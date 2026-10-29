USE muriel;

-- Massa inteiramente fictícia para uso acadêmico; cenário em 2026-09-30.
-- Executar uma vez em banco vazio, após o DDL aprovado.
-- Documentos, CEPs, EANs e chaves fiscais são sequências de teste sem validade cadastral.
-- Telefones usam DDD 00 e e-mails usam o domínio reservado example.invalid.
-- Valores comerciais sem frete, descontos ou juros; preços unitários simulados abaixo.
-- Preços em R$ por ID_PRODUTO: 1=18.90; 2=21.90; 3=19.90; 4=23.90.
-- Preços em R$ por ID_PRODUTO: 5=24.90; 6=16.90; 7=17.90; 8=12.90.
-- Preços em R$ por ID_PRODUTO: 9=15.90; 10=14.90; 11=28.90; 12=32.90.
-- Preços em R$ por ID_PRODUTO: 13=11.90; 14=13.90; 15=34.90; 16=45.90.

-- CLIENTE (24 registros)
INSERT INTO `CLIENTE` (`ID_CLIENTE`, `UF_CLIENTE`, `CEP_CLIENTE`, `TEL_CLIENTE`, `NM_CLIENTE`, `ENDERECO_CLIENTE`, `CPF_CLIENTE`) VALUES
    (1, 'SP', '00000101', '00 00000-1001', 'Alina Florim (Fictício)', 'Rua Simulada das Flores, 41, Cidade Fictícia', '00000000100'),
    (2, 'RJ', '00000102', '00 00000-1002', 'Breno Valedo (Fictício)', 'Rua Simulada do Horizonte, 52, Cidade Fictícia', '00000000200'),
    (3, 'MG', '00000103', '00 00000-1003', 'Celia Ventori (Fictício)', 'Rua Simulada das Nuvens, 63, Cidade Fictícia', '00000000300'),
    (4, 'PR', '00000104', '00 00000-1004', 'Dario Nuvim (Fictício)', 'Rua Simulada do Jardim, 74, Cidade Fictícia', '00000000400'),
    (5, 'SC', '00000105', '00 00000-1005', 'Elisa Campori (Fictício)', 'Rua Simulada das Flores, 85, Cidade Fictícia', '00000000500'),
    (6, 'RS', '00000106', '00 00000-1006', 'Fabio Solvero (Fictício)', 'Rua Simulada do Horizonte, 96, Cidade Fictícia', '00000000600'),
    (7, 'ES', '00000107', '00 00000-1007', 'Gilda Lunari (Fictício)', 'Rua Simulada das Nuvens, 107, Cidade Fictícia', '00000000700'),
    (8, 'GO', '00000108', '00 00000-1008', 'Hugo Pedrali (Fictício)', 'Rua Simulada do Jardim, 118, Cidade Fictícia', '00000000800'),
    (9, 'SP', '00000109', '00 00000-1009', 'Iara Ventelo (Fictício)', 'Rua Simulada das Flores, 129, Cidade Fictícia', '00000000900'),
    (10, 'RJ', '00000110', '00 00000-1010', 'Jonas Floreli (Fictício)', 'Rua Simulada do Horizonte, 140, Cidade Fictícia', '00000001000'),
    (11, 'MG', '00000111', '00 00000-1011', 'Kiara Monteli (Fictício)', 'Rua Simulada das Nuvens, 151, Cidade Fictícia', '00000001100'),
    (12, 'PR', '00000112', '00 00000-1012', 'Lino Arvori (Fictício)', 'Rua Simulada do Jardim, 162, Cidade Fictícia', '00000001200'),
    (13, 'SC', '00000113', '00 00000-1013', 'Mara Celesti (Fictício)', 'Rua Simulada das Flores, 173, Cidade Fictícia', '00000001300'),
    (14, 'RS', '00000114', '00 00000-1014', 'Nilo Brisani (Fictício)', 'Rua Simulada do Horizonte, 184, Cidade Fictícia', '00000001400'),
    (15, 'ES', '00000115', '00 00000-1015', 'Olina Jardeli (Fictício)', 'Rua Simulada das Nuvens, 195, Cidade Fictícia', '00000001500'),
    (16, 'GO', '00000116', '00 00000-1016', 'Piero Clarim (Fictício)', 'Rua Simulada do Jardim, 206, Cidade Fictícia', '00000001600'),
    (17, 'SP', '00000117', '00 00000-1017', 'Emporio Aurora de Teste', 'Rua Simulada das Flores, 217, Cidade Fictícia', NULL),
    (18, 'RJ', '00000118', '00 00000-1018', 'Loja Estrela Simulada', 'Rua Simulada do Horizonte, 228, Cidade Fictícia', NULL),
    (19, 'MG', '00000119', '00 00000-1019', 'Bazar Jardim de Teste', 'Rua Simulada das Nuvens, 239, Cidade Fictícia', NULL),
    (20, 'PR', '00000120', '00 00000-1020', 'Rede Horizonte Simulada', 'Rua Simulada do Jardim, 250, Cidade Fictícia', NULL),
    (21, 'SC', '00000121', '00 00000-1021', 'Atacado Luar de Teste', 'Rua Simulada das Flores, 261, Cidade Fictícia', NULL),
    (22, 'RS', '00000122', '00 00000-1022', 'Mercado Brisa Simulado', 'Rua Simulada do Horizonte, 272, Cidade Fictícia', NULL),
    (23, 'ES', '00000123', '00 00000-1023', 'Drogaria Cenario de Teste', 'Rua Simulada das Nuvens, 283, Cidade Fictícia', NULL),
    (24, 'GO', '00000124', '00 00000-1024', 'Distribuidora Nuvem Simulada', 'Rua Simulada do Jardim, 294, Cidade Fictícia', NULL);

-- PESSOA_FISICA (16 registros)
INSERT INTO `PESSOA_FISICA` (`ID_CLIENTE`) VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15),
    (16);

-- PESSOA_JURIDICA (8 registros)
INSERT INTO `PESSOA_JURIDICA` (`ID_CLIENTE`, `CNPJ`) VALUES
    (17, '00000000000017'),
    (18, '00000000000018'),
    (19, '00000000000019'),
    (20, '00000000000020'),
    (21, '00000000000021'),
    (22, '00000000000022'),
    (23, '00000000000023'),
    (24, '00000000000024');

-- FUNCIONARIO (12 registros)
INSERT INTO `FUNCIONARIO` (`ID_FUNCIONARIO`, `TEL_FUNCIONARIO`, `NM_FUNCIONARIO`, `DT_ADMISSAO`, `EMAIL_FUNCIONARIO`) VALUES
    (1, '00 00000-2001', 'Aline Briseli (Fictício)', '2025-02-03', 'colaborador01@muriel.example.invalid'),
    (2, '00 00000-2002', 'Caio Ventori (Fictício)', '2025-02-20', 'colaborador02@muriel.example.invalid'),
    (3, '00 00000-2003', 'Lia Montari (Fictício)', '2025-03-09', 'colaborador03@muriel.example.invalid'),
    (4, '00 00000-2004', 'Otavio Solani (Fictício)', '2025-03-26', 'colaborador04@muriel.example.invalid'),
    (5, '00 00000-2005', 'Nara Floremi (Fictício)', '2025-04-12', 'colaborador05@muriel.example.invalid'),
    (6, '00 00000-2006', 'Enzo Campoli (Fictício)', '2025-04-29', 'colaborador06@muriel.example.invalid'),
    (7, '00 00000-2007', 'Bia Valeri (Fictício)', '2025-05-16', 'colaborador07@muriel.example.invalid'),
    (8, '00 00000-2008', 'Rui Lunaro (Fictício)', '2025-06-02', 'colaborador08@muriel.example.invalid'),
    (9, '00 00000-2009', 'Tania Arveli (Fictício)', '2025-06-19', 'colaborador09@muriel.example.invalid'),
    (10, '00 00000-2010', 'Vitor Jardeli (Fictício)', '2025-07-06', 'colaborador10@muriel.example.invalid'),
    (11, '00 00000-2011', 'Lara Claroni (Fictício)', '2025-07-23', NULL),
    (12, NULL, 'Davi Nuvori (Fictício)', '2025-08-09', 'colaborador12@muriel.example.invalid');

-- FUNC_SAC (3 registros)
INSERT INTO `FUNC_SAC` (`ID_FUNCIONARIO`) VALUES
    (1),
    (2),
    (3);

-- FUNC_VENDAS (4 registros)
INSERT INTO `FUNC_VENDAS` (`ID_FUNCIONARIO`) VALUES
    (4),
    (5),
    (6),
    (7);

-- FUNC_PRODUCAO (5 registros)
INSERT INTO `FUNC_PRODUCAO` (`ID_FUNCIONARIO`) VALUES
    (8),
    (9),
    (10),
    (11),
    (12);

-- REGISTRO_PONTO (48 registros)
INSERT INTO `REGISTRO_PONTO` (`ID_REGISTRO`, `ID_FUNCIONARIO`, `DT_REGISTRO`, `HR_REGISTRO`, `TIPO_REGISTRO`) VALUES
    (1, 1, '2026-09-01', '08:03:00', 'ENTRADA'),
    (2, 1, '2026-09-01', '17:02:00', 'SAIDA'),
    (3, 1, '2026-09-02', '08:04:00', 'ENTRADA'),
    (4, 1, '2026-09-02', '17:03:00', 'SAIDA'),
    (5, 2, '2026-09-01', '08:06:00', 'ENTRADA'),
    (6, 2, '2026-09-01', '17:04:00', 'SAIDA'),
    (7, 2, '2026-09-02', '08:07:00', 'ENTRADA'),
    (8, 2, '2026-09-02', '17:05:00', 'SAIDA'),
    (9, 3, '2026-09-01', '08:09:00', 'ENTRADA'),
    (10, 3, '2026-09-01', '17:06:00', 'SAIDA'),
    (11, 3, '2026-09-02', '08:10:00', 'ENTRADA'),
    (12, 3, '2026-09-02', '17:07:00', 'SAIDA'),
    (13, 4, '2026-09-01', '08:00:00', 'ENTRADA'),
    (14, 4, '2026-09-01', '17:08:00', 'SAIDA'),
    (15, 4, '2026-09-02', '08:01:00', 'ENTRADA'),
    (16, 4, '2026-09-02', '17:09:00', 'SAIDA'),
    (17, 5, '2026-09-01', '08:03:00', 'ENTRADA'),
    (18, 5, '2026-09-01', '17:10:00', 'SAIDA'),
    (19, 5, '2026-09-02', '08:04:00', 'ENTRADA'),
    (20, 5, '2026-09-02', '17:11:00', 'SAIDA'),
    (21, 6, '2026-09-01', '08:06:00', 'ENTRADA'),
    (22, 6, '2026-09-01', '17:00:00', 'SAIDA'),
    (23, 6, '2026-09-02', '08:07:00', 'ENTRADA'),
    (24, 6, '2026-09-02', '17:01:00', 'SAIDA'),
    (25, 7, '2026-09-01', '08:09:00', 'ENTRADA'),
    (26, 7, '2026-09-01', '17:02:00', 'SAIDA'),
    (27, 7, '2026-09-02', '08:10:00', 'ENTRADA'),
    (28, 7, '2026-09-02', '17:03:00', 'SAIDA'),
    (29, 8, '2026-09-01', '08:00:00', 'ENTRADA'),
    (30, 8, '2026-09-01', '17:04:00', 'SAIDA'),
    (31, 8, '2026-09-02', '08:01:00', 'ENTRADA'),
    (32, 8, '2026-09-02', '17:05:00', 'SAIDA'),
    (33, 9, '2026-09-01', '08:03:00', 'ENTRADA'),
    (34, 9, '2026-09-01', '17:06:00', 'SAIDA'),
    (35, 9, '2026-09-02', '08:04:00', 'ENTRADA'),
    (36, 9, '2026-09-02', '17:07:00', 'SAIDA'),
    (37, 10, '2026-09-01', '08:06:00', 'ENTRADA'),
    (38, 10, '2026-09-01', '17:08:00', 'SAIDA'),
    (39, 10, '2026-09-02', '08:07:00', 'ENTRADA'),
    (40, 10, '2026-09-02', '17:09:00', 'SAIDA'),
    (41, 11, '2026-09-01', '08:09:00', 'ENTRADA'),
    (42, 11, '2026-09-01', '17:10:00', 'SAIDA'),
    (43, 11, '2026-09-02', '08:10:00', 'ENTRADA'),
    (44, 11, '2026-09-02', '17:11:00', 'SAIDA'),
    (45, 12, '2026-09-01', '08:00:00', 'ENTRADA'),
    (46, 12, '2026-09-01', '17:00:00', 'SAIDA'),
    (47, 12, '2026-09-02', '08:01:00', 'ENTRADA'),
    (48, 12, '2026-09-02', '17:01:00', 'SAIDA');

-- PRODUTO (16 registros)
INSERT INTO `PRODUTO` (`ID_PRODUTO`, `DESCRICAO_PRODUTO`, `UNIDADE_PRODUTO`, `NM_PRODUTO`, `EAN_PRODUTO`) VALUES
    (1, 'Limpeza suave com extrato vegetal.', 1, 'Shampoo Aloe 300 ml', '0000000000001'),
    (2, 'Desembaraço para uso diário.', 1, 'Condicionador Aloe 300 ml', '0000000000002'),
    (3, 'Limpeza para cabelos secos.', 1, 'Shampoo Coco 250 ml', '0000000000003'),
    (4, 'Condicionamento com óleo de coco.', 1, 'Condicionador Coco 250 ml', '0000000000004'),
    (5, 'Tratamento capilar em pote.', 1, 'Máscara Coco 500 ml', '0000000000005'),
    (6, 'Higiene das mãos com fragrância floral.', 1, 'Sabonete Líquido Floral 200 ml', '0000000000006'),
    (7, 'Higiene suave com extrato de aloe.', 1, 'Sabonete Líquido Aloe 200 ml', '0000000000007'),
    (8, 'Hidratação em embalagem de bisnaga.', 1, 'Creme para Mãos 100 ml', '0000000000008'),
    (9, 'Loção com óleo de coco.', 1, 'Loção Corporal Coco 250 ml', '0000000000009'),
    (10, 'Loção perfumada para uso diário.', 1, 'Loção Corporal Floral 250 ml', '0000000000010'),
    (11, 'Tratamento capilar hidratante.', 1, 'Máscara Aloe 500 ml', '0000000000011'),
    (12, 'Creme nutritivo em pote.', 1, 'Creme Corporal Vegetal 500 ml', '0000000000012'),
    (13, 'Higiene suave em bisnaga compacta.', 1, 'Sabonete em Gel Neutro 100 ml', '0000000000013'),
    (14, 'Hidratação com glicerina.', 1, 'Creme para Pés 200 ml', '0000000000014'),
    (15, 'Limpeza capilar em frasco profissional.', 1, 'Shampoo Profissional 1000 ml', '0000000000015'),
    (16, 'Condicionamento em frasco profissional.', 1, 'Condicionador Profissional 1000 ml', '0000000000016');

-- MATERIAL (10 registros)
INSERT INTO `MATERIAL` (`ID_MATERIAL`, `NM_MATERIAL`, `ESTOQUE_MIN_MATERIAL`, `UNIDADE_MATERIAL`) VALUES
    (1, 'Água de processo simulada', 60, 1),
    (2, 'Base de shampoo simulada', 70, 1),
    (3, 'Base de condicionador simulada', 80, 1),
    (4, 'Glicerina vegetal simulada', 90, 1),
    (5, 'Óleo de coco simulado', 100, 1),
    (6, 'Essência floral simulada', 110, 1),
    (7, 'Base de sabonete líquido simulada', 120, 1),
    (8, 'Base de creme simulada', 130, 1),
    (9, 'Extrato de aloe simulado', 140, 1),
    (10, 'Manteiga vegetal simulada', 150, 1);

-- FORNECEDOR (6 registros)
INSERT INTO `FORNECEDOR` (`ID_FORNECEDOR`, `TEL_FORNECEDOR`, `CNPJ_FORNECEDOR`, `ENDERECO_FORNECEDOR`, `NM_FORNECEDOR`, `CEP_FORNECEDOR`) VALUES
    (1, '00 00000-3001', '00000000000101', 'Avenida Laboratório, 125, Distrito Simulado', 'Bases Aurora (Fictício)', '00000201'),
    (2, '00 00000-3002', '00000000000102', 'Avenida Laboratório, 150, Distrito Simulado', 'Extratos Nuvem (Fictício)', '00000202'),
    (3, '00 00000-3003', '00000000000103', 'Avenida Laboratório, 175, Distrito Simulado', 'Insumos Jardim (Fictício)', '00000203'),
    (4, '00 00000-3004', '00000000000104', 'Avenida Laboratório, 200, Distrito Simulado', 'Aromas Ventania (Fictício)', '00000204'),
    (5, '00 00000-3005', '00000000000105', 'Avenida Laboratório, 225, Distrito Simulado', 'Óleos Horizonte (Fictício)', '00000205'),
    (6, '00 00000-3006', '00000000000106', 'Avenida Laboratório, 250, Distrito Simulado', 'Águas Cristal de Teste (Fictício)', '00000206');

-- EMBALAGEM (6 registros)
INSERT INTO `EMBALAGEM` (`ID_EMBALAGEM`, `CAPACIDADE_EMBALAGEM`, `MATERIAL_EMBALAGEM`, `TIPO_EMBALAGEM`) VALUES
    (1, 100, 'PEAD', 'Bisnaga compacta'),
    (2, 200, 'PET', 'Frasco com válvula'),
    (3, 250, 'PET', 'Frasco com tampa'),
    (4, 300, 'PEAD', 'Frasco capilar'),
    (5, 500, 'PP', 'Pote com tampa'),
    (6, 1000, 'PEAD', 'Frasco profissional');

-- ATENDIMENTO_SAC (14 registros)
INSERT INTO `ATENDIMENTO_SAC` (`ID_ATENDIMENTO`, `ID_CLIENTE`, `ID_FUNCIONARIO`, `PROTOCOLO`, `DT_ATENDIMENTO`, `TIPO_ATENDIMENTO`, `DESCRICAO_ATENDIMENTO`, `STATUS_ATENDIMENTO`) VALUES
    (1, 2, 1, 'SIM-SAC-2026-0001', '2026-09-08', 'DEVOLUCAO', 'Frasco com vazamento identificado na entrega. Pedido simulado 2, produto 4.', 'ENCERRADO'),
    (2, 2, 2, 'SIM-SAC-2026-0002', '2026-09-08', 'DEVOLUCAO', 'Tampa danificada no transporte. Pedido simulado 2, produto 9.', 'ENCERRADO'),
    (3, 5, 3, 'SIM-SAC-2026-0003', '2026-09-11', 'DEVOLUCAO', 'Textura diferente da expectativa do cliente. Pedido simulado 5, produto 13.', 'ENCERRADO'),
    (4, 9, 1, 'SIM-SAC-2026-0004', '2026-09-15', 'DEVOLUCAO', 'Embalagem amassada durante o transporte. Pedido simulado 9, produto 9.', 'ENCERRADO'),
    (5, 14, 2, 'SIM-SAC-2026-0005', '2026-09-20', 'DEVOLUCAO', 'Produto separado em desacordo com a preferência do cliente. Pedido simulado 14, produto 8.', 'ENCERRADO'),
    (6, 20, 3, 'SIM-SAC-2026-0006', '2026-09-26', 'DEVOLUCAO', 'Solicitação de análise de alteração de fragrância. Pedido simulado 20, produto 10.', 'EM_ANALISE'),
    (7, 1, 1, 'SIM-SAC-2026-0007', '2026-09-20', 'DUVIDA', 'Orientação sobre uso do shampoo Aloe.', 'ENCERRADO'),
    (8, 23, 2, 'SIM-SAC-2026-0008', '2026-09-21', 'SOLICITACAO', 'Solicita orientação sobre formas de pagamento.', 'ENCERRADO'),
    (9, 10, 3, 'SIM-SAC-2026-0009', '2026-09-22', 'RECLAMACAO', 'Relata demora na atualização do rastreamento.', 'ENCERRADO'),
    (10, 10, 1, 'SIM-SAC-2026-0010', '2026-09-23', 'ELOGIO', 'Elogia a embalagem do creme corporal recebido.', 'ENCERRADO'),
    (11, 24, 2, 'SIM-SAC-2026-0011', '2026-09-24', 'DUVIDA', 'Consulta sobre capacidade da embalagem profissional.', 'ABERTO'),
    (12, 6, 3, 'SIM-SAC-2026-0012', '2026-09-25', 'SOLICITACAO', 'Solicita segunda via do comprovante de compra.', 'EM_ATENDIMENTO'),
    (13, 15, 1, 'SIM-SAC-2026-0013', '2026-09-26', 'DUVIDA', 'Solicita detalhes sobre conservação dos produtos.', 'ENCERRADO'),
    (14, 4, 2, 'SIM-SAC-2026-0014', '2026-09-27', 'RECLAMACAO', 'Relata dificuldade para consultar o pedido no acompanhamento.', 'EM_ATENDIMENTO');

-- PEDIDO (30 registros)
INSERT INTO `PEDIDO` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_FUNCIONARIO`, `DT_PEDIDO`, `PRECO_PEDIDO`, `STATUS_PEDIDO`) VALUES
    (1, 1, 4, '2026-09-01', 56.70, 'ENTREGUE'),
    (2, 2, 5, '2026-09-02', 175.10, 'DEVOLUCAO_PARCIAL'),
    (3, 3, 6, '2026-09-03', 324.70, 'ENTREGUE'),
    (4, 4, 7, '2026-09-04', 89.40, 'ENTREGUE'),
    (5, 5, 4, '2026-09-05', 89.50, 'DEVOLUCAO_PARCIAL'),
    (6, 6, 5, '2026-09-06', 311.80, 'ENTREGUE'),
    (7, 7, 6, '2026-09-07', 79.60, 'ENTREGUE'),
    (8, 8, 7, '2026-09-08', 257.90, 'ENTREGUE'),
    (9, 9, 4, '2026-09-09', 182.90, 'DEVOLUCAO_PARCIAL'),
    (10, 10, 5, '2026-09-10', 65.80, 'ENTREGUE'),
    (11, 11, 6, '2026-09-11', 200.30, 'ENTREGUE'),
    (12, 12, 7, '2026-09-12', 374.50, 'ENTREGUE'),
    (13, 13, 4, '2026-09-13', 124.50, 'ENTREGUE'),
    (14, 14, 5, '2026-09-14', 101.20, 'DEVOLUCAO_PARCIAL'),
    (15, 15, 6, '2026-09-15', 295.10, 'ENTREGUE'),
    (16, 16, 7, '2026-09-16', 41.70, 'ENTREGUE'),
    (17, 17, 4, '2026-09-17', 960.60, 'ENTREGUE'),
    (18, 18, 5, '2026-09-18', 1456.20, 'ENTREGUE'),
    (19, 19, 6, '2026-09-19', 644.40, 'ENTREGUE'),
    (20, 20, 7, '2026-09-20', 807.00, 'DEVOLUCAO_EM_ANALISE'),
    (21, 21, 4, '2026-09-21', 1276.80, 'ENTREGUE'),
    (22, 22, 5, '2026-09-22', 1101.60, 'ENTREGUE'),
    (23, 23, 6, '2026-09-24', 1061.40, 'AGUARDANDO_PAGAMENTO'),
    (24, 24, 7, '2026-09-25', 1781.40, 'AGUARDANDO_PAGAMENTO'),
    (25, 1, 4, '2026-09-26', 31.80, 'AGUARDANDO_PAGAMENTO'),
    (26, 4, 5, '2026-09-27', 174.30, 'AGUARDANDO_PAGAMENTO'),
    (27, 7, 6, '2026-09-25', 354.50, 'CANCELADO'),
    (28, 10, 7, '2026-09-26', 109.50, 'CANCELADO'),
    (29, 13, 4, '2026-09-28', 179.20, 'EM_SEPARACAO'),
    (30, 16, 5, '2026-09-29', 149.10, 'EM_SEPARACAO');

-- ITEM_PEDIDO (60 registros)
INSERT INTO `ITEM_PEDIDO` (`ID_PEDIDO`, `ID_PRODUTO`, `QUANTIDADE_PEDIDA`) VALUES
    (1, 1, 3),
    (2, 4, 4),
    (2, 9, 5),
    (3, 7, 5),
    (3, 12, 6),
    (3, 1, 2),
    (4, 10, 6),
    (5, 13, 2),
    (5, 2, 3),
    (6, 16, 3),
    (6, 5, 4),
    (6, 10, 5),
    (7, 3, 4),
    (8, 6, 5),
    (8, 11, 6),
    (9, 9, 6),
    (9, 14, 2),
    (9, 3, 3),
    (10, 12, 2),
    (11, 15, 3),
    (11, 4, 4),
    (12, 2, 4),
    (12, 7, 5),
    (12, 12, 6),
    (13, 5, 5),
    (14, 8, 6),
    (14, 13, 2),
    (15, 11, 2),
    (15, 16, 3),
    (15, 5, 4),
    (16, 14, 3),
    (17, 1, 24),
    (17, 6, 30),
    (18, 4, 30),
    (18, 9, 36),
    (18, 14, 12),
    (19, 7, 36),
    (20, 10, 12),
    (20, 15, 18),
    (21, 13, 18),
    (21, 2, 24),
    (21, 7, 30),
    (22, 16, 24),
    (23, 3, 30),
    (23, 8, 36),
    (24, 6, 36),
    (24, 11, 12),
    (24, 16, 18),
    (25, 9, 2),
    (26, 12, 3),
    (26, 1, 4),
    (27, 15, 4),
    (27, 4, 5),
    (27, 9, 6),
    (28, 2, 5),
    (29, 5, 6),
    (29, 10, 2),
    (30, 8, 2),
    (30, 13, 3),
    (30, 2, 4);

-- PAGAMENTO (34 registros)
INSERT INTO `PAGAMENTO` (`ID_PAGAMENTO`, `ID_PEDIDO`, `VALOR_PAGAMENTO`, `STATUS_PAGAMENTO`, `FORMA_PAGAMENTO`, `DT_PAGAMENTO`) VALUES
    (1, 1, 56.70, 'PAGO', 'PIX', '2026-09-02'),
    (2, 2, 175.10, 'PAGO', 'CARTAO_CREDITO', '2026-09-03'),
    (3, 3, 129.88, 'PAGO', 'PIX', '2026-09-03'),
    (4, 3, 194.82, 'PAGO', 'CARTAO_CREDITO', '2026-09-04'),
    (5, 4, 89.40, 'PAGO', 'TRANSFERENCIA', '2026-09-05'),
    (6, 5, 89.50, 'PAGO', 'PIX', '2026-09-06'),
    (7, 6, 311.80, 'PAGO', 'CARTAO_CREDITO', '2026-09-07'),
    (8, 7, 79.60, 'PAGO', 'BOLETO', '2026-09-08'),
    (9, 8, 103.16, 'PAGO', 'PIX', '2026-09-08'),
    (10, 8, 154.74, 'PAGO', 'CARTAO_CREDITO', '2026-09-09'),
    (11, 9, 182.90, 'PAGO', 'PIX', '2026-09-10'),
    (12, 10, 65.80, 'PAGO', 'CARTAO_CREDITO', '2026-09-11'),
    (13, 11, 200.30, 'PAGO', 'BOLETO', '2026-09-12'),
    (14, 12, 374.50, 'PAGO', 'TRANSFERENCIA', '2026-09-13'),
    (15, 13, 49.80, 'PAGO', 'PIX', '2026-09-13'),
    (16, 13, 74.70, 'PAGO', 'CARTAO_CREDITO', '2026-09-14'),
    (17, 14, 101.20, 'PAGO', 'CARTAO_CREDITO', '2026-09-15'),
    (18, 15, 295.10, 'PAGO', 'BOLETO', '2026-09-16'),
    (19, 16, 41.70, 'PAGO', 'TRANSFERENCIA', '2026-09-17'),
    (20, 17, 960.60, 'PAGO', 'PIX', '2026-09-18'),
    (21, 18, 582.48, 'PAGO', 'PIX', '2026-09-18'),
    (22, 18, 873.72, 'PAGO', 'CARTAO_CREDITO', '2026-09-19'),
    (23, 19, 644.40, 'PAGO', 'BOLETO', '2026-09-20'),
    (24, 20, 807.00, 'PAGO', 'TRANSFERENCIA', '2026-09-21'),
    (25, 21, 1276.80, 'PAGO', 'PIX', '2026-09-22'),
    (26, 22, 1101.60, 'PAGO', 'CARTAO_CREDITO', '2026-09-23'),
    (27, 23, 1061.40, 'PENDENTE', 'BOLETO', NULL),
    (28, 24, 1781.40, 'PENDENTE', 'TRANSFERENCIA', NULL),
    (29, 25, 31.80, 'PENDENTE', 'PIX', NULL),
    (30, 26, 174.30, 'PENDENTE', 'CARTAO_CREDITO', NULL),
    (31, 27, 354.50, 'CANCELADO', 'BOLETO', NULL),
    (32, 28, 109.50, 'CANCELADO', 'TRANSFERENCIA', NULL),
    (33, 29, 179.20, 'PAGO', 'PIX', '2026-09-29'),
    (34, 30, 149.10, 'PAGO', 'CARTAO_CREDITO', '2026-09-30');

-- NOTA_FISCAL (22 registros)
INSERT INTO `NOTA_FISCAL` (`ID_NF`, `ID_PEDIDO`, `NUM_NF`, `SERIE_NF`, `STATUS_NF`, `CHAVE_ACESSO`, `VALOR_TOTAL`, `DT_EMISSAO`) VALUES
    (1, 1, 'SIM-000001', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000001', 56.70, '2026-09-03'),
    (2, 2, 'SIM-000002', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000002', 175.10, '2026-09-04'),
    (3, 3, 'SIM-000003', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000003', 324.70, '2026-09-05'),
    (4, 4, 'SIM-000004', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000004', 89.40, '2026-09-06'),
    (5, 5, 'SIM-000005', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000005', 89.50, '2026-09-07'),
    (6, 6, 'SIM-000006', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000006', 311.80, '2026-09-08'),
    (7, 7, 'SIM-000007', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000007', 79.60, '2026-09-09'),
    (8, 8, 'SIM-000008', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000008', 257.90, '2026-09-10'),
    (9, 9, 'SIM-000009', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000009', 182.90, '2026-09-11'),
    (10, 10, 'SIM-000010', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000010', 65.80, '2026-09-12'),
    (11, 11, 'SIM-000011', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000011', 200.30, '2026-09-13'),
    (12, 12, 'SIM-000012', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000012', 374.50, '2026-09-14'),
    (13, 13, 'SIM-000013', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000013', 124.50, '2026-09-15'),
    (14, 14, 'SIM-000014', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000014', 101.20, '2026-09-16'),
    (15, 15, 'SIM-000015', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000015', 295.10, '2026-09-17'),
    (16, 16, 'SIM-000016', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000016', 41.70, '2026-09-18'),
    (17, 17, 'SIM-000017', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000017', 960.60, '2026-09-19'),
    (18, 18, 'SIM-000018', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000018', 1456.20, '2026-09-20'),
    (19, 19, 'SIM-000019', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000019', 644.40, '2026-09-21'),
    (20, 20, 'SIM-000020', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000020', 807.00, '2026-09-22'),
    (21, 21, 'SIM-000021', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000021', 1276.80, '2026-09-23'),
    (22, 22, 'SIM-000022', 'TESTE', 'EMITIDA', '00000000000000000000000000000000000000000022', 1101.60, '2026-09-24');

-- DEVOLUCAO (6 registros)
INSERT INTO `DEVOLUCAO` (`ID_DEVOLUCAO`, `ID_NF`, `ID_PEDIDO`, `ID_ATENDIMENTO`, `ID_PRODUTO`, `DT_DEVOLUCAO`, `MOTIVO`, `STATUS_DEVOLUCAO`, `REEMBOLSO_DEVOLUCAO`, `QUANTIDADE_DEVOLVIDA`) VALUES
    (1, 2, 2, 1, 4, '2026-09-09', 'Frasco com vazamento identificado na entrega.', 'REEMBOLSADA', 23.90, 1),
    (2, 2, 2, 2, 9, '2026-09-09', 'Tampa danificada no transporte.', 'REEMBOLSADA', 15.90, 1),
    (3, 5, 5, 3, 13, '2026-09-12', 'Textura diferente da expectativa do cliente.', 'REEMBOLSADA', 11.90, 1),
    (4, 9, 9, 4, 9, '2026-09-16', 'Embalagem amassada durante o transporte.', 'REEMBOLSADA', 31.80, 2),
    (5, 14, 14, 5, 8, '2026-09-21', 'Produto separado em desacordo com a preferência do cliente.', 'APROVADA', 12.90, 1),
    (6, 20, 20, 6, 10, '2026-09-27', 'Solicitação de análise de alteração de fragrância.', 'EM_ANALISE', NULL, 1);

-- ENTREGA (22 registros)
INSERT INTO `ENTREGA` (`ID_ENTREGA`, `ID_NF`, `DT_ENVIO`, `DT_ENTREGA`, `STATUS_ENTREGA`, `COD_RASTREIO`, `NM_MOTORISTA`, `PLACA_CAMINHAO`, `TRANSPORTADORA`) VALUES
    (1, 1, '2026-09-04', '2026-09-06', 'ENTREGUE', 'SIM-RASTREIO-0001', 'Ivo Venteli (Fictício)', 'SIM0001', 'Rota Nuvem Simulada'),
    (2, 2, '2026-09-05', '2026-09-07', 'ENTREGUE', 'SIM-RASTREIO-0002', 'Nina Claroni (Fictício)', 'SIM0002', 'Transporte Horizonte de Teste'),
    (3, 3, '2026-09-06', '2026-09-08', 'ENTREGUE', 'SIM-RASTREIO-0003', 'Teo Floreli (Fictício)', 'SIM0003', 'Cargas Jardim Simuladas'),
    (4, 4, '2026-09-07', '2026-09-09', 'ENTREGUE', 'SIM-RASTREIO-0004', 'Ivo Venteli (Fictício)', 'SIM0004', 'Rota Nuvem Simulada'),
    (5, 5, '2026-09-08', '2026-09-10', 'ENTREGUE', 'SIM-RASTREIO-0005', 'Nina Claroni (Fictício)', 'SIM0005', 'Transporte Horizonte de Teste'),
    (6, 6, '2026-09-09', '2026-09-11', 'ENTREGUE', 'SIM-RASTREIO-0006', 'Teo Floreli (Fictício)', 'SIM0006', 'Cargas Jardim Simuladas'),
    (7, 7, '2026-09-10', '2026-09-12', 'ENTREGUE', 'SIM-RASTREIO-0007', 'Ivo Venteli (Fictício)', 'SIM0007', 'Rota Nuvem Simulada'),
    (8, 8, '2026-09-11', '2026-09-13', 'ENTREGUE', 'SIM-RASTREIO-0008', 'Nina Claroni (Fictício)', 'SIM0008', 'Transporte Horizonte de Teste'),
    (9, 9, '2026-09-12', '2026-09-14', 'ENTREGUE', 'SIM-RASTREIO-0009', 'Teo Floreli (Fictício)', 'SIM0009', 'Cargas Jardim Simuladas'),
    (10, 10, '2026-09-13', '2026-09-15', 'ENTREGUE', 'SIM-RASTREIO-0010', 'Ivo Venteli (Fictício)', 'SIM0010', 'Rota Nuvem Simulada'),
    (11, 11, '2026-09-14', '2026-09-16', 'ENTREGUE', 'SIM-RASTREIO-0011', 'Nina Claroni (Fictício)', 'SIM0011', 'Transporte Horizonte de Teste'),
    (12, 12, '2026-09-15', '2026-09-17', 'ENTREGUE', 'SIM-RASTREIO-0012', 'Teo Floreli (Fictício)', 'SIM0012', 'Cargas Jardim Simuladas'),
    (13, 13, '2026-09-16', '2026-09-18', 'ENTREGUE', 'SIM-RASTREIO-0013', 'Ivo Venteli (Fictício)', 'SIM0013', 'Rota Nuvem Simulada'),
    (14, 14, '2026-09-17', '2026-09-19', 'ENTREGUE', 'SIM-RASTREIO-0014', 'Nina Claroni (Fictício)', 'SIM0014', 'Transporte Horizonte de Teste'),
    (15, 15, '2026-09-18', '2026-09-20', 'ENTREGUE', 'SIM-RASTREIO-0015', 'Teo Floreli (Fictício)', 'SIM0015', 'Cargas Jardim Simuladas'),
    (16, 16, '2026-09-19', '2026-09-21', 'ENTREGUE', 'SIM-RASTREIO-0016', 'Ivo Venteli (Fictício)', 'SIM0016', 'Rota Nuvem Simulada'),
    (17, 17, '2026-09-20', '2026-09-22', 'ENTREGUE', 'SIM-RASTREIO-0017', 'Nina Claroni (Fictício)', 'SIM0017', 'Transporte Horizonte de Teste'),
    (18, 18, '2026-09-21', '2026-09-23', 'ENTREGUE', 'SIM-RASTREIO-0018', 'Teo Floreli (Fictício)', 'SIM0018', 'Cargas Jardim Simuladas'),
    (19, 19, '2026-09-22', '2026-09-24', 'ENTREGUE', 'SIM-RASTREIO-0019', 'Ivo Venteli (Fictício)', 'SIM0019', 'Rota Nuvem Simulada'),
    (20, 20, '2026-09-23', '2026-09-25', 'ENTREGUE', 'SIM-RASTREIO-0020', 'Nina Claroni (Fictício)', 'SIM0020', 'Transporte Horizonte de Teste'),
    (21, 21, '2026-09-24', '2026-09-26', 'ENTREGUE', 'SIM-RASTREIO-0021', 'Teo Floreli (Fictício)', 'SIM0021', 'Cargas Jardim Simuladas'),
    (22, 22, '2026-09-25', '2026-09-27', 'ENTREGUE', 'SIM-RASTREIO-0022', 'Ivo Venteli (Fictício)', 'SIM0022', 'Rota Nuvem Simulada');

-- FATURAMENTO (22 registros)
INSERT INTO `FATURAMENTO` (`ID_FATURAMENTO`, `ID_NF`, `DT_FATURAMENTO`, `STATUS`, `DT_VENCIMENTO`, `VALOR_TOTAL`) VALUES
    (1, 1, '2026-09-03', 'LIQUIDADO', '2026-09-17', 56.70),
    (2, 2, '2026-09-04', 'LIQUIDADO', '2026-09-18', 175.10),
    (3, 3, '2026-09-05', 'LIQUIDADO', '2026-09-19', 324.70),
    (4, 4, '2026-09-06', 'LIQUIDADO', '2026-09-20', 89.40),
    (5, 5, '2026-09-07', 'LIQUIDADO', '2026-09-21', 89.50),
    (6, 6, '2026-09-08', 'LIQUIDADO', '2026-09-22', 311.80),
    (7, 7, '2026-09-09', 'LIQUIDADO', '2026-09-23', 79.60),
    (8, 8, '2026-09-10', 'LIQUIDADO', '2026-09-24', 257.90),
    (9, 9, '2026-09-11', 'LIQUIDADO', '2026-09-25', 182.90),
    (10, 10, '2026-09-12', 'LIQUIDADO', '2026-09-26', 65.80),
    (11, 11, '2026-09-13', 'LIQUIDADO', '2026-09-27', 200.30),
    (12, 12, '2026-09-14', 'LIQUIDADO', '2026-09-28', 374.50),
    (13, 13, '2026-09-15', 'LIQUIDADO', '2026-09-29', 124.50),
    (14, 14, '2026-09-16', 'LIQUIDADO', '2026-09-30', 101.20),
    (15, 15, '2026-09-17', 'LIQUIDADO', '2026-10-01', 295.10),
    (16, 16, '2026-09-18', 'LIQUIDADO', '2026-10-02', 41.70),
    (17, 17, '2026-09-19', 'LIQUIDADO', '2026-10-03', 960.60),
    (18, 18, '2026-09-20', 'LIQUIDADO', '2026-10-04', 1456.20),
    (19, 19, '2026-09-21', 'LIQUIDADO', '2026-10-05', 644.40),
    (20, 20, '2026-09-22', 'LIQUIDADO', '2026-10-06', 807.00),
    (21, 21, '2026-09-23', 'LIQUIDADO', '2026-10-07', 1276.80),
    (22, 22, '2026-09-24', 'LIQUIDADO', '2026-10-08', 1101.60);

-- LOTE (16 registros)
INSERT INTO `LOTE` (`ID_LOTE`, `ID_PRODUTO`, `QUANTIDADE_LOTE`, `DT_FABRICACAO`, `NUM_LOTE`, `DT_VALIDADE`) VALUES
    (1, 1, 260, '2026-04-07', 'SIM-LOTE-2026-001', '2028-04-06'),
    (2, 2, 280, '2026-04-08', 'SIM-LOTE-2026-002', '2028-04-07'),
    (3, 3, 300, '2026-04-09', 'SIM-LOTE-2026-003', '2028-04-08'),
    (4, 4, 320, '2026-04-10', 'SIM-LOTE-2026-004', '2028-04-09'),
    (5, 5, 340, '2026-04-11', 'SIM-LOTE-2026-005', '2028-04-10'),
    (6, 6, 360, '2026-04-12', 'SIM-LOTE-2026-006', '2028-04-11'),
    (7, 7, 380, '2026-04-13', 'SIM-LOTE-2026-007', '2028-04-12'),
    (8, 8, 400, '2026-04-14', 'SIM-LOTE-2026-008', '2028-04-13'),
    (9, 9, 420, '2026-04-15', 'SIM-LOTE-2026-009', '2028-04-14'),
    (10, 10, 440, '2026-04-16', 'SIM-LOTE-2026-010', '2028-04-15'),
    (11, 11, 460, '2026-04-07', 'SIM-LOTE-2026-011', '2028-04-06'),
    (12, 12, 480, '2026-04-08', 'SIM-LOTE-2026-012', '2028-04-07'),
    (13, 13, 500, '2026-04-09', 'SIM-LOTE-2026-013', '2028-04-08'),
    (14, 14, 520, '2026-04-10', 'SIM-LOTE-2026-014', '2028-04-09'),
    (15, 15, 540, '2026-04-11', 'SIM-LOTE-2026-015', '2028-04-10'),
    (16, 16, 560, '2026-04-12', 'SIM-LOTE-2026-016', '2028-04-11');

-- PEDIDO_MATERIAL (16 registros)
INSERT INTO `PEDIDO_MATERIAL` (`ID_PEDIDO_MATERIAL`, `ID_FORNECEDOR`, `ID_MATERIAL`, `DT_PEDIDO`, `QUANTIDADE_SOLICITADA`, `PRECO_UNITARIO`, `DT_PREVISTA`, `PRECO_TOTAL`, `STATUS`) VALUES
    (1, 6, 1, '2026-03-02', 150, 0.35, '2026-03-05', 52.50, 'RECEBIDO'),
    (2, 1, 2, '2026-03-03', 200, 8.50, '2026-03-06', 1700.00, 'RECEBIDO'),
    (3, 1, 3, '2026-03-04', 250, 9.30, '2026-03-07', 2325.00, 'RECEBIDO'),
    (4, 3, 4, '2026-03-05', 300, 6.20, '2026-03-08', 1860.00, 'RECEBIDO'),
    (5, 5, 5, '2026-03-06', 350, 12.40, '2026-03-09', 4340.00, 'RECEBIDO'),
    (6, 4, 6, '2026-03-07', 100, 18.90, '2026-03-10', 1890.00, 'RECEBIDO'),
    (7, 1, 7, '2026-03-08', 150, 7.40, '2026-03-11', 1110.00, 'RECEBIDO'),
    (8, 1, 8, '2026-03-09', 200, 11.20, '2026-03-12', 2240.00, 'RECEBIDO'),
    (9, 2, 9, '2026-03-10', 250, 15.50, '2026-03-13', 3875.00, 'RECEBIDO'),
    (10, 5, 10, '2026-03-11', 300, 16.80, '2026-03-14', 5040.00, 'RECEBIDO'),
    (11, 6, 1, '2026-09-22', 350, 0.35, '2026-09-25', 122.50, 'RECEBIDO'),
    (12, 1, 2, '2026-09-23', 100, 8.50, '2026-09-26', 850.00, 'RECEBIDO'),
    (13, 1, 3, '2026-09-24', 150, 9.30, '2026-09-27', 1395.00, 'EM_TRANSPORTE'),
    (14, 3, 4, '2026-09-25', 200, 6.20, '2026-09-28', 1240.00, 'EM_TRANSPORTE'),
    (15, 5, 5, '2026-09-26', 250, 12.40, '2026-09-29', 3100.00, 'APROVADO'),
    (16, 4, 6, '2026-09-27', 300, 18.90, '2026-09-30', 5670.00, 'APROVADO');

-- PRODUCAO (16 registros)
INSERT INTO `PRODUCAO` (`ID_PRODUCAO`, `ID_PRODUTO`, `QUANTIDADE_PRODUCAO`, `STATUS_PRODUCAO`, `DT_INICIO_PRODUCAO`) VALUES
    (1, 1, 260, 'CONCLUIDA', '2026-04-06'),
    (2, 2, 280, 'CONCLUIDA', '2026-04-07'),
    (3, 3, 300, 'CONCLUIDA', '2026-04-08'),
    (4, 4, 320, 'CONCLUIDA', '2026-04-09'),
    (5, 5, 340, 'CONCLUIDA', '2026-04-10'),
    (6, 6, 360, 'CONCLUIDA', '2026-04-11'),
    (7, 7, 380, 'CONCLUIDA', '2026-04-12'),
    (8, 8, 400, 'CONCLUIDA', '2026-04-13'),
    (9, 9, 420, 'CONCLUIDA', '2026-04-14'),
    (10, 10, 440, 'CONCLUIDA', '2026-04-15'),
    (11, 11, 460, 'CONCLUIDA', '2026-04-06'),
    (12, 12, 480, 'CONCLUIDA', '2026-04-07'),
    (13, 13, 500, 'CONCLUIDA', '2026-04-08'),
    (14, 14, 520, 'CONCLUIDA', '2026-04-09'),
    (15, 15, 540, 'CONCLUIDA', '2026-04-10'),
    (16, 16, 560, 'CONCLUIDA', '2026-04-11');

-- PRODUTO_MATERIAL (32 registros)
INSERT INTO `PRODUTO_MATERIAL` (`ID_MATERIAL`, `ID_PRODUTO`) VALUES
    (2, 1),
    (9, 1),
    (3, 2),
    (9, 2),
    (2, 3),
    (5, 3),
    (3, 4),
    (5, 4),
    (8, 5),
    (5, 5),
    (7, 6),
    (6, 6),
    (7, 7),
    (9, 7),
    (8, 8),
    (4, 8),
    (8, 9),
    (5, 9),
    (8, 10),
    (6, 10),
    (8, 11),
    (9, 11),
    (8, 12),
    (10, 12),
    (7, 13),
    (1, 13),
    (8, 14),
    (4, 14),
    (2, 15),
    (6, 15),
    (3, 16),
    (10, 16);

-- PRODUTO_EMBALAGEM (16 registros)
INSERT INTO `PRODUTO_EMBALAGEM` (`ID_PRODUTO`, `ID_EMBALAGEM`) VALUES
    (1, 4),
    (2, 4),
    (3, 3),
    (4, 3),
    (5, 5),
    (6, 2),
    (7, 2),
    (8, 1),
    (9, 3),
    (10, 3),
    (11, 5),
    (12, 5),
    (13, 1),
    (14, 2),
    (15, 6),
    (16, 6);

-- FUNCIONARIO_PRODUCAO (24 registros)
INSERT INTO `FUNCIONARIO_PRODUCAO` (`ID_PRODUCAO`, `ID_FUNCIONARIO`) VALUES
    (1, 8),
    (1, 9),
    (2, 9),
    (2, 10),
    (3, 10),
    (3, 11),
    (4, 11),
    (4, 12),
    (5, 12),
    (5, 8),
    (6, 8),
    (6, 9),
    (7, 9),
    (7, 10),
    (8, 10),
    (8, 11),
    (9, 11),
    (10, 12),
    (11, 8),
    (12, 9),
    (13, 10),
    (14, 11),
    (15, 12),
    (16, 8);
