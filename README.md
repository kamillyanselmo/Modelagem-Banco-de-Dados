## Modelagem de Banco de Dados para a Muriel Cosméticos: Gestão de Pedidos, Produção, Estoque, Logística e Controle de Acesso
Introdução
- Problema, objetivos e delimitação
A Muriel Cosméticos é uma empresa privada do setor de fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal. A empresa informa possuir mais de 60 anos de atuação e disponibiliza diferentes linhas e categorias de produtos, incluindo produtos para corpo e cabelo. Muriel Cosméticos
O presente projeto tem como objetivo desenvolver uma modelagem conceitual de banco de dados capaz de representar, de maneira integrada, processos relacionados ao cadastro de clientes e representantes, registro de pedidos, fornecedores e materiais, produção, controle de estoque, separação de pedidos, acondicionamento em caixas, expedição e entrega, além do controle de acesso ao sistema.
O problema abordado consiste na necessidade de organizar, em uma estrutura de dados única e consistente, informações que participam de diferentes etapas da operação industrial e logística. O modelo busca permitir o relacionamento entre pedido, produto, produção, estoque e entrega, reduzindo redundâncias e facilitando futuras etapas de implementação do sistema.
O escopo deste trabalho está delimitado à modelagem conceitual do banco de dados. Não fazem parte desta etapa a implementação física do banco, desenvolvimento da aplicação, definição completa dos tipos de dados, criação das tabelas SQL ou integração efetiva com sistemas corporativos existentes.
Desenvolvimento
Caracterização da Organização
(vale 7,5% — Dimensão Conceitual)
- Nome e natureza da organização: a organização selecionada é a Muriel Cosméticos, cuja razão social apresentada no site institucional é BEAUTY LAB DO BRASIL LTDA.. Trata-se de uma empresa privada que atua na fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal. Muriel Cosméticos
- Contexto e porte: a Muriel informa possuir mais de 60 anos de atuação no mercado de cosméticos. Seu perfil institucional no LinkedIn classifica a empresa como privada, sediada em São Paulo e pertencente à faixa de 201 a 500 funcionários. Muriel Cosméticos
  A empresa disponibiliza diversas linhas e categorias de produtos, incluindo body splash, águas de banho, águas de colônia, sabonetes, óleos corporais, produtos capilares, shampoos, condicionadores, máscaras, produtos Muriel Baby, entre outros. Muriel Cosméticos
- Problemas e necessidades identificados: para fins deste projeto, o principal problema de modelagem consiste na necessidade de integrar informações de diferentes etapas da operação: clientes e pedidos, fornecedores e materiais, produtos e produção, estoque, separação e expedição, entregas e controle de acesso.
  O DER foi construído para centralizar essas informações e representar os relacionamentos existentes entre as áreas. Dessa forma, o sistema poderá futuramente permitir o acompanhamento de um pedido desde seu cadastro até a separação, acondicionamento e entrega, relacionando essas operações às informações de produtos, estoque e produção.
  -----Observação: os problemas específicos atualmente existentes nos sistemas internos da Muriel devem ser confirmados por meio da pesquisa de campo realizada pelo grupo, pois não são informações que possam ser comprovadas somente pelo DER ou pelo site público da empresa---- 
- Justificativa da escolha: a Muriel apresenta características que tornam sua operação adequada para um projeto de modelagem de dados: possui atividade industrial, variedade de produtos, relacionamento com fornecedores, utilização de materiais, produção, armazenamento e processos de distribuição. A própria empresa destaca investimento em inovação, tecnologia, pesquisa e desenvolvimento de produtos.
A diversidade de processos permite construir um modelo conceitual com diferentes níveis de relacionamento, incluindo operações comerciais, produtivas, logísticas e administrativas.

Organização: Muriel Cosméticos / BEAUTY LAB DO BRASIL LTDA.
Endereço divulgado: Rua Forte do Rio Branco, 854, Parque Industrial São Lourenço, São Paulo/SP, CEP 08340-140. Muriel Cosméticos
Site oficial: Muriel Cosméticos
Contato institucional: SAC 0800 011 3846; e-mail sac@muriel.com.br; telefone +55 (11) 2010-1900; WhatsApp +55 (11) 97085-2921. Muriel Cosméticos
Perfil empresarial: Muriel Cosméticos no LinkedIn

*Foto retirada com a colaboradora da Muriel Cosméticos que nos guiou no processo de funcionamento do fluxo operacional dos processos:*
<img width="1200" height="1600" alt="eduarda" src="https://github.com/user-attachments/assets/27ffe2f8-9a62-4a58-8b09-617f73fe4dd5" />

*Processos de Negócio*
(vale 10% — Dimensão Procedimental)
- Principais processos mapeados:
1. Cadastro e gestão de clientes e representantes
   - Cadastro das informações do cliente.
   - Cadastro dos representantes.
   - Associação entre representantes e pedidos.
2. Registro e gerenciamento de pedidos
   - Identificação do cliente.
   - Registro do representante responsável.
   - Registro da data, valor e status do pedido.
   - Associação dos produtos ao pedido.
3. Gestão de fornecedores e materiais
   - Cadastro de fornecedores.
   - Cadastro de materiais.
   - Associação entre fornecedores e materiais fornecidos.
   - Controle de unidade e estoque mínimo dos materiais.
4. Planejamento e execução da produção
   - Cadastro da ordem de produção.
   - Definição da quantidade a produzir.
   - Registro do status e da data de emissão.
   - Geração de registros de produção.
   - Associação de produtos às ordens de produção.
   - Registro de datas de programação, início e término da produção.
5. Controle de estoque
   - Cadastro dos estoques.
   - Controle de lote.
   - Controle de validade.
   - Controle de quantidade.
   - Identificação do endereço físico do estoque.
   - Associação do estoque ao produto.
6. Separação e acondicionamento de pedidos
   - Criação da separação do pedido.
   - Registro de data, quantidade e status.
   - Acondicionamento dos itens em caixas.
   - Controle de peso e quantidade das caixas.
7. Expedição e entrega
   - Registro das caixas que compõem uma entrega.
   - Associação da entrega a um caminhão.
   - Registro do código de rastreio.
   - Registro das datas de envio e entrega.
   - Acompanhamento do status da entrega.
8. Controle de acesso
   - Cadastro de usuários.
   - Associação de usuários a perfis.
   - Definição de permissões.
   - Associação das permissões aos recursos do sistema.

------     *Fluxogramas*
Os fluxogramas abaixo representam os principais processos contemplados pelo modelo.

- Processo de pedido e atendimento:
anexar imagem
- Processo de produção:
anexar imagem
- Processo de estoque e expedição:
anexar imagem
- Processo de controle de acesso:
anexar imagem----------
  *Requisitos do Sistema*
(esta seção e a Seção 4 "Regras de Negócio" DIVIDEM 7,5% na dimensão conceitual — juntas valem 7,5%, não 7,5% cada — + 4% exclusivos desta seção na organização/documentação)
Requisitos Funcionais
O sistema deverá:
- RF01 — Permitir cadastrar, consultar, alterar e manter dados de clientes.
- RF02 — Permitir cadastrar representantes.
- RF03 — Permitir cadastrar e consultar pedidos.
- RF04 — Permitir associar um pedido a um cliente.
- RF05 — Permitir associar um pedido a um representante.
- RF06 — Permitir associar produtos aos pedidos.
- RF07 — Permitir controlar o status dos pedidos.
- RF08 — Permitir cadastrar fornecedores.
- RF09 — Permitir cadastrar materiais.
- RF10 — Permitir associar fornecedores aos materiais fornecidos.
- RF11 — Permitir cadastrar produtos e suas características.
- RF12 — Permitir cadastrar ordens de produção.
- RF13 — Permitir registrar a quantidade planejada para produção.
- RF14 — Permitir acompanhar o status das ordens de produção.
- RF15 — Permitir registrar as etapas de produção.
- RF16 — Permitir relacionar produtos às ordens de produção.
- RF17 — Permitir controlar os registros de estoque.
- RF18 — Permitir controlar lote, validade, quantidade e endereço do estoque.
- RF19 — Permitir registrar a separação de pedidos.
- RF20 — Permitir registrar caixas utilizadas no acondicionamento.
- RF21 — Permitir registrar peso e quantidade das caixas.
- RF22 — Permitir cadastrar caminhões e informações de saída.
- RF23 — Permitir registrar entregas.
- RF24 — Permitir registrar código de rastreio e datas de envio/entrega.
- RF25 — Permitir associar uma entrega ao caminhão utilizado.
- RF26 — Permitir cadastrar usuários do sistema.
- RF27 — Permitir associar usuários a perfis.
- RF28 — Permitir associar permissões a recursos.
- RF29 — Permitir controlar operações de consulta, inserção, alteração e exclusão conforme as permissões do usuário.
- RF30 — Permitir consultar informações de pedidos, estoque, produção e entregas de forma integrada.
Requisitos Não Funcionais
- RNF01 — Segurança: o acesso ao sistema deverá exigir autenticação de usuários.
- RNF02 — Controle de acesso: as funcionalidades disponíveis deverão respeitar o perfil e as permissões atribuídas ao usuário.
- RNF03 — Privacidade: informações pessoais deverão ser tratadas de acordo com a legislação aplicável, especialmente a LGPD. A Lei nº 13.709/2018 regulamenta o tratamento de dados pessoais por pessoas físicas e jurídicas. Planalto
- RNF04 — Integridade: o sistema deverá impedir registros que violem chaves únicas, relacionamentos ou obrigatoriedades definidas pelo modelo.
- RNF05 — Rastreabilidade: operações relevantes deverão poder ser identificadas e rastreadas por seus registros.
- RNF06 — Disponibilidade: o sistema deverá estar disponível durante os períodos necessários às operações administrativas, produtivas e logísticas.
- RNF07 — Desempenho: consultas de pedidos, estoque e produção deverão apresentar resposta adequada mesmo com crescimento do volume de registros.
- RNF08 — Escalabilidade: o modelo deverá permitir o crescimento da quantidade de produtos, clientes, pedidos, fornecedores, estoques, produções e entregas sem alteração estrutural frequente.
- RNF09 — Usabilidade: as informações deverão ser apresentadas de forma clara e organizada para os usuários.
- RNF10 — Backup: os dados deverão possuir mecanismos de cópia de segurança e recuperação.
- RNF11 — Manutenibilidade: o modelo deverá permitir futuras alterações e integrações com outros sistemas.
- RNF12 — Conformidade: o processo de fabricação deve considerar requisitos regulatórios aplicáveis ao setor de cosméticos, higiene pessoal e perfumaria. A Anvisa estabelece requisitos de Boas Práticas de Fabricação para esses produtos, incluindo aspectos de produção, armazenamento, documentação e controle da qualidade.

  *Regras de Negócio*
(esta seção DIVIDE com a Seção 3 "Requisitos do Sistema" os mesmos 7,5% da dimensão conceitual — juntas valem 7,5%, não 7,5% cada — + 4% exclusivos desta seção na documentação. "Regras de negócio" é o termo técnico usado em modelagem de dados para as regras de funcionamento de qualquer organização, com ou sem fins lucrativos)
Regras operacionais
- RN01: Cada cliente pode possuir zero ou vários pedidos.
- RN02: Cada pedido deve estar associado a um cliente.
- RN03: Cada pedido deve estar associado a um representante, conforme o modelo conceitual apresentado.
- RN04: Um representante pode estar associado a vários pedidos.
- RN05: Um fornecedor pode fornecer diversos materiais.
- RN06: Um material pode ser fornecido por diferentes fornecedores.
- RN07: O CNPJ do fornecedor deve ser único.
- RN08: Cada material deve possuir identificação própria.
- RN09: O estoque deve manter informações de lote, validade, quantidade e localização.
- RN10: Um produto pode possuir diferentes registros de estoque.
- RN11: Cada registro de estoque deve estar relacionado a um produto.
- RN12: Uma ordem de produção deve possuir identificação, data de emissão, quantidade e status.
- RN13: Uma ordem de produção deve estar associada a um produto.
- RN14: Uma ordem de produção gera registros de produção.
- RN15: Os registros de produção devem permitir acompanhamento de programação, início, término e status.
- RN16: Uma produção pode utilizar embalagens.
- RN17: A separação de pedido deve registrar data, quantidade e status.
- RN18: O processo de acondicionamento deve registrar as caixas utilizadas.
- RN19: Cada caixa deve possuir identificação própria.
- RN20: A entrega deve possuir identificação e status.
- RN21: A entrega pode possuir código de rastreio para permitir acompanhamento logístico.
- RN22: Uma entrega deve ser realizada por um caminhão, conforme o DER.
- RN23: A placa do caminhão deve ser única.
- RN24: O sistema deve controlar os acessos por meio de usuários, perfis, permissões e recursos.
- RN25: Um usuário deve possuir um perfil.
- RN26: Um perfil pode possuir várias permissões.
- RN27: As permissões devem indicar operações autorizadas, como consultar, inserir, alterar e excluir.
- RN28: As permissões devem ser aplicadas aos recursos correspondentes do sistema.
- RN29: Status de pedido, produção, separação e entrega devem utilizar valores previamente definidos pelo sistema.
- RN30: Quantidades relacionadas a pedidos, produção, estoque e caixas não devem assumir valores negativos.
- RN31: Registros relacionados à validade devem permitir identificar materiais/produtos que não podem ser utilizados após o vencimento.
- RN32: Dados pessoais de clientes, representantes e usuários devem ser protegidos contra acesso não autorizado.
A legislação sanitária aplicável ao setor também torna relevantes controles de documentação, produção, armazenamento, qualidade e rastreabilidade. A regulamentação de Boas Práticas de Fabricação da Anvisa contempla, entre outros pontos, recebimento e armazenamento, produção, controle da qualidade e documentação. BVSMS
Restrições organizacionais
1. Proteção de dados pessoais: informações como nome, telefone, e-mail, endereço e dados de autenticação devem possuir acesso restrito e finalidade definida. A LGPD estabelece regras para o tratamento de dados pessoais em meios físicos e digitais. Planalto
2. Controle de acesso: nem todos os usuários devem possuir as mesmas permissões. Por isso o modelo separa Usuário, Perfil, Permissão e Recurso.
3. Controle de estoque e validade: o modelo precisa permitir identificar lotes, quantidades, endereços e validade. Esse tipo de controle é especialmente relevante para uma indústria de cosméticos, considerando os requisitos de armazenamento e controle previstos nas Boas Práticas de Fabricação. BVSMS
4. Rastreabilidade logística: a existência de entrega, código de rastreio, caminhão, data de envio e data de entrega permite acompanhar a movimentação dos pedidos.
5. Integridade dos cadastros: identificadores como CNPJ de fornecedor e placa de caminhão são tratados como únicos no modelo fornecido.

   *Dicionário de Dados Conceitual (Preliminar)*
(vale 10% — Dimensão Procedimental)

Entidade: Cliente
Atributo	Descrição	Regra de negócio associada
CNPJ	Identificador fiscal do cliente empresarial	Deve identificar o cliente de forma única
Razão_Social	Nome empresarial oficial	Obrigatório no cadastro
Nome_Fantasia	Nome comercial utilizado pelo cliente	Pode ser informado quando aplicável
Telefone	Telefone de contato	Deve possuir formato válido
Cidade	Cidade do cliente	Obrigatória para localização
UF	Unidade federativa do cliente	Deve utilizar UF válida
Endereço	Endereço do cliente	Obrigatório para cadastro completo


Entidade: Representante
Atributo	Descrição	Regra de negócio associada
IdRep	Identificador do representante	Chave da entidade
Nome	Nome do representante	Obrigatório
Telefone	Telefone de contato	Deve possuir formato válido
Email	E-mail do representante	Deve possuir formato válido


Entidade: Pedido
Atributo	Descrição	Regra de negócio associada
IdPedido	Identificador do pedido	Chave da entidade
Data_Pedido	Data de criação do pedido	Obrigatória
Valor_Total	Valor total do pedido	Não deve ser negativo
Status_Pedido	Situação atual do pedido	Deve utilizar valores previamente definidos


Entidade: Fornecedor
Atributo	Descrição	Regra de negócio associada
IdFornecedor	Identificador do fornecedor	Chave da entidade
Nome	Nome do fornecedor	Obrigatório
CNPJ	CNPJ do fornecedor	Deve ser único
Telefone	Telefone do fornecedor	Deve possuir formato válido
Endereço	Endereço do fornecedor	Obrigatório para cadastro completo


Entidade: Material
Atributo	Descrição	Regra de negócio associada
IdMaterial	Identificador do material	Chave da entidade
Nome_Material	Nome ou descrição do material	Obrigatório
Unidade	Unidade utilizada para controle do material	Deve utilizar unidade válida
Estoque_Minimo	Quantidade mínima desejada em estoque	Não deve ser negativa


Entidade: Produto
Atributo	Descrição	Regra de negócio associada
IdProduto	Identificador do produto	Chave da entidade
Nome	Nome do produto	Obrigatório
EAN	Código EAN do produto	Deve possuir formato válido quando utilizado
Unidade	Unidade de comercialização/controle	Obrigatória
Descrição	Características descritivas do produto	Campo textual


Entidade: Ordem de Produção
Atributo	Descrição	Regra de negócio associada
IdOrdem	Identificador da ordem de produção	Chave da entidade
Data_Emissão	Data de emissão da ordem	Obrigatória
Status	Situação da ordem de produção	Deve utilizar valores definidos
Quantidade	Quantidade planejada para produção	Deve ser positiva


Entidade: Produção
Atributo	Descrição	Regra de negócio associada
IdProdução	Identificador do registro de produção	Chave da entidade
Data_Programação	Data planejada para produção	Obrigatória
Data_Início	Data de início da produção	Não deve anteceder a programação de forma inconsistente
Data_Fim	Data de término da produção	Deve ser compatível com a data de início
Status	Situação da produção	Deve utilizar valores definidos


Entidade: Embalagem
Atributo	Descrição	Regra de negócio associada
IdEmbalagem	Identificador da embalagem	Chave da entidade
Tipo	Tipo de embalagem	Obrigatório
Capacidade	Capacidade da embalagem	Deve ser positiva
Material	Material utilizado na embalagem	Deve ser informado


Entidade: Estoque
Atributo	Descrição	Regra de negócio associada
IdEstoque	Identificador do registro de estoque	Chave da entidade
Lote	Identificação do lote	Deve permitir rastreabilidade
Validade	Data de validade	Deve ser uma data válida
Quantidade	Quantidade disponível	Não deve ser negativa
Endereço	Localização física do estoque	Deve identificar a localização


Entidade: Separação de Pedido
Atributo	Descrição	Regra de negócio associada
IdSeparação	Identificador da separação	Chave da entidade
Data	Data da separação	Obrigatória
Quantidade	Quantidade separada	Deve ser positiva
Status	Situação da separação	Deve utilizar valores definidos


Entidade: Caixa
Atributo	Descrição	Regra de negócio associada
IdCaixa	Identificador da caixa	Chave da entidade
Peso	Peso da caixa	Deve ser positivo
Quantidade	Quantidade acondicionada	Deve ser positiva


Entidade: Caminhão
Atributo	Descrição	Regra de negócio associada
IdCaminhão	Identificador do caminhão	Chave da entidade
Placa	Placa do veículo	Deve ser única
Motorista	Identificação do motorista	Deve ser informado para operação de entrega
Data_Saída	Data de saída do veículo	Deve ser válida


Entidade: Entrega
Atributo	Descrição	Regra de negócio associada
IdEntrega	Identificador da entrega	Chave da entidade
Código_Rastreio	Código utilizado para rastreamento	Deve ser único quando utilizado
Data_Envio	Data em que a entrega foi enviada	Deve ser válida
Data_Entrega	Data efetiva da entrega	Deve ser igual ou posterior à data de envio
Status	Situação da entrega	Deve utilizar valores definidos


Entidade: Usuário
Atributo	Descrição	Regra de negócio associada
IdUsuario	Identificador do usuário	Chave da entidade
Nome_Completo	Nome do usuário	Obrigatório
Email	E-mail do usuário	Deve possuir formato válido
Login	Identificador para autenticação	Deve ser único
Senha	Credencial de autenticação	Deve ser armazenada de forma segura, nunca em texto puro
Status	Situação do usuário	Deve permitir ativação/inativação


Entidade: Perfil
Atributo	Descrição	Regra de negócio associada
IdPerfil	Identificador do perfil	Chave da entidade
Cargo	Cargo/função associado ao perfil	Obrigatório


Entidade: Permissão
Atributo	Descrição	Regra de negócio associada
Id_Permissão	Identificador da permissão	Chave da entidade
Consultar	Indica autorização para consulta	Booleano
Inserir	Indica autorização para inserção	Booleano
Alterar	Indica autorização para alteração	Booleano
Excluir	Indica autorização para exclusão	Booleano


Entidade: Recurso
Atributo	Descrição	Regra de negócio associada
IdRecurso	Identificador do recurso	Chave da entidade
Nome	Nome do recurso ou funcionalidade	Obrigatório

*Modelagem Conceitual (Entidades, Atributos, Relacionamentos)*
(vale 7,5% na dimensão conceitual)
Entidades reconhecidas
O modelo conceitual possui as seguintes entidades:
- Cliente: representa empresas/clientes que realizam pedidos.
- Representante: representa o responsável comercial relacionado ao pedido.
- Pedido: representa a solicitação comercial realizada pelo cliente.
- Produto: representa os produtos comercializados pela organização.
- Fornecedor: representa empresas fornecedoras.
- Material: representa materiais utilizados na operação produtiva.
- Ordem de Produção: representa a programação formal de fabricação.
- Produção: representa o registro da execução da produção.
- Embalagem: representa os tipos de embalagens utilizadas.
- Estoque: representa a disponibilidade e localização dos produtos armazenados.
- Separação de Pedido: representa a etapa de preparação do pedido para expedição.
- Caixa: representa a unidade física utilizada no acondicionamento.
- Caminhão: representa o veículo utilizado na operação de entrega.
- Entrega: representa o processo de envio/entrega do pedido.
- Usuário: representa quem acessa o sistema.
- Perfil: representa o conjunto de características/cargo associado ao usuário.
- Permissão: representa as operações autorizadas.
- Recurso: representa as funcionalidades ou recursos protegidos pelo controle de acesso.

Atributos e classificações
Os atributos foram classificados conceitualmente em:
- Identificadores: IdCliente/CNPJ, IdRep, IdPedido, IdFornecedor, IdMaterial, IdProduto, IdOrdem, IdProdução, IdEmbalagem, IdEstoque, IdSeparação, IdCaixa, IdCaminhão, IdEntrega, IdUsuario, IdPerfil, Id_Permissão e IdRecurso.
- Atributos descritivos: nomes, descrições, endereços, tipos, cargos e demais informações textuais.
- Atributos quantitativos: quantidade, valor total, peso, capacidade e estoque mínimo.
- Atributos temporais: datas de pedido, emissão, programação, início, fim, saída, envio e entrega.
- Atributos de controle: status, login, senha e indicadores de permissão.
- Atributos de identificação externa: CNPJ, EAN, placa e código de rastreio.
Relacionamentos pertinentes
Relacionamento	Entidades	Finalidade
Faz	Cliente — Pedido	Representa a realização de pedidos pelo cliente
Cadastra	Representante — Pedido	Relaciona representante e pedido
Possui	Pedido — Produto	Relaciona produtos aos pedidos
Fornece	Fornecedor — Material	Representa o fornecimento de materiais
Produzido em	Produto — Ordem de Produção	Relaciona o produto à ordem de produção
Gera	Ordem de Produção — Produção	Representa a geração de registros de produção
Possui	Produto — Estoque	Relaciona produto e seus registros de estoque
Utiliza	Produção — Embalagem	Representa a utilização de embalagens
Separado em	Pedido — Separação de Pedido	Representa a separação do pedido
Acondiciona	Separação de Pedido — Caixa	Representa o acondicionamento da separação
Compõe	Caixa — Entrega	Relaciona caixas à entrega
Realizada por	Entrega — Caminhão	Relaciona a entrega ao veículo utilizado
Possui	Usuário — Perfil	Relaciona o usuário ao perfil
Possui	Perfil — Permissão	Relaciona o perfil às permissões
Aplicada a	Permissão — Recurso	Define em qual recurso a permissão é aplicada


Restrições e políticas organizacionais aplicadas ao modelo
O modelo considera:
- identificação única dos principais registros;
- controle de status dos processos;
- rastreabilidade de estoque por lote e validade;
- rastreabilidade das entregas;
- controle de acesso baseado em perfil e permissão;
- integridade referencial entre entidades;
- proteção dos dados pessoais;
- possibilidade de expansão futura para outros processos da organização.

 *Justificativa Técnica*
(vale 7,5% — sozinho, é o subcritério de maior peso dentro da Dimensão Conceitual)
A modelagem foi estruturada de maneira a separar os principais objetos de negócio da organização em entidades independentes. Essa decisão evita concentrar informações diferentes em uma única estrutura e permite que cada entidade represente um conceito específico da operação.
A entidade Cliente foi separada de Pedido porque um mesmo cliente pode realizar diferentes pedidos ao longo do tempo. Da mesma forma, Representante foi separado de Pedido, permitindo que um representante esteja associado a diferentes operações comerciais.
A separação entre Fornecedor e Material permite representar a relação de fornecimento. O modelo considera que diferentes fornecedores podem fornecer materiais e que um fornecedor pode trabalhar com diversos materiais.
A distinção entre Produto, Ordem de Produção e Produção permite separar o cadastro permanente do produto da ordem que determina uma fabricação e do registro efetivo de produção. Isso possibilita acompanhar o planejamento e a execução da fabricação.
A entidade Estoque foi separada de Produto porque um mesmo produto pode possuir diferentes registros de estoque, inclusive por lote, validade ou localização. Essa decisão é importante para permitir rastreabilidade.
As entidades Separação de Pedido, Caixa, Entrega e Caminhão representam etapas diferentes da logística. A separação representa a preparação, a caixa representa o acondicionamento físico, a entrega representa o transporte do pedido e o caminhão representa o veículo responsável pelo transporte.
Por fim, Usuário, Perfil, Permissão e Recurso foram modelados separadamente para permitir um mecanismo de controle de acesso mais flexível. Essa estrutura possibilita que diferentes perfis tenham diferentes permissões sobre diferentes recursos do sistema.

*Uso de Inteligência Artificial*
A Inteligência Artificial foi utilizada como ferramenta de apoio durante o desenvolvimento do projeto, principalmente na elaboração do README e do código HTML do dicionário de dados.
No desenvolvimento do dicionário de dados, inicialmente foi utilizado um prompt para gerar a estrutura em HTML. Entretanto, o primeiro resultado apresentou uma estrutura mais elaborada do que a solicitada pelo professor. Por esse motivo, o prompt foi reformulado, orientando a IA a desenvolver o HTML utilizando uma lista simples, conforme as orientações fornecidas para a atividade.
A IA também foi utilizada como apoio na organização e elaboração do README, auxiliando na estruturação das informações do projeto, na descrição dos processos, requisitos, regras de negócio e demais seções solicitadas. Após a geração do conteúdo, as informações foram revisadas e ajustadas de acordo com o projeto desenvolvido e com as orientações da atividade.

*Conclusão*
Síntese, contribuições, aprendizados, trabalhos futuros
O projeto apresentou uma modelagem conceitual de banco de dados direcionada à realidade operacional da Muriel Cosméticos, contemplando processos comerciais, produtivos, logísticos e administrativos.
O DER desenvolvido permite relacionar clientes, representantes, pedidos e produtos com processos posteriores de separação, acondicionamento e entrega. Também foram contemplados fornecedores, materiais, produção, embalagens e estoques, possibilitando representar o fluxo de informações desde o fornecimento de materiais e fabricação até a disponibilização e distribuição dos produtos.
Outro aspecto importante foi a inclusão do controle de acesso, por meio das entidades Usuário, Perfil, Permissão e Recurso. Essa estrutura permite que uma futura implementação do sistema controle quais operações cada usuário está autorizado a executar.
Como aprendizado, o projeto permitiu compreender a importância de transformar processos organizacionais em entidades, atributos e relacionamentos, considerando não apenas o armazenamento das informações, mas também as regras de negócio, cardinalidades, integridade, segurança e possibilidade de expansão futura.

*Referências Bibliográficas*
MURIEL COSMÉTICOS. Muriel Cosméticos — site institucional. Disponível em: https://muriel.com.br/. Acesso em: 21 set. 2026.
MURIEL COSMÉTICOS. Quem somos. Disponível em: Quem Somos — Muriel Cosméticos. Acesso em: 21 set. 2026.
MURIEL COSMÉTICOS. Fale conosco. Disponível em: Contato — Muriel Cosméticos. Acesso em: 21 set. 2026.
MURIEL COSMÉTICOS. Perfil institucional. LinkedIn. Disponível em: Muriel Cosméticos — LinkedIn. Acesso em: 21 set. 2026.
BRASIL. Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais — LGPD. Brasília, DF. Disponível em: Lei nº 13.709/2018 — Planalto. Acesso em: 21 set. 2026. Planalto
BRASIL. AGÊNCIA NACIONAL DE VIGILÂNCIA SANITÁRIA — ANVISA. Resolução RDC nº 48, de 25 de outubro de 2013. Regulamento Técnico de Boas Práticas de Fabricação para Produtos de Higiene Pessoal, Cosméticos e Perfumes. Disponível em: RDC nº 48/2013 — Anvisa. Acesso em: 21 set. 2026. BVSMS
BRASIL. AGÊNCIA NACIONAL DE VIGILÂNCIA SANITÁRIA — ANVISA. Legislação e orientações em cosmetovigilância. Disponível em: Anvisa — Cosmetovigilância. Acesso em: 21 set. 2026. Serviços e Informações do Brasil
GRUPO DO PROJETO. Conceptual model - BRMW. Diagrama conceitual/DER fornecido para o desenvolvimento deste projeto. 2026.     Conceptual model - BRMW

*Critérios Atitudinais (20%)*
Estes critérios NÃO constam explicitamente como item de entrega no README. Eles são avaliados por meio de Avaliação 360º entre os integrantes do grupo (cada membro avalia os colegas de equipe), e não pela leitura do repositório ou pela apresentação:
- Participação (1%): envolvimento nas discussões técnicas e nas decisões do grupo.
- Comprometimento (7%): cumprimento de prazos e responsabilidades assumidas.
- Colaboração (2%): respeito às contribuições dos colegas e cooperação na construção do projeto.
- Autonomia (10%): busca independente de soluções e proposta de melhorias.
