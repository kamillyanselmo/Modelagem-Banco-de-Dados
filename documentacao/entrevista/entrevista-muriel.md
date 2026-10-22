# Entrevista — Muriel Cosméticos

## 1. Identificação da entrevista

- **Empresa:** Muriel Cosméticos
- **Data:** 02/09
- **Local:** Sala responsável por assuntos relacionados ao estoque, localizada na área de expedição da empresa Muriel Cosméticos.
- **Entrevistada:** Raquel Lira da Silva
- **Cargo/Setor:** Gerente geral
- **Telefone:** (11)99464-1908

> **Observação:** As respostas abaixo foram organizadas e reconstruídas pelo grupo a partir das informações obtidas durante a visita e da compreensão dos processos da empresa. Não constituem uma transcrição literal da fala da entrevistada.

---

# 2. Entrevista

## Pergunta 1 — Como funciona o cadastro dos clientes?

**Resposta:**  
A entrevistada explicou que os clientes precisam ser identificados e cadastrados para que os pedidos possam ser relacionados corretamente a cada cliente. Entre as informações utilizadas estão nome, telefone, endereço e unidade federativa.

Essas informações foram representadas no modelo pela entidade **Cliente**, permitindo que um mesmo cliente esteja relacionado a diferentes pedidos ao longo do tempo.

---

## Pergunta 2 — Como funciona o trabalho dos representantes comerciais?

**Resposta:**  
A entrevistada informou que os representantes possuem participação no processo comercial, principalmente no registro e acompanhamento dos pedidos realizados pelos clientes.

O modelo representa essa função por meio da entidade **Representante**, contendo informações como nome, telefone e e-mail. Cada pedido fica associado ao representante responsável pelo seu cadastro.

---

## Pergunta 3 — Como os pedidos são registrados?

**Resposta:**  
A entrevistada relatou que o pedido reúne as principais informações da venda, como o cliente responsável, o representante, a data, o preço e a situação atual do pedido.

No modelo conceitual, o **Pedido** funciona como uma das principais entidades do processo comercial, relacionando-se com cliente, representante, produtos, pagamentos, faturamento e entrega.

---

## Pergunta 4 — Um pedido pode possuir mais de um produto?

**Resposta:**  
A entrevistada explicou que um pedido pode conter diferentes produtos. Da mesma forma, um mesmo produto pode aparecer em diversos pedidos realizados por diferentes clientes.

Por esse motivo, o relacionamento entre **Pedido** e **Produto** foi representado como muitos-para-muitos, sendo necessária uma tabela associativa durante a transformação para o modelo lógico.

---

## Pergunta 5 — Como são controlados os produtos comercializados?

**Resposta:**  
A entrevistada informou que os produtos precisam ser identificados individualmente para facilitar seu cadastro, comercialização e rastreabilidade.

No modelo, a entidade **Produto** contém informações como identificação, nome, código EAN, unidade e descrição. No modelo atualizado também foram considerados os dados de **lote e validade**, permitindo ampliar a rastreabilidade dos produtos.

---

## Pergunta 6 — Como são controlados os materiais utilizados na produção?

**Resposta:**  
A entrevistada explicou que a fabricação dos produtos depende de diferentes materiais e insumos. Esses materiais precisam ser identificados e relacionados aos produtos e às produções em que são utilizados.

Por isso, o modelo possui a entidade **Material**, com informações como nome, unidade e estoque mínimo.

---

## Pergunta 7 — Como funciona o relacionamento com os fornecedores?

**Resposta:**  
A entrevistada informou que os materiais utilizados pela empresa são obtidos de fornecedores. Um fornecedor pode disponibilizar diferentes materiais e um mesmo material pode possuir mais de um fornecedor.

Essa situação foi representada pelo relacionamento entre **Fornecedor** e **Material**, com cardinalidade muitos-para-muitos.

---

## Pergunta 8 — Como é realizado o pedido de materiais?

**Resposta:**  
A entrevistada explicou que existe uma necessidade de solicitar materiais aos fornecedores para atender às demandas da operação.

Para representar esse processo de forma separada do pedido realizado pelo cliente, foi criada no modelo atualizado a entidade **Pedido_Material**.

Essa entidade permite registrar informações como data do pedido, data prevista, status e preço total, relacionando a solicitação ao fornecedor e aos materiais solicitados.

---

## Pergunta 9 — Como funciona a produção dos produtos?

**Resposta:**  
A entrevistada explicou que a produção registra a fabricação dos produtos e envolve o controle da quantidade produzida e da situação da produção.

No modelo, a entidade **Produção** possui informações como data, quantidade produzida e status. Cada produção está relacionada a um produto e também aos materiais utilizados durante sua execução.

---

## Pergunta 10 — Como as embalagens são relacionadas à produção?

**Resposta:**  
A entrevistada informou que diferentes tipos de embalagens podem ser utilizados durante a fabricação dos produtos.

O modelo possui a entidade **Embalagem**, com informações como tipo, capacidade e material. Uma produção pode utilizar diferentes embalagens, enquanto uma embalagem pode ser utilizada em diferentes produções.

Por isso, esse relacionamento também será transformado em uma estrutura associativa no modelo lógico.

---

## Pergunta 11 — Como funciona o pagamento dos pedidos?

**Resposta:**  
A entrevistada explicou que o pagamento precisa ser acompanhado separadamente do pedido, pois existem situações em que um pedido pode estar registrado e o pagamento ainda não ter sido concluído.

O modelo possui a entidade **Pagamento**, que registra data, preço, valor pago e status do pagamento.

A separação entre pedido e pagamento permite acompanhar a situação financeira de cada operação.

---

## Pergunta 12 — Como funciona o faturamento?

**Resposta:**  
A entrevistada explicou que o faturamento representa uma etapa posterior ao registro do pedido e possui informações próprias relacionadas ao valor, à forma de pagamento, ao vencimento e ao status.

Por esse motivo, o modelo atualizado possui a entidade **Faturamento**, separando essa etapa do simples registro do pedido.

O faturamento também está relacionado à documentação fiscal correspondente.

---

## Pergunta 13 — Como são registradas as notas fiscais?

**Resposta:**  
A entrevistada informou que as notas fiscais precisam possuir informações próprias para identificação e acompanhamento.

No modelo, a entidade **Nota_Fiscal** registra dados como número, série, data de emissão, chave de acesso, valor total e status.

A separação da nota fiscal em uma entidade própria permite manter as informações fiscais organizadas e relacionadas ao pedido ou faturamento correspondente.

---

## Pergunta 14 — Como funciona o processo de entrega?

**Resposta:**  
A entrevistada explicou que, após as etapas necessárias do pedido, ocorre a expedição e entrega dos produtos ao cliente.

A entidade **Entrega** foi utilizada para registrar informações como código de rastreio, data de envio, data de entrega, status, motorista, caminhão e transportadora.

Dessa forma, o banco pode permitir o acompanhamento da situação da entrega e sua relação com o pedido.

---

## Pergunta 15 — Como são tratados os problemas ou solicitações dos clientes após a venda?

**Resposta:**  
A entrevistada explicou que podem ocorrer situações em que o cliente precisa entrar em contato com a empresa depois da realização do pedido ou recebimento do produto.

Para representar esse processo, o modelo atualizado possui a entidade **Atendimento_SAC**, que permite registrar protocolo, data do atendimento, tipo de atendimento, descrição e status.

O atendimento fica relacionado ao cliente, permitindo manter um histórico das solicitações realizadas.

---

## Pergunta 16 — Como são registradas as devoluções?

**Resposta:**  
A entrevistada informou que determinados atendimentos podem resultar na necessidade de devolução de produtos.

Para representar essa situação, foi criada a entidade **Devolução**, relacionada ao atendimento do SAC.

A devolução possui informações próprias, como data, motivo, status, quantidade devolvida e reembolso.

Dessa forma, o modelo consegue diferenciar o simples atendimento ao cliente de uma ocorrência que efetivamente resultou em devolução.

---

## Pergunta 17 — Como são acompanhados os pedidos cancelados?

**Resposta:**  
A entrevistada relatou que existem registros relacionados a pedidos que podem ser cancelados e que parte desse acompanhamento ainda depende de registros físicos utilizados pelos setores.

Essa situação foi considerada pelo grupo na definição do atributo de **status do pedido**, permitindo diferenciar pedidos em diferentes situações e facilitar consultas futuras.

---

## Pergunta 18 — Como são controladas as informações de estoque?

**Resposta:**  
A entrevistada explicou que o estoque envolve registros relacionados aos materiais e aos produtos utilizados nos processos da empresa.

Durante a visita, o grupo observou a utilização de documentos físicos para registrar informações relacionadas ao estoque. Também foram observados papéis utilizados como evidência para processos relacionados a devoluções e pedidos cancelados.

A partir dessa observação, o grupo considerou importante estruturar as informações em entidades relacionadas, reduzindo a dependência de registros físicos e permitindo consultas integradas.

---

## Pergunta 19 — Quais informações seriam importantes para acompanhar melhor os processos?

**Resposta:**  
A entrevistada indicou que seria importante conseguir acompanhar as informações relacionadas aos pedidos, estoque, produção, pagamentos, faturamento, entregas e ocorrências posteriores à venda.

Com base nisso, o grupo estruturou o modelo para relacionar essas áreas e permitir consultas que apresentem o histórico das operações.

---

## Pergunta 20 — Como o banco de dados poderia ajudar a empresa?

**Resposta:**  
A partir dos processos apresentados, o grupo identificou que um banco de dados integrado poderia centralizar as informações e facilitar a consulta dos registros.

O modelo permite relacionar clientes, representantes, pedidos, produtos, pagamentos, fornecedores, materiais, produção, faturamento, notas fiscais, entregas, atendimentos do SAC e devoluções.

Com essas informações estruturadas, seria possível futuramente utilizar ferramentas de **Business Intelligence (BI)** para gerar indicadores e dashboards, além de utilizar técnicas de **Inteligência Artificial (IA)** para identificar padrões, apoiar previsões e auxiliar na tomada de decisões.

---

# 3. Relação da entrevista com o DER

As informações levantadas durante a entrevista contribuíram para a definição das principais entidades do modelo.

| Processo identificado | Entidade no DER |
|---|---|
| Cadastro de clientes | Cliente |
| Atuação comercial | Representante |
| Venda | Pedido |
| Produtos vendidos | Produto |
| Pagamentos | Pagamento |
| Faturamento | Faturamento |
| Documentação fiscal | Nota_Fiscal |
| Fornecimento de insumos | Fornecedor |
| Controle de insumos | Material |
| Solicitação de materiais | Pedido_Material |
| Fabricação | Produção |
| Embalagens | Embalagem |
| Transporte e expedição | Entrega |
| Atendimento pós-venda | Atendimento_SAC |
| Retorno de produtos | Devolução |

A entrevista também ajudou a justificar a separação entre os diferentes processos. Por exemplo, **Pagamento** possui informações próprias e não foi tratado apenas como um atributo de Pedido; da mesma forma, **Nota_Fiscal** possui informações fiscais específicas e **Entrega** possui informações próprias de rastreamento.

---

# 4. Observação presencial relacionada à entrevista

Durante a visita realizada em 02/09, na sala responsável por assuntos relacionados ao estoque, localizada na área de expedição da Muriel Cosméticos, foram observados diversos registros físicos em papel.

Entre os documentos observados estavam registros relacionados a estoque, devoluções e pedidos cancelados, entre outros processos. Também foi observado que os papéis eram utilizados como forma de evidenciar e acompanhar determinados processos.

Essa observação presencial foi considerada separadamente das informações relatadas na entrevista e contribuiu para a identificação da necessidade de organizar os processos em uma estrutura de dados integrada.
