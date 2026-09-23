### Modelagem de Banco de Dados para a Muriel Cosméticos: Gestão de Pedidos, Produção, Estoque, Logística e Controle de Acesso

*Projeto acadêmico — Modelagem de Banco de Dados (2º semestre)*

📄 Dicionário de dados (versão web) 🔗 Modelo conceitual no BRModelo Web

Colaboradores do projeto acadêmico
Kevyn Deusdará Antônio (RGM 46970746)
Kamilly Anselmoo (RGM 47234237)
Maria Eduarda da Silva Costa (RGM 46939563)
Igor Tsuyoshi (RGM 47133562)
1. Introdução

#### Problema, objetivos e delimitação

A Muriel Cosméticos é uma empresa privada do setor de fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal. A empresa informa possuir mais de 60 anos de atuação e disponibiliza diferentes linhas e categorias de produtos, incluindo produtos para corpo e cabelo.

O presente projeto tem como objetivo desenvolver uma modelagem conceitual de banco de dados capaz de representar, de maneira integrada, processos relacionados ao cadastro de clientes e representantes, registro de pedidos, fornecedores e materiais, produção, controle de estoque, separação de pedidos, acondicionamento em caixas, expedição e entrega, além do controle de acesso ao sistema.

O problema abordado consiste na necessidade de organizar, em uma estrutura de dados única e consistente, informações que participam de diferentes etapas da operação industrial e logística. O modelo busca permitir o relacionamento entre pedido, produto, produção, estoque e entrega, reduzindo redundâncias e facilitando futuras etapas de implementação do sistema.

O escopo deste trabalho está delimitado à modelagem conceitual do banco de dados. Não fazem parte desta etapa a implementação física do banco, o desenvolvimento da aplicação, a definição completa dos tipos de dados, a criação das tabelas SQL ou a integração efetiva com sistemas corporativos existentes.

*2. Desenvolvimento*
2.1 Caracterização da Organização
Nome e natureza da organização: a organização selecionada é a Muriel Cosméticos, cuja razão social apresentada no site institucional é BEAUTY LAB DO BRASIL LTDA. Trata-se de uma empresa privada que atua na fabricação de cosméticos, produtos de perfumaria e produtos de higiene pessoal.
Contexto e porte: a Muriel informa possuir mais de 60 anos de atuação no mercado de cosméticos. Seu perfil institucional no LinkedIn classifica a empresa como privada, sediada em São Paulo e pertencente à faixa de 201 a 500 funcionários. A empresa disponibiliza diversas linhas e categorias de produtos, incluindo body splash, águas de banho, águas de colônia, sabonetes, óleos corporais, produtos capilares, shampoos, condicionadores, máscaras e produtos Muriel Baby, entre outros.
Problemas e necessidades identificados: o principal problema de modelagem consiste na necessidade de integrar informações de diferentes etapas da operação: clientes e pedidos, fornecedores e materiais, produtos e produção, estoque, separação e expedição, entregas e controle de acesso. O DER foi construído para centralizar essas informações e representar os relacionamentos existentes entre as áreas. Dessa forma, o sistema poderá futuramente permitir o acompanhamento de um pedido desde seu cadastro até a separação, o acondicionamento e a entrega, relacionando essas operações às informações de produtos, estoque e produção.
Justificativa da escolha: a Muriel apresenta características que tornam sua operação adequada para um projeto de modelagem de dados: possui atividade industrial, variedade de produtos, relacionamento com fornecedores, utilização de materiais, produção, armazenamento e processos de distribuição. A própria empresa destaca investimento em inovação, tecnologia, pesquisa e desenvolvimento de produtos. A diversidade de processos permite construir um modelo conceitual com diferentes níveis de relacionamento, incluindo operações comerciais, produtivas, logísticas e administrativas.

#### Dados da organização

Organização: Muriel Cosméticos / BEAUTY LAB DO BRASIL LTDA.
Endereço divulgado: Rua Forte do Rio Branco, 854, Parque Industrial São Lourenço, São Paulo/SP, CEP 08340-140.
Site oficial: https://muriel.com.br/
Contato institucional: SAC 0800 011 3846; e-mail sac@muriel.com.br; telefone +55 (11) 2010-1900; WhatsApp +55 (11) 97085-2921.
Perfil empresarial: Muriel Cosméticos no LinkedIn.

Visita à organização. A foto abaixo foi tirada com a colaboradora da Muriel Cosméticos que nos guiou pelo fluxo operacional dos processos:

<img width="465" height="573" alt="Captura de tela 2026-09-23 133139" src="https://github.com/user-attachments/assets/573742d8-7582-4d01-8f05-952a3dd262dd" />

*2.2 Oportunidade de melhoria identificada*

Durante a visita, identificamos uma possível dificuldade operacional que o sistema modelado poderia ajudar a resolver.

Dor: falta de visibilidade em tempo real do status do pedido. O setor Comercial pode ter dificuldade para identificar rapidamente se o pedido está aguardando material, em produção, disponível no estoque, em separação ou já expedido.
Proposta: um painel de acompanhamento integrado ao Protheus (TOTVS), o sistema de gestão utilizado pela empresa, com:
status do pedido atualizado por etapa;
alertas para atrasos e falta de materiais;
rastreabilidade desde o pedido até a entrega;
redução de planilhas e de comunicação manual.

Esta é uma proposta para trabalhos futuros. Ela está fora do escopo desta etapa (modelagem conceitual), mas o modelo foi pensado para dar suporte a ela: as entidades Pedido, Produção, Estoque, Separação de Pedido e Entrega, com seus respectivos campos de status, fornecem os dados necessários.

*2.3 Processos de Negócio*

Principais processos mapeados

Cadastro e gestão de clientes e representantes
Cadastro das informações do cliente.
Cadastro dos representantes.
Associação entre representantes e pedidos.
Registro e gerenciamento de pedidos
Identificação do cliente.
Registro do representante responsável.
Registro da data, do valor e do status do pedido.
Associação dos produtos ao pedido.
Gestão de fornecedores e materiais
Cadastro de fornecedores.
Cadastro de materiais.
Associação entre fornecedores e materiais fornecidos.
Controle de unidade e estoque mínimo dos materiais.
Planejamento e execução da produção
Cadastro da ordem de produção.
Definição da quantidade a produzir.
Registro do status e da data de emissão.
Geração de registros de produção.
Associação de produtos às ordens de produção.
Registro das datas de programação, início e término da produção.
Controle de estoque
Cadastro dos estoques.
Controle de lote, validade e quantidade.
Identificação do endereço físico do estoque.
Associação do estoque ao produto.
Separação e acondicionamento de pedidos
Criação da separação do pedido.
Registro de data, quantidade e status.
Acondicionamento dos itens em caixas.
Controle de peso e quantidade das caixas.
Expedição e entrega
Registro das caixas que compõem uma entrega.
Associação da entrega a um caminhão.
Registro do código de rastreio.
Registro das datas de envio e entrega.
Acompanhamento do status da entrega.
Controle de acesso
Cadastro de usuários.
Associação de usuários a perfis.
Definição de permissões.
Associação das permissões aos recursos do sistema.

#### Fluxogramas

Os fluxogramas abaixo representam os principais processos contemplados pelo modelo.

Processo de pedido e atendimento:

<img width="765" height="488" alt="Captura de tela 2026-09-22 083054" src="https://github.com/user-attachments/assets/52b850d5-b07f-436c-9d44-ec03cceb8c90" />

Processo de produção:

<img width="765" height="484" alt="Captura de tela 2026-09-22 083319" src="https://github.com/user-attachments/assets/ceeb1763-fd09-4e22-bbfc-2a96151d7d81" />

Processo de estoque e expedição:

<img width="766" height="488" alt="Captura de tela 2026-09-22 083348" src="https://github.com/user-attachments/assets/37bf5ec5-9f95-4502-96dd-f201bd543b9d" />

Processo de controle de acesso:

<img width="766" height="488" alt="Captura de tela 2026-09-22 133108" src="https://github.com/user-attachments/assets/e021934d-3395-42c7-96b3-8beee5ba78f1" />

*2.4 Requisitos do Sistema*

Requisitos Funcionais

O sistema deverá:

RF01 — Permitir cadastrar, consultar, alterar e manter dados de clientes.
RF02 — Permitir cadastrar representantes.
RF03 — Permitir cadastrar e consultar pedidos.
RF04 — Permitir associar um pedido a um cliente.
RF05 — Permitir associar um pedido a um representante.
RF06 — Permitir associar produtos aos pedidos.
RF07 — Permitir controlar o status dos pedidos.
RF08 — Permitir cadastrar fornecedores.
RF09 — Permitir cadastrar materiais.
RF10 — Permitir associar fornecedores aos materiais fornecidos.
RF11 — Permitir cadastrar produtos e suas características.
RF12 — Permitir cadastrar ordens de produção.
RF13 — Permitir registrar a quantidade planejada para produção.
RF14 — Permitir acompanhar o status das ordens de produção.
RF15 — Permitir registrar as etapas de produção.
RF16 — Permitir relacionar produtos às ordens de produção.
RF17 — Permitir controlar os registros de estoque.
RF18 — Permitir controlar lote, validade, quantidade e endereço do estoque.
RF19 — Permitir registrar a separação de pedidos.
RF20 — Permitir registrar caixas utilizadas no acondicionamento.
RF21 — Permitir registrar peso e quantidade das caixas.
RF22 — Permitir cadastrar caminhões e informações de saída.
RF23 — Permitir registrar entregas.
RF24 — Permitir registrar código de rastreio e datas de envio/entrega.
RF25 — Permitir associar uma entrega ao caminhão utilizado.
RF26 — Permitir cadastrar usuários do sistema.
RF27 — Permitir associar usuários a perfis.
RF28 — Permitir associar permissões a recursos.
RF29 — Permitir controlar operações de consulta, inserção, alteração e exclusão conforme as permissões do usuário.
RF30 — Permitir consultar informações de pedidos, estoque, produção e entregas de forma integrada.

Requisitos Não Funcionais

RNF01 — Segurança: o acesso ao sistema deverá exigir autenticação de usuários.
RNF02 — Controle de acesso: as funcionalidades disponíveis deverão respeitar o perfil e as permissões atribuídas ao usuário.
RNF03 — Privacidade: informações pessoais deverão ser tratadas de acordo com a legislação aplicável, especialmente a Lei Geral de Proteção de Dados Pessoais (LGPD — Lei nº 13.709/2018), que regulamenta o tratamento de dados pessoais por pessoas físicas e jurídicas.
RNF04 — Integridade: o sistema deverá impedir registros que violem chaves únicas, relacionamentos ou obrigatoriedades definidas pelo modelo.
RNF05 — Rastreabilidade: operações relevantes deverão poder ser identificadas e rastreadas por seus registros.
RNF06 — Disponibilidade: o sistema deverá estar disponível durante os períodos necessários às operações administrativas, produtivas e logísticas.
RNF07 — Desempenho: consultas de pedidos, estoque e produção deverão apresentar resposta adequada mesmo com o crescimento do volume de registros.
RNF08 — Escalabilidade: o modelo deverá permitir o crescimento da quantidade de produtos, clientes, pedidos, fornecedores, estoques, produções e entregas sem alteração estrutural frequente.
RNF09 — Usabilidade: as informações deverão ser apresentadas de forma clara e organizada para os usuários.
RNF10 — Backup: os dados deverão possuir mecanismos de cópia de segurança e recuperação.
RNF11 — Manutenibilidade: o modelo deverá permitir futuras alterações e integrações com outros sistemas.
RNF12 — Conformidade: o processo de fabricação deve considerar os requisitos regulatórios aplicáveis ao setor de cosméticos, higiene pessoal e perfumaria. A Anvisa, por meio da RDC nº 48/2013, estabelece requisitos de Boas Práticas de Fabricação para esses produtos, incluindo aspectos de produção, armazenamento, documentação e controle da qualidade.
2.5 Regras de Negócio

Regras operacionais

RN01: cada cliente pode possuir zero ou vários pedidos.
RN02: cada pedido deve estar associado a um cliente.
RN03: cada pedido deve estar associado a um representante.
RN04: um representante pode estar associado a vários pedidos.
RN05: um fornecedor pode fornecer diversos materiais.
RN06: um material pode ser fornecido por diferentes fornecedores.
RN07: o CNPJ do fornecedor deve ser único.
RN08: cada material deve possuir identificação própria.
RN09: o estoque deve manter informações de lote, validade, quantidade e localização.
RN10: um produto pode possuir diferentes registros de estoque.
RN11: cada registro de estoque deve estar relacionado a um produto.
RN12: uma ordem de produção deve possuir identificação, data de emissão, quantidade e status.
RN13: uma ordem de produção deve estar associada a um produto.
RN14: uma ordem de produção gera registros de produção.
RN15: os registros de produção devem permitir o acompanhamento de programação, início, término e status.
RN16: uma produção pode utilizar uma ou mais embalagens.
RN17: a separação de pedido deve registrar data, quantidade e status.
RN18: o processo de acondicionamento deve registrar as caixas utilizadas.
RN19: cada caixa deve possuir identificação própria.
RN20: a entrega deve possuir identificação e status.
RN21: a entrega pode possuir código de rastreio para permitir o acompanhamento logístico.
RN22: uma entrega deve ser realizada por um caminhão.
RN23: a placa do caminhão deve ser única.
RN24: o sistema deve controlar os acessos por meio de usuários, perfis, permissões e recursos.
RN25: um usuário deve possuir um perfil.
RN26: um perfil pode possuir várias permissões.
RN27: as permissões devem indicar as operações autorizadas: consultar, inserir, alterar e excluir.
RN28: as permissões devem ser aplicadas aos recursos correspondentes do sistema.
RN29: os status de pedido, produção, separação e entrega devem utilizar valores previamente definidos pelo sistema.
RN30: quantidades relacionadas a pedidos, produção, estoque e caixas não devem assumir valores negativos.
RN31: registros relacionados à validade devem permitir identificar materiais e produtos que não podem ser utilizados após o vencimento.
RN32: dados pessoais de clientes, representantes e usuários devem ser protegidos contra acesso não autorizado.

A legislação sanitária aplicável ao setor também torna relevantes os controles de documentação, produção, armazenamento, qualidade e rastreabilidade. A RDC nº 48/2013 da Anvisa contempla, entre outros pontos, recebimento e armazenamento, produção, controle da qualidade e documentação.

#### Restrições organizacionais

Proteção de dados pessoais: informações como nome, telefone, e-mail, endereço e dados de autenticação devem possuir acesso restrito e finalidade definida. A LGPD estabelece regras para o tratamento de dados pessoais em meios físicos e digitais.
Controle de acesso: nem todos os usuários devem possuir as mesmas permissões. Por isso, o modelo separa Usuário, Perfil, Permissão e Recurso.
Controle de estoque e validade: o modelo precisa permitir identificar lotes, quantidades, endereços e validade, o que é especialmente relevante para uma indústria de cosméticos, considerando os requisitos de armazenamento e controle previstos nas Boas Práticas de Fabricação.
Rastreabilidade logística: a existência de entrega, código de rastreio, caminhão, data de envio e data de entrega permite acompanhar a movimentação dos pedidos.
Integridade dos cadastros: identificadores como o CNPJ do fornecedor e a placa do caminhão são tratados como únicos no modelo.
2.6 Dicionário de Dados Conceitual (preliminar)

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
2.7 Modelagem Conceitual (entidades, atributos e relacionamentos)

#### Diagrama Entidade-Relacionamento (DER)

<img width="801" height="580" alt="Captura de tela 2026-09-23 084153" src="https://github.com/user-attachments/assets/da00b8f1-6c83-450c-a1d0-47f91d44d3b1" />

*Entidades reconhecidas*

Cliente: representa empresas/clientes que realizam pedidos.
Representante: representa o responsável comercial relacionado ao pedido.
Pedido: representa a solicitação comercial realizada pelo cliente.
Produto: representa os produtos comercializados pela organização.
Fornecedor: representa empresas fornecedoras.
Material: representa materiais utilizados na operação produtiva.
Ordem de Produção: representa a programação formal de fabricação.
Produção: representa o registro da execução da produção.
Embalagem: representa os tipos de embalagens utilizadas.
Estoque: representa a disponibilidade e a localização dos produtos armazenados.
Separação de Pedido: representa a etapa de preparação do pedido para expedição.
Caixa: representa a unidade física utilizada no acondicionamento.
Caminhão: representa o veículo utilizado na operação de entrega.
Entrega: representa o processo de envio/entrega do pedido.
Usuário: representa quem acessa o sistema.
Perfil: representa o conjunto de características/cargo associado ao usuário.
Permissão: representa as operações autorizadas.
Recurso: representa as funcionalidades ou recursos protegidos pelo controle de acesso.

*Atributos e classificações*

Os atributos foram classificados conceitualmente em:

Identificadores: CNPJ (Cliente), IdRep, IdPedido, IdFornecedor, IdMaterial, IdProduto, IdOrdem, IdProdução, IdEmbalagem, IdEstoque, IdSeparação, IdCaixa, IdCaminhão, IdEntrega, IdUsuario, IdPerfil, Id_Permissão e IdRecurso.
Atributos descritivos: nomes, descrições, endereços, tipos, cargos e demais informações textuais.
Atributos quantitativos: quantidade, valor total, peso, capacidade e estoque mínimo.
Atributos temporais: datas de pedido, emissão, programação, início, fim, saída, envio e entrega.
Atributos de controle: status, login, senha e indicadores de permissão.
Atributos de identificação externa: CNPJ, EAN, placa e código de rastreio.

*Relacionamentos e cardinalidades*

Relacionamento	Entidades	Cardinalidade	Finalidade
Faz	Cliente — Pedido	1:N	Um cliente realiza vários pedidos; cada pedido pertence a um cliente
Cadastra	Representante — Pedido	1:N	Um representante cadastra vários pedidos; cada pedido tem um representante
Possui	Pedido — Produto	N:N	Um pedido contém vários produtos; um produto pode estar em vários pedidos
Fornece	Fornecedor — Material	N:N	Um fornecedor fornece vários materiais; um material pode ter vários fornecedores
É feito com	Produto — Material	N:N	Relaciona o produto aos materiais que o compõem
É utilizado	Material — Produção	N:N	Relaciona os materiais consumidos em cada produção
Produzido em	Produto — Ordem de Produção	1:N	Um produto pode ter várias ordens de produção
Gera	Ordem de Produção — Produção	1:N	Uma ordem gera registros de produção
Possui	Produto — Estoque	1:N	Um produto pode ter vários registros de estoque (lote, validade, endereço)
Utiliza	Produção — Embalagem	N:N	Uma produção pode utilizar várias embalagens
Separado em	Pedido — Separação de Pedido	1:N	Relaciona o pedido à sua separação
Acondiciona	Separação de Pedido — Caixa	1:N	Uma separação é acondicionada em uma ou mais caixas
Compõe	Caixa — Entrega	N:1	Várias caixas compõem uma entrega
Realizada por	Entrega — Caminhão	N:1	Um caminhão realiza várias entregas; cada entrega usa um caminhão
Possui	Usuário — Perfil	N:1	Cada usuário tem um perfil; um perfil vale para vários usuários
Possui	Perfil — Permissão	N:N	Um perfil pode ter várias permissões
Aplicada a	Permissão — Recurso	N:1	Cada permissão é aplicada a um recurso

#### Restrições e políticas organizacionais aplicadas ao modelo

O modelo considera:

identificação única dos principais registros;
controle de status dos processos;
rastreabilidade de estoque por lote e validade;
rastreabilidade das entregas;
controle de acesso baseado em perfil e permissão;
integridade referencial entre entidades;
proteção dos dados pessoais;
possibilidade de expansão futura para outros processos da organização.
2.8 Justificativa Técnica

A modelagem foi estruturada de maneira a separar os principais objetos de negócio da organização em entidades independentes. Essa decisão evita concentrar informações diferentes em uma única estrutura e permite que cada entidade represente um conceito específico da operação.

A entidade Cliente foi separada de Pedido porque um mesmo cliente pode realizar diferentes pedidos ao longo do tempo. Da mesma forma, Representante foi separado de Pedido, permitindo que um representante esteja associado a diferentes operações comerciais.

A separação entre Fornecedor e Material permite representar a relação de fornecimento. O modelo considera que diferentes fornecedores podem fornecer materiais e que um fornecedor pode trabalhar com diversos materiais.

A distinção entre Produto, Ordem de Produção e Produção permite separar o cadastro permanente do produto, da ordem que determina uma fabricação e do registro efetivo de produção. Isso possibilita acompanhar o planejamento e a execução da fabricação.

A entidade Estoque foi separada de Produto porque um mesmo produto pode possuir diferentes registros de estoque, inclusive por lote, validade ou localização. Essa decisão é importante para permitir rastreabilidade.

As entidades Separação de Pedido, Caixa, Entrega e Caminhão representam etapas diferentes da logística. A separação representa a preparação, a caixa representa o acondicionamento físico, a entrega representa o transporte do pedido e o caminhão representa o veículo responsável pelo transporte.

Por fim, Usuário, Perfil, Permissão e Recurso foram modelados separadamente para permitir um mecanismo de controle de acesso mais flexível. Essa estrutura possibilita que diferentes perfis tenham diferentes permissões sobre diferentes recursos do sistema.

*3. Uso de Inteligência Artificial*

A Inteligência Artificial foi utilizada como ferramenta de apoio durante o desenvolvimento do projeto, principalmente na elaboração do README e do código HTML do dicionário de dados.

No desenvolvimento do dicionário de dados, inicialmente foi utilizado um prompt para gerar a estrutura em HTML. Entretanto, o primeiro resultado apresentou uma estrutura mais elaborada do que a solicitada pelo professor. Por esse motivo, o prompt foi reformulado, orientando a IA a desenvolver o HTML utilizando uma lista simples, conforme as orientações fornecidas para a atividade.

A IA também foi utilizada como apoio na organização e na elaboração do README, auxiliando na estruturação das informações do projeto, na descrição dos processos, dos requisitos, das regras de negócio e das demais seções solicitadas. Após a geração do conteúdo, as informações foram revisadas e ajustadas de acordo com o projeto desenvolvido e com as orientações da atividade.

#### 4. Conclusão

Síntese. O projeto apresentou uma modelagem conceitual de banco de dados direcionada à realidade operacional da Muriel Cosméticos, contemplando processos comerciais, produtivos, logísticos e administrativos. O DER desenvolvido permite relacionar clientes, representantes, pedidos e produtos com os processos posteriores de separação, acondicionamento e entrega. Também foram contemplados fornecedores, materiais, produção, embalagens e estoques, possibilitando representar o fluxo de informações desde o fornecimento de materiais e a fabricação até a disponibilização e a distribuição dos produtos.

Contribuições. Outro aspecto importante foi a inclusão do controle de acesso, por meio das entidades Usuário, Perfil, Permissão e Recurso, que permite que uma futura implementação controle quais operações cada usuário está autorizado a executar. As cardinalidades dos relacionamentos foram documentadas na seção 2.7.

Aprendizados. O projeto permitiu compreender a importância de transformar processos organizacionais em entidades, atributos e relacionamentos, considerando não apenas o armazenamento das informações, mas também as regras de negócio, as cardinalidades, a integridade, a segurança e a possibilidade de expansão futura.

Trabalhos futuros. Como evolução deste trabalho, propomos:

detalhar os relacionamentos com atributos próprios, como quantidade e preço unitário na relação Pedido — Produto e quantidade de cada material na composição do produto;
relacionar Separação de Pedido e Caixa ao Estoque (lote), para garantir a rastreabilidade completa do lote até a entrega;
avaliar a criação de uma entidade própria para o motorista e o tratamento de Valor_Total como atributo derivado dos itens do pedido;
elaborar o modelo lógico e físico, com definição de tipos de dados e criação das tabelas em SQL;
implementar o painel de acompanhamento de pedidos integrado ao Protheus, descrito na seção 2.2.
5. Referências Bibliográficas

MURIEL COSMÉTICOS. Muriel Cosméticos — site institucional. Disponível em: https://muriel.com.br/. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Quem somos. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Fale conosco. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

MURIEL COSMÉTICOS. Perfil institucional. LinkedIn. Disponível em: <COLE-AQUI-A-URL>. Acesso em: 21 set. 2026.

BRASIL. Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais (LGPD). Brasília, DF. Disponível em: https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm. Acesso em: 21 set. 2026.

BRASIL. Agência Nacional de Vigilância Sanitária (ANVISA). Resolução RDC nº 48, de 25 de outubro de 2013. Regulamento Técnico de Boas Práticas de Fabricação para Produtos de Higiene Pessoal, Cosméticos e Perfumes. Disponível em: https://goias.gov.br/saude/wp-content/uploads/sites/34/2016/03/rdc-48-de-25-de-outubro-de-2013-a36.pdf. Acesso em: 21 set. 2026.

GRUPO DO PROJETO. Modelo Conceitual definitivo. BRModelo Web, 2026. Disponível em: https://app.brmodeloweb.com/publicview/6ab340cd664f8629cdf4e2ef. Acesso em: 23 set. 2026.
