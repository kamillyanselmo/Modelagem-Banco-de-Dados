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

O modelo foi desenvolvido a partir das informações levantadas durante a visita à empresa, da entrevista realizada com uma colaboradora e da análise dos processos relacionados ao cadastro de clientes e representantes, registro de pedidos, produtos, pagamentos, fornecedores, materiais, produção, embalagens, faturamento, notas fiscais e entregas.

A proposta do banco de dados é organizar essas informações de maneira estruturada, permitindo que dados pertencentes a diferentes processos possam ser relacionados e consultados de maneira integrada.

O projeto está delimitado à **modelagem conceitual e à documentação do modelo**. A implementação física do banco de dados, a criação definitiva das tabelas SQL, a definição dos tipos de dados e a integração com sistemas corporativos são consideradas etapas posteriores.

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
    p.IdPedido,
    p.Data_Pedido,
    p.Status_Pedido,
    pag.Status_Pagamento,
    nf.StatusNF,
    e.Status_Entrega
FROM Pedido p
LEFT JOIN Pagamento pag
    ON pag.IdPedido = p.IdPedido
LEFT JOIN Nota_Fiscal nf
    ON nf.IdPedido = p.IdPedido
LEFT JOIN Entrega e
    ON e.IdPedido = p.IdPedido;
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
    p.IdPedido,
    p.Status_Pedido,
    pag.Status_Pagamento,
    nf.StatusNF,
    e.Status_Entrega
FROM Pedido p
LEFT JOIN Pagamento pag
    ON pag.IdPedido = p.IdPedido
LEFT JOIN Nota_Fiscal nf
    ON nf.IdPedido = p.IdPedido
LEFT JOIN Entrega e
    ON e.IdPedido = p.IdPedido;
```

O resultado poderá fornecer uma visão integrada da situação de cada pedido.

---

## P3 — Dificuldade de acompanhar pagamentos

**Problema:**

Os pagamentos possuem informações próprias, como data, preço, valor pago e status.

A existência de uma entidade específica para pagamento permite separar as informações financeiras das informações gerais do pedido, mantendo uma relação entre as duas.

**Como o banco ajuda:**

A relação entre `Pedido` e `Pagamento` permite identificar quais pagamentos estão associados a determinado pedido e consultar a situação financeira correspondente.

**Tabelas/entidades relacionadas:**

`Pedido` e `Pagamento`.

**Consulta:**

```sql
SELECT
    p.IdPedido,
    p.Preco_Pedido,
    pag.Data_Pagamento,
    pag.Preco,
    pag.Valor_Pago,
    pag.Status_Pagamento
FROM Pedido p
JOIN Pagamento pag
    ON pag.IdPedido = p.IdPedido;
```

A consulta pode auxiliar na identificação de valores pagos, valores registrados e status dos pagamentos associados aos pedidos.

---

## P4 — Dificuldade de rastrear materiais utilizados na produção

**Problema:**

A produção dos produtos depende de materiais e embalagens. Por isso, é importante conseguir relacionar um produto produzido aos materiais utilizados em sua produção.

**Como o banco ajuda:**

As entidades `Produto`, `Material` e `Produção` permitem organizar essas informações e estabelecer relações entre o produto fabricado, a produção realizada e os materiais utilizados.

**Tabelas/entidades relacionadas:**

`Produto`, `Material` e `Produção`.

**Consulta:**

```sql
SELECT
    prod.Id_Produto,
    prod.Nome_Produto,
    pr.IdProducao,
    pr.Data_emissao,
    pr.Quantidade_Producao,
    pr.Status_Producao,
    mat.IdMaterial,
    mat.Nome_Material
FROM Produto prod
JOIN Produção pr
    ON pr.Id_Produto = prod.Id_Produto
JOIN Material mat
    ON mat.IdMaterial = pr.IdMaterial;
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
    p.IdPedido,
    p.Status_Pedido,
    e.Codigo_Rastreio,
    e.Data_Envio,
    e.Data_Entrega,
    e.Status_Entrega,
    e.Nome_Motorista,
    e.IdCaminhao
FROM Pedido p
JOIN Entrega e
    ON e.IdPedido = p.IdPedido;
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
    p.IdPedido,
    nf.IdNotaFiscal,
    nf.Numero_NF,
    nf.Serie,
    nf.Data_Emissao,
    nf.Chave_Acesso,
    nf.Valor_Total,
    nf.StatusNF
FROM Pedido p
JOIN Nota_Fiscal nf
    ON nf.IdPedido = p.IdPedido;
```

---

# 6. Processos de negócio

## 6.1 Cadastro de clientes e representantes

O cadastro de clientes e representantes permite identificar as pessoas ou organizações envolvidas nas operações comerciais.

A entidade `Cliente` concentra as informações necessárias para identificar o cliente e possibilitar seu relacionamento com os pedidos.

Já a entidade `Representante` permite identificar o profissional responsável pelo cadastro ou acompanhamento dos pedidos.

### Cliente

O cliente é a entidade responsável por representar quem realiza uma solicitação comercial à empresa.

Seus atributos permitem armazenar:

- **IdCliente:** identifica unicamente cada cliente cadastrado.
- **Nome_Cliente:** registra o nome utilizado para identificar o cliente.
- **Telefone_Cliente:** armazena um meio de contato telefônico.
- **Endereco_Cliente:** registra o endereço relacionado ao cliente.
- **UF_Cliente:** identifica a unidade federativa do endereço.

### Representante

O representante é responsável pela relação comercial associada aos pedidos.

Seus atributos permitem armazenar:

- **IdRep:** identifica unicamente o representante.
- **Nome_Rep:** registra o nome do representante.
- **Telefone_Rep:** permite armazenar seu contato telefônico.
- **Email_Rep:** registra seu endereço eletrônico.

---

## 6.2 Registro de pedidos

A entidade `Pedido` representa uma solicitação comercial realizada por um cliente e cadastrada por um representante.

O pedido funciona como um dos principais pontos de integração do modelo, pois se relaciona com outras entidades, como:

- Cliente;
- Representante;
- Produto;
- Pagamento;
- Nota Fiscal;
- Entrega.

### Informações do pedido

- **IdPedido:** identifica unicamente cada pedido.
- **Data_Pedido:** registra a data em que o pedido foi realizado ou cadastrado.
- **Preco_Pedido:** registra o preço associado ao pedido.
- **Status_Pedido:** registra a situação atual do pedido.

A partir do `IdPedido`, é possível relacionar as informações comerciais às etapas financeira, fiscal e logística.

---

## 6.3 Pagamentos

A entidade `Pagamento` representa a informação financeira associada a um pedido.

Ela foi separada da entidade `Pedido` porque possui atributos próprios e representa uma etapa específica do processo.

### Informações registradas

- **IdPagamento:** identifica unicamente o pagamento.
- **Data_Pagamento:** registra quando o pagamento foi realizado ou registrado.
- **Preco:** representa o preço ou valor associado ao pagamento.
- **Valor_Pago:** registra o valor efetivamente pago.
- **Status_Pagamento:** indica a situação do pagamento.

A separação permite que as informações financeiras sejam consultadas independentemente das demais informações do pedido.

---

## 6.4 Produtos

A entidade `Produto` representa os produtos comercializados pela empresa.

Cada produto possui informações próprias que permitem identificá-lo, descrevê-lo e relacioná-lo às vendas e à produção.

### Informações registradas

- **Id_Produto:** identificador único do produto.
- **Nome_Produto:** nome utilizado para identificar o produto.
- **EAN_Produto:** código utilizado para identificação comercial do produto.
- **Unidade_Produto:** unidade utilizada para representar o produto.
- **Descricao_Produto:** descrição complementar das características do produto.

Os produtos podem aparecer em diferentes pedidos e também estar relacionados a diferentes registros de produção.

---

## 6.5 Materiais

A entidade `Material` representa os materiais utilizados nos processos produtivos.

Esses materiais são diferentes dos produtos acabados. Enquanto o produto representa aquilo que será comercializado, o material representa um recurso utilizado para a produção.

### Informações registradas

- **IdMaterial:** identificador único do material.
- **Nome_Material:** nome utilizado para identificar o material.
- **Unidade_Material:** unidade de medida utilizada para o material.
- **Estoque_minimo:** quantidade mínima de estoque considerada para o material.

A entidade pode ser relacionada tanto aos fornecedores quanto aos produtos e às produções.

---

## 6.6 Fornecedores

A entidade `Fornecedor` representa empresas ou organizações responsáveis pelo fornecimento dos materiais utilizados pela empresa.

### Informações registradas

- **IdFornecedor:** identifica unicamente o fornecedor.
- **Nome_Fornecedor:** nome do fornecedor.
- **CNPJ_Fornecedor:** identifica o fornecedor juridicamente.
- **Telefone_Fornecedor:** registra um contato telefônico.
- **Endereco_Fornecedor:** registra o endereço do fornecedor.

O relacionamento com `Material` permite representar quais materiais podem ser obtidos de cada fornecedor.

---

## 6.7 Pedido de materiais

A entidade `Pedido_Material` representa uma solicitação de materiais realizada junto aos fornecedores.

Ela é importante porque o processo de aquisição de materiais possui características diferentes do pedido comercial realizado pelo cliente.

### Informações registradas

- **ID_PEDIDO_MATERIAL:** identifica a solicitação de materiais.
- **DT_PEDIDO:** registra a data em que a solicitação foi realizada.
- **DT_PREVISTA:** indica a data prevista para atendimento.
- **STATUS:** registra a situação atual do pedido.
- **PREÇO_TOTAL:** representa o valor total relacionado à solicitação.

---

## 6.8 Produção

A entidade `Produção` representa uma ocorrência de fabricação de determinado produto.

Um mesmo produto pode possuir diferentes registros de produção, representando diferentes momentos ou lotes de fabricação.

### Informações registradas

- **IdProducao:** identifica a produção.
- **Data_emissao:** registra a data associada à produção.
- **Quantidade_Producao:** registra a quantidade produzida.
- **Status_Producao:** registra a situação da produção.

A produção também se relaciona com os materiais e as embalagens utilizados no processo.

---

## 6.9 Embalagens

A entidade `Embalagem` representa os recipientes ou estruturas utilizados para acondicionar os produtos durante a produção.

Ela foi representada separadamente de `Material` porque possui características específicas relacionadas à sua função de embalagem.

### Informações registradas

- **IdEmbalagem:** identifica a embalagem.
- **Tipo:** indica o tipo de embalagem.
- **Capacidade:** registra a capacidade da embalagem.
- **Material:** indica o material utilizado para fabricação da embalagem.

---

## 6.10 Faturamento

A entidade `Faturamento` representa informações relacionadas ao processo de faturamento.

### Informações registradas

- **ID_FATURAMENTO:** identifica o faturamento.
- **DT_FATURAMENTO:** registra a data em que o faturamento foi realizado.
- **VALOR_TOTAL:** representa o valor total faturado.
- **STATUS:** indica a situação do faturamento.
- **FORMA_PAGAMENTO:** identifica a forma de pagamento relacionada.
- **DT_VENCIMENTO:** registra a data de vencimento quando aplicável.

O faturamento está relacionado à documentação fiscal representada pela entidade `Nota_Fiscal`.

---

## 6.11 Notas fiscais

A entidade `Nota_Fiscal` representa o documento fiscal relacionado ao pedido.

### Informações registradas

- **IdNotaFiscal:** identificador da nota fiscal.
- **Numero_NF:** número da nota fiscal.
- **Serie:** série utilizada na identificação fiscal.
- **Data_Emissao:** data de emissão da nota.
- **Chave_Acesso:** chave utilizada para identificação e consulta do documento fiscal.
- **Valor_Total:** valor total registrado na nota.
- **StatusNF:** situação atual da nota fiscal.

A relação com `Pedido` permite identificar qual operação comercial originou determinada nota fiscal.

---

## 6.12 Entrega

A entidade `Entrega` representa o processo logístico de envio do pedido.

### Informações registradas

- **IdEntrega:** identifica unicamente a entrega.
- **Codigo_Rastreio:** registra o código utilizado para acompanhamento da entrega.
- **Data_Envio:** registra quando o pedido foi enviado.
- **Data_Entrega:** registra quando ocorreu a entrega.
- **Status_Entrega:** informa a situação atual da entrega.
- **Nome_Motorista:** identifica o motorista associado à entrega.
- **IdCaminhao:** identifica o caminhão utilizado.

A entidade permite acompanhar a etapa posterior ao processamento do pedido.

---

# 7. Regras de negócio

As principais regras consideradas na construção do modelo são:

RN1. Cada pedido deve estar associado a um cliente.
RN2. Cada pedido deve estar associado a um representante.
RN3. Um cliente pode realizar vários pedidos.
RN4. Um representante pode cadastrar vários pedidos.
RN5. Cada pedido possui pelo menos um produto.
RN6. Um produto pode aparecer em vários pedidos.
RN7. Um pedido pode possuir zero ou vários pagamentos.
RN8. Cada pagamento pertence a um pedido.
RN9. Um pedido pode gerar zero ou uma nota fiscal.
RN10. Cada nota fiscal está associada a um pedido.
RN11. Um pedido pode possuir zero ou várias entregas conforme a cardinalidade representada no DER.
RN12. Cada entrega está associada a um pedido.
RN13. Um fornecedor pode fornecer vários materiais.
RN14. Um material pode ser fornecido por vários fornecedores.
RN15. Um produto pode estar relacionado a diferentes materiais.
RN16. Uma produção deve estar associada a um produto.
RN17. Uma produção utiliza materiais.
RN18. Uma produção utiliza embalagens.
RN19. Um mesmo produto pode possuir diferentes registros de produção.
RN20. Os valores monetários devem possuir validação para evitar valores negativos.
RN21. Quantidades devem possuir validação para evitar valores inválidos.
RN22. Dados pessoais devem possuir mecanismos de proteção contra acesso não autorizado.

---

# 8. Dicionário de dados conceitual

O dicionário de dados apresenta a finalidade de cada entidade e de seus principais atributos dentro do modelo.

## 8.1 Cliente

A entidade `Cliente` representa a pessoa ou organização que realiza pedidos junto à empresa.

| Atributo | Descrição detalhada |
|---|---|
| `IdCliente` | Identificador único utilizado para diferenciar cada cliente dos demais registros existentes no banco de dados. |
| `Nome_Cliente` | Nome utilizado para identificar o cliente no cadastro e nas operações comerciais. |
| `Telefone_Cliente` | Número de telefone utilizado como informação de contato do cliente. |
| `Endereco_Cliente` | Endereço relacionado ao cliente, utilizado para identificar sua localização cadastral. |
| `UF_Cliente` | Unidade federativa correspondente ao endereço cadastrado do cliente. |

---

## 8.2 Representante

A entidade `Representante` representa o profissional responsável pela relação comercial e pelo cadastro dos pedidos.

| Atributo | Descrição detalhada |
|---|---|
| `IdRep` | Identificador único utilizado para diferenciar cada representante cadastrado. |
| `Nome_Rep` | Nome completo utilizado para identificação do representante. |
| `Telefone_Rep` | Número de telefone utilizado para contato com o representante. |
| `Email_Rep` | Endereço de e-mail utilizado como canal de comunicação com o representante. |

---

## 8.3 Pedido

A entidade `Pedido` representa a solicitação comercial realizada pelo cliente.

| Atributo | Descrição detalhada |
|---|---|
| `IdPedido` | Identificador único do pedido, utilizado para relacioná-lo aos produtos, pagamentos, notas fiscais e entregas. |
| `Data_Pedido` | Data em que o pedido foi realizado ou cadastrado no sistema. |
| `Preco_Pedido` | Valor associado ao pedido, representando seu preço total conforme a regra definida para o modelo. |
| `Status_Pedido` | Situação atual do pedido, permitindo identificar se ele está, por exemplo, em andamento, cancelado ou concluído. |

---

## 8.4 Pagamento

A entidade `Pagamento` representa o registro financeiro relacionado ao pedido.

| Atributo | Descrição detalhada |
|---|---|
| `IdPagamento` | Identificador único do registro de pagamento. |
| `Data_Pagamento` | Data em que o pagamento foi realizado ou registrado. |
| `Preco` | Valor associado ao pagamento ou valor previsto para a operação. |
| `Valor_Pago` | Quantia efetivamente registrada como paga. |
| `Status_Pagamento` | Situação do pagamento, permitindo acompanhar se está pendente, realizado ou em outra situação definida pela empresa. |

---

## 8.5 Produto

A entidade `Produto` representa os produtos comercializados pela empresa.

| Atributo | Descrição detalhada |
|---|---|
| `Id_Produto` | Identificador único utilizado para diferenciar cada produto cadastrado. |
| `Nome_Produto` | Nome comercial utilizado para identificar o produto. |
| `EAN_Produto` | Código EAN utilizado como identificador do produto em processos comerciais. |
| `Unidade_Produto` | Unidade utilizada para representar a quantidade ou comercialização do produto. |
| `Descricao_Produto` | Texto utilizado para registrar características ou informações complementares sobre o produto. |

---

## 8.6 Material

A entidade `Material` representa recursos utilizados nos processos produtivos.

| Atributo | Descrição detalhada |
|---|---|
| `IdMaterial` | Identificador único utilizado para diferenciar cada material cadastrado. |
| `Nome_Material` | Nome utilizado para identificar o material utilizado pela empresa. |
| `Unidade_Material` | Unidade utilizada para controlar ou representar a quantidade do material. |
| `Estoque_minimo` | Quantidade mínima de estoque definida como referência para o acompanhamento do material. |

---

## 8.7 Fornecedor

A entidade `Fornecedor` representa a organização responsável por fornecer materiais.

| Atributo | Descrição detalhada |
|---|---|
| `IdFornecedor` | Identificador único do fornecedor dentro do banco de dados. |
| `Nome_Fornecedor` | Nome utilizado para identificar o fornecedor. |
| `CNPJ_Fornecedor` | Cadastro Nacional da Pessoa Jurídica utilizado para identificação fiscal do fornecedor. |
| `Telefone_Fornecedor` | Número utilizado para contato com o fornecedor. |
| `Endereco_Fornecedor` | Endereço cadastrado do fornecedor. |

---

## 8.8 Pedido_Material

A entidade `Pedido_Material` representa uma solicitação de materiais realizada junto a um fornecedor.

| Atributo | Descrição detalhada |
|---|---|
| `ID_PEDIDO_MATERIAL` | Identificador único da solicitação de materiais. |
| `DT_PEDIDO` | Data em que o pedido de materiais foi realizado. |
| `DT_PREVISTA` | Data prevista para recebimento ou atendimento da solicitação. |
| `STATUS` | Situação atual do pedido de materiais. |
| `PREÇO_TOTAL` | Valor total associado aos materiais solicitados no pedido. |

---

## 8.9 Produção

A entidade `Produção` representa uma ocorrência de fabricação.

| Atributo | Descrição detalhada |
|---|---|
| `IdProducao` | Identificador único da produção realizada. |
| `Data_emissao` | Data associada ao registro da produção. |
| `Quantidade_Producao` | Quantidade do produto fabricada naquela ocorrência de produção. |
| `Status_Producao` | Situação atual do processo produtivo registrado. |

---

## 8.10 Embalagem

A entidade `Embalagem` representa os elementos utilizados para acondicionar os produtos.

| Atributo | Descrição detalhada |
|---|---|
| `IdEmbalagem` | Identificador único da embalagem cadastrada. |
| `Tipo` | Classificação ou tipo da embalagem utilizada. |
| `Capacidade` | Capacidade de armazenamento ou acondicionamento da embalagem. |
| `Material` | Material utilizado para fabricação da embalagem. |

---

## 8.11 Nota_Fiscal

A entidade `Nota_Fiscal` representa o documento fiscal associado ao pedido.

| Atributo | Descrição detalhada |
|---|---|
| `IdNotaFiscal` | Identificador único do registro da nota fiscal no banco. |
| `Numero_NF` | Número utilizado para identificar a nota fiscal. |
| `Serie` | Série fiscal à qual a nota pertence. |
| `Data_Emissao` | Data em que a nota fiscal foi emitida. |
| `Chave_Acesso` | Chave utilizada para identificar e consultar eletronicamente a nota fiscal. |
| `Valor_Total` | Valor total registrado no documento fiscal. |
| `StatusNF` | Situação atual da nota fiscal. |

---

## 8.12 Entrega

A entidade `Entrega` representa a etapa logística relacionada ao envio do pedido.

| Atributo | Descrição detalhada |
|---|---|
| `IdEntrega` | Identificador único utilizado para diferenciar cada entrega. |
| `Codigo_Rastreio` | Código utilizado para acompanhar o deslocamento ou situação da entrega. |
| `Data_Envio` | Data em que os produtos foram enviados para entrega. |
| `Data_Entrega` | Data em que a entrega foi efetivamente realizada, quando concluída. |
| `Status_Entrega` | Situação atual da entrega, permitindo acompanhar seu andamento. |
| `Nome_Motorista` | Nome do motorista relacionado ao transporte da entrega. |
| `IdCaminhao` | Identificador do caminhão utilizado no transporte. |

---

## 8.13 Faturamento

A entidade `Faturamento` representa informações relacionadas ao processo financeiro/fiscal de faturamento.

| Atributo | Descrição detalhada |
|---|---|
| `ID_FATURAMENTO` | Identificador único do registro de faturamento. |
| `DT_FATURAMENTO` | Data em que o faturamento foi realizado. |
| `VALOR_TOTAL` | Valor total associado ao faturamento. |
| `STATUS` | Situação atual do faturamento. |
| `FORMA_PAGAMENTO` | Forma definida para realização do pagamento. |
| `DT_VENCIMENTO` | Data prevista para vencimento do pagamento, quando aplicável. |

---

## 8.14 Atendimento_SAC

A entidade `Atendimento_SAC` representa um atendimento realizado ao cliente.

| Atributo | Descrição detalhada |
|---|---|
| `ID_ATENDIMENTO` | Identificador único do atendimento realizado. |
| `PROTOCOLO` | Número ou código utilizado para identificar o atendimento e facilitar seu acompanhamento. |
| `DT_ATENDIMENTO` | Data em que o atendimento foi realizado. |
| `STATUS` | Situação atual do atendimento. |
| `TIPO_ATENDIMENTO` | Classificação utilizada para identificar o tipo de solicitação ou atendimento. |
| `DESCRICAO` | Texto utilizado para registrar informações detalhadas sobre o atendimento. |

---

## 8.15 Devolução

A entidade `Devolução` representa o registro de um processo de devolução relacionado a um pedido.

| Atributo | Descrição detalhada |
|---|---|
| `ID_DEVOLUCAO` | Identificador único da devolução. |
| `DT_DEVOLUCAO` | Data em que a devolução foi registrada ou realizada. |
| `MOTIVO` | Motivo informado para realização da devolução. |
| `STATUS` | Situação atual do processo de devolução. |
| `REEMBOLSO` | Informação relacionada à existência ou situação de eventual reembolso. |
| `QUANTIDADE` | Quantidade de produtos relacionada à devolução. |

---

# 9. Relacionamentos e cardinalidades do DER

As cardinalidades devem ser interpretadas exatamente de acordo com o DER atualizado.

| Relacionamento | Cardinalidade | Descrição |
|---|---|---|
| `Cliente — Faz — Pedido` | Cliente `(0,n)` / Pedido `(1,1)` | Um cliente pode realizar nenhum ou vários pedidos, enquanto cada pedido está associado a exatamente um cliente. |
| `Representante — Cadastra — Pedido` | Representante `(0,n)` / Pedido `(1,1)` | Um representante pode cadastrar nenhum ou vários pedidos, enquanto cada pedido está associado a exatamente um representante. |
| `Pedido — Possui — Pagamento` | Pedido `(0,n)` / Pagamento `(1,1)` | Um pedido pode possuir nenhum ou vários pagamentos, enquanto cada pagamento pertence a exatamente um pedido. |
| `Pedido — Possui — Produto` | Pedido `(1,n)` / Produto `(0,n)` | Cada pedido possui pelo menos um produto, enquanto um produto pode estar presente em nenhum ou vários pedidos. |
| `Pedido — Gera — Nota_Fiscal` | Pedido `(0,1)` / Nota_Fiscal `(1,1)` | Um pedido pode não gerar ou gerar uma nota fiscal, enquanto cada nota fiscal está vinculada a exatamente um pedido. |
| `Pedido — Tem — Entrega` | Pedido `(0,n)` / Entrega `(1,1)` | Um pedido pode possuir nenhuma ou várias entregas, enquanto cada entrega está vinculada a exatamente um pedido. |
| `Fornecedor — Fornece — Material` | Fornecedor `(0,n)` / Material `(0,n)` | Um fornecedor pode fornecer nenhum ou vários materiais, e um material pode ser fornecido por nenhum ou vários fornecedores. |
| `Fornecedor — Recebe — Pedido_Material` | Fornecedor `(0,n)` / Pedido_Material `(1,1)` | Um fornecedor pode receber nenhum ou vários pedidos de materiais, enquanto cada pedido de material está relacionado a exatamente um fornecedor. |
| `Material — Contém — Pedido_Material` | Material `(0,n)` / Pedido_Material `(1,n)` | Um material pode estar associado a nenhum ou vários pedidos de materiais, enquanto um pedido de material contém um ou vários materiais. |
| `Material — é feito com — Produto` | Material `(0,n)` / Produto `(1,n)` | Um material pode estar associado a nenhum ou vários produtos, enquanto cada produto possui pelo menos um material relacionado. |
| `Material — é utilizado — Produção` | Material `(0,n)` / Produção `(1,n)` | Um material pode ser utilizado em nenhuma ou várias produções, enquanto cada produção utiliza pelo menos um material. |
| `Produto — é produzido em — Produção` | Produto `(0,n)` / Produção `(1,1)` | Um produto pode possuir nenhum ou vários registros de produção, enquanto cada produção está relacionada a exatamente um produto. |
| `Embalagem — Utiliza — Produção` | Embalagem `(0,n)` / Produção `(1,n)` | Uma embalagem pode estar relacionada a nenhuma ou várias produções, enquanto cada produção utiliza pelo menos uma embalagem. |
| `Atendimento_SAC — Solicita — Cliente` | Atendimento `(1,1)` / Cliente `(0,n)` | Cada atendimento está relacionado a exatamente um cliente, enquanto um cliente pode possuir nenhum ou vários atendimentos. |
| `Atendimento_SAC — Registra — Devolução` | Atendimento `(0,1)` / Devolução `(1,1)` | Um atendimento pode registrar nenhuma ou uma devolução, enquanto cada devolução está relacionada a exatamente um atendimento. |
| `Devolução — Tem — Pedido` | Devolução `(1,1)` / Pedido `(0,n)` | Cada devolução está relacionada a exatamente um pedido, enquanto um pedido pode possuir nenhuma ou várias devoluções. |
| `Nota_Fiscal — Documenta — Faturamento` | Nota_Fiscal `(1,1)` / Faturamento `(0,1)` | Cada nota fiscal está relacionada a um faturamento, enquanto um faturamento pode estar relacionado a nenhuma ou uma nota fiscal. |

---

# 10. Modelo Conceitual

O Diagrama Entidade-Relacionamento foi desenvolvido utilizando o BRModelo Web.

[🔗 Visualizar DER no BRModelo Web](https://app.brmodeloweb.com/publicview/6ab340cd664f8629cdf4e2ef)

O arquivo do modelo conceitual também está disponível neste repositório:

[🖼️ Modelo Conceitual](modelo_conceitual.jpg)

O DER representa as entidades, atributos, relacionamentos e respectivas cardinalidades identificadas durante o levantamento dos processos.

A estrutura foi construída para permitir que informações de diferentes áreas sejam relacionadas por meio de entidades e relacionamentos.

---

# 11. Transformação do modelo conceitual para o modelo lógico

Durante a transformação do modelo conceitual para o lógico, os relacionamentos com cardinalidade muitos-para-muitos precisam ser representados por estruturas associativas.

Essas tabelas são necessárias porque, no modelo relacional, uma relação N:N não deve ser implementada diretamente entre duas tabelas sem uma estrutura intermediária.

## 11.1 Pedido × Produto

O relacionamento `Possui` apresenta:

- `Pedido (1,n)`
- `Produto (0,n)`

Como um pedido pode possuir vários produtos e um produto pode aparecer em vários pedidos, foi necessária uma estrutura associativa, como:

`Pedido_Produto`

Essa tabela pode armazenar as referências ao pedido e ao produto e, posteriormente, atributos específicos da relação, como quantidade e preço unitário.

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

Como um pedido de material pode conter diversos materiais e um material pode aparecer em diferentes pedidos, a relação necessita de uma estrutura intermediária.

---

## 11.6 Produção × Embalagem

O relacionamento `Utiliza` apresenta:

- `Embalagem (0,n)`
- `Produção (1,n)`

Uma produção pode utilizar várias embalagens e uma embalagem pode ser utilizada em diferentes produções.

Por esse motivo, a relação também deverá ser representada por uma estrutura associativa no modelo lógico.

---

# 12. Justificativa técnica da modelagem

A separação das entidades foi realizada para representar conceitos diferentes e reduzir a duplicação de informações.

Por exemplo, `Cliente` não foi colocado diretamente dentro de `Pedido` como um conjunto de informações repetidas. O cliente possui cadastro próprio porque pode realizar vários pedidos.

O mesmo princípio é aplicado ao `Representante`, que possui seus próprios dados e pode estar associado a diferentes pedidos.

`Pagamento` foi definido como entidade própria porque possui atributos específicos, como data, valor pago e status.

`Nota_Fiscal` também possui entidade própria porque representa uma informação fiscal que possui número, série, chave de acesso, valor e status.

`Produção` foi separada de `Produto` porque um mesmo produto pode ser produzido várias vezes.

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
- pedidos por representante.

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

### Uso de Inteligência Artificial


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
| **Ferramenta e etapa** | *(PREENCHER: nome da ferramenta)* — organização e redação do README (descrição dos processos, requisitos, regras de negócio e demais seções). |
| **Motivação** | Apoio na estruturação das informações levantadas na visita e no DER. |
| **Prompt(s) utilizados** | Solicitação para elaborar e organizar o README do projeto acadêmico de modelagem de banco de dados, contemplando as seções exigidas na atividade e utilizando as informações fornecidas pelo grupo. |
| **Resposta recebida** | Texto do README organizado nas seções solicitadas. |
| **Fontes consultadas e verificadas** | LGPD (Lei nº 13.709/2018), RDC nº 48/2013 da Anvisa e dados institucionais da Muriel (site e LinkedIn). *(PREENCHER: como o grupo conferiu, por exemplo acessando os links e comparando com o que foi visto na visita)* |
| **Trechos rejeitados ou corrigidos** | Foram corrigidos trechos com informações genéricas que não correspondiam diretamente ao contexto observado na visita. Também foram ajustadas descrições de processos, requisitos e regras de negócio para evitar a inclusão de funcionalidades que não faziam parte do escopo definido pelo grupo. |
| **Justificativa da escolha final** | O conteúdo foi revisado e ajustado ao projeto e às orientações da atividade. |
| **Reflexão crítica** | A IA facilitou a organização e redação do README, mas apresentou algumas informações genéricas que precisaram ser comparadas com o que realmente foi observado na visita. Isso mostrou que a IA deve ser utilizada como ferramenta de apoio e que as informações geradas precisam ser verificadas pelo grupo antes da utilização. |

#### Uso 3 — Ajuste do README ao DER final e às normas da entrega

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | Claude (Anthropic) — revisão do README para torná-lo coerente com o DER final e com o modelo de README fornecido pelo professor. |
| **Motivação** | O DER mudou depois da primeira versão do README (saíram entidades como Estoque, Caixa, Separação, Caminhão e as de controle de acesso; entrou Pagamento), e o texto precisava refletir o diagrama e seguir a estrutura exigida. |
| **Prompt(s) utilizados** | Solicitação para elaborar e organizar o README do projeto acadêmico de modelagem de banco de dados, contemplando as seções exigidas na atividade e utilizando as informações fornecidas pelo grupo. |
| **Resposta recebida** | Foi gerado um texto estruturado nas seções solicitadas, contemplando a apresentação do projeto, caracterização da organização, processos de negócio, requisitos funcionais e não funcionais, regras de negócio, dicionário de dados, modelagem conceitual, justificativa técnica, uso de IA, conclusão e referências. |
| **Fontes consultadas e verificadas** |Foram utilizadas e verificadas a Lei Geral de Proteção de Dados (LGPD — Lei nº 13.709/2018), a RDC nº 48/2013 da Anvisa e informações institucionais da Muriel Cosméticos, obtidas por meio do site institucional e do perfil institucional no LinkedIn. O grupo comparou essas informações com os dados levantados durante a visita e com o conteúdo do projeto antes de utilizá-las no README. |
| **Trechos rejeitados ou corrigidos** | Foram corrigidos trechos com informações genéricas que não correspondiam diretamente ao contexto observado na visita. Também foram ajustadas descrições de processos, requisitos e regras de negócio para evitar a inclusão de funcionalidades que não faziam parte do escopo definido pelo grupo. |
| **Justificativa da escolha final** | O conteúdo final foi mantido após revisão do grupo, pois apresentava as informações necessárias para documentar o projeto e estava mais adequado às informações coletadas na visita, ao DER e às orientações da atividade. |
| **Reflexão crítica** | A IA interpreta o diagrama a partir de uma imagem e pode errar a leitura de cardinalidades ou nomes de atributos; por isso o grupo precisa conferir tudo com o DER original. Também apontou pontos que precisam de decisão humana (ex.: possível redundância entre Preco_Pedido e Preco). |

# 16. Conclusão

O projeto permitiu transformar processos observados na Muriel Cosméticos em uma estrutura conceitual de banco de dados.

O modelo contempla processos relacionados a clientes, representantes, pedidos, produtos, pagamentos, fornecedores, materiais, produção, embalagens, faturamento, notas fiscais, entregas, atendimento e devoluções.

A visita realizada em 02/09 também permitiu observar a utilização de registros físicos relacionados a estoque, devoluções e pedidos cancelados.

Essa observação contribuiu para identificar a necessidade de organizar e relacionar informações que participam de diferentes processos.

A modelagem proposta permite que informações comerciais, financeiras, produtivas, fiscais e logísticas sejam relacionadas por meio das entidades e relacionamentos definidos no DER.

Além de atender aos processos analisados no projeto, o modelo fornece uma base para futuras implementações de banco de dados, consultas SQL, dashboards de BI e aplicações de Inteligência Artificial.

---

# 17. Trabalhos futuros

Como possíveis evoluções do projeto, poderão ser considerados:

- implementação física do banco de dados;
- criação das tabelas SQL;
- definição dos tipos de dados;
- definição das chaves primárias e estrangeiras;
- criação das tabelas associativas;
- criação de índices;
- implementação de restrições de integridade;
- detalhamento do controle de estoque;
- controle de lote e validade;
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

**GRUPO DO PROJETO.** Modelo Conceitual — BRModelo Web.
