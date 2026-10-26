# Entrevista — Muriel Cosméticos

## 1. Identificação da entrevista

- **Empresa:** Muriel Cosméticos
- **Data:** 02/09/2026
- **Local:** Sala responsável por assuntos relacionados ao estoque, localizada na área de expedição da empresa Muriel Cosméticos.
- **Entrevistada:** Raquel Lira da Silva
- **Cargo/Setor:** Gerente geral
- **Número para contato:** (11)99464-1908
- **Participante entrevistador:** Maria Eduarda da Silva Costa RGM: 46939563

**Observação:** As respostas abaixo foram organizadas e reconstruídas pelo grupo a partir das informações obtidas durante a visita e da compreensão dos processos da empresa. Não constituem uma transcrição literal da fala da entrevistada.

---

# 2. Entrevista

## Pergunta 1 — Como funciona o cadastro dos clientes?

**Resposta:**

Os clientes precisam ser identificados e cadastrados para que os pedidos possam ser relacionados corretamente a cada um. Entre as informações consideradas estão nome, CPF, telefone e endereço.

Essas informações foram representadas no modelo pela entidade **Cliente**, permitindo relacionar os clientes aos pedidos realizados.

---

## Pergunta 2 — Como funciona o trabalho dos funcionários nos processos da empresa?

**Resposta:**

Os funcionários participam de atividades administrativas e operacionais, de acordo com suas responsabilidades. No processo comercial, os colaboradores responsáveis realizam o registro dos pedidos dos clientes por meio do sistema TOTVS Protheus.

No modelo atualizado, a entidade **Funcionário** representa os colaboradores da empresa e reúne informações como identificação, nome, telefone, e-mail, cargo e data de admissão. Essa alteração permite representar os funcionários de forma mais abrangente, sem limitar a entidade apenas aos representantes comerciais.

---

## Pergunta 3 — Como os pedidos são registrados?

**Resposta:**

Os pedidos são registrados pelos responsáveis pelo processo comercial por meio do sistema TOTVS Protheus, utilizando o código e a descrição dos produtos solicitados pelos clientes.

No modelo conceitual, a entidade **Pedido** reúne informações como identificação do pedido, data, preço e status. Ela se relaciona com o **Cliente** que realizou a solicitação e com o **Funcionário** responsável pelo registro.

---

## Pergunta 4 — Um pedido pode possuir mais de um produto?

**Resposta:**

Um pedido pode conter diferentes produtos e quantidades, conforme a solicitação do cliente. Um mesmo produto também pode estar presente em diferentes pedidos.

No DER, o relacionamento entre **Pedido** e **Produto** representa essa ligação. O relacionamento entre Pedido e produto, possui o atributo a quantidade pedida. 

---

## Pergunta 5 — Como são controlados os produtos comercializados?

**Resposta:**

Os produtos precisam ser identificados para facilitar o cadastro, a comercialização e o acompanhamento durante os processos da empresa.

No modelo, a entidade **Produto** reúne informações como identificação, nome, descrição e unidade. Também foi incluída a entidade **Lote**, que permite registrar informações relacionadas aos lotes dos produtos fabricados, como número, data de fabricação, data de validade e quantidade.

Essa estrutura contribui para relacionar os produtos aos seus lotes e facilitar o acompanhamento das informações de fabricação e validade.

---

## Pergunta 6 — Como são controlados os materiais utilizados na produção?

**Resposta:**

A fabricação dos produtos depende de diferentes materiais e insumos, que precisam ser identificados e relacionados aos produtos em que são utilizados.

Por isso, o modelo possui a entidade **Material**, com informações como identificação, nome, unidade e estoque mínimo. O relacionamento entre **Produto** e **Material** representa a utilização desses materiais na fabricação dos produtos.

---

## Pergunta 7 — Como funciona o relacionamento com os fornecedores?

**Resposta:**

Os materiais necessários para as atividades da empresa são obtidos de fornecedores. Um fornecedor pode disponibilizar diferentes materiais, de acordo com as necessidades da operação.

No DER, a entidade **Fornecedor** reúne informações cadastrais, como identificação, nome, CNPJ, telefone, CEP e endereço. O relacionamento entre **Fornecedor** e **Material** representa a associação entre os fornecedores e os materiais que disponibilizam.

---

## Pergunta 8 — Como é realizado o pedido de materiais?

**Resposta:**

Após o registro dos pedidos comerciais, é realizado o planejamento das compras conforme as necessidades identificadas. As solicitações de materiais são realizadas por meio do sistema TOTVS Protheus.

Para representar esse processo no modelo, foi utilizada a entidade **Pedido_Material**, separada do pedido realizado pelo cliente. Ela permite registrar informações como identificação do pedido de material, data do pedido, previsão de recebimento, status e preço total.

O pedido de material se relaciona com o fornecedor e com os materiais solicitados, permitindo organizar as informações referentes às compras.

---

## Pergunta 9 — Como funciona a produção dos produtos?

**Resposta:**

Após a chegada dos materiais necessários, é realizada a programação da produção. Em seguida, são emitidas as ordens de produção no sistema TOTVS Protheus e começa o processo de fabricação, que envolve a manipulação dos produtos, o envase nos frascos e o acondicionamento nas caixas.

No DER, a entidade **Produção** reúne informações como data de início, quantidade produzida e status. Ela se relaciona com os produtos fabricados, os materiais utilizados, as embalagens empregadas e os funcionários que participam do processo.

---

## Pergunta 10 — Como as embalagens são utilizadas na produção?

**Resposta:**

Durante o processo produtivo, os produtos passam por etapas de envase e acondicionamento em embalagens, como frascos e caixas. Esses materiais precisam ser considerados conforme o tipo de produto fabricado.

No modelo, a entidade **Embalagem** possui informações como identificação, tipo, capacidade e material utilizado. O relacionamento entre **Produção** e **Embalagem** permite representar as embalagens utilizadas durante a fabricação.

---

## Pergunta 11 — Como funciona o pagamento dos pedidos?

**Resposta:**

As informações de pagamento precisam ser organizadas para permitir o acompanhamento dos valores e da situação financeira dos pedidos.

No DER, a entidade **Pagamento** registra informações como identificação, data, valor, forma de pagamento e status. O relacionamento com **Pedido** permite associar os pagamentos aos pedidos correspondentes.

---

## Pergunta 12 — Como funciona o faturamento?

**Resposta:**

O faturamento faz parte do processo de atendimento dos pedidos comerciais e possui informações próprias para o acompanhamento dos valores e das situações relacionadas a essa etapa.

No modelo, a entidade **Faturamento** reúne informações como identificação, data de faturamento, valor total, status e data de vencimento. Ela se relaciona com a documentação fiscal por meio do relacionamento representado no DER.

---

## Pergunta 13 — Como são registradas as notas fiscais?

**Resposta:**

As notas fiscais precisam possuir informações que permitam sua identificação e consulta durante os processos da empresa.

No modelo, a entidade **Nota Fiscal** reúne dados como identificação, número, série, chave de acesso, data de emissão, valor total e status. O relacionamento com **Pedido** representa a associação entre o pedido comercial e sua documentação fiscal, enquanto o relacionamento com **Faturamento** representa a ligação com o processo de faturamento.

---

## Pergunta 14 — Como funciona o processo de entrega?

**Resposta:**

Depois que os produtos são preparados para a expedição, os pedidos são separados conforme as quantidades solicitadas, os volumes são carregados nos veículos e encaminhados aos clientes em diferentes regiões do Brasil.

No DER, a entidade **Entrega** reúne informações como identificação, data de envio, data prevista de entrega, status, código de rastreio, motorista, placa do caminhão e transportadora. Essa entidade permite representar o acompanhamento do transporte e da entrega dos pedidos.

---

## Pergunta 15 — Como são tratados os problemas ou solicitações dos clientes após a venda?

**Resposta:**

Podem ocorrer situações em que os clientes precisam entrar em contato com a empresa para apresentar solicitações ou relatar algum problema relacionado aos produtos ou aos pedidos.

Para representar esse processo, o modelo possui a entidade **Atendimento_SAC**, que permite registrar informações como identificação do atendimento, protocolo, data, tipo de atendimento, descrição e status.

O atendimento se relaciona com o cliente e com o funcionário responsável, permitindo organizar as informações das solicitações registradas.

---

## Pergunta 16 — Como são registradas as devoluções?

**Resposta:**

Em algumas situações, um atendimento realizado pelo SAC pode estar relacionado à necessidade de devolução de produtos. Por isso, é importante manter informações que permitam identificar e acompanhar essas ocorrências.

No modelo, a entidade **Devolução** reúne dados como identificação, data, motivo, status e informações de reembolso. Ela se relaciona com o **Atendimento_SAC**, enquanto o relacionamento entre **Devolução** e **Produto** permite registrar os produtos e as quantidades devolvidas.

Dessa forma, o modelo diferencia o atendimento realizado ao cliente da devolução registrada.

---

## Pergunta 17 — Como são acompanhados os horários dos funcionários?

**Resposta:**

É importante manter organizadas as informações relacionadas aos horários dos funcionários para possibilitar o acompanhamento dos registros de jornada.

Para representar esse controle no DER, foi adicionada a entidade **Registro_Ponto**, que contém informações como identificação do registro, data, horário e tipo de registro. Ela se relaciona com a entidade **Funcionário**, permitindo associar cada marcação ao colaborador correspondente.

A estrutura permite organizar os registros de entrada, saída e outros tipos de marcação que sejam adotados pela empresa. Os procedimentos específicos de controle de ponto devem ser confirmados com a empresa.

---

## Pergunta 18 — Como funciona o controle dos lotes dos produtos?

**Resposta:**

O acompanhamento dos lotes permite identificar os produtos fabricados e organizar informações relacionadas à fabricação, à quantidade e à validade.

No modelo atualizado, a entidade **Lote** possui informações como número do lote, data de fabricação, data de validade e quantidade. Ela se relaciona com **Produto**, permitindo associar o lote ao produto correspondente.

Essa estrutura pode auxiliar no acompanhamento dos produtos ao longo dos processos de fabricação e armazenamento.

---

## Pergunta 19 — Quais informações seriam importantes para acompanhar melhor os processos?

**Resposta:**

É importante organizar as informações relacionadas aos clientes, pedidos, funcionários, materiais, fornecedores, produção, lotes, pagamentos, faturamento, entregas e atendimentos realizados após a venda.

Com base nos processos estudados, o grupo estruturou o DER para relacionar essas informações e facilitar consultas sobre as operações da empresa.

---

## Pergunta 20 — Como o banco de dados poderia ajudar a empresa?

**Resposta:**

Um banco de dados integrado pode ajudar a organizar as informações e facilitar a consulta dos registros relacionados às atividades da empresa.

O modelo atualizado contempla as entidades **Cliente**, **Funcionário**, **Registro_Ponto**, **Pedido**, **Produto**, **Lote**, **Material**, **Fornecedor**, **Pedido_Material**, **Produção**, **Embalagem**, **Pagamento**, **Faturamento**, **Nota Fiscal**, **Entrega**, **Atendimento_SAC** e **Devolução**, além dos relacionamentos representados no DER.

Com essas informações estruturadas, o banco de dados poderá apoiar consultas integradas e, futuramente, permitir o uso de ferramentas de **Business Intelligence (BI)** para gerar indicadores e dashboards. Técnicas de **Inteligência Artificial (IA)** também poderão ser avaliadas para identificar padrões, apoiar previsões e auxiliar na tomada de decisões.

---

# 3. Relação da entrevista com o DER

As informações levantadas durante a entrevista e os processos estudados pelo grupo contribuíram para a definição das entidades do modelo conceitual atualizado.

| Processo identificado | Entidades relacionadas no DER |
|---|---|
| Cadastro de clientes | Cliente |
| Atuação dos colaboradores | Funcionário |
| Controle de jornada | Funcionário, Registro_Ponto |
| Registro comercial dos pedidos | Cliente, Funcionário, Pedido |
| Produtos comercializados | Pedido, Produto |
| Controle de lotes e validade | Produto, Lote |
| Controle de materiais | Produto, Material |
| Relacionamento com fornecedores | Fornecedor, Material |
| Solicitação de materiais | Fornecedor, Pedido_Material, Material |
| Fabricação dos produtos | Produção, Produto, Material |
| Utilização de embalagens | Produção, Embalagem |
| Pagamentos | Pedido, Pagamento |
| Faturamento | Pedido, Faturamento |
| Documentação fiscal | Pedido, Faturamento, Nota_Fiscal |
| Transporte e entrega | Pedido, Entrega |
| Atendimento pós-venda | Cliente, Funcionário, Atendimento_SAC |
| Devolução de produtos | Atendimento_SAC, Devolução, Produto |

A estrutura do DER separa as informações de acordo com suas finalidades. Por exemplo, **Pedido** representa o registro comercial, enquanto **Pedido_Material** representa a solicitação de materiais aos fornecedores. Da mesma forma, **Atendimento_SAC** registra uma ocorrência de atendimento e **Devolução** representa a ocorrência de retorno de produtos.

A inclusão de **Funcionário**, **Registro_Ponto** e **Lote** amplia a representação dos processos relacionados aos colaboradores, aos registros de jornada e à identificação dos produtos fabricados.

---

# 4. Observação presencial relacionada à entrevista

Durante a visita realizada em 02/09/2026, na sala responsável por assuntos relacionados ao estoque, localizada na área de expedição da Muriel Cosméticos, foram observados registros físicos em papel relacionados a diferentes processos da empresa.

Essa observação foi considerada pelo grupo na análise da organização das informações e na proposta de estruturar os dados em um modelo integrado.

---

# 5. Considerações finais (mundaças que tiveram ao longo do processo de realização do modelo conceitual)

As alterações realizadas no DER tiveram como objetivo representar de forma mais abrangente os processos estudados na Muriel Cosméticos.

A substituição de **Representante** por **Funcionário** permite representar os colaboradores de maneira mais ampla. A inclusão de **Registro_Ponto** contempla a organização dos registros de jornada, enquanto a entidade **Lote** permite associar os produtos fabricados às informações de fabricação e validade.

As entidades **Pedido_Material**, **Atendimento_SAC** e **Devolução** também permitem separar processos com finalidades diferentes, organizando as solicitações de materiais, os atendimentos posteriores à venda e os registros de devolução.

Dessa forma, o modelo atualizado busca integrar as informações comerciais, administrativas, produtivas e logísticas, facilitando a consulta e o acompanhamento dos processos representados no DER.

**Nota metodológica:** as descrições das entidades e dos relacionamentos representam a estrutura proposta pelo grupo com base no DER. Os detalhes operacionais que não foram confirmados durante a entrevista devem ser validados com a empresa antes de serem apresentados como procedimentos efetivamente adotados.
