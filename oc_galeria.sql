CREATE TABLE IF NOT EXISTS `oc_galeria` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_foto` varchar(50) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_foto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

