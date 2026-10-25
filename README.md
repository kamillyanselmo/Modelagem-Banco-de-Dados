# Modelagem de Banco de Dados para a Muriel Cosméticos: Gestão de Pedidos, Pagamentos, Produção e Entregas

*Projeto acadêmico — Modelagem de Banco de Dados (2º semestre) 

**Colaboradores do projeto**
- Kevyn Deusdará Antônio (RGM 46970746)
- Kamilly Anselmoo (RGM 47234237)
- Maria Eduarda da Silva Costa (RGM 46939563)
- Igor Tsuyoshi (RGM 47133562)

---

# 1. Introdução

Este projeto tem como objetivo desenvolver uma modelagem conceitual de banco de dados para representar processos da **Muriel Cosméticos**, abrangendo principalmente as áreas comercial, financeira, produtiva, fiscal e logística.

O modelo foi desenvolvido a partir das informações levantadas durante a visita à empresa, da entrevista realizada com uma colaboradora e da análise dos processos relacionados ao cadastro de clientes e funcionários, registro de pedidos, produtos, pagamentos, fornecedores, materiais, produção, embalagens, faturamento, notas fiscais e entregas.

A proposta do banco de dados é organizar essas informações de maneira estruturada, permitindo que dados pertencentes a diferentes processos possam ser relacionados e consultados de maneira integrada.

O projeto está delimitado à **modelagem conceitual, ao modelo lógico (desenvolvido no BRModelo Web) e à documentação do modelo**. A implementação física do banco de dados, a criação definitiva das tabelas SQL, a definição final dos tipos de dados e a integração com sistemas corporativos são consideradas etapas posteriores.

---

# 2. Caracterização da Organização

## 2.1 Natureza, localização e porte

A organização estudada é a **Muriel Cosméticos**, cuja razão social apresentada institucionalmente é **BEAUTY LAB DO BRASIL LTDA.**

- **Natureza:** empresa privada com fins lucrativos.
- **Atividade:** fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal.
- **Localização:** São Paulo, SP.
- **Porte:** faixa de **201 a 500 funcionários**, conforme o perfil institucional consultado.
- **Tempo de atuação informado:** mais de 60 anos.

A empresa possui diferentes linhas de produtos relacionados a cuidados com o corpo, cabelos, perfumaria e higiene pessoal.

Para que esses produtos cheguem aos clientes, existe uma cadeia de processos que envolve diferentes áreas da organização. Entre elas estão o relacionamento com fornecedores, aquisição e utilização de materiais, produção, utilização de embalagens, atuação de representantes comerciais, cadastro de clientes, realização de pedidos, pagamentos, faturamento, emissão de notas fiscais e entrega.

Essa diversidade de processos foi considerada na elaboração do modelo de dados, buscando representar as informações de maneira relacionada e evitar que cada processo seja tratado como uma informação isolada.

## 2.2 Participação de integrante do grupo

Um dos integrantes do grupo **trabalha na empresa estudada**, o que facilitou o acesso às informações necessárias para compreender os processos representados no modelo.

A participação desse integrante possibilitou um contato mais próximo com a realidade da organização e contribuiu para a realização da visita, da entrevista e do levantamento das informações utilizadas na modelagem.

As informações utilizadas no projeto foram analisadas pelo grupo e posteriormente relacionadas às entidades, atributos e relacionamentos representados no DER.

---

# 3. Entrevista e evidências da visita

A entrevista foi realizada no dia **02/09/2026**, em uma sala destinada ao tratamento de assuntos relacionados ao estoque, localizada na área de expedição da Muriel Cosméticos.

- **Data:** 02/09/2026
- **Local:** sala de assuntos relacionados ao estoque, localizada na área de expedição.
- **Entrevistada:** Raquel Lira da Silva
- **Cargo/setor:** Gerente geral
- **Telefone:** (11)99464-1908

A entrevista teve como finalidade compreender como determinados processos são realizados na empresa e quais informações precisam ser registradas ou acompanhadas.

As respostas obtidas foram utilizadas como uma das fontes para a identificação dos processos representados no banco de dados.

A documentação da entrevista foi mantida separada das observações presenciais para deixar claro quais informações foram **relatadas pela entrevistada** e quais situações foram **observadas diretamente pela participante do grupo (Maria Eduarda)**.

### Documentação da entrevista

[📄 Entrevista realizada com a empresa](documentacao/entrevista/entrevista-muriel.md)

### Observações presenciais

[📄 Observações realizadas durante a visita](documentacao/observacoes-visita.md)

### Evidências fotográficas

[📁 Fotos e evidências da visita](documentacao/entrevista/fotos/)

---

# 4. Observações presenciais

Durante a visita realizada em **02/09**, foi observado um uso significativo de documentos e registros em papel para apoiar determinados processos relacionados ao estoque e à operação da empresa.

Na área visitada, foram observados papéis utilizados para registrar ou evidenciar informações relacionadas a:

- movimentações de estoque;
- devoluções;
- pedidos cancelados;
- acompanhamento de processos;
- registros utilizados como evidência das atividades realizadas.

Também foi possível observar que alguns processos dependiam da utilização de documentos físicos para registrar informações e comprovar determinadas movimentações.

Essa observação foi relevante para o projeto porque demonstra a existência de informações que precisam ser registradas e posteriormente consultadas. A modelagem de banco de dados pode contribuir para estruturar essas informações de maneira organizada, permitindo relacionar dados de diferentes processos.

É importante destacar que essa observação **não significa que todos os processos da empresa sejam realizados exclusivamente em papel**. A participante registrou especificamente aquilo que foi observado durante a visita.

---

# 5. Problemas e dores identificados

A partir da entrevista e principalmente das observações realizadas durante a visita, foram identificados problemas relacionados à organização, integração, acompanhamento e rastreabilidade das informações.

Os problemas são apresentados no formato:

**PROBLEMA → TABELA/ENTIDADE → CONSULTA**

As consultas apresentadas demonstram como o banco de dados poderá apoiar a resolução ou o acompanhamento dos problemas identificados.

> Os nomes de tabelas e colunas utilizados nas consultas seguem os nomes definidos no DER conceitual e no modelo lógico.

---

## P1 — Informações operacionais registradas em diferentes documentos

**Problema:**

Durante a visita, foram observados diversos registros em papel relacionados a estoque, devoluções e pedidos cancelados.

Quando informações relacionadas a um mesmo processo estão distribuídas em diferentes registros, o acompanhamento pode exigir a consulta de documentos distintos. Isso pode dificultar a obtenção de uma visão completa de determinada operação.

O banco de dados pode contribuir para centralizar as informações relacionadas aos processos e permitir que elas sejam consultadas por meio de relacionamentos entre as entidades.

**Tabelas/entidades relacionadas:**

`Pedido`, `Produto`, `Pagamento`, `Nota_Fiscal` e `Entrega`.

**Consulta:**

```sql
SELECT
    p.ID_PEDIDO,
    p.DT_PEDIDO,
    p.STATUS_PEDIDO,
    pag.STATUS_PAGAMENTO,
    nf.STATUS_NF,
    e.STATUS_ENTREGA
FROM Pedido p
LEFT JOIN Pagamento pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO
LEFT JOIN Nota_Fiscal nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO
LEFT JOIN Entrega e
    ON e.ID_PEDIDO = p.ID_PEDIDO;
```

Essa consulta permite reunir informações comerciais, financeiras, fiscais e logísticas de um pedido em uma única consulta.

---

## P2 — Dificuldade para acompanhar a situação dos pedidos

**Problema:**

Um pedido pode passar por diversas etapas. Depois de cadastrado, ele pode possuir produtos, pagamentos, nota fiscal e posteriormente uma entrega.

Quando essas informações não estão relacionadas em uma estrutura única, pode ser mais difícil identificar rapidamente em qual situação o pedido se encontra.

**Como o banco ajuda:**

O relacionamento entre `Pedido`, `Pagamento`, `Nota_Fiscal` e `Entrega` permite consultar diferentes etapas utilizando o identificador do pedido como referência.

**Tabelas/entidades relacionadas:**

`Pedido`, `Pagamento`, `Nota_Fiscal` e `Entrega`.

**Consulta:**

```sql
SELECT
    p.ID_PEDIDO,
    p.STATUS_PEDIDO,
    pag.STATUS_PAGAMENTO,
    nf.STATUS_NF,
    e.STATUS_ENTREGA
FROM Pedido p
LEFT JOIN Pagamento pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO
LEFT JOIN Nota_Fiscal nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO
LEFT JOIN Entrega e
    ON e.ID_PEDIDO = p.ID_PEDIDO;
```

O resultado poderá fornecer uma visão integrada da situação de cada pedido.

---

## P3 — Dificuldade de acompanhar pagamentos

**Problema:**

Os pagamentos possuem informações próprias, como data, valor, forma de pagamento e status.

A existência de uma entidade específica para pagamento permite separar as informações financeiras das informações gerais do pedido, mantendo uma relação entre as duas.

**Como o banco ajuda:**

A relação entre `Pedido` e `Pagamento` permite identificar quais pagamentos estão associados a determinado pedido e consultar a situação financeira correspondente.

**Tabelas/entidades relacionadas:**

`Pedido` e `Pagamento`.

**Consulta:**

```sql
SELECT
    p.ID_PEDIDO,
    p.PRECO_PEDIDO,
    pag.DT_PAGAMENTO,
    pag.VALOR_PAGAMENTO,
    pag.FORMA_PAGAMENTO,
    pag.STATUS_PAGAMENTO
FROM Pedido p
JOIN Pagamento pag
    ON pag.ID_PEDIDO = p.ID_PEDIDO;
```

A consulta pode auxiliar na identificação de valores pagos, do valor registrado no pedido, da forma de pagamento e do status dos pagamentos associados aos pedidos.

---

## P4 — Dificuldade de rastrear materiais utilizados na produção

**Problema:**

A produção dos produtos depende de materiais e embalagens. Por isso, é importante conseguir relacionar um produto produzido aos materiais utilizados em sua produção.

**Como o banco ajuda:**

As entidades `Produto`, `Material` e `Produção` permitem organizar essas informações e estabelecer relações entre o produto fabricado, a produção realizada e os materiais utilizados. Como a relação entre `Produção` e `Material` é muitos-para-muitos, ela é representada pela tabela associativa `Material_Producao` (criada no BRModelo com o nome `é utilizado`).

**Tabelas/entidades relacionadas:**

`Produto`, `Material`, `Produção` e `Material_Producao`.

**Consulta:**

```sql
SELECT
    prod.ID_PRODUTO,
    prod.NM_PRODUTO,
    pr.ID_PRODUCAO,
    pr.DT_INICIO_PRODUCAO,
    pr.QUANTIDADE_PRODUCAO,
    pr.STATUS_PRODUCAO,
    mat.ID_MATERIAL,
    mat.NM_MATERIAL
FROM Produto prod
JOIN Produção pr
    ON pr.ID_PRODUTO = prod.ID_PRODUTO
JOIN Material_Producao mp
    ON mp.ID_PRODUCAO = pr.ID_PRODUCAO
JOIN Material mat
    ON mat.ID_MATERIAL = mp.ID_MATERIAL;
```

A consulta permite obter informações sobre o produto, a produção e os materiais relacionados.

---

## P5 — Dificuldade de acompanhar as entregas

**Problema:**

Após a realização do pedido e das etapas financeiras e fiscais, existe a necessidade de acompanhar o processo de envio dos produtos.

Informações como código de rastreio, data de envio, data de entrega e status permitem acompanhar o andamento logístico.

**Como o banco ajuda:**

A entidade `Entrega` está relacionada ao `Pedido`, permitindo consultar informações logísticas utilizando o identificador do pedido.

**Tabelas/entidades relacionadas:**

`Pedido` e `Entrega`.

**Consulta:**

```sql
SELECT
    p.ID_PEDIDO,
    p.STATUS_PEDIDO,
    e.COD_RASTREIO,
    e.DT_ENVIO,
    e.DT_ENTREGA,
    e.STATUS_ENTREGA,
    e.NM_MOTORISTA,
    e.PLACA_CAMINHAO,
    e.TRANSPORTADORA
FROM Pedido p
JOIN Entrega e
    ON e.ID_PEDIDO = p.ID_PEDIDO;
```

A consulta permite acompanhar o status logístico dos pedidos e suas respectivas informações de entrega.

---

## P6 — Dificuldade de acompanhar informações fiscais

**Problema:**

As notas fiscais possuem informações específicas, como número, série, data de emissão, chave de acesso, valor total e status.

Essas informações precisam estar relacionadas ao pedido ao qual a nota fiscal pertence para que seja possível identificar a origem de determinado documento fiscal.

**Como o banco ajuda:**

A relação entre `Pedido` e `Nota_Fiscal` permite consultar os dados fiscais associados a cada pedido.

**Tabelas/entidades relacionadas:**

`Pedido` e `Nota_Fiscal`.

**Consulta:**

```sql
SELECT
    p.ID_PEDIDO,
    nf.ID_NF,
    nf.NUM_NF,
    nf.SERIE_NF,
    nf.DT_EMISSAO,
    nf.CHAVE_ACESSO,
    nf.VALOR_TOTAL,
    nf.STATUS_NF
FROM Pedido p
JOIN Nota_Fiscal nf
    ON nf.ID_PEDIDO = p.ID_PEDIDO;
```

---

## P7 — Dificuldade de acompanhar os atendimentos ao cliente

**Problema:**

Os atendimentos realizados ao cliente possuem informações próprias, como protocolo, data, tipo, descrição e status.

Quando essas informações não estão relacionadas ao cliente que fez a solicitação, ao funcionário que realizou o atendimento e a uma eventual devolução, torna-se mais difícil acompanhar o andamento de cada solicitação.

**Como o banco ajuda:**

A entidade `Atendimento_SAC` está relacionada a `Cliente`, a `Funcionário` e a `Devolução`, permitindo consultar, a partir do protocolo, quem solicitou, quem atendeu e se o atendimento originou uma devolução.

**Tabelas/entidades relacionadas:**

`Atendimento_SAC`, `Cliente`, `Funcionário` e `Devolução`.

**Consulta:**

```sql
SELECT
    a.ID_ATENDIMENTO,
    a.PROTOCOLO,
    a.DT_ATENDIMENTO,
    a.TIPO_ATENDIMENTO,
    a.STATUS_ATENDIMENTO,
    c.NM_CLIENTE,
    f.NM_FUNCIONARIO,
    d.ID_DEVOLUCAO
FROM Atendimento_SAC a
JOIN Cliente c
    ON c.ID_CLIENTE = a.ID_CLIENTE
JOIN Funcionário f
    ON f.ID_FUNCIONARIO = a.ID_FUNCIONARIO
LEFT JOIN Devolução d
    ON d.ID_ATENDIMENTO = a.ID_ATENDIMENTO;
```

A consulta permite acompanhar cada atendimento junto ao cliente, ao funcionário responsável e à devolução registrada, quando houver.

---

## P8 — Dificuldade de rastrear devoluções

**Problema:**

Durante a visita, foram observados registros em papel relacionados a devoluções.

Uma devolução envolve o pedido de origem, os produtos devolvidos e suas quantidades, o motivo e eventual reembolso. Quando essas informações ficam em registros separados, pode ser difícil identificar o que foi devolvido e a que pedido a devolução se refere.

**Como o banco ajuda:**

A entidade `Devolução` está relacionada a `Pedido` e, por meio da tabela associativa `Devolucao_Produto` (criada no BRModelo com o nome `Contém`), aos produtos devolvidos e às respectivas quantidades.

**Tabelas/entidades relacionadas:**

`Devolução`, `Pedido`, `Produto` e `Devolucao_Produto`.

**Consulta:**

```sql
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
    dp.QUANTIDADE_DEVOLVIDA
FROM Devolução d
JOIN Pedido p
    ON p.ID_PEDIDO = d.ID_PEDIDO
JOIN Devolucao_Produto dp
    ON dp.ID_DEVOLUCAO = d.ID_DEVOLUCAO
JOIN Produto prod
    ON prod.ID_PRODUTO = dp.ID_PRODUTO;
```

A consulta permite identificar, para cada devolução, o pedido de origem, os produtos devolvidos, as quantidades e a situação do processo.

---

## P9 — Dificuldade de acompanhar os pedidos de materiais aos fornecedores

**Problema:**

A produção depende de materiais adquiridos junto a fornecedores. Cada pedido de material possui datas, status, valor total e uma lista de materiais com quantidades e preços unitários.

Quando essas informações não estão relacionadas ao fornecedor e aos materiais solicitados, pode ser difícil acompanhar o que foi pedido, a quem e quando se espera receber.

**Como o banco ajuda:**

A entidade `Pedido_Material` está relacionada a `Fornecedor` e, por meio da tabela associativa `Pedido_Material_Item` (criada no BRModelo com o nome `Contém`), aos materiais solicitados, com quantidade e preço unitário.

**Tabelas/entidades relacionadas:**

`Pedido_Material`, `Fornecedor`, `Material` e `Pedido_Material_Item`.

**Consulta:**

```sql
SELECT
    pm.ID_PEDIDO_MATERIAL,
    pm.DT_PEDIDO,
    pm.DT_PREVISTA,
    pm.STATUS,
    pm.PRECO_TOTAL,
    f.NM_FORNECEDOR,
    mat.NM_MATERIAL,
    pmi.QUANTIDADE_SOLICITADA,
    pmi.PRECO_UNITARIO
FROM Pedido_Material pm
JOIN Fornecedor f
    ON f.ID_FORNECEDOR = pm.ID_FORNECEDOR
JOIN Pedido_Material_Item pmi
    ON pmi.ID_PEDIDO_MATERIAL = pm.ID_PEDIDO_MATERIAL
JOIN Material mat
    ON mat.ID_MATERIAL = pmi.ID_MATERIAL;
```

A consulta permite acompanhar os pedidos de materiais por fornecedor, com datas previstas, status, quantidades e preços.

---

# 6. Processos de negócio

## 6.1 Cadastro de clientes e funcionários

O cadastro de clientes e funcionários permite identificar as pessoas ou organizações envolvidas nas operações comerciais.

A entidade `Cliente` concentra as informações necessárias para identificar o cliente e possibilitar seu relacionamento com os pedidos.

Já a entidade `Funcionário` permite identificar o profissional responsável pelo cadastro ou acompanhamento dos pedidos, bem como pela realização de atendimentos, pelo registro de ponto e pela participação nas produções.

### Cliente

O cliente é a entidade responsável por representar quem realiza uma solicitação comercial à empresa.

Seus atributos permitem armazenar:

- **ID_CLIENTE:** identifica unicamente cada cliente cadastrado.
- **NM_CLIENTE:** registra o nome utilizado para identificar o cliente.
- **CPF_CLIENTE:** registra o CPF do cliente.
- **TEL_CLIENTE:** armazena um meio de contato telefônico.
- **ENDERECO_CLIENTE:** registra o endereço relacionado ao cliente.
- **CEP_CLIENTE:** registra o CEP do endereço do cliente.
- **UF_CLIENTE:** identifica a unidade federativa do endereço.

### Funcionário

O funcionário é responsável pela relação comercial associada aos pedidos e também pelas demais atividades internas registradas no modelo (atendimentos, ponto e produção).

Seus atributos permitem armazenar:

- **ID_FUNCIONARIO:** identifica unicamente o funcionário.
- **NM_FUNCIONARIO:** registra o nome do funcionário.
- **CARGO:** registra o cargo exercido pelo funcionário.
- **DT_ADMISSAO:** registra a data de admissão do funcionário.
- **TEL_FUNCIONARIO:** permite armazenar seu contato telefônico.
- **EMAIL_FUNCIONARIO:** registra seu endereço eletrônico.

---

## 6.2 Registro de pedidos

A entidade `Pedido` representa uma solicitação comercial realizada por um cliente e cadastrada por um funcionário.

O pedido funciona como um dos principais pontos de integração do modelo, pois se relaciona com outras entidades, como:

- Cliente;
- Funcionário;
- Produto;
- Pagamento;
- Nota Fiscal;
- Entrega;
- Devolução.

### Informações do pedido

- **ID_PEDIDO:** identifica unicamente cada pedido.
- **DT_PEDIDO:** registra a data em que o pedido foi realizado ou cadastrado.
- **PRECO_PEDIDO:** registra o preço associado ao pedido.
- **STATUS_PEDIDO:** registra a situação atual do pedido.

A partir do `ID_PEDIDO`, é possível relacionar as informações comerciais às etapas financeira, fiscal e logística.

---

## 6.3 Pagamentos

A entidade `Pagamento` representa a informação financeira associada a um pedido.

Ela foi separada da entidade `Pedido` porque possui atributos próprios e representa uma etapa específica do processo.

### Informações registradas

- **ID_PAGAMENTO:** identifica unicamente o pagamento.
- **DT_PAGAMENTO:** registra quando o pagamento foi realizado ou registrado.
- **VALOR_PAGAMENTO:** registra o valor efetivamente pago.
- **FORMA_PAGAMENTO:** identifica a forma de pagamento utilizada.
- **STATUS_PAGAMENTO:** indica a situação do pagamento.

A separação permite que as informações financeiras sejam consultadas independentemente das demais informações do pedido.

---

## 6.4 Produtos

A entidade `Produto` representa os produtos comercializados pela empresa.

Cada produto possui informações próprias que permitem identificá-lo, descrevê-lo e relacioná-lo às vendas e à produção.

### Informações registradas

- **ID_PRODUTO:** identificador único do produto.
- **NM_PRODUTO:** nome utilizado para identificar o produto.
- **EAN_PRODUTO:** código utilizado para identificação comercial do produto.
- **UNIDADE_PRODUTO:** unidade utilizada para representar o produto.
- **DESCRIÇÃO_PRODUTO:** descrição complementar das características do produto.

Os produtos podem aparecer em diferentes pedidos e também estar relacionados a diferentes registros de produção e a diferentes lotes.

---

## 6.5 Materiais

A entidade `Material` representa os materiais utilizados nos processos produtivos.

Esses materiais são diferentes dos produtos acabados. Enquanto o produto representa aquilo que será comercializado, o material representa um recurso utilizado para a produção.

### Informações registradas

- **ID_MATERIAL:** identificador único do material.
- **NM_MATERIAL:** nome utilizado para identificar o material.
- **UNIDADE_MATERIAL:** unidade de medida utilizada para o material.
- **ESTOQUE_MIN_MATERIAL:** quantidade mínima de estoque considerada para o material.

A entidade pode ser relacionada tanto aos fornecedores quanto aos produtos, aos pedidos de materiais e às produções.

---

## 6.6 Fornecedores

A entidade `Fornecedor` representa empresas ou organizações responsáveis pelo fornecimento dos materiais utilizados pela empresa.

### Informações registradas

- **ID_FORNECEDOR:** identifica unicamente o fornecedor.
- **NM_FORNECEDOR:** nome do fornecedor.
- **CNPJ_FORNECEDOR:** identifica o fornecedor juridicamente.
- **TEL_FORNECEDOR:** registra um contato telefônico.
- **ENDERECO_FORNECEDOR:** registra o endereço do fornecedor.
- **CEP_FORNECEDOR:** registra o CEP do endereço do fornecedor.

O relacionamento com `Material` permite representar quais materiais podem ser obtidos de cada fornecedor.

---

## 6.7 Pedido de materiais (Pedido_Material)

A entidade `Pedido_Material` representa uma solicitação de materiais realizada junto aos fornecedores.

Ela é importante porque o processo de aquisição de materiais possui características diferentes do pedido comercial realizado pelo cliente.

Cada pedido de material está relacionado a exatamente um fornecedor e contém um ou vários materiais. Para cada material solicitado, são registrados a quantidade solicitada (`QUANTIDADE_SOLICITADA`) e o preço unitário (`PRECO_UNITARIO`), atributos do relacionamento `Contém`.

### Informações registradas

- **ID_PEDIDO_MATERIAL:** identifica a solicitação de materiais.
- **DT_PEDIDO:** registra a data em que a solicitação foi realizada.
- **DT_PREVISTA:** indica a data prevista para atendimento.
- **STATUS:** registra a situação atual do pedido.
- **PRECO_TOTAL:** representa o valor total relacionado à solicitação.

---

## 6.8 Produção

A entidade `Produção` representa uma ocorrência de fabricação de determinado produto.

Um mesmo produto pode possuir diferentes registros de produção, representando diferentes momentos ou lotes de fabricação.

### Informações registradas

- **ID_PRODUCAO:** identifica a produção.
- **DT_INICIO_PRODUCAO:** registra a data e o horário de início da produção.
- **QUANTIDADE_PRODUCAO:** registra a quantidade produzida.
- **STATUS_PRODUCAO:** registra a situação da produção.

A produção também se relaciona com os materiais e as embalagens utilizados no processo e com os funcionários que participam dela.

---

## 6.9 Embalagens

A entidade `Embalagem` representa os recipientes ou estruturas utilizados para acondicionar os produtos durante a produção.

Ela foi representada separadamente de `Material` porque possui características específicas relacionadas à sua função de embalagem.

### Informações registradas

- **ID_EMBALAGEM:** identifica a embalagem.
- **TIPO_EMBALAGEM:** indica o tipo de embalagem.
- **CAPACIDADE_EMBALAGEM:** registra a capacidade da embalagem.
- **MATERIAL_EMBALAGEM:** indica o material utilizado para fabricação da embalagem.

---

## 6.10 Faturamento

A entidade `Faturamento` representa informações relacionadas ao processo de faturamento.

### Informações registradas

- **ID_FATURAMENTO:** identifica o faturamento.
- **DT_FATURAMENTO:** registra a data em que o faturamento foi realizado.
- **VALOR_TOTAL:** representa o valor total faturado.
- **STATUS:** indica a situação do faturamento.
- **DT_VENCIMENTO:** registra a data de vencimento quando aplicável.

O faturamento está relacionado à documentação fiscal representada pela entidade `Nota_Fiscal`. A forma de pagamento passou a ser registrada na entidade `Pagamento` (atributo `FORMA_PAGAMENTO`).

---

## 6.11 Notas fiscais

A entidade `Nota_Fiscal` representa o documento fiscal relacionado ao pedido.

### Informações registradas

- **ID_NF:** identificador da nota fiscal.
- **NUM_NF:** número da nota fiscal.
- **SERIE_NF:** série utilizada na identificação fiscal.
- **DT_EMISSAO:** data de emissão da nota.
- **CHAVE_ACESSO:** chave utilizada para identificação e consulta do documento fiscal.
- **VALOR_TOTAL:** valor total registrado na nota.
- **STATUS_NF:** situação atual da nota fiscal.

A relação com `Pedido` permite identificar qual operação comercial originou determinada nota fiscal.

---

## 6.12 Entrega

A entidade `Entrega` representa o processo logístico de envio do pedido.

### Informações registradas

- **ID_ENTREGA:** identifica unicamente a entrega.
- **COD_RASTREIO:** registra o código utilizado para acompanhamento da entrega.
- **DT_ENVIO:** registra quando o pedido foi enviado.
- **DT_ENTREGA:** registra quando ocorreu a entrega.
- **STATUS_ENTREGA:** informa a situação atual da entrega.
- **NM_MOTORISTA:** identifica o motorista associado à entrega.
- **PLACA_CAMINHAO:** identifica o caminhão utilizado, por meio de sua placa.
- **TRANSPORTADORA:** identifica a transportadora responsável pela entrega.

A entidade permite acompanhar a etapa posterior ao processamento do pedido.

---

## 6.13 Lotes

A entidade `Lote` representa um lote de fabricação de determinado produto.

Cada lote pertence a exatamente um produto, e um mesmo produto pode possuir nenhum ou vários lotes. A entidade permite registrar informações de fabricação e validade, apoiando a rastreabilidade dos produtos.

### Informações registradas

- **ID_LOTE:** identifica unicamente o lote.
- **NUM_LOTE:** registra o número ou código do lote.
- **DT_FABRICACAO:** registra a data de fabricação do lote.
- **DT_VALIDADE:** registra a data de validade do lote.
- **QUANTIDADE_LOTE:** registra a quantidade de produtos do lote.

---

## 6.14 Registro de ponto

A entidade `Registro_Ponto` representa os registros de jornada realizados pelos funcionários.

Cada registro pertence a exatamente um funcionário, e um funcionário pode possuir nenhum ou vários registros de ponto.

### Informações registradas

- **ID_REGISTRO:** identifica unicamente o registro de ponto.
- **DT_REGISTRO:** registra a data do registro.
- **HR_REGISTRO:** registra o horário do registro.
- **TIPO_REGISTRO:** indica o tipo de registro (por exemplo, entrada ou saída).

---

## 6.15 Atendimento ao cliente (SAC)

A entidade `Atendimento_SAC` representa um atendimento realizado ao cliente, como uma solicitação, reclamação ou dúvida.

Cada atendimento é solicitado por exatamente um cliente e realizado por exatamente um funcionário. Um atendimento pode registrar nenhuma ou uma devolução, o que permite relacionar o contato do cliente ao processo de devolução quando ele ocorrer.

### Informações registradas

- **ID_ATENDIMENTO:** identifica unicamente o atendimento.
- **PROTOCOLO:** registra o número ou código utilizado para acompanhar o atendimento.
- **DT_ATENDIMENTO:** registra a data em que o atendimento foi realizado.
- **STATUS_ATENDIMENTO:** indica a situação atual do atendimento.
- **TIPO_ATENDIMENTO:** indica o tipo de solicitação ou atendimento.
- **DESCRICAO_ATENDIMENTO:** registra informações detalhadas sobre o atendimento.

---

## 6.16 Devoluções

A entidade `Devolução` representa o processo de devolução de produtos relacionado a um pedido.

Cada devolução é registrada a partir de exatamente um atendimento (`Atendimento_SAC`), está relacionada a exatamente um pedido e contém um ou vários produtos devolvidos. A quantidade devolvida de cada produto é registrada no relacionamento `Contém` (atributo `QUANTIDADE_DEVOLVIDA`).

Esse processo está ligado às devoluções observadas em registros de papel durante a visita (seção 4).

### Informações registradas

- **ID_DEVOLUCAO:** identifica unicamente a devolução.
- **DT_DEVOLUCAO:** registra a data em que a devolução foi registrada ou realizada.
- **MOTIVO:** registra o motivo informado para a devolução.
- **STATUS_DEVOLUCAO:** indica a situação atual do processo de devolução.
- **REEMBOLSO_DEVOLUCAO:** registra o valor do reembolso relacionado à devolução, quando houver.

---

# 7. Regras de negócio

As principais regras consideradas na construção do modelo são:

RN1. Cada pedido deve estar associado a um cliente.
RN2. Cada pedido deve estar associado a um funcionário.
RN3. Um cliente pode realizar vários pedidos.
RN4. Um funcionário pode cadastrar vários pedidos.
RN5. Cada pedido possui pelo menos um produto.
RN6. Um produto pode aparecer em vários pedidos.
RN7. Um pedido pode possuir zero ou vários pagamentos.
RN8. Cada pagamento pertence a um pedido.
RN9. Um pedido pode gerar zero ou uma nota fiscal.
RN10. Cada nota fiscal está associada a um pedido.
RN11. Um pedido pode possuir zero ou uma entrega, conforme a cardinalidade representada no DER.
RN12. Cada entrega está associada a um pedido.
RN13. Um fornecedor pode fornecer vários materiais.
RN14. Um material pode ser fornecido por vários fornecedores.
RN15. Cada produto está relacionado a pelo menos um material, e um material pode estar relacionado a diferentes produtos.
RN16. Uma produção deve estar associada a um produto.
RN17. Uma produção utiliza materiais.
RN18. Uma produção utiliza embalagens.
RN19. Um mesmo produto pode possuir diferentes registros de produção.
RN20. Os valores monetários devem possuir validação para evitar valores negativos.
RN21. Quantidades devem possuir validação para evitar valores inválidos.
RN22. Dados pessoais devem possuir mecanismos de proteção contra acesso não autorizado.
RN23. Cada lote pertence a exatamente um produto, e um produto pode possuir zero ou vários lotes.
RN24. Cada registro de ponto pertence a exatamente um funcionário, e um funcionário pode possuir zero ou vários registros de ponto.
RN25. Um funcionário pode participar de zero ou várias produções, e cada produção possui pelo menos um funcionário participante.
RN26. Cada atendimento (SAC) está associado a exatamente um cliente e é realizado por exatamente um funcionário.
RN27. Um atendimento pode registrar zero ou uma devolução, e cada devolução está relacionada a exatamente um atendimento.
RN28. Cada devolução está relacionada a exatamente um pedido, e um pedido pode possuir zero ou várias devoluções.
RN29. Cada devolução contém pelo menos um produto, com a respectiva quantidade devolvida.
RN30. Cada pedido de material está relacionado a exatamente um fornecedor e contém pelo menos um material.
RN31. Cada nota fiscal documenta um faturamento, e um faturamento pode estar relacionado a zero ou uma nota fiscal.

> **Observação para a implementação:** no modelo lógico, uma chave estrangeira isoladamente não impede que haja vários registros relacionados. Para garantir os limites de "zero ou uma" (RN9, RN11 e RN27), a implementação em SQL deverá utilizar restrições `UNIQUE` em `Nota_Fiscal.ID_PEDIDO`, `Entrega.ID_PEDIDO` e `Devolução.ID_ATENDIMENTO`. Os mínimos "um ou mais" (por exemplo, RN5, RN17 e RN29) não são impostos pela estrutura das tabelas e deverão ser garantidos por validações na aplicação ou por triggers.

---

# 8. Dicionário de dados conceitual

O dicionário de dados apresenta a finalidade de cada entidade e de seus principais atributos dentro do modelo.

> **Observação sobre valores monetários:** Variáveis que representam valores em moeda estão no tipo FLOAT pela limitação do BRModelo. Na implementação do SQL serão alteradas para DECIMAL.

## 8.1 Cliente

A entidade `Cliente` representa a pessoa ou organização que realiza pedidos junto à empresa.

| Atributo | Descrição detalhada |
|---|---|
| `ID_CLIENTE` | Identificador único utilizado para diferenciar cada cliente dos demais registros existentes no banco de dados. |
| `NM_CLIENTE` | Nome utilizado para identificar o cliente no cadastro e nas operações comerciais. |
| `CPF_CLIENTE` | CPF do cliente, utilizado para sua identificação cadastral. |
| `TEL_CLIENTE` | Número de telefone utilizado como informação de contato do cliente. |
| `ENDERECO_CLIENTE` | Endereço relacionado ao cliente, utilizado para identificar sua localização cadastral. |
| `CEP_CLIENTE` | CEP correspondente ao endereço cadastrado do cliente. |
| `UF_CLIENTE` | Unidade federativa correspondente ao endereço cadastrado do cliente. |

---

## 8.2 Funcionário

A entidade `Funcionário` representa o profissional responsável pelo cadastro dos pedidos, pela realização dos atendimentos, pelo registro de ponto e pela participação nas produções.

| Atributo | Descrição detalhada |
|---|---|
| `ID_FUNCIONARIO` | Identificador único utilizado para diferenciar cada funcionário cadastrado. |
| `NM_FUNCIONARIO` | Nome completo utilizado para identificação do funcionário. |
| `CARGO` | Cargo ou função exercida pelo funcionário na empresa. |
| `DT_ADMISSAO` | Data em que o funcionário foi admitido. |
| `TEL_FUNCIONARIO` | Número de telefone utilizado para contato com o funcionário. |
| `EMAIL_FUNCIONARIO` | Endereço de e-mail utilizado como canal de comunicação com o funcionário. |

---

## 8.3 Pedido

A entidade `Pedido` representa a solicitação comercial realizada pelo cliente.

| Atributo | Descrição detalhada |
|---|---|
| `ID_PEDIDO` | Identificador único do pedido, utilizado para relacioná-lo aos produtos, pagamentos, notas fiscais, entregas e devoluções. |
| `DT_PEDIDO` | Data em que o pedido foi realizado ou cadastrado no sistema. |
| `PRECO_PEDIDO` | Valor associado ao pedido, representando seu preço total conforme a regra definida para o modelo. |
| `STATUS_PEDIDO` | Situação atual do pedido, permitindo identificar se ele está, por exemplo, em andamento, cancelado ou concluído. |

---

## 8.4 Pagamento

A entidade `Pagamento` representa o registro financeiro relacionado ao pedido.

| Atributo | Descrição detalhada |
|---|---|
| `ID_PAGAMENTO` | Identificador único do registro de pagamento. |
| `DT_PAGAMENTO` | Data em que o pagamento foi realizado ou registrado. |
| `VALOR_PAGAMENTO` | Quantia efetivamente registrada como paga. |
| `FORMA_PAGAMENTO` | Forma utilizada para realização do pagamento. |
| `STATUS_PAGAMENTO` | Situação do pagamento, permitindo acompanhar se está pendente, realizado ou em outra situação definida pela empresa. |

---

## 8.5 Produto

A entidade `Produto` representa os produtos comercializados pela empresa.

| Atributo | Descrição detalhada |
|---|---|
| `ID_PRODUTO` | Identificador único utilizado para diferenciar cada produto cadastrado. |
| `NM_PRODUTO` | Nome comercial utilizado para identificar o produto. |
| `EAN_PRODUTO` | Código EAN utilizado como identificador do produto em processos comerciais. |
| `UNIDADE_PRODUTO` | Unidade utilizada para representar a quantidade ou comercialização do produto. |
| `DESCRIÇÃO_PRODUTO` | Texto utilizado para registrar características ou informações complementares sobre o produto. |

---

## 8.6 Material

A entidade `Material` representa recursos utilizados nos processos produtivos.

| Atributo | Descrição detalhada |
|---|---|
| `ID_MATERIAL` | Identificador único utilizado para diferenciar cada material cadastrado. |
| `NM_MATERIAL` | Nome utilizado para identificar o material utilizado pela empresa. |
| `UNIDADE_MATERIAL` | Unidade utilizada para controlar ou representar a quantidade do material. |
| `ESTOQUE_MIN_MATERIAL` | Quantidade mínima de estoque definida como referência para o acompanhamento do material. |

---

## 8.7 Fornecedor

A entidade `Fornecedor` representa a organização responsável por fornecer materiais.

| Atributo | Descrição detalhada |
|---|---|
| `ID_FORNECEDOR` | Identificador único do fornecedor dentro do banco de dados. |
| `NM_FORNECEDOR` | Nome utilizado para identificar o fornecedor. |
| `CNPJ_FORNECEDOR` | Cadastro Nacional da Pessoa Jurídica utilizado para identificação fiscal do fornecedor. |
| `TEL_FORNECEDOR` | Número utilizado para contato com o fornecedor. |
| `ENDERECO_FORNECEDOR` | Endereço cadastrado do fornecedor. |
| `CEP_FORNECEDOR` | CEP correspondente ao endereço cadastrado do fornecedor. |

---

## 8.8 Pedido_Material

A entidade `Pedido_Material` representa uma solicitação de materiais realizada junto a um fornecedor. Cada pedido de material está relacionado a exatamente um fornecedor e contém um ou vários materiais (a quantidade solicitada e o preço unitário de cada material são registrados no relacionamento `Contém`, descrito no item 8.18).

| Atributo | Descrição detalhada |
|---|---|
| `ID_PEDIDO_MATERIAL` | Identificador único da solicitação de materiais. |
| `DT_PEDIDO` | Data em que o pedido de materiais foi realizado. |
| `DT_PREVISTA` | Data prevista para recebimento ou atendimento da solicitação. |
| `STATUS` | Situação atual do pedido de materiais. |
| `PRECO_TOTAL` | Valor total associado aos materiais solicitados no pedido. |

---

## 8.9 Produção

A entidade `Produção` representa uma ocorrência de fabricação.

| Atributo | Descrição detalhada |
|---|---|
| `ID_PRODUCAO` | Identificador único da produção realizada. |
| `DT_INICIO_PRODUCAO` | Data e horário de início associados ao registro da produção. |
| `QUANTIDADE_PRODUCAO` | Quantidade do produto fabricada naquela ocorrência de produção. |
| `STATUS_PRODUCAO` | Situação atual do processo produtivo registrado. |

---

## 8.10 Embalagem

A entidade `Embalagem` representa os elementos utilizados para acondicionar os produtos.

| Atributo | Descrição detalhada |
|---|---|
| `ID_EMBALAGEM` | Identificador único da embalagem cadastrada. |
| `TIPO_EMBALAGEM` | Classificação ou tipo da embalagem utilizada. |
| `CAPACIDADE_EMBALAGEM` | Capacidade de armazenamento ou acondicionamento da embalagem. |
| `MATERIAL_EMBALAGEM` | Material utilizado para fabricação da embalagem. |

---

## 8.11 Nota_Fiscal

A entidade `Nota_Fiscal` representa o documento fiscal associado ao pedido.

| Atributo | Descrição detalhada |
|---|---|
| `ID_NF` | Identificador único do registro da nota fiscal no banco. |
| `NUM_NF` | Número utilizado para identificar a nota fiscal. |
| `SERIE_NF` | Série fiscal à qual a nota pertence. |
| `DT_EMISSAO` | Data em que a nota fiscal foi emitida. |
| `CHAVE_ACESSO` | Chave utilizada para identificar e consultar eletronicamente a nota fiscal. |
| `VALOR_TOTAL` | Valor total registrado no documento fiscal. |
| `STATUS_NF` | Situação atual da nota fiscal. |

---

## 8.12 Entrega

A entidade `Entrega` representa a etapa logística relacionada ao envio do pedido.

| Atributo | Descrição detalhada |
|---|---|
| `ID_ENTREGA` | Identificador único utilizado para diferenciar cada entrega. |
| `COD_RASTREIO` | Código utilizado para acompanhar o deslocamento ou situação da entrega. |
| `DT_ENVIO` | Data em que os produtos foram enviados para entrega. |
| `DT_ENTREGA` | Data em que a entrega foi efetivamente realizada, quando concluída. |
| `STATUS_ENTREGA` | Situação atual da entrega, permitindo acompanhar seu andamento. |
| `NM_MOTORISTA` | Nome do motorista relacionado ao transporte da entrega. |
| `PLACA_CAMINHAO` | Placa do caminhão utilizado no transporte. |
| `TRANSPORTADORA` | Nome da transportadora responsável pela entrega. |

---

## 8.13 Faturamento

A entidade `Faturamento` representa informações relacionadas ao processo financeiro/fiscal de faturamento.

| Atributo | Descrição detalhada |
|---|---|
| `ID_FATURAMENTO` | Identificador único do registro de faturamento. |
| `DT_FATURAMENTO` | Data em que o faturamento foi realizado. |
| `VALOR_TOTAL` | Valor total associado ao faturamento. |
| `STATUS` | Situação atual do faturamento. |
| `DT_VENCIMENTO` | Data prevista para vencimento do pagamento, quando aplicável. |

---

## 8.14 Atendimento_SAC

A entidade `Atendimento_SAC` representa um atendimento realizado ao cliente. Cada atendimento está relacionado a exatamente um cliente (que o solicita) e a exatamente um funcionário (que o realiza), podendo registrar nenhuma ou uma devolução.

| Atributo | Descrição detalhada |
|---|---|
| `ID_ATENDIMENTO` | Identificador único do atendimento realizado. |
| `PROTOCOLO` | Número ou código utilizado para identificar o atendimento e facilitar seu acompanhamento. |
| `DT_ATENDIMENTO` | Data em que o atendimento foi realizado. |
| `STATUS_ATENDIMENTO` | Situação atual do atendimento. |
| `TIPO_ATENDIMENTO` | Classificação utilizada para identificar o tipo de solicitação ou atendimento. |
| `DESCRICAO_ATENDIMENTO` | Texto utilizado para registrar informações detalhadas sobre o atendimento. |

---

## 8.15 Devolução

A entidade `Devolução` representa o registro de um processo de devolução. Cada devolução está relacionada a exatamente um atendimento (`Atendimento_SAC`) e a exatamente um pedido, e contém um ou vários produtos devolvidos (a quantidade devolvida de cada produto é registrada no relacionamento `Contém`, descrito no item 8.18).

| Atributo | Descrição detalhada |
|---|---|
| `ID_DEVOLUCAO` | Identificador único da devolução. |
| `DT_DEVOLUCAO` | Data em que a devolução foi registrada ou realizada. |
| `MOTIVO` | Motivo informado para realização da devolução. |
| `STATUS_DEVOLUCAO` | Situação atual do processo de devolução. |
| `REEMBOLSO_DEVOLUCAO` | Valor do reembolso relacionado à devolução, quando houver. |

---

## 8.16 Registro_Ponto

A entidade `Registro_Ponto` representa os registros de jornada realizados pelos funcionários. Cada registro pertence a exatamente um funcionário.

| Atributo | Descrição detalhada |
|---|---|
| `ID_REGISTRO` | Identificador único do registro de ponto. |
| `DT_REGISTRO` | Data em que o registro de ponto foi realizado. |
| `HR_REGISTRO` | Horário em que o registro de ponto foi realizado. |
| `TIPO_REGISTRO` | Classificação do registro de ponto (por exemplo, entrada ou saída). |

---

## 8.17 Lote

A entidade `Lote` representa um lote de fabricação de um produto. Cada lote pertence a exatamente um produto.

| Atributo | Descrição detalhada |
|---|---|
| `ID_LOTE` | Identificador único do lote. |
| `NUM_LOTE` | Número ou código utilizado para identificar o lote. |
| `DT_FABRICACAO` | Data de fabricação do lote. |
| `DT_VALIDADE` | Data de validade dos produtos do lote. |
| `QUANTIDADE_LOTE` | Quantidade de produtos pertencentes ao lote. |

---

## 8.18 Atributos de relacionamentos

Alguns atributos pertencem aos relacionamentos muitos-para-muitos e, no modelo lógico, ficam armazenados nas tabelas associativas correspondentes.

| Relacionamento | Atributo | Descrição detalhada |
|---|---|---|
| `Pedido — Possui — Produto` | `QUANTIDADE_PEDIDA` | Quantidade de determinado produto incluída no pedido. |
| `Material — Contém — Pedido_Material` | `QUANTIDADE_SOLICITADA` | Quantidade de determinado material solicitada ao fornecedor no pedido de material. |
| `Material — Contém — Pedido_Material` | `PRECO_UNITARIO` | Preço unitário de determinado material no pedido de material. |
| `Devolução — Contém — Produto` | `QUANTIDADE_DEVOLVIDA` | Quantidade de determinado produto devolvida na devolução. |

---

# 9. Relacionamentos e cardinalidades do DER

As cardinalidades devem ser interpretadas exatamente de acordo com o DER atualizado.

| Relacionamento | Cardinalidade | Descrição |
|---|---|---|
| `Cliente — Faz — Pedido` | Cliente `(0,n)` / Pedido `(1,1)` | Um cliente pode realizar nenhum ou vários pedidos, enquanto cada pedido está associado a exatamente um cliente. |
| `Funcionário — Cadastra — Pedido` | Funcionário `(0,n)` / Pedido `(1,1)` | Um funcionário pode cadastrar nenhum ou vários pedidos, enquanto cada pedido está associado a exatamente um funcionário. |
| `Pedido — Possui — Pagamento` | Pedido `(0,n)` / Pagamento `(1,1)` | Um pedido pode possuir nenhum ou vários pagamentos, enquanto cada pagamento pertence a exatamente um pedido. |
| `Pedido — Possui — Produto` | Pedido `(1,n)` / Produto `(0,n)` | Cada pedido possui pelo menos um produto, enquanto um produto pode estar presente em nenhum ou vários pedidos. O relacionamento possui o atributo `QUANTIDADE_PEDIDA`. |
| `Pedido — Gera — Nota_Fiscal` | Pedido `(0,1)` / Nota_Fiscal `(1,1)` | Um pedido pode não gerar ou gerar uma nota fiscal, enquanto cada nota fiscal está vinculada a exatamente um pedido. |
| `Pedido — Gera — Entrega` | Pedido `(0,1)` / Entrega `(1,1)` | Um pedido pode não gerar ou gerar uma entrega, enquanto cada entrega está vinculada a exatamente um pedido. |
| `Fornecedor — Fornece — Material` | Fornecedor `(0,n)` / Material `(0,n)` | Um fornecedor pode fornecer nenhum ou vários materiais, e um material pode ser fornecido por nenhum ou vários fornecedores. |
| `Fornecedor — Recebe — Pedido_Material` | Fornecedor `(0,n)` / Pedido_Material `(1,1)` | Um fornecedor pode receber nenhum ou vários pedidos de materiais, enquanto cada pedido de material está relacionado a exatamente um fornecedor. |
| `Material — Contém — Pedido_Material` | Material `(0,n)` / Pedido_Material `(1,n)` | Um material pode estar associado a nenhum ou vários pedidos de materiais, enquanto um pedido de material contém um ou vários materiais. O relacionamento possui os atributos `QUANTIDADE_SOLICITADA` e `PRECO_UNITARIO`. |
| `Material — é feito com — Produto` | Material `(0,n)` / Produto `(1,n)` | Um material pode estar associado a nenhum ou vários produtos, enquanto cada produto possui pelo menos um material relacionado. |
| `Material — é utilizado — Produção` | Material `(0,n)` / Produção `(1,n)` | Um material pode ser utilizado em nenhuma ou várias produções, enquanto cada produção utiliza pelo menos um material. |
| `Produto — é produzido em — Produção` | Produto `(0,n)` / Produção `(1,1)` | Um produto pode possuir nenhum ou vários registros de produção, enquanto cada produção está relacionada a exatamente um produto. |
| `Embalagem — Utiliza — Produção` | Embalagem `(0,n)` / Produção `(1,n)` | Uma embalagem pode estar relacionada a nenhuma ou várias produções, enquanto cada produção utiliza pelo menos uma embalagem. |
| `Funcionário — Participa — Produção` | Funcionário `(0,n)` / Produção `(1,n)` | Um funcionário pode participar de nenhuma ou várias produções, enquanto cada produção possui pelo menos um funcionário participante. |
| `Produto — Possui — Lote` | Produto `(0,n)` / Lote `(1,1)` | Um produto pode possuir nenhum ou vários lotes, enquanto cada lote está relacionado a exatamente um produto. |
| `Funcionário — Registra — Registro_Ponto` | Funcionário `(0,n)` / Registro_Ponto `(1,1)` | Um funcionário pode possuir nenhum ou vários registros de ponto, enquanto cada registro de ponto pertence a exatamente um funcionário. |
| `Atendimento_SAC — Solicita — Cliente` | Atendimento `(1,1)` / Cliente `(0,n)` | Cada atendimento está relacionado a exatamente um cliente, enquanto um cliente pode possuir nenhum ou vários atendimentos. |
| `Funcionário — Realiza — Atendimento_SAC` | Funcionário `(0,n)` / Atendimento `(1,1)` | Um funcionário pode realizar nenhum ou vários atendimentos, enquanto cada atendimento é realizado por exatamente um funcionário. |
| `Atendimento_SAC — Registra — Devolução` | Atendimento `(0,1)` / Devolução `(1,1)` | Um atendimento pode registrar nenhuma ou uma devolução, enquanto cada devolução está relacionada a exatamente um atendimento. |
| `Devolução — Tem — Pedido` | Devolução `(1,1)` / Pedido `(0,n)` | Cada devolução está relacionada a exatamente um pedido, enquanto um pedido pode possuir nenhuma ou várias devoluções. |
| `Devolução — Contém — Produto` | Devolução `(1,n)` / Produto `(0,n)` | Cada devolução contém um ou vários produtos, enquanto um produto pode estar presente em nenhuma ou várias devoluções. O relacionamento possui o atributo `QUANTIDADE_DEVOLVIDA`. |
| `Nota_Fiscal — Documenta — Faturamento` | Nota_Fiscal `(1,1)` / Faturamento `(0,1)` | Cada nota fiscal está relacionada a um faturamento, enquanto um faturamento pode estar relacionado a nenhuma ou uma nota fiscal. |

---

# 10. Modelo Conceitual

O Diagrama Entidade-Relacionamento foi desenvolvido utilizando o BRModelo Web.

[🔗 Visualizar DER no BRModelo Web](https://app.brmodeloweb.com/publicview/6ab340cd664f8629cdf4e2ef)

O arquivo do modelo conceitual também está disponível neste repositório:

[🖼️ Modelo Conceitual](modelo_conceitual.jpg)

O DER representa as entidades, atributos, relacionamentos e respectivas cardinalidades identificadas durante o levantamento dos processos.

A estrutura foi construída para permitir que informações de diferentes áreas sejam relacionadas por meio de entidades e relacionamentos.

O modelo lógico, derivado do DER conceitual, também foi desenvolvido no BRModelo Web e está disponível neste repositório:

[🖼️ Modelo Lógico](modelo_logico.jpg)

---

# 11. Transformação do modelo conceitual para o modelo lógico

Durante a transformação do modelo conceitual para o lógico, os relacionamentos com cardinalidade muitos-para-muitos precisam ser representados por estruturas associativas.

Essas tabelas são necessárias porque, no modelo relacional, uma relação N:N não deve ser implementada diretamente entre duas tabelas sem uma estrutura intermediária.

> **Observação sobre valores monetários:** Variáveis que representam valores em moeda estão no tipo FLOAT pela limitação do BRModelo. Na implementação do SQL serão alteradas para DECIMAL.

> Os nomes das tabelas associativas abaixo seguem a nomenclatura deste documento; no BRModelo, essas tabelas foram geradas automaticamente com o nome do relacionamento correspondente (por exemplo, `Possui`, `é feito com`, `é utilizado`).

## 11.1 Pedido × Produto

O relacionamento `Possui` apresenta:

- `Pedido (1,n)`
- `Produto (0,n)`

Como um pedido pode possuir vários produtos e um produto pode aparecer em vários pedidos, foi necessária uma estrutura associativa, como:

`Pedido_Produto`

Essa tabela armazena as referências ao pedido (`ID_PEDIDO`) e ao produto (`ID_PRODUTO`), que formam sua chave primária composta, e o atributo específico da relação, `QUANTIDADE_PEDIDA`.

---

## 11.2 Fornecedor × Material

O relacionamento `Fornece` apresenta:

- `Fornecedor (0,n)`
- `Material (0,n)`

Como um fornecedor pode fornecer vários materiais e um material pode ser fornecido por vários fornecedores, foi necessária uma estrutura associativa:

`Fornecedor_Material`

Essa tabela permite registrar quais materiais são fornecidos por cada fornecedor.

---

## 11.3 Material × Produto

O relacionamento `é feito com` apresenta:

- `Material (0,n)`
- `Produto (1,n)`

Como existe uma relação N:N, foi necessária uma estrutura intermediária:

`Produto_Material`

Ela permite registrar quais materiais estão associados à composição de cada produto.

---

## 11.4 Material × Produção

O relacionamento `é utilizado` apresenta:

- `Material (0,n)`
- `Produção (1,n)`

Como uma produção pode utilizar vários materiais e um mesmo material pode participar de várias produções, foi criada uma estrutura associativa:

`Material_Producao`

Essa estrutura permite registrar a relação entre cada produção e os materiais utilizados.

---

## 11.5 Material × Pedido_Material

O relacionamento `Contém` apresenta:

- `Material (0,n)`
- `Pedido_Material (1,n)`

Como um pedido de material pode conter diversos materiais e um material pode aparecer em diferentes pedidos, a relação necessita de uma estrutura intermediária, como:

`Pedido_Material_Item`

Essa estrutura armazena as referências ao pedido de material e ao material e os atributos específicos da relação: `QUANTIDADE_SOLICITADA` e `PRECO_UNITARIO`.

---

## 11.6 Produção × Embalagem

O relacionamento `Utiliza` apresenta:

- `Embalagem (0,n)`
- `Produção (1,n)`

Uma produção pode utilizar várias embalagens e uma embalagem pode ser utilizada em diferentes produções.

Por esse motivo, a relação também deverá ser representada por uma estrutura associativa no modelo lógico.

---

## 11.7 Funcionário × Produção

O relacionamento `Participa` apresenta:

- `Funcionário (0,n)`
- `Produção (1,n)`

Como um funcionário pode participar de várias produções e uma produção pode contar com vários funcionários, foi necessária uma estrutura associativa, que armazena as referências à produção (`ID_PRODUCAO`) e ao funcionário (`ID_FUNCIONARIO`).

---

## 11.8 Devolução × Produto

O relacionamento `Contém` (entre `Devolução` e `Produto`) apresenta:

- `Devolução (1,n)`
- `Produto (0,n)`

Como uma devolução pode conter vários produtos e um produto pode aparecer em diferentes devoluções, foi necessária uma estrutura associativa, como:

`Devolucao_Produto`

Essa tabela armazena as referências ao produto (`ID_PRODUTO`) e à devolução (`ID_DEVOLUCAO`) e o atributo específico da relação, `QUANTIDADE_DEVOLVIDA`.

---

# 12. Justificativa técnica da modelagem

A separação das entidades foi realizada para representar conceitos diferentes e reduzir a duplicação de informações.

Por exemplo, `Cliente` não foi colocado diretamente dentro de `Pedido` como um conjunto de informações repetidas. O cliente possui cadastro próprio porque pode realizar vários pedidos.

O mesmo princípio é aplicado ao `Funcionário`, que possui seus próprios dados e pode estar associado a diferentes pedidos, atendimentos, registros de ponto e produções.

`Pagamento` foi definido como entidade própria porque possui atributos específicos, como data, valor pago, forma de pagamento e status.

`Nota_Fiscal` também possui entidade própria porque representa uma informação fiscal que possui número, série, chave de acesso, valor e status.

`Produção` foi separada de `Produto` porque um mesmo produto pode ser produzido várias vezes.

`Lote` foi definido como entidade própria porque um mesmo produto pode possuir vários lotes, cada um com número, datas de fabricação e validade e quantidade específicos.

`Registro_Ponto` foi definido como entidade própria porque um funcionário possui vários registros de jornada ao longo do tempo, cada um com data, horário e tipo.

`Material` foi separado de `Produto` porque o material representa um recurso utilizado na fabricação, enquanto o produto representa aquilo que será comercializado.

`Embalagem` também possui entidade própria porque apresenta atributos específicos, como tipo e capacidade.

Essa separação facilita a manutenção dos dados e possibilita que diferentes processos sejam relacionados sem que todas as informações precisem ser repetidas.

---

# 13. BI — Business Intelligence

O modelo possui potencial para apoiar futuras soluções de **Business Intelligence (BI)**.

A estrutura permite reunir informações de diferentes áreas da empresa e transformá-las em indicadores para acompanhamento gerencial.

Por exemplo, utilizando a entidade `Pedido`, seria possível calcular:

- quantidade de pedidos realizados por período;
- quantidade de pedidos cancelados;
- quantidade de pedidos por status;
- valor total dos pedidos;
- produtos mais solicitados;
- pedidos por funcionário.

Relacionando `Pedido` e `Pagamento`, seria possível analisar:

- valores pagos;
- valores pendentes;
- quantidade de pagamentos;
- situação financeira dos pedidos.

Relacionando `Pedido`, `Nota_Fiscal` e `Entrega`, seria possível analisar:

- quantidade de pedidos faturados;
- quantidade de pedidos enviados;
- quantidade de entregas concluídas;
- entregas pendentes;
- tempo entre envio e entrega.

Na área produtiva, as entidades `Produto`, `Produção` e `Material` poderiam fornecer indicadores como:

- quantidade produzida;
- produção por período;
- produtos mais produzidos;
- materiais utilizados;
- frequência de utilização dos materiais.

Dessa forma, o banco pode funcionar como uma fonte estruturada para construção de dashboards.

---

# 14. Inteligência Artificial

O banco de dados também poderá servir como fonte estruturada para futuras aplicações de **Inteligência Artificial**.

Com um histórico suficiente de dados, poderiam ser desenvolvidas soluções para:

### Previsão de demanda

Os dados históricos de pedidos e produtos poderiam ser utilizados para identificar padrões de consumo e estimar futuras demandas.

### Planejamento de materiais

As informações de produção e materiais poderiam auxiliar na estimativa de quais materiais poderão ser necessários em períodos futuros.

### Análise de entregas

Dados históricos de entrega poderiam ser utilizados para identificar padrões relacionados a atrasos ou dificuldades logísticas.

### Identificação de padrões

A IA poderia analisar grandes volumes de pedidos e identificar comportamentos que não seriam facilmente percebidos por meio de consultas manuais.

### Apoio à produção

Informações históricas sobre produção e pedidos poderiam auxiliar na identificação de produtos com maior demanda e apoiar decisões futuras relacionadas ao planejamento produtivo.

Essas aplicações são possibilidades futuras. O projeto atual não implementa modelos de Inteligência Artificial.

---

# 15. Uso de Inteligência Artificial


#### Uso 1 — Código HTML do dicionário de dados

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | *ChatGPT* — geração do código HTML do dicionário de dados. |
| **Motivação** | Agilizar a montagem do dicionário de dados em HTML. |
| **Prompts utilizados** | 1º prompt: solicitação para gerar o código HTML do dicionário de dados a partir das informações do projeto. Prompt reformulado: solicitação para simplificar o código e apresentar o dicionário em formato de lista simples, seguindo as orientações do professor.|
| **Resposta recebida** | O primeiro resultado trouxe uma estrutura mais elaborada do que a pedida pelo professor. Após a reformulação do prompt, a IA gerou o HTML em formato de lista simples. |
| **Fontes consultadas e verificadas** | Não se aplica: o conteúdo do dicionário foi definido pelo grupo a partir do DER; a IA só gerou a formatação. |
| **Trechos rejeitados ou corrigidos** | A primeira versão foi descartada por apresentar uma estrutura mais complexa do que a solicitada. A segunda versão foi utilizada, com revisão do conteúdo e adequação dos nomes dos atributos às informações do DER. |
| **Justificativa da escolha final** | Mantida a versão em lista simples, por seguir as orientações do professor. |
| **Reflexão crítica** | A IA tendeu a entregar mais do que o pedido (estrutura mais complexa), mostrando a necessidade de especificar o formato no prompt e revisar o resultado. |

#### Uso 2 — Elaboração do README (versão inicial)

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | ChatGPT — organização e redação do README (descrição dos processos, requisitos, regras de negócio e demais seções). |
| **Motivação** | Apoio na estruturação das informações levantadas na visita e no DER. |
| **Prompt(s) utilizados** | Solicitação para elaborar e organizar o README do projeto acadêmico de modelagem de banco de dados, contemplando as seções exigidas na atividade e utilizando as informações fornecidas pelo grupo. |
| **Resposta recebida** | Texto do README organizado nas seções solicitadas. |
| **Fontes consultadas e verificadas** | LGPD (Lei nº 13.709/2018), RDC nº 48/2013 da Anvisa e dados institucionais da Muriel (site e LinkedIn). O grupo acessou as fontes institucionais indicadas, comparou as informações encontradas com os dados levantados durante a visita e verificou se as informações utilizadas no README estavam de acordo com o contexto observado na empresa|
| **Trechos rejeitados ou corrigidos** | Foram corrigidos trechos com informações genéricas que não correspondiam diretamente ao contexto observado na visita. Também foram ajustadas descrições de processos, requisitos e regras de negócio para evitar a inclusão de funcionalidades que não faziam parte do escopo definido pelo grupo. |
| **Justificativa da escolha final** | O conteúdo foi revisado e ajustado ao projeto e às orientações da atividade. |
| **Reflexão crítica** | A IA facilitou a organização e redação do README, mas apresentou algumas informações genéricas que precisaram ser comparadas com o que realmente foi observado na visita. Isso mostrou que a IA deve ser utilizada como ferramenta de apoio e que as informações geradas precisam ser verificadas pelo grupo antes da utilização. |

#### Uso 3 — Ajuste do README ao DER final e às normas da entrega

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | Claude (Anthropic) — revisão do README para torná-lo coerente com o DER final e com o modelo de README fornecido pelo professor. |
| **Motivação** | O DER mudou depois da primeira versão do README (saíram entidades como Estoque, Caixa, Separação, Caminhão e as de controle de acesso; entrou Pagamento), e o texto precisava refletir o diagrama e seguir a estrutura exigida. |
| **Prompt(s) utilizados** | Solicitação para revisar o README existente e ajustá-lo de acordo com o DER final do projeto, corrigindo entidades, atributos, relacionamentos, cardinalidades e informações que não correspondessem mais à versão atual do modelo. |
| **Resposta recebida** | Foi gerado um texto estruturado nas seções solicitadas, contemplando a apresentação do projeto, caracterização da organização, processos de negócio, requisitos funcionais e não funcionais, regras de negócio, dicionário de dados, modelagem conceitual, justificativa técnica, uso de IA, conclusão e referências. |
| **Fontes consultadas e verificadas** |Foram utilizadas e verificadas a Lei Geral de Proteção de Dados (LGPD — Lei nº 13.709/2018), a RDC nº 48/2013 da Anvisa e informações institucionais da Muriel Cosméticos, obtidas por meio do site institucional e do perfil institucional no LinkedIn. O grupo comparou essas informações com os dados levantados durante a visita e com o conteúdo do projeto antes de utilizá-las no README. |
| **Trechos rejeitados ou corrigidos** | Foram corrigidos trechos com informações genéricas que não correspondiam diretamente ao contexto observado na visita. Também foram ajustadas descrições de processos, requisitos e regras de negócio para evitar a inclusão de funcionalidades que não faziam parte do escopo definido pelo grupo. |
| **Justificativa da escolha final** | O conteúdo final foi mantido após revisão do grupo, pois apresentava as informações necessárias para documentar o projeto e estava mais adequado às informações coletadas na visita, ao DER e às orientações da atividade. |
| **Reflexão crítica** | A IA interpreta o diagrama a partir de uma imagem e pode errar a leitura de cardinalidades ou nomes de atributos; por isso o grupo precisa conferir tudo com o DER original. Também apontou pontos que precisam de decisão humana (ex.: possível redundância entre Preco_Pedido e Preco). |

# 16. Conclusão

O projeto permitiu transformar processos observados na Muriel Cosméticos em uma estrutura conceitual de banco de dados.

O modelo contempla processos relacionados a clientes, funcionários, registro de ponto, pedidos, produtos, lotes, pagamentos, fornecedores, materiais, produção, embalagens, faturamento, notas fiscais, entregas, atendimento e devoluções.

A visita realizada em 02/09 também permitiu observar a utilização de registros físicos relacionados a estoque, devoluções e pedidos cancelados.

Essa observação contribuiu para identificar a necessidade de organizar e relacionar informações que participam de diferentes processos.

A modelagem proposta permite que informações comerciais, financeiras, produtivas, fiscais e logísticas sejam relacionadas por meio das entidades e relacionamentos definidos no DER.

Além de atender aos processos analisados no projeto, o modelo fornece uma base para futuras implementações de banco de dados, consultas SQL, dashboards de BI e aplicações de Inteligência Artificial.

---

# 17. Trabalhos futuros

Como possíveis evoluções do projeto, poderão ser considerados:

- implementação física do banco de dados;
- criação das tabelas SQL;
- definição final dos tipos de dados (incluindo a alteração de FLOAT para DECIMAL nos valores monetários);
- implementação das chaves primárias e estrangeiras definidas no modelo lógico;
- criação das tabelas associativas definidas no modelo lógico;
- criação de índices;
- implementação de restrições de integridade (incluindo `UNIQUE` para os relacionamentos "zero ou um" e validações para os mínimos "um ou mais");
- detalhamento do controle de estoque;
- detalhamento do controle de lote e validade;
- controle de movimentações de estoque;
- detalhamento das devoluções;
- detalhamento do atendimento ao cliente;
- criação de entidades próprias para motorista e caminhão;
- criação de dashboards de BI;
- criação de relatórios gerenciais;
- integração com sistemas corporativos;
- desenvolvimento de soluções de IA para previsão e análise.

---

# 18. Documentação e evidências

Toda a documentação relacionada à visita e à entrevista está organizada dentro do repositório.

```text
documentacao/
├── observacoes-visita.md
│
└── entrevista/
    ├── entrevista-muriel.md
    │
    └── fotos/
        ├── foto-01.jpg
        ├── foto-02.jpg
        └── ...
```

### Arquivos

- [📄 Entrevista](documentacao/entrevista/entrevista-muriel.md)
- [📄 Observações presenciais](documentacao/observacoes-visita.md)
- [📁 Evidências fotográficas](documentacao/entrevista/fotos/)

A documentação da entrevista contém as informações relatadas pela entrevistada.

O arquivo de observações registra aquilo que foi observado diretamente pelo grupo durante a visita.

As fotografias, quando autorizadas, funcionam como evidências visuais da visita realizada.

---

# 19. Referências

**MURIEL COSMÉTICOS.** Muriel Cosméticos — site institucional.

**MURIEL COSMÉTICOS.** Perfil institucional. LinkedIn.

**BRASIL.** Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais (LGPD).

**ANVISA.** Resolução RDC nº 48, de 25 de outubro de 2013. Regulamento Técnico de Boas Práticas de Fabricação para Produtos de Higiene Pessoal, Cosméticos e Perfumes.

**GRUPO DO PROJETO.** Modelo Conceitual e Modelo Lógico — BRModelo Web.
