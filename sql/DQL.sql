USE muriel;

-- P1 — Informações operacionais registradas em diferentes documentos

-- Durante a visita, foram observados diversos registros em papel relacionados a estoque, devoluções e pedidos cancelados.

-- Quando informações relacionadas a um mesmo processo estão distribuídas em diferentes registros, o acompanhamento pode exigir a consulta de documentos distintos. Isso pode dificultar a obtenção de uma visão completa de determinada operação.

-- O banco de dados pode contribuir para centralizar as informações relacionadas aos processos e permitir que elas sejam consultadas por meio de relacionamentos entre as entidades.

-- Solução: Visão integrada das operações por pedido

SELECT
    p.ID_PEDIDO,
    p.DT_PEDIDO,
    p.STATUS_PEDIDO,
    COUNT(DISTINCT ip.ID_PRODUTO) AS TOTAL_PRODUTOS,

    COALESCE(
        GROUP_CONCAT(DISTINCT pag.STATUS_PAGAMENTO),
        'SEM PAGAMENTO'
    ) AS STATUS_PAGAMENTOS,

    COALESCE(nf.STATUS_NF, 'SEM NOTA') AS STATUS_NOTA,
    COALESCE(e.STATUS_ENTREGA, 'SEM ENTREGA') AS STATUS_ENTREGA,

    COUNT(DISTINCT d.ID_DEVOLUCAO) AS TOTAL_DEVOLUCOES

FROM PEDIDO p

LEFT JOIN ITEM_PEDIDO ip
    ON ip.ID_PEDIDO = p.ID_PEDIDO

LEFT JOIN PAGAMENTO pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO

LEFT JOIN NOTA_FISCAL nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO

LEFT JOIN ENTREGA e
    ON e.ID_NF = nf.ID_NF

LEFT JOIN DEVOLUCAO d
    ON d.ID_PEDIDO = p.ID_PEDIDO

GROUP BY
    p.ID_PEDIDO,
    p.DT_PEDIDO,
    p.STATUS_PEDIDO,
    nf.STATUS_NF,
    e.STATUS_ENTREGA

ORDER BY p.ID_PEDIDO;

--P2 — Dificuldade para acompanhar a situação dos pedidos

-- Um pedido pode passar por diversas etapas. Depois de cadastrado, ele pode possuir produtos, pagamentos, nota fiscal e posteriormente uma entrega.

-- Quando essas informações não estão relacionadas em uma estrutura única, pode ser mais difícil identificar rapidamente em qual situação o pedido se encontra.

-- Solução: Acompanhamento de pedidos com etapas pendentes.

SELECT
    p.ID_PEDIDO,
    p.DT_PEDIDO,
    p.STATUS_PEDIDO,

    COALESCE(
        GROUP_CONCAT(DISTINCT pag.STATUS_PAGAMENTO),
        'SEM PAGAMENTO'
    ) AS STATUS_PAGAMENTO,

    COALESCE(nf.STATUS_NF, 'SEM NOTA') AS STATUS_NOTA,
    COALESCE(e.STATUS_ENTREGA, 'SEM ENTREGA') AS STATUS_ENTREGA,

    CASE
        WHEN p.STATUS_PEDIDO = 'AGUARDANDO_PAGAMENTO'
            THEN 'PAGAMENTO PENDENTE'

        WHEN p.STATUS_PEDIDO = 'EM_SEPARACAO'
            THEN 'PEDIDO EM SEPARACAO'

        WHEN nf.ID_NF IS NULL
            THEN 'AGUARDANDO NOTA FISCAL'

        WHEN e.ID_ENTREGA IS NULL
            THEN 'ENTREGA NAO REGISTRADA'

        ELSE 'ACOMPANHAR ENTREGA'
    END AS ETAPA_PENDENTE

FROM PEDIDO p

LEFT JOIN PAGAMENTO pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO

LEFT JOIN NOTA_FISCAL nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO

LEFT JOIN ENTREGA e
    ON e.ID_NF = nf.ID_NF

WHERE
    p.STATUS_PEDIDO <> 'CANCELADO'
    AND (
        e.ID_ENTREGA IS NULL
        OR e.STATUS_ENTREGA <> 'ENTREGUE'
    )

GROUP BY
    p.ID_PEDIDO,
    p.DT_PEDIDO,
    p.STATUS_PEDIDO,
    nf.ID_NF,
    nf.STATUS_NF,
    e.ID_ENTREGA,
    e.STATUS_ENTREGA

ORDER BY p.DT_PEDIDO DESC, p.ID_PEDIDO DESC;

--P3 — Dificuldade de acompanhar pagamentos

-- Os pagamentos possuem informações próprias, como data, valor, forma de pagamento e status.

-- A existência de uma entidade específica para pagamento permite separar as informações financeiras das informações gerais do pedido, mantendo uma relação entre as duas.

-- Solução: Acompanhamento de pagamentos por pedido.

SELECT
    p.ID_PEDIDO,
    p.PRECO_PEDIDO,
    pag.ID_PAGAMENTO,
    pag.DT_PAGAMENTO,
    pag.VALOR_PAGAMENTO,
    pag.FORMA_PAGAMENTO,

    COALESCE(
        pag.STATUS_PAGAMENTO,
        'SEM PAGAMENTO'
    ) AS STATUS_PAGAMENTO

FROM PEDIDO p

LEFT JOIN PAGAMENTO pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO

ORDER BY
    p.ID_PEDIDO,
    pag.ID_PAGAMENTO;

--  P4 — Dificuldade de identificar os materiais associados aos produtos em produção

-- A fabricação dos produtos depende de diferentes materiais. Por isso, é importante identificar quais materiais estão associados a cada produto fabricado, facilitando a consulta das informações utilizadas no planejamento da produção.

-- Solução: Consulta dos materiais associados aos produtos em produção.

SELECT
    prod.ID_PRODUTO,
    prod.NM_PRODUTO,
    pr.ID_PRODUCAO,
    pr.DT_INICIO_PRODUCAO,
    pr.QUANTIDADE_PRODUCAO,
    pr.STATUS_PRODUCAO,
    mat.ID_MATERIAL,
    mat.NM_MATERIAL

FROM PRODUCAO pr

JOIN PRODUTO prod
    ON prod.ID_PRODUTO = pr.ID_PRODUTO

JOIN PRODUTO_MATERIAL pm
    ON pm.ID_PRODUTO = prod.ID_PRODUTO

JOIN MATERIAL mat
    ON mat.ID_MATERIAL = pm.ID_MATERIAL

ORDER BY
    pr.ID_PRODUCAO,
    mat.ID_MATERIAL;

-- P5 — Dificuldade de acompanhar as entregas

-- Após a realização do pedido e das etapas financeiras e fiscais, existe a necessidade de acompanhar o processo de envio dos produtos.

-- Informações como código de rastreio, data de envio, data de entrega e status permitem acompanhar o andamento logístico.


--  Solução: Consulta das informações logísticas e do histórico das entregas registradas.

SELECT
    p.ID_PEDIDO,
    p.STATUS_PEDIDO,
    nf.NUM_NF,
    e.COD_RASTREIO,
    e.DT_ENVIO,
    e.DT_ENTREGA,
    e.STATUS_ENTREGA,
    e.NM_MOTORISTA,
    e.PLACA_CAMINHAO,
    e.TRANSPORTADORA

FROM PEDIDO p

JOIN NOTA_FISCAL nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO

JOIN ENTREGA e
    ON e.ID_NF = nf.ID_NF

ORDER BY
    e.DT_ENVIO DESC,
    p.ID_PEDIDO;

-- P6 — Dificuldade de acompanhar informações fiscais

--As notas fiscais possuem informações específicas, como número, série, data de emissão, chave de acesso, valor total e status.

-- Essas informações precisam estar relacionadas ao pedido ao qual a nota fiscal pertence para que seja possível identificar a origem de determinado documento fiscal.

--Solução: Consulta de Informações fiscais.

SELECT
    p.ID_PEDIDO,
    nf.ID_NF,
    nf.NUM_NF,
    nf.SERIE_NF,
    nf.DT_EMISSAO,
    nf.CHAVE_ACESSO,
    nf.VALOR_TOTAL,
    nf.STATUS_NF

FROM PEDIDO p

JOIN NOTA_FISCAL nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO

ORDER BY
    nf.DT_EMISSAO DESC,
    p.ID_PEDIDO;

-- P7 — Dificuldade de acompanhar os atendimentos ao cliente

-- Os atendimentos realizados ao cliente possuem informações próprias, como protocolo, data, tipo, descrição e status.

-- Quando essas informações não estão relacionadas ao cliente que fez a solicitação, ao funcionário que realizou o atendimento e a uma eventual devolução, torna-se mais difícil acompanhar o andamento de cada solicitação.

-- Solução: Rastreamento de Atendimentos

SELECT
    a.ID_ATENDIMENTO,
    a.PROTOCOLO,
    a.DT_ATENDIMENTO,
    a.TIPO_ATENDIMENTO,
    a.STATUS_ATENDIMENTO,
    c.NM_CLIENTE,
    f.NM_FUNCIONARIO,
    d.ID_DEVOLUCAO,

    COALESCE(
        d.STATUS_DEVOLUCAO,
        'SEM DEVOLUCAO'
    ) AS STATUS_DEVOLUCAO

FROM ATENDIMENTO_SAC a

JOIN CLIENTE c
    ON c.ID_CLIENTE = a.ID_CLIENTE

JOIN FUNCIONARIO f
    ON f.ID_FUNCIONARIO = a.ID_FUNCIONARIO

LEFT JOIN DEVOLUCAO d
    ON d.ID_ATENDIMENTO = a.ID_ATENDIMENTO

ORDER BY
    a.DT_ATENDIMENTO DESC,
    a.ID_ATENDIMENTO;

-- P8 — Dificuldade de rastrear devoluções

-- Durante a visita, foram observados registros em papel relacionados a devoluções.

-- Uma devolução envolve o pedido de origem, o produto devolvido, sua quantidade, o motivo e um eventual reembolso. Quando essas informações ficam em registros separados, pode ser difícil identificar o que foi devolvido e a qual pedido a devolução se refere.

-- Solução: Rastreamento de Devoluções.

SELECT
    d.ID_DEVOLUCAO,
    d.DT_DEVOLUCAO,
    d.MOTIVO,
    d.STATUS_DEVOLUCAO,
    d.REEMBOLSO_DEVOLUCAO,

    p.ID_PEDIDO,
    p.STATUS_PEDIDO,

    prod.ID_PRODUTO,
    prod.NM_PRODUTO,

    d.QUANTIDADE_DEVOLVIDA

FROM DEVOLUCAO d

JOIN PEDIDO p
    ON p.ID_PEDIDO = d.ID_PEDIDO

JOIN PRODUTO prod
    ON prod.ID_PRODUTO = d.ID_PRODUTO

ORDER BY
    d.DT_DEVOLUCAO DESC,
    d.ID_DEVOLUCAO DESC;

--  P9 — Dificuldade de acompanhar os pedidos de materiais aos fornecedores

-- A produção depende de materiais adquiridos junto a fornecedores. Cada registro de pedido de material possui informações como data do pedido, previsão de recebimento, status, quantidade solicitada, preço unitário e valor total.

-- Quando essas informações não estão relacionadas ao fornecedor e ao material solicitado, pode ser difícil acompanhar o que foi pedido, a quem e quando se espera receber.

-- Solução: Acompanhamento dos pedidos de materiais aos fornecedores.

SELECT
    pm.ID_PEDIDO_MATERIAL,
    pm.DT_PEDIDO,
    pm.DT_PREVISTA,
    pm.STATUS,
    pm.PRECO_TOTAL,

    f.NM_FORNECEDOR,

    mat.NM_MATERIAL,

    pm.QUANTIDADE_SOLICITADA,
    pm.PRECO_UNITARIO

FROM PEDIDO_MATERIAL pm

JOIN FORNECEDOR f
    ON f.ID_FORNECEDOR = pm.ID_FORNECEDOR

JOIN MATERIAL mat
    ON mat.ID_MATERIAL = pm.ID_MATERIAL

ORDER BY
    pm.DT_PEDIDO DESC,
    pm.ID_PEDIDO_MATERIAL DESC;
