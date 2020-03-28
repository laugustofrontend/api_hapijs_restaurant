CREATE TABLE `aberturabar` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_evento` int(11) unsigned NOT NULL DEFAULT '0',
  `cod_bar` int(11) unsigned NOT NULL DEFAULT '0',
  `gerente` int(11) unsigned NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `status` enum('ENVIADO','RECEBIDO','CANCELADO') NOT NULL DEFAULT 'ENVIADO',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `baixa_estoque` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) NOT NULL DEFAULT '0',
  `prod_baixa` int(11) NOT NULL DEFAULT '0',
  `quantidade` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `balada_vip` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_cli` int(11) unsigned DEFAULT NULL,
  `cod_usu` int(11) unsigned DEFAULT NULL,
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `veio` enum('true','false') NOT NULL DEFAULT 'false',
  `cod_evento` int(11) unsigned DEFAULT NULL,
  `comanda` int(11) unsigned DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `hora_saida` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `caixa` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(11) unsigned DEFAULT NULL,
  `evento_abertura` int(11) unsigned DEFAULT NULL,
  `evento_encerramento` int(11) unsigned DEFAULT NULL,
  `valor_abertura` double(10,2) DEFAULT NULL,
  `movcx_inicial` int(11) unsigned DEFAULT NULL,
  `movcx_final` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `cartao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(100) NOT NULL DEFAULT '',
  `status` enum('NOVO','ATIVO','BLOQUEADO') NOT NULL DEFAULT 'NOVO',
  `data_venda` date NOT NULL DEFAULT '0000-00-00',
  `hora_venda` time NOT NULL DEFAULT '00:00:00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `caixa` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `centro` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `ativo` enum('false','true') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `classes` (
  `codigo` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `grupo` int(11) unsigned DEFAULT NULL,
  `app` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `classes2` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `grupo` int(11) unsigned DEFAULT NULL,
  `app` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `classescp` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `ativo` enum('true','false') NOT NULL DEFAULT 'true',
  `grupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `clientes` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `nascimento` date NOT NULL DEFAULT '0000-00-00',
  `email` varchar(100) NOT NULL DEFAULT '',
  `celular` varchar(20) NOT NULL DEFAULT '',
  `limite` double(10,2) NOT NULL DEFAULT '0.00',
  `log` int(11) unsigned NOT NULL DEFAULT '0',
  `couvert` varchar(100) NOT NULL DEFAULT 'MULHER',
  `vip` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `comanda` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('FECHADA','ABERTA','BLOQUEADA') DEFAULT NULL,
  `cliente` int(11) unsigned DEFAULT NULL,
  `couvert` enum('HOMEM','MULHER') NOT NULL DEFAULT 'HOMEM',
  `hora_abertura` time NOT NULL DEFAULT '00:00:00',
  `hora_fecha` time NOT NULL DEFAULT '00:00:00',
  `dia` varchar(30) NOT NULL DEFAULT '',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `data_real` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `chapelaria` enum('true','false') NOT NULL DEFAULT 'false',
  `chapelaria_numero` varchar(30) NOT NULL DEFAULT '',
  `origem` varchar(50) DEFAULT NULL,
  `operador` varchar(50) DEFAULT NULL,
  `menor` enum('false','true') NOT NULL DEFAULT 'false',
  `entrada` double(10,2) DEFAULT NULL,
  `tela` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`codigo`,`numero`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `comanda_extraviada` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `comanda` int(11) unsigned NOT NULL DEFAULT '0',
  `motivo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `comanda_inaug` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('FECHADA','ABERTA','BLOQUEADA') DEFAULT NULL,
  `cliente` int(11) unsigned DEFAULT NULL,
  `couvert` enum('HOMEM','MULHER') NOT NULL DEFAULT 'HOMEM',
  `hora_abertura` time NOT NULL DEFAULT '00:00:00',
  `hora_fecha` time NOT NULL DEFAULT '00:00:00',
  `dia` varchar(30) NOT NULL DEFAULT '',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `data_real` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `chapelaria` enum('true','false') NOT NULL DEFAULT 'false',
  `chapelaria_numero` varchar(30) NOT NULL DEFAULT '',
  `origem` varchar(50) DEFAULT NULL,
  `operador` varchar(50) DEFAULT NULL,
  `menor` enum('false','true') NOT NULL DEFAULT 'false',
  `entrada` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`numero`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `comanda_serie` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num_inicial` int(11) unsigned NOT NULL DEFAULT '0',
  `num_final` int(11) unsigned NOT NULL DEFAULT '0',
  `evento` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `contas` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `status_padrao` int(11) NOT NULL DEFAULT '0',
  `saldo_inicial` double(10,2) NOT NULL DEFAULT '0.00',
  `over` double(10,3) NOT NULL DEFAULT '0.000',
  `ativo` enum('true','false') NOT NULL DEFAULT 'true',
  `tipo` enum('FINANCEIRA','DESPESA') NOT NULL DEFAULT 'FINANCEIRA',
  `sistema` int(11) DEFAULT NULL,
  `grupo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `contaspg` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vencimento` date NOT NULL DEFAULT '0000-00-00',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `pg` enum('false','true') NOT NULL DEFAULT 'false',
  `mora` double(10,2) NOT NULL DEFAULT '0.00',
  `tipo_mora` enum('perc','esp') NOT NULL DEFAULT 'perc',
  `multa` double(10,2) NOT NULL DEFAULT '0.00',
  `tipo_multa` enum('perc','esp') NOT NULL DEFAULT 'perc',
  `fornecedor` int(11) unsigned NOT NULL DEFAULT '0',
  `descricao` varchar(50) NOT NULL DEFAULT '',
  `usuario` int(11) unsigned NOT NULL DEFAULT '0',
  `data_cadastro` date NOT NULL DEFAULT '0000-00-00',
  `datapgto` date NOT NULL DEFAULT '0000-00-00',
  `valor_pago` double(10,2) NOT NULL DEFAULT '0.00',
  `multa_paga` double(10,2) NOT NULL DEFAULT '0.00',
  `usuario_recebeu` int(11) DEFAULT NULL,
  `cod_doc` int(11) unsigned DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `operac` enum('E','S') NOT NULL DEFAULT 'S',
  `parcela` varchar(50) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `centrodecusto` int(11) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `exporta` int(11) unsigned DEFAULT NULL,
  `pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `cortesia` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_func` int(11) unsigned NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `evento` int(11) NOT NULL DEFAULT '0',
  `comanda` varchar(100) NOT NULL DEFAULT '',
  `nome_cliente` varchar(100) DEFAULT NULL,
  `cod_cliente` int(11) unsigned DEFAULT NULL,
  `gerente` varchar(100) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `custoop` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `desconto_garcon` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `garcon` int(11) unsigned DEFAULT NULL,
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `pg` enum('true','false') NOT NULL DEFAULT 'false',
  `cod_cliente` int(11) unsigned NOT NULL DEFAULT '0',
  `cod_gerente` int(11) unsigned NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `comanda` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `detalhe_aberturabar` (
  `cod_produto` varchar(50) NOT NULL DEFAULT '',
  `nome_produto` varchar(50) NOT NULL DEFAULT '',
  `enviado` int(11) NOT NULL DEFAULT '0',
  `cod_abertura` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recebido` int(11) NOT NULL DEFAULT '0',
  `vendido` int(11) unsigned NOT NULL DEFAULT '0',
  `valor_unit` double(10,2) NOT NULL DEFAULT '0.00',
  `final` int(11) unsigned DEFAULT NULL,
  `inicial` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `saldofinal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `detalhe_caixa` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `caixa` int(11) unsigned DEFAULT NULL,
  `evento` int(11) unsigned DEFAULT NULL,
  `pc` int(11) unsigned DEFAULT NULL,
  `moeda` varchar(50) DEFAULT NULL,
  `inicial` double(10,2) DEFAULT NULL,
  `movimento` double(10,2) DEFAULT NULL,
  `saldo` double(10,2) DEFAULT NULL,
  `informado` double(10,2) DEFAULT NULL,
  `diferenca` double(10,2) DEFAULT NULL,
  `saidas` double(10,2) DEFAULT NULL,
  `cod_abertura` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `devolucao` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cartao` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `evento` int(11) unsigned DEFAULT NULL,
  `operador` int(11) unsigned DEFAULT NULL,
  `saldo` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `dias` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `diferencial` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) NOT NULL DEFAULT '0',
  `diferencial` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `doc` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_cadastro` date DEFAULT NULL,
  `hora_cadastro` time DEFAULT NULL,
  `usuario` int(11) unsigned DEFAULT NULL,
  `valor_total` int(11) unsigned DEFAULT NULL,
  `cod_fornecedor` int(11) unsigned DEFAULT NULL,
  `parcelas` int(11) unsigned DEFAULT NULL,
  `data_doc` date DEFAULT NULL,
  `tipo_doc` varchar(30) DEFAULT NULL,
  `num_nf` varchar(30) DEFAULT NULL,
  `num_doc` varchar(50) DEFAULT NULL,
  `tipo_parcelas` varchar(30) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `contabil` int(11) unsigned DEFAULT NULL,
  `OPERAC` enum('S','E') NOT NULL DEFAULT 'S',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `encerramentomesa` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mesa` int(11) unsigned DEFAULT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `caixa` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `evento` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora_abertura` time DEFAULT NULL,
  `hora_encerramento` time DEFAULT NULL,
  `faturamento` double(10,2) DEFAULT NULL,
  `vendabar` double(10,2) DEFAULT NULL,
  `cod_dia` int(11) unsigned DEFAULT NULL,
  `nome_dia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `extrato` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cartao` varchar(50) DEFAULT NULL,
  `entrada` double(10,2) NOT NULL DEFAULT '0.00',
  `saida` double(10,2) NOT NULL DEFAULT '0.00',
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `operador` int(11) unsigned DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `quantidade` int(11) unsigned DEFAULT NULL,
  `cod_produto` varchar(50) DEFAULT NULL,
  `valor_unit` double(10,2) DEFAULT NULL,
  `valor_total` double(10,2) DEFAULT NULL,
  `evento` int(11) unsigned DEFAULT NULL,
  `log` int(11) unsigned DEFAULT NULL,
  `garcon` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `extratopg` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `obs` varchar(50) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `entrada` double(10,2) NOT NULL DEFAULT '0.00',
  `saida` double(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) DEFAULT NULL,
  `contadebito` int(11) unsigned DEFAULT NULL,
  `nome_contadebito` varchar(50) DEFAULT NULL,
  `contacredito` int(11) unsigned DEFAULT NULL,
  `nome_contacredito` varchar(50) DEFAULT NULL,
  `cod_despesa` int(11) unsigned DEFAULT NULL,
  `operador` int(11) unsigned DEFAULT NULL,
  `saldo_anetrior` double(10,2) DEFAULT NULL,
  `saldo_atual` double(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `datareal` datetime DEFAULT NULL,
  `operac` varchar(30) NOT NULL DEFAULT '',
  `cod_doc` int(11) DEFAULT NULL,
  `contrapartida` int(11) unsigned DEFAULT NULL,
  `conferido` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `feriado` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_feriado` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `ficha` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evento` int(11) unsigned DEFAULT NULL,
  `hora` datetime DEFAULT '0000-00-00 00:00:00',
  `usuario` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `financeiro` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` int(11) unsigned DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `formapgto` (
  `codigo` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `fornecedor` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendedor` varchar(100) NOT NULL DEFAULT '',
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `fone1` varchar(50) DEFAULT NULL,
  `fone2` varchar(50) DEFAULT NULL,
  `fone3` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `insc_est` varchar(30) DEFAULT NULL,
  `ativo` enum('true','false') DEFAULT 'true',
  `complemento` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `obs` varchar(244) DEFAULT NULL,
  `banco` varchar(30) DEFAULT NULL,
  `agencia` varchar(30) DEFAULT NULL,
  `conta` varchar(40) DEFAULT NULL,
  `data_cadastro` date NOT NULL DEFAULT '0000-00-00',
  `razao` varchar(100) NOT NULL DEFAULT '',
  `fantasia` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `contabil` int(11) DEFAULT NULL,
  `categoria` varchar(50) NOT NULL DEFAULT 'FORNECEDOR',
  `data_nascimento` date DEFAULT NULL,
  `aluno` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `funcionario` (
  `nome` varchar(100) NOT NULL DEFAULT '',
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `fone1` varchar(50) DEFAULT NULL,
  `fone2` varchar(50) DEFAULT NULL,
  `fone3` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `comissao` double(10,2) NOT NULL DEFAULT '10.00',
  `cpf` varchar(20) DEFAULT NULL,
  `rg` varchar(30) DEFAULT NULL,
  `ativo` enum('true','false') DEFAULT 'true',
  `complemento` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `obs` varchar(244) DEFAULT NULL,
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banco` varchar(30) DEFAULT NULL,
  `agencia` varchar(30) DEFAULT NULL,
  `conta` varchar(40) DEFAULT NULL,
  `cargo` varchar(50) NOT NULL DEFAULT '',
  `data_adm` date NOT NULL DEFAULT '0000-00-00',
  `data_dem` date NOT NULL DEFAULT '0000-00-00',
  `data_nasc` date NOT NULL DEFAULT '0000-00-00',
  `apelido` varchar(60) NOT NULL DEFAULT '',
  `contrat` varchar(30) NOT NULL DEFAULT '',
  `prod` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `garcon` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cartao` varchar(50) NOT NULL DEFAULT '',
  `comissao` double(10,2) NOT NULL DEFAULT '0.00',
  `nome` varchar(50) unsigned NOT NULL DEFAULT '',
  `apelido` varchar(100) unsigned NOT NULL DEFAULT '',
  `cod_interno` int(11) NOT NULL DEFAULT '0',
  `senha` varchar(60) NOT NULL DEFAULT '',
  `ativo` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `grupos` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `grupos2` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `gruposaidas` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `gruposcp` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `ativo` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `icms` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `sigla` varchar(30) NOT NULL DEFAULT '',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `impressao` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_garcon` int(10) NOT NULL DEFAULT '0',
  `nom_garcon` varchar(100) NOT NULL DEFAULT '',
  `comanda` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `impresso` enum('false','true') NOT NULL DEFAULT 'false',
  `cod_evento` int(11) unsigned NOT NULL DEFAULT '0',
  `nome_evento` varchar(100) NOT NULL DEFAULT '',
  `origem` varchar(100) NOT NULL DEFAULT '',
  `impressora` int(11) unsigned NOT NULL DEFAULT '0',
  `mesa` int(11) unsigned NOT NULL DEFAULT '0',
  `local` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `impressao_detalhe` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_produto` varchar(100) NOT NULL DEFAULT '',
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `nome_produto` varchar(100) NOT NULL DEFAULT '',
  `pedido` int(11) unsigned NOT NULL DEFAULT '0',
  `cod_print` int(11) unsigned NOT NULL DEFAULT '0',
  `tamanho` varchar(100) NOT NULL DEFAULT '',
  `separador` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `impressoras` (
  `codigo` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  `nome` varchar(60) DEFAULT NULL,
  `caminho` varchar(60) DEFAULT NULL,
  `origem` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `log_cancelado` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cartao` varchar(50) DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `bar` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `log_estoque` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) DEFAULT NULL,
  `entrada` double(10,2) DEFAULT NULL,
  `saida` double(10,2) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `datareal` datetime DEFAULT NULL,
  `comanda` int(11) NOT NULL DEFAULT '0',
  `operador` int(11) NOT NULL DEFAULT '0',
  `LOJA` varchar(100) NOT NULL DEFAULT '',
  `QUANTIDADEANTERIOR` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `log_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_post` varchar(100) DEFAULT NULL,
  KEY `id` (`id`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `logcx` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cx` int(11) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `evento` int(11) unsigned DEFAULT NULL,
  `fechamento` blob,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `logportaria` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `dia` int(11) unsigned NOT NULL DEFAULT '0',
  `grupo` varchar(50) NOT NULL DEFAULT '',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `cliente` int(11) unsigned NOT NULL DEFAULT '0',
  `nome_cliente` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `motivoestoque` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `OP` char(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `planocontas` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `senha` enum('true','false') NOT NULL DEFAULT 'false',
  `grupo` varchar(50) DEFAULT NULL,
  `contabil` enum('false','true') NOT NULL DEFAULT 'true',
  `over` double(10,2) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `cod_financeiro` int(11) DEFAULT NULL,
  `financeiro` enum('false','true') NOT NULL DEFAULT 'true',
  `grupofinan` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `produtos` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cod_produto` varchar(50) NOT NULL DEFAULT '',
  `unidade` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `nome_abreviado` varchar(100) DEFAULT NULL,
  `valor_compra` double(10,2) DEFAULT NULL,
  `valor_pequena` double(10,2) DEFAULT NULL,
  `margem` double(10,2) DEFAULT NULL,
  `fornecedor` int(11) unsigned DEFAULT NULL,
  `comissao` enum('true','false') DEFAULT 'true',
  `estoque_minimo` int(11) unsigned DEFAULT NULL,
  `impressora` int(11) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL,
  `valor` double(10,4) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `origem` varchar(50) NOT NULL DEFAULT 'BAR1',
  `origem1` varchar(50) NOT NULL DEFAULT 'BAR2',
  `nome_classe` varchar(50) DEFAULT NULL,
  `icms` int(11) NOT NULL DEFAULT '1',
  `bar` enum('true','false') NOT NULL DEFAULT 'true',
  `ultimavenda` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `conferebar` enum('false','true') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`codigo`,`cod_produto`),
  KEY `tipo` (`classe`,`grupo`),
  KEY `codigo` (`cod_produto`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `produtos2` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cod_produto` varchar(50) NOT NULL DEFAULT '',
  `unidade` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `nome_abreviado` varchar(100) DEFAULT NULL,
  `valor_compra` double(10,2) DEFAULT NULL,
  `valor_pequena` double(10,2) DEFAULT NULL,
  `margem` double(10,2) DEFAULT NULL,
  `fornecedor` int(11) unsigned DEFAULT NULL,
  `comissao` enum('true','false') DEFAULT 'true',
  `estoque_minimo` int(11) unsigned DEFAULT NULL,
  `impressora` int(11) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL,
  `valor` double(10,4) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `origem` varchar(50) NOT NULL DEFAULT 'BAR1',
  `origem1` varchar(50) NOT NULL DEFAULT 'BAR2',
  `nome_classe` varchar(50) DEFAULT NULL,
  `icms` int(11) NOT NULL DEFAULT '1',
  `bar` enum('true','false') NOT NULL DEFAULT 'true',
  `ultimavenda` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `conferebar` enum('false','true') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`codigo`,`cod_produto`),
  KEY `tipo` (`classe`,`grupo`),
  KEY `codigo` (`cod_produto`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `pronto` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `recarga` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `caixa` int(11) unsigned NOT NULL DEFAULT '0',
  `valor` double(10,2) NOT NULL DEFAULT '0.00',
  `cartao` int(11) unsigned NOT NULL DEFAULT '0',
  `saldo_anterior` double(10,2) NOT NULL DEFAULT '0.00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `subgruposaidas` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `tabelaespecial` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `horalimite` enum('true','false') NOT NULL DEFAULT 'false',
  `hora` time DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `valida` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `taxa_servico` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evento` int(11) unsigned DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `origem` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `telas` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) unsigned DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `unidade` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `abrev` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `usuarios` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) unsigned DEFAULT NULL,
  `senha` varchar(60) unsigned DEFAULT NULL,
  `cx` enum('false','true') NOT NULL DEFAULT 'false',
  `operacx` enum('false','true') NOT NULL DEFAULT 'false',
  `operaterminal` enum('false','true') NOT NULL DEFAULT 'false',
  `adm` enum('false','true') NOT NULL DEFAULT 'false',
  `ativo` enum('false','true') NOT NULL DEFAULT 'true',
  `grupo` varchar(30) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `valorportaria` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dia` int(11) unsigned DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `ativo` enum('false','true') NOT NULL DEFAULT 'true',
  `produto` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `venda` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comanda` int(11) DEFAULT NULL,
  `cliente` int(11) unsigned NOT NULL DEFAULT '0',
  `cod_produto` varchar(50) DEFAULT NULL,
  `nome_produto` varchar(250) DEFAULT NULL,
  `quantidade` double(10,2) DEFAULT NULL,
  `cod_unidade` int(11) unsigned DEFAULT NULL,
  `nome_unidade` varchar(10) DEFAULT NULL,
  `garcon` int(11) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` enum('C','D') NOT NULL DEFAULT 'D',
  `dia` varchar(30) NOT NULL DEFAULT '',
  `periodo` varchar(30) NOT NULL DEFAULT '',
  `usuario` int(11) unsigned NOT NULL DEFAULT '0',
  `nome_cliente` varchar(50) DEFAULT NULL,
  `valor_unit` double(10,4) NOT NULL DEFAULT '0.0000',
  `valor_total` double(10,2) NOT NULL DEFAULT '0.00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `pedido` int(11) unsigned DEFAULT NULL,
  `turno` varchar(20) NOT NULL DEFAULT '',
  `origem` varchar(50) NOT NULL DEFAULT 'JAPA',
  `classe` varchar(50) NOT NULL DEFAULT '',
  `valor_compra` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `venda_cancelada` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comanda` int(11) DEFAULT NULL,
  `cliente` int(11) unsigned NOT NULL DEFAULT '0',
  `cod_produto` varchar(50) DEFAULT NULL,
  `nome_produto` varchar(250) DEFAULT NULL,
  `quantidade` double(10,2) DEFAULT NULL,
  `cod_unidade` int(11) unsigned DEFAULT NULL,
  `nome_unidade` varchar(10) DEFAULT NULL,
  `garcon` int(11) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` enum('C','D') NOT NULL DEFAULT 'D',
  `dia` varchar(30) NOT NULL DEFAULT '',
  `periodo` varchar(30) NOT NULL DEFAULT '',
  `usuario` int(11) unsigned NOT NULL DEFAULT '0',
  `nome_cliente` varchar(50) DEFAULT NULL,
  `valor_unit` double(10,4) NOT NULL DEFAULT '0.0000',
  `valor_total` double(10,2) NOT NULL DEFAULT '0.00',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `pedido` int(11) unsigned DEFAULT NULL,
  `turno` varchar(20) NOT NULL DEFAULT '',
  `origem` varchar(50) NOT NULL DEFAULT 'JAPA',
  `classe` varchar(50) NOT NULL DEFAULT '',
  `autorizou` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;
