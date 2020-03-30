CREATE TABLE `classes` (
  `codigo` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `grupo` int(11) unsigned DEFAULT NULL,
  `app` enum('true','false') NOT NULL DEFAULT 'true',
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

CREATE TABLE `garcon` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `apelido` varchar(30) NOT NULL DEFAULT '',
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

CREATE TABLE `unidade` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `abrev` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `usuarios` (
  `codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `senha` varchar(60) NOT NULL DEFAULT '',
  `adm` enum('false','true') NOT NULL DEFAULT 'false',
  `ativo` enum('false','true') NOT NULL DEFAULT 'true',
  `grupo` varchar(30) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`),
  KEY `codigo` (`codigo`)
) DEFAULT character SET utf8 DEFAULT COLLATE utf8_general_ci;
