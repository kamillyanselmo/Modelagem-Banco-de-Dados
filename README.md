# Modelagem de Banco de Dados para a Muriel Cosméticos: Gestão de Pedidos, Pagamentos, Produção e Entregas

*Projeto acadêmico — Modelagem de Banco de Dados (2º semestre) — Entrega 1: Modelo Conceitual (DER)*

**Colaboradores do projeto**
- Kevyn Deusdará Antônio (RGM 46970746)
- Kamilly Anselmoo (RGM 47234237)
- Maria Eduarda da Silva Costa (RGM 46939563)
- Igor Tsuyoshi (RGM 47133562)

---

## Introdução

#### Problema, objetivos e delimitação

A Muriel Cosméticos é uma empresa privada do setor de fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal. A empresa informa possuir mais de 60 anos de atuação e disponibiliza diferentes linhas e categorias de produtos, incluindo produtos para corpo e cabelo.

**Problema:** a operação da empresa envolve etapas comerciais, financeiras, industriais e logísticas que dependem de informações compartilhadas entre setores. Sem uma estrutura de dados única e consistente, torna-se difícil acompanhar um pedido desde o cadastro até o pagamento, a produção e a entrega.

**Objetivo:** desenvolver uma modelagem conceitual de banco de dados que represente, de maneira integrada, o cadastro de clientes e representantes, o registro de pedidos e pagamentos, o cadastro de fornecedores, materiais e produtos, a produção (com materiais e embalagens) e a entrega, reduzindo redundâncias e facilitando as próximas etapas do projeto.

**Delimitação:** o escopo está restrito à modelagem conceitual. Não fazem parte desta etapa a implementação física do banco, o desenvolvimento da aplicação, a definição completa dos tipos de dados, a criação das tabelas SQL ou a integração com sistemas corporativos existentes. Processos observados na visita, mas não incluídos nesta versão do modelo (controle de estoque por lote e validade, separação e acondicionamento de pedidos e controle de acesso), estão listados como trabalhos futuros.

---

## Desenvolvimento

### Caracterização da Organização

- **Nome e natureza da organização:** Muriel Cosméticos, cuja razão social apresentada no site institucional é BEAUTY LAB DO BRASIL LTDA. Trata-se de uma empresa privada, com fins lucrativos, que atua na fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal.

- **Contexto e porte:** a empresa informa mais de 60 anos de atuação. Seu perfil institucional no LinkedIn a classifica como privada, sediada em São Paulo e na faixa de 201 a 500 funcionários. O portfólio inclui body splash, águas de banho, águas de colônia, sabonetes, óleos corporais, produtos capilares, shampoos, condicionadores, máscaras e produtos Muriel Baby, entre outros. A operação envolve fornecedores, uso de materiais e embalagens, produção industrial, representantes comerciais e entrega dos pedidos aos clientes. *(PREENCHER, se informado na visita: volume aproximado de pedidos/entregas.)*

- **Problemas e necessidades identificados:** durante a visita, identificamos a falta de visibilidade em tempo real do status do pedido. O setor Comercial pode ter dificuldade para saber rapidamente se o pedido está aguardando material, em produção, pago, já expedido ou entregue, e o acompanhamento depende de planilhas e de comunicação manual entre setores.
  - **Proposta (trabalho futuro):** painel de acompanhamento integrado ao Protheus (TOTVS), sistema de gestão utilizado pela empresa, com status do pedido por etapa, alertas de atraso e falta de materiais, rastreabilidade do pedido até a entrega e redução de planilhas. Está fora do escopo desta etapa, mas o modelo dá suporte a ela por meio das entidades Pedido, Pagamento, Produção e Entrega e seus campos de status.

- **Justificativa da escolha:** a Muriel possui atividade industrial, variedade de produtos, relacionamento com fornecedores, uso de materiais e embalagens, produção e processos de distribuição. Essa diversidade permite um modelo com diferentes níveis de relacionamento (comercial, financeiro, produtivo e logístico), sem ser inviável para esta primeira etapa. O grupo teve acesso à empresa por meio de visita guiada.

- **Evidências da organização:**
  - Site oficial: https://muriel.com.br/
  - Perfil no LinkedIn: Muriel Cosméticos *(COLE-AQUI-A-URL)*
  - Google Maps / Meu Negócio: *(COLE-AQUI-A-URL)*
  - Endereço: Rua Forte do Rio Branco, 854, Parque Industrial São Lourenço, São Paulo/SP, CEP 08340-140.
  - Contato: SAC 0800 011 3846; e-mail sac@muriel.com.br; telefone +55 (11) 2010-1900; WhatsApp +55 (11) 97085-2921.
  - Responsável/colaboradora que acompanhou a visita: *(PREENCHER: nome e setor, se autorizado)*. Data da visita: *(PREENCHER)*.
  - Foto da visita, tirada com a colaboradora da Muriel que nos guiou pelo fluxo operacional:

<img width="465" height="573" alt="Captura de tela 2026-09-23 133139" src="https://github.com/user-attachments/assets/573742d8-7582-4d01-8f05-952a3dd262dd" />

---

### Processos de Negócio

#### Principais processos mapeados

**Cadastro e gestão de clientes e representantes**
- Cadastro das informações do cliente.
- Cadastro dos representantes.
- Associação entre representantes e pedidos.

**Registro e gerenciamento de pedidos**
- Identificação do cliente.
- Registro do representante responsável.
- Registro da data, do preço e do status do pedido.
- Associação dos produtos ao pedido.
- Registro de NF.

**Controle de pagamentos**
- Registro do pagamento do pedido.
- Registro da data, do preço, do valor pago e do status do pagamento.

**Gestão de fornecedores, materiais e produtos**
- Cadastro de fornecedores e de materiais.
- Associação entre fornecedores e materiais fornecidos.
- Controle de unidade e estoque mínimo dos materiais.
- Cadastro de produtos e associação dos materiais que os compõem.

**Produção**
- Registro da produção de um produto, com data de emissão, quantidade e status.
- Associação dos materiais e das embalagens utilizados na produção.

**Expedição e entrega**
- Geração da entrega a partir do pedido.
- Registro do motorista e do caminhão responsáveis.
- Registro do código de rastreio, das datas de envio e entrega e do status.

#### Fluxogramas

O fluxograma abaixo representa os processos-chave e mostra como eles se integram: o pedido (com cliente, representante e pagamento) aciona a produção, que consome materiais e embalagens, e a produção culmina na entrega.

---

<img width="1600" height="900" alt="WhatsApp Image 2026-10-14 at 11 43 23" src="https://github.com/user-attachments/assets/eef6aa40-d5b4-423d-9100-a53ceba410de" />


---

### Requisitos do Sistema

#### Requisitos Funcionais

O sistema deverá:

- RF01 — Permitir cadastrar, consultar, alterar e manter dados de clientes.
- RF02 — Permitir cadastrar representantes.
- RF03 — Permitir cadastrar e consultar pedidos.
- RF04 — Permitir associar um pedido a um cliente.
- RF05 — Permitir associar um pedido a um representante.
- RF06 — Permitir associar produtos aos pedidos.
- RF07 — Permitir controlar o status dos pedidos.
- RF08 — Permitir registrar o pagamento de um pedido.
- RF09 — Permitir registrar data, preço, valor pago e status do pagamento.
- RF10 — Permitir cadastrar fornecedores.
- RF11 — Permitir cadastrar materiais.
- RF12 — Permitir associar fornecedores aos materiais fornecidos.
- RF13 — Permitir cadastrar produtos e suas características.
- RF14 — Permitir associar produtos aos materiais que os compõem.
- RF15 — Permitir registrar a produção de um produto.
- RF16 — Permitir registrar a quantidade produzida e a data de emissão da produção.
- RF17 — Permitir acompanhar o status da produção.
- RF18 — Permitir associar materiais e embalagens utilizados em cada produção.
- RF19 — Permitir cadastrar embalagens.
- RF21 — Permitir gerar e registrar notas fiscais relacionadas aos pedidos.
- RF22 — Permitir registrar o número, série, data de emissão, chave de acesso, valor total e status da nota fiscal.
- RF23 — Permitir registrar o motorista e o caminhão responsáveis pela entrega.
- RF24 — Permitir consultar as notas fiscais vinculadas aos pedidos.
- RF25 — Permitir gerar e registrar a entrega de um pedido.
- RF26 — Permitir registrar código de rastreio, datas de envio e entrega e status da entrega.
- RF27 — Permitir registrar o motorista e o caminhão responsáveis pela entrega.
- RF28 — Permitir consultar informações de pedidos, pagamentos, produção, notas fiscais e entregas de forma integrada.


#### Requisitos Não Funcionais

- RNF01 — Segurança: o acesso ao sistema deverá exigir autenticação de usuários.
- RNF02 — Controle de acesso: o controle de perfis e permissões por usuário deverá ser definido na etapa de implementação, pois não faz parte do modelo conceitual desta versão.
- RNF03 — Privacidade: informações pessoais deverão ser tratadas de acordo com a Lei Geral de Proteção de Dados Pessoais (LGPD — Lei nº 13.709/2018).
- RNF04 — Integridade: o sistema deverá impedir registros que violem chaves únicas, relacionamentos ou obrigatoriedades definidas pelo modelo.
- RNF05 — Rastreabilidade: operações relevantes deverão poder ser identificadas e rastreadas por seus registros.
- RNF06 — Disponibilidade: o sistema deverá estar disponível durante os períodos necessários às operações administrativas, produtivas e logísticas.
- RNF07 — Desempenho: consultas de pedidos, pagamentos, notas fiscais, produção e entregas deverão apresentar resposta adequada mesmo com o crescimento do volume de registros.
- RNF08 — Escalabilidade: o modelo deverá permitir o crescimento da quantidade de produtos, clientes, pedidos, fornecedores, produções, notas fiscais e entregas sem alteração estrutural frequente.
- RNF09 — Usabilidade: as informações deverão ser apresentadas de forma clara e organizada para os usuários.
- RNF10 — Backup: os dados deverão possuir mecanismos de cópia de segurança e recuperação.
- RNF11 — Manutenibilidade: o modelo deverá permitir futuras alterações e integrações com outros sistemas, incluindo sistemas de emissão e consulta de notas fiscais.
- RNF12 — Conformidade: o processo de fabricação deve considerar os requisitos regulatórios do setor. A Anvisa, por meio da RDC nº 48/2013, estabelece requisitos de Boas Práticas de Fabricação para produtos de higiene pessoal, cosméticos e perfumes, incluindo produção, armazenamento, documentação e controle da qualidade.

---

### Regras de Negócio

#### Regras operacionais

- RN01: cada cliente pode possuir zero ou vários pedidos.
- RN02: cada pedido deve estar associado a um único cliente.
- RN03: cada pedido deve estar associado a um único representante.
- RN04: um representante pode estar associado a zero ou vários pedidos.
- RN05: um pedido deve conter um ou mais produtos; um produto pode estar em zero ou vários pedidos.
- RN06: um pedido pode possuir zero ou vários pagamentos; cada pagamento deve pertencer a exatamente um pedido.
- RN07: um pedido pode gerar no máximo uma entrega; cada entrega deve estar associada a exatamente um pedido.
- RN08: um fornecedor pode fornecer zero ou vários materiais.
- RN09: um material pode ser fornecido por zero ou vários fornecedores.
- RN10: o CNPJ do fornecedor deve ser único.
- RN11: cada material deve possuir identificação própria e estoque mínimo não negativo.
- RN12: um produto deve ser feito com um ou mais materiais; um material pode compor zero ou vários produtos.
- RN13: cada produção deve estar associada a exatamente um produto; um produto pode possuir zero ou várias produções.
- RN14: uma produção deve utilizar um ou mais materiais; um material pode ser utilizado em zero ou várias produções.
- RN15: uma produção deve utilizar uma ou mais embalagens; uma embalagem pode ser utilizada em zero ou várias produções.
- RN16: uma produção deve possuir identificação, data de emissão, quantidade e status.
- RN17: cada embalagem deve possuir identificação própria, tipo, capacidade e material.
- RN18: a entrega deve possuir identificação e status.
- RN19: a entrega pode possuir código de rastreio para permitir o acompanhamento logístico.
- RN20: a data de entrega deve ser igual ou posterior à data de envio.
- RN21: os status de pedido, pagamento, produção e entrega devem utilizar valores previamente definidos pelo sistema.
- RN22: quantidades, preços e valores relacionados a pedidos, pagamentos, produção e embalagens não devem assumir valores negativos.
- RN23: dados pessoais de clientes e representantes devem ser protegidos contra acesso não autorizado.
- RN24: cada nota fiscal deve estar associada a exatamente um pedido; um pedido pode possuir zero ou várias notas fiscais.
- RN25: cada nota fiscal deve possuir identificação, número, série, data de emissão, chave de acesso, valor total e status.
- RN26: o número e a série da nota fiscal devem identificar a nota fiscal dentro do contexto definido pelo sistema.
- RN27: o valor total da nota fiscal não deve assumir valor negativo.
#### Restrições organizacionais

- **Proteção de dados pessoais:** nome, telefone, e-mail e endereço devem ter acesso restrito e finalidade definida, conforme a LGPD. Importa porque o cadastro de clientes e representantes contém dados de contato.
- **Normas sanitárias:** a RDC nº 48/2013 da Anvisa torna relevantes os controles de documentação, produção, armazenamento, qualidade e rastreabilidade. Por isso o modelo registra a produção com seus materiais e embalagens, permitindo identificar o que foi utilizado em cada fabricação.
- **Rastreabilidade logística:** entrega, código de rastreio, motorista, caminhão, data de envio e data de entrega permitem acompanhar a movimentação dos pedidos.
- **Controle financeiro:** a separação entre Pedido e Pagamento permite acompanhar a situação financeira de cada pedido (data, preço, valor pago e status).
- **Integridade dos cadastros:** identificadores como o CNPJ do fornecedor são tratados como únicos no modelo.

---

### Dicionário de Dados Conceitual (Preliminar)

**Entidade: Cliente**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdCliente | Identificador do cliente | Chave da entidade |
| Telefone_Cliente | Telefone de contato | Deve possuir formato válido |
| Endereco_Cliente | Endereço do cliente | Obrigatório para cadastro completo |
| UF_Cliente | Unidade federativa do cliente | Deve utilizar UF válida |

**Entidade: Representante**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdRep | Identificador do representante | Chave da entidade |
| Nome_Rep | Nome do representante | Obrigatório |
| Telefone_Rep | Telefone de contato | Deve possuir formato válido |
| Email_Rep | E-mail do representante | Deve possuir formato válido |

**Entidade: Pedido**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdPedido | Identificador do pedido | Chave da entidade |
| Data_Pedido | Data de criação do pedido | Obrigatória |
| Preco_Pedido | Preço do pedido | Não deve ser negativo |
| Status_Pedido | Situação atual do pedido | Deve utilizar valores previamente definidos |

**Entidade: Pagamento**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdPagamento | Identificador do pagamento | Chave da entidade |
| Data_Pagamento | Data do pagamento | Deve ser uma data válida |
| Preco | Valor a ser pago pelo pedido | Não deve ser negativo |
| Valor_Pago | Valor efetivamente pago | Não deve ser negativo |
| Status_Pagamento | Situação do pagamento | Deve utilizar valores previamente definidos |

**Entidade: Nota fiscal**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdNotaFiscal | Identificador da nota fiscal | Chave da entidade |
| Numero_NF | Número da nota fiscal | Deve ser informado |
| Serie | Série da nota fiscal | Deve ser informada |  
| Data_Emissao | Data de emissão da nota fiscal | Deve ser uma data válida |
| Chave_Acesso | Chave de acesso da nota fiscal | Deve possuir formato válido |
| Valor_Total | Valor total da nota fiscal | Não deve ser negativo |
| StatusNF | Situação da nota fiscal | Deve utilizar valores previamente definidos |

**Entidade: Fornecedor**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdFornecedor | Identificador do fornecedor | Chave da entidade |
| Nome_Fornecedor | Nome do fornecedor | Obrigatório |
| CNPJ_Fornecedor | CNPJ do fornecedor | Deve ser único |
| Telefone_Fornecedor | Telefone do fornecedor | Deve possuir formato válido |
| Endereco_Fornecedor | Endereço do fornecedor | Obrigatório para cadastro completo |

**Entidade: Material**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdMaterial | Identificador do material | Chave da entidade |
| Nome_Material | Nome ou descrição do material | Obrigatório |
| Unidade_Material | Unidade utilizada para controle do material | Deve utilizar unidade válida |
| Estoque_minimo | Quantidade mínima desejada em estoque | Não deve ser negativa |

**Entidade: Produto**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| Id_Produto | Identificador do produto | Chave da entidade |
| Nome_Produto | Nome do produto | Obrigatório |
| EAN_Produto | Código EAN do produto | Deve possuir formato válido quando utilizado |
| Unidade_Produto | Unidade de comercialização/controle | Obrigatória |
| Descricao_Produto | Características descritivas do produto | Campo textual |

**Entidade: Produção**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdProducao | Identificador do registro de produção | Chave da entidade |
| Data_emissao | Data de emissão da produção | Obrigatória |
| Quantidade_Producao | Quantidade produzida/planejada | Deve ser positiva |
| Status_Producao | Situação da produção | Deve utilizar valores definidos |

**Entidade: Embalagem**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdEmbalagem | Identificador da embalagem | Chave da entidade |
| Tipo | Tipo de embalagem | Obrigatório |
| Capacidade | Capacidade da embalagem | Deve ser positiva |
| Material | Material de que a embalagem é feita | Deve ser informado (atributo descritivo, distinto da entidade Material) |

**Entidade: Entrega**

| Atributo | Descrição | Regra de negócio associada |
|---|---|---|
| IdEntrega | Identificador da entrega | Chave da entidade |
| Codigo_Rastreio | Código utilizado para rastreamento | Deve ser único quando utilizado |
| Data_Envio | Data em que a entrega foi enviada | Deve ser válida |
| Data_Entrega | Data efetiva da entrega | Deve ser igual ou posterior à data de envio |
| Status_Entrega | Situação da entrega | Deve utilizar valores definidos |
| Nome_Motorista | Nome do motorista responsável | Deve ser informado para operação de entrega |
| IdCaminhao | Identificação do caminhão utilizado | Deve ser informado para operação de entrega |

---

### Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

#### Entidades reconhecidas

- **Cliente:** pessoas físicas que realizam pedidos; separado de Pedido porque um cliente faz vários pedidos ao longo do tempo.
- **Representante:** responsável comercial que cadastra os pedidos.
- **Pedido:** solicitação comercial feita pelo cliente; é o eixo que liga as áreas comercial, financeira e logística.
- **Pagamento:** pagamento associado a um pedido, com ciclo de vida próprio (data, valor pago e status).
- **Nota_Fiscal**: documento fiscal associado a um pedido, contendo informações como número, série, data de emissão, chave de acesso, valor total e status.
- **Produto:** produtos comercializados pela organização.
- **Fornecedor:** empresas que fornecem materiais.
- **Material:** insumos usados na composição dos produtos e na produção.
- **Produção:** registro da execução da fabricação de um produto.
- **Embalagem:** tipos de embalagens utilizadas na produção.
- **Entrega:** envio do pedido ao cliente, com rastreio, datas, status, motorista e caminhão.

#### Atributos e classificações

**Atributos por entidade**

| Entidade | Atributos (identificador em negrito) |
|---|---|
| Cliente | **IdCliente**, Telefone_Cliente, Endereco_Cliente, UF_Cliente |
| Representante | **IdRep**, Nome_Rep, Telefone_Rep, Email_Rep |
| Pedido | **IdPedido**, Data_Pedido, Preco_Pedido, Status_Pedido |
| Pagamento | **IdPagamento**, Data_Pagamento, Preco, Valor_Pago, Status_Pagamento |
| Nota_Fiscal |	**IdNotaFiscal**, NumeroNF, Serie, DataEmissao, ChaveAcesso, ValorTotal, StatusNF |
| Fornecedor | **IdFornecedor**, Nome_Fornecedor, CNPJ_Fornecedor, Telefone_Fornecedor, Endereco_Fornecedor |
| Material | **IdMaterial**, Nome_Material, Unidade_Material, Estoque_minimo |
| Produto | **Id_Produto**, Nome_Produto, EAN_Produto, Unidade_Produto, Descricao_Produto |
| Produção | **IdProducao**, Data_emissao, Quantidade_Producao, Status_Producao |
| Embalagem | **IdEmbalagem**, Tipo, Capacidade, Material |
| Entrega | **IdEntrega**, Codigo_Rastreio, Data_Envio, Data_Entrega, Status_Entrega, Nome_Motorista, IdCaminhao |

**Classificação dos atributos**

- **Identificadores:** IdCliente, IdRep, IdPedido, IdPagamento, IdNotaFiscal, IdFornecedor, IdMaterial, Id_Produto, IdProducao, IdEmbalagem e IdEntrega.
- **Descritivos:** nomes, descrições, endereços, tipos, material da embalagem e demais informações textuais.
- **Quantitativos:** Preco_Pedido, Preco, Valor_Pago, Quantidade_Producao, Capacidade e Estoque_minimo.
- **Temporais:** Data_Pedido, Data_Pagamento, Data_emissao, Data_Envio e Data_Entrega.
- **De controle:** Status_Pedido, Status_Pagamento, Status_Producao e Status_Entrega.
- **De identificação externa:** CNPJ_Fornecedor, EAN_Produto, Codigo_Rastreio e IdCaminhao.

#### Relacionamentos pertinentes

As cardinalidades seguem a notação (mínima, máxima) do DER.

| Relacionamento | Entidades | Cardinalidade | Finalidade |
|---|---|---|---|
| Faz | Cliente (0,n) — Pedido (1,1) | 1:N | Um cliente realiza zero ou vários pedidos; cada pedido pertence a um cliente |
| Cadastra | Representante (0,n) — Pedido (1,1) | 1:N | Um representante cadastra zero ou vários pedidos; cada pedido tem um representante |
| Possui | Pedido (1,n) — Produto (0,n) | N:N | Um pedido contém um ou mais produtos; um produto pode estar em vários pedidos |
| Possui | Pedido (0,N) — Pagamento (1,1) | 1:1 | um pedido pode ter vários pagamentos por causa do parcelamento |
| Gera | Pedido (0,1) — Entrega (1,1) | 1:1 | Um pedido gera no máximo uma entrega; cada entrega pertence a um pedido |
| Possui |	Pedido (0,n) — Nota_Fiscal (1,1) |	1:N	Um pedido pode possuir zero ou várias notas fiscais; cada nota fiscal pertence a um pedido |
| Fornece | Fornecedor (0,n) — Material (0,n) | N:N | Um fornecedor fornece vários materiais; um material pode ter vários fornecedores |
| É feito com | Material (0,n) — Produto (1,n) | N:N | Relaciona o produto aos materiais que o compõem (mínimo de um) |
| É utilizado | Material (0,n) — Produção (1,n) | N:N | Relaciona os materiais utilizados em cada produção (mínimo de um) |
| É produzido em | Produto (0,n) — Produção (1,1) | 1:N | Um produto pode ter várias produções; cada produção é de um único produto |
| Utiliza | Produção (1,n) — Embalagem (0,n) | N:N | Uma produção utiliza uma ou mais embalagens; uma embalagem pode ser usada em várias produções |

#### Restrições e políticas organizacionais aplicadas ao modelo

- identificação única dos principais registros e unicidade do CNPJ do fornecedor;
- controle de status dos processos (pedido, pagamento, produção e entrega) com valores pré-definidos;
- rastreabilidade das entregas (código de rastreio, datas, motorista e caminhão);
- rastreabilidade da produção (produto, materiais e embalagens utilizados);
- rastreabilidade das notas fiscais (número, série, data de emissão, chave de acesso, valor total e status);
- integridade referencial entre entidades;
- proteção dos dados pessoais (LGPD);
- possibilidade de expansão futura para outros processos da organização.

---

### Diagrama Entidade-Relacionamento (DER)

O DER foi construído no BRModelo Web e representa entidades, atributos, relacionamentos e cardinalidades (mínima, máxima). Link para visualização: https://app.brmodeloweb.com/publicview/6ab340cd664f8629cdf4e2ef


<img width="917" height="585" alt="Captura de tela 2026-10-14 092831" src="https://github.com/user-attachments/assets/36f49aaf-81c9-4019-bdaf-c999aeca25f0" />


O modelo é consistente com o dicionário de dados e com as regras de negócio, e já prevê integração e escalabilidade: as entidades Pedido, Pagamento, Produção e Entrega, com seus campos de status, sustentam o painel proposto, e novos processos (estoque, separação, controle de acesso) podem ser acrescentados sem reestruturar o que já existe.

---

### Justificativa Técnica

**Por que separar as entidades.** Cada entidade representa um conceito específico da operação, o que evita concentrar informações diferentes em uma única estrutura. Cliente e Representante ficam fora de Pedido porque ambos se repetem em vários pedidos; guardar seus dados dentro do pedido geraria redundância.

**Pagamento como entidade, e não atributos de Pedido.** A alternativa seria colocar data, valor pago e status do pagamento dentro de Pedido. Optamos por uma entidade própria porque o pagamento tem ciclo de vida independente do pedido (um pedido pode ser aprovado e ainda não pago, por exemplo). A cardinalidade (0,N)–(1,1) reflete que o pedido pode ainda não ter pagamento registrado, mas todo pedido pode ter vários pagamentos por causa do parcelamento.

**Nota Fiscal como entidade própria**. A Nota Fiscal foi separada de Pedido porque possui informações próprias, como número, série, data de emissão, chave de acesso, valor total e status. Dessa forma, é possível manter o registro e o acompanhamento das informações fiscais relacionadas aos pedidos sem concentrá-las diretamente na entidade Pedido.

**Entrega com relacionamento 1:1 opcional com Pedido.** Uma alternativa seria uma entrega agrupar vários pedidos. Adotamos uma entrega por pedido porque simplifica o rastreio nesta etapa e corresponde ao fluxo observado; a cardinalidade (0,1) do lado do pedido indica que o pedido pode existir antes de a entrega ser gerada.

**Motorista e caminhão como atributos da Entrega.** Poderiam ser entidades próprias. Como nesta etapa precisamos apenas identificar quem e o que realizou a entrega, mantê-los como atributos reduz a complexidade. A criação de entidades específicas (com placa única) está nos trabalhos futuros.

**Pedido e Produto em N:N.** Um pedido tem vários produtos e um produto aparece em vários pedidos, então a relação é naturalmente N:N. Ela será resolvida em uma tabela associativa no modelo lógico, onde entrarão quantidade e preço unitário.

**Produto, Produção e materiais.** Separamos o cadastro permanente do produto (Produto) do registro de cada fabricação (Produção), o que permite várias produções do mesmo produto ao longo do tempo. A relação Produto–Material (N:N) descreve a composição; a relação Material–Produção (N:N) registra o que foi realmente usado em cada fabricação, importante para a rastreabilidade exigida pela RDC nº 48/2013. Optamos por uma única entidade Produção, que concentra emissão, quantidade e status, em vez de separar "ordem" e "execução", por ser suficiente para o escopo desta etapa.

**Embalagem separada de Material.** Embalagem tem atributos próprios (tipo e capacidade) e uma relação própria com a Produção (N:N), por isso não foi tratada como mais um material.

**Fornecedor–Material em N:N.** Um mesmo material pode ser comprado de fornecedores diferentes, e um fornecedor atende vários materiais; a relação 1:N impediria representar essa realidade.

**Escopo.** Estoque, separação/acondicionamento e controle de acesso foram observados, mas ficaram fora desta versão para manter o modelo viável nesta primeira etapa. O atributo Estoque_minimo em Material mantém o controle mínimo dos insumos.

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

---

## Conclusão

**Síntese.** O projeto apresentou uma modelagem conceitual de banco de dados direcionada à realidade operacional da Muriel Cosméticos, contemplando processos comerciais, financeiros, produtivos e logísticos. O DER relaciona clientes, representantes, pedidos, produtos e pagamentos com a entrega, além de fornecedores, materiais, produção e embalagens, representando o fluxo de informações desde o fornecimento de materiais e a fabricação até a entrega do pedido.

**Contribuições.** O modelo documenta as cardinalidades mínimas e máximas de todos os relacionamentos e fornece a base para o acompanhamento integrado de pedido, pagamento, produção e entrega, apoiando a proposta de painel de acompanhamento identificada na visita.

**Aprendizados.** O projeto permitiu compreender como transformar processos organizacionais em entidades, atributos e relacionamentos, considerando regras de negócio, cardinalidades, integridade, segurança e expansão futura, além da importância de manter a documentação coerente com o diagrama.

**Trabalhos futuros.**
- incluir o controle de estoque, com lote, validade, quantidade e endereço, relacionado a Produto;
- incluir a separação de pedidos e o acondicionamento em caixas, relacionados ao estoque (lote), para garantir a rastreabilidade completa do lote até a entrega;
- incluir o controle de acesso, por meio de entidades como Usuário, Perfil, Permissão e Recurso;
- avaliar entidades próprias para Caminhão (com placa única) e Motorista, hoje atributos da Entrega;
- detalhar os relacionamentos com atributos próprios, como quantidade e preço unitário em Pedido — Produto e quantidade de cada material na composição do produto;
- revisar a redundância entre Preco_Pedido (Pedido) e Preco (Pagamento), avaliando o valor do pedido como atributo derivado dos itens;
- elaborar o modelo lógico e físico, com tipos de dados e criação das tabelas em SQL;
- implementar o painel de acompanhamento integrado ao Protheus.

---

## Referências Bibliográficas

MURIEL COSMÉTICOS. Muriel Cosméticos — site institucional. Disponível em: https://muriel.com.br/. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Quem somos. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Fale conosco. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Perfil institucional. LinkedIn. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

BRASIL. Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais (LGPD). Brasília, DF. Disponível em: https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm. Acesso em: 21 set. 2026.

BRASIL. Agência Nacional de Vigilância Sanitária (ANVISA). Resolução RDC nº 48, de 25 de outubro de 2013. Regulamento Técnico de Boas Práticas de Fabricação para Produtos de Higiene Pessoal, Cosméticos e Perfumes. Disponível em: https://goias.gov.br/saude/wp-content/uploads/sites/34/2016/03/rdc-48-de-25-de-outubro-de-2013-a36.pdf. Acesso em: 21 set. 2026.

GRUPO DO PROJETO. Modelo Conceitual definitivo. BRModelo Web, 2026. Disponível em: https://app.brmodeloweb.com/publicview/6ab340cd664f8629cdf4e2ef. Acesso em: 23 set. 2026.
