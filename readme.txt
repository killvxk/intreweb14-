CREATE TABLE `zhoubao` (
  `id` int(5) NOT NULL auto_increment COMMENT 'id',
  `sdate` date default NULL COMMENT '发布日期',
  `sfabr` varchar(255) default NULL,
  `jiesr` varchar(255) default NULL,
  `wancd` varchar(255) default NULL,
  `xiangmmc` varchar(255) default NULL,
  `haos` varchar(255) default NULL,
  `wentigl` varchar(255) default NULL,
  `sfgd` varchar(255) default NULL,
  `chulfs` text,
  `sfwc` varchar(255) default NULL,
  `houxjh` text,
  `zhicsj` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--https://www.cnblogs.com/specter45/p/github.html#s1  如何推送到gitbub
