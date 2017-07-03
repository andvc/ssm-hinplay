/*
SQLyog Ultimate v8.32 
MySQL - 5.6.17 : Database - hinplay_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hinplay_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hinplay_db`;

/*Table structure for table `forum_comment` */

DROP TABLE IF EXISTS `forum_comment`;

CREATE TABLE `forum_comment` (
  `fcId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `fcContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '评论内容',
  `fcTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `fmsgId` int(10) unsigned NOT NULL COMMENT '被关联的消息id',
  `uId` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`fcId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `forum_comment` */

LOCK TABLES `forum_comment` WRITE;

insert  into `forum_comment`(`fcId`,`fcContent`,`fcTime`,`fmsgId`,`uId`) values (1,'','2016-11-13 14:13:04',1,1);

UNLOCK TABLES;

/*Table structure for table `forum_intransit` */

DROP TABLE IF EXISTS `forum_intransit`;

CREATE TABLE `forum_intransit` (
  `fiId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '转发id',
  `fmsgId` int(10) unsigned NOT NULL COMMENT '被关联的消息id',
  `uId` int(10) unsigned NOT NULL COMMENT '用户id',
  `fiTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '转发时间',
  PRIMARY KEY (`fiId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='转发表';

/*Data for the table `forum_intransit` */

LOCK TABLES `forum_intransit` WRITE;

UNLOCK TABLES;

/*Table structure for table `forum_message` */

DROP TABLE IF EXISTS `forum_message`;

CREATE TABLE `forum_message` (
  `fmsgId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `fmsgContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `fmsgTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `fmsgPraise_num` int(11) NOT NULL DEFAULT '0' COMMENT '赞同次数',
  `fmsgComment_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `fmsgIntransit_num` int(11) NOT NULL DEFAULT '0' COMMENT '转发次数',
  `fmsgRead_num` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `uId` int(11) NOT NULL COMMENT '用户id',
  `gId` int(11) NOT NULL COMMENT '游戏id，被关联的游戏',
  `fmsgPictures` varchar(1000) NOT NULL DEFAULT '' COMMENT '消息图片，JSON数组对象url',
  PRIMARY KEY (`fmsgId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

/*Data for the table `forum_message` */

LOCK TABLES `forum_message` WRITE;

UNLOCK TABLES;

/*Table structure for table `forum_praise` */

DROP TABLE IF EXISTS `forum_praise`;

CREATE TABLE `forum_praise` (
  `fpId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赞同id',
  `fmsgId` int(10) unsigned NOT NULL COMMENT '被赞同的消息id',
  `uId` int(10) unsigned NOT NULL COMMENT '用户id',
  `fpTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赞同时间',
  PRIMARY KEY (`fpId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赞同表';

/*Data for the table `forum_praise` */

LOCK TABLES `forum_praise` WRITE;

UNLOCK TABLES;

/*Table structure for table `game_class` */

DROP TABLE IF EXISTS `game_class`;

CREATE TABLE `game_class` (
  `cId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分类名称',
  `cImage` varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标',
  PRIMARY KEY (`cId`),
  UNIQUE KEY `NewIndex1` (`cName`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `game_class` */

LOCK TABLES `game_class` WRITE;

insert  into `game_class`(`cId`,`cName`,`cImage`) values (5,'撒大大2','http://cdn.hinplay.com/static/uploads/images/20161108/87e14456681b49bc8276e82d4ef51c5b.jpg'),(6,'按时大大','http://cdn.hinplay.com/static/uploads/images/20161108/a5779582e0af4386b430de6f9de42e2a.jpg'),(7,'123456','http://cdn.hinplay.com/static/uploads/images/20161108/87e14456681b49bc8276e82d4ef51c5b.jpg');

UNLOCK TABLES;

/*Table structure for table `game_commend` */

DROP TABLE IF EXISTS `game_commend`;

CREATE TABLE `game_commend` (
  `gId` int(10) unsigned NOT NULL COMMENT '游戏id',
  `gHot` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为热门游戏0为否，1为是',
  `gNice` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为精品游戏0为否，1为是',
  `gNew` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为最新游戏0为否，1为是',
  PRIMARY KEY (`gId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `game_commend` */

LOCK TABLES `game_commend` WRITE;

insert  into `game_commend`(`gId`,`gHot`,`gNice`,`gNew`) values (5,0,0,1),(9,0,0,0),(10,0,0,0);

UNLOCK TABLES;

/*Table structure for table `game_giftbag` */

DROP TABLE IF EXISTS `game_giftbag`;

CREATE TABLE `game_giftbag` (
  `bId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '礼包id',
  `gId` int(11) NOT NULL COMMENT '游戏id',
  `bName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '礼包名称',
  `bDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '礼包内容',
  `bExplain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '使用说明',
  `bLast` int(11) NOT NULL DEFAULT '0' COMMENT '礼包过期，0未过期，1过期',
  PRIMARY KEY (`bId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `game_giftbag` */

LOCK TABLES `game_giftbag` WRITE;

insert  into `game_giftbag`(`bId`,`gId`,`bName`,`bDesc`,`bExplain`,`bLast`) values (6,9,'dsadad','asa','dadadadadadad',0),(5,9,'sad','asda','dadadadas',0),(7,9,'addas','adasdadada','adadadadaddad',0);

UNLOCK TABLES;

/*Table structure for table `games_manage` */

DROP TABLE IF EXISTS `games_manage`;

CREATE TABLE `games_manage` (
  `gId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏id',
  `cId` int(11) NOT NULL COMMENT '分类id',
  `gName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏名字',
  `gDesc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏简介',
  `gLogo` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏logo',
  `gPictures` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏图片集,JSON数组对象url',
  `gPayType` int(1) NOT NULL DEFAULT '0' COMMENT '付费类型0、免费游戏；1、付费游戏',
  `gScreen` int(1) NOT NULL DEFAULT '0' COMMENT '屏幕朝向0、横屏；1、竖屏',
  `gPlayed` int(11) NOT NULL DEFAULT '0' COMMENT '游戏活跃度',
  `gState` int(1) NOT NULL DEFAULT '0' COMMENT '游戏状态0已上架，1未上架',
  `gUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏地址',
  `gRuntimeUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏RuntimeUrl地址',
  `gFirm` int(1) DEFAULT '0' COMMENT '游戏厂商0白鹭，1.....',
  `gCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '游戏创建时间',
  PRIMARY KEY (`gId`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `games_manage` */

LOCK TABLES `games_manage` WRITE;

insert  into `games_manage`(`gId`,`cId`,`gName`,`gDesc`,`gLogo`,`gPictures`,`gPayType`,`gScreen`,`gPlayed`,`gState`,`gUrl`,`gRuntimeUrl`,`gFirm`,`gCreate`) values (5,5,'啊大大2','ddasdadadasdds','http://cdn.hinplay.com/static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg','[\"http://cdn.hinplay.com/static/uploads/images/20161108/87e14456681b49bc8276e82d4ef51c5b.jpg\",\"http://cdn.hinplay.com/static/uploads/images/20161108/6ad6a7072a274b1ca8acd0096a497c89.jpg\",\"http://cdn.hinplay.com/static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg\",\"http://cdn.hinplay.com/static/uploads/images/20161108/a5779582e0af4386b430de6f9de42e2a.jpg\"]',1,1,22,0,'http://ww.baidu.om','',0,'2016-11-05 21:43:59'),(9,6,'aadad','sahttps://www.uc123.com/https://www.uc123.com/https://www.uc123.com/','http://cdn.hinplay.com/static/uploads/images/20161112/fbcde38d7d494bf7adf01d2295536b74.jpg','[\"http://cdn.hinplay.com/static/uploads/images/20161108/6ad6a7072a274b1ca8acd0096a497c89.jpg\",\"http://cdn.hinplay.com/static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg\",\"http://cdn.hinplay.com/static/uploads/images/20161108/a5779582e0af4386b430de6f9de42e2a.jpg\"]',1,1,31231,0,'https://www.uc123.com/','',0,'2016-11-12 17:58:49'),(10,5,'adada','','','null',1,1,0,0,'http://www.yoz365.com','http://www.yoz365.com',0,'2016-11-13 14:31:54');

UNLOCK TABLES;

/*Table structure for table `giftbag_keys` */

DROP TABLE IF EXISTS `giftbag_keys`;

CREATE TABLE `giftbag_keys` (
  `kId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '兑换码id',
  `kKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '兑换码',
  `bId` int(11) unsigned NOT NULL COMMENT '礼包id',
  `uId` int(11) unsigned DEFAULT NULL COMMENT '会员领取id',
  `isUsed` int(11) NOT NULL DEFAULT '0' COMMENT '是否使用了，0未使用，1使用过',
  PRIMARY KEY (`kId`),
  KEY `FK_giftbag_keys` (`bId`)
) ENGINE=MyISAM AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8;

/*Data for the table `giftbag_keys` */

LOCK TABLES `giftbag_keys` WRITE;

insert  into `giftbag_keys`(`kId`,`kKey`,`bId`,`uId`,`isUsed`) values (2005,'xnkwo7o9',6,NULL,0),(2004,'dcsizv5t',6,NULL,0),(1989,'99tp2b78',6,NULL,0),(1988,'wo6f43nq',6,NULL,0),(1987,'z9gryf2x',6,NULL,0),(1986,'hxcscpfv',6,NULL,0),(1985,'f275ydp4',6,NULL,0),(1984,'nh0wtsbm',6,NULL,0),(1983,'p8bemkw1',6,NULL,0),(1982,'jymutdaf',6,NULL,0),(1981,'expyatyl',6,NULL,0),(1980,'neflive6',6,NULL,0),(1979,'psnpdcv1',6,NULL,0),(1978,'lflmoyzc',6,NULL,0),(1977,'iaim3olm',6,NULL,0),(1976,'b9ghkuiu',6,NULL,0),(1975,'frm25x5j',6,NULL,0),(1974,'cch6rpui',6,NULL,0),(1973,'2nfblvpg',6,NULL,0),(1972,'bxikj3vx',6,NULL,0),(1971,'aea6aamb',6,NULL,0),(1970,'j0ae8vyw',6,NULL,0),(1969,'yp42i9si',6,NULL,0),(1968,'u1abza41',6,NULL,0),(1967,'8qz6lp60',6,NULL,0),(1966,'gx14ch1e',6,NULL,0),(1965,'yv7jvcxc',6,NULL,0),(1964,'sxazy90e',6,NULL,0),(1963,'a313mk1w',6,NULL,0),(1962,'sj2ibakk',6,NULL,0),(1961,'c8hqgnih',6,NULL,0),(1960,'c7a824kk',6,NULL,0),(1959,'ml7rodfl',6,NULL,0),(1958,'m766hfv3',6,NULL,0),(1957,'y89wlxlo',6,NULL,0),(1956,'fehqea9h',6,NULL,0),(1955,'j2qcrku0',6,NULL,0),(1954,'bwavmys1',6,NULL,0),(1953,'ggxkn9wm',6,NULL,0),(1952,'y49s653m',6,NULL,0),(1951,'r1h9dzwt',6,NULL,0),(1950,'y4bfjfxh',6,NULL,0),(1949,'fnmrhudm',6,NULL,0),(1948,'bon8qp3z',6,NULL,0),(1947,'kzohgwp9',6,NULL,0),(1946,'37aklkd2',6,NULL,0),(1945,'geipvoky',6,NULL,0),(1944,'2qscqez4',6,NULL,0),(1943,'tfyww22h',6,NULL,0),(1942,'5a2y8qli',6,NULL,0),(1941,'lzy9vit9',6,NULL,0),(1940,'bq9tn4a4',6,NULL,0),(1939,'ikwzznlc',6,NULL,0),(1938,'we7c1l09',6,NULL,0),(1937,'rqo10d4y',6,NULL,0),(1936,'rcy4owsx',6,NULL,0),(1935,'e092secl',6,NULL,0),(1934,'cu4koqf1',6,NULL,0),(1933,'mxa3hmhw',6,NULL,0),(1932,'68z8q45j',6,NULL,0),(1931,'nhbarw7o',6,NULL,0),(1930,'mqy2is07',6,NULL,0),(1929,'mg3555fp',6,NULL,0),(1928,'k8gksoan',6,NULL,0),(1927,'iuqxyqnx',6,NULL,0),(1926,'110plhuv',6,NULL,0),(1925,'x3unogtk',6,NULL,0),(1924,'x26cp6an',6,NULL,0),(1923,'3rzi3i1c',6,NULL,0),(1922,'4n1qwzc1',6,NULL,0),(1921,'vfuf6qxl',6,NULL,0),(1920,'qqw6hxkl',6,NULL,0),(1919,'74tldr52',6,NULL,0),(1918,'kricbwy0',6,NULL,0),(1917,'gjeqbido',6,NULL,0),(1916,'n4d6qbft',6,NULL,0),(1915,'4i5zp08j',6,NULL,0),(1914,'stt74kbr',6,NULL,0),(1913,'5mqe87nr',6,NULL,0),(1912,'a1rwu5st',6,NULL,0),(1911,'81vsi1xa',6,NULL,0),(1910,'y8nlwfht',6,NULL,0),(1909,'uss0aetv',6,NULL,0),(1908,'gn1nvoj1',6,NULL,0),(1907,'zts1qzwg',6,NULL,0),(1906,'2xjzb212',6,NULL,0),(1905,'idl1y8b8',6,NULL,0),(1904,'yp7bptla',6,NULL,0),(1903,'ul6m697b',6,NULL,0),(1902,'skjogcny',6,NULL,0),(1901,'fm0z5rd7',6,NULL,0),(1900,'bwgkvz4n',6,NULL,0),(1899,'uekjray3',6,NULL,0),(1898,'ps96baau',6,NULL,0),(1897,'1t3y7g83',6,NULL,0),(1885,'xvb5g7p0',6,NULL,0),(1896,'90nsifb0',6,NULL,0),(1895,'bwrm2gvr',6,NULL,0),(1894,'qetf2d14',6,NULL,0),(1884,'l2tyvli5',6,NULL,0),(1893,'gi105i4p',6,NULL,0),(1892,'a3evp6yx',6,NULL,0),(1891,'h250nbrc',6,NULL,0),(1890,'inie1gb9',6,NULL,0),(1889,'zalx7rm4',6,NULL,0),(1888,'7w7saw47',6,NULL,0),(1887,'m87iacsy',6,NULL,0),(1883,'h3cl8cs1',6,NULL,0),(1886,'vmqzykqo',6,NULL,0),(1882,'x75wx0e0',6,NULL,0),(1881,'bljkhzia',6,NULL,0),(1880,'remwm032',6,NULL,0),(1879,'o9dz80yy',6,NULL,0),(1878,'9d0rea68',6,NULL,0),(1877,'chegz285',6,NULL,0),(1876,'4zsfk4yq',6,NULL,0),(1875,'kq8kb62i',6,NULL,0),(1874,'dn2xty3c',6,NULL,0),(1873,'ojhhbzmt',6,NULL,0),(1872,'ln971hhm',6,NULL,0),(1871,'hxnndoub',6,NULL,0),(1870,'lhvxrj8b',6,NULL,0),(1869,'uc46bcpz',6,NULL,0),(1868,'6dll6lu3',6,NULL,0),(1867,'2gjvekcq',6,NULL,0),(1866,'td0xwny3',6,NULL,0),(1865,'ov3ezmge',6,NULL,0),(1864,'lpp5i5qr',6,NULL,0),(1863,'98rhlwin',6,NULL,0),(1862,'3ckiwnvc',6,NULL,0),(1861,'ldhhvrrm',6,NULL,0),(1860,'6r0hqo2r',6,NULL,0),(1859,'qso7kzri',6,NULL,0),(1858,'ymuhlswk',6,NULL,0),(1857,'pihzdl0j',6,NULL,0),(1856,'btfe93g2',6,NULL,0),(1855,'9p2ncehl',6,NULL,0),(1854,'47ga06az',6,NULL,0),(1853,'b618lg5v',6,NULL,0),(1852,'8ja99mx6',6,NULL,0),(1851,'w8r0u2o1',6,NULL,0),(1850,'nsvjwr1m',6,NULL,0),(1849,'vqio25jy',6,NULL,0),(1848,'y7nrm9ib',6,NULL,0),(1847,'ejqvh72u',6,NULL,0),(1846,'4cn7k3dm',6,NULL,0),(1845,'y8g1l4uy',6,NULL,0),(1844,'3aclshbn',6,NULL,0),(1843,'hc9li97l',6,NULL,0),(1842,'jasny8nv',6,NULL,0),(1841,'t1efnl9p',6,NULL,0),(1840,'4bwgi3dd',6,NULL,0),(1839,'c3ca28p6',6,NULL,0),(1838,'utuxhnda',6,NULL,0),(1837,'sw2gcpsp',6,NULL,0),(1836,'kuu4x4kg',6,NULL,0),(1835,'nb0499oi',6,NULL,0),(1834,'won4yeje',6,NULL,0),(1833,'9kuct8oa',6,NULL,0),(1832,'3s6qcf09',6,NULL,0),(1831,'p2kg286j',6,NULL,0),(1830,'eq4c8tak',6,NULL,0),(1829,'hf6gvjky',6,NULL,0),(1828,'ckpj8o9d',6,NULL,0),(1827,'owpihhko',6,NULL,0),(1826,'ezdrcx2w',6,NULL,0),(1825,'fh50i7if',6,NULL,0),(1824,'5yq35ya1',6,NULL,0),(1823,'5go5rjm3',6,NULL,0),(1822,'o8bfsnpd',6,NULL,0),(1821,'xvmedwfk',6,NULL,0),(1820,'6q1w2afe',6,NULL,0),(1819,'8yldqtg4',6,NULL,0),(1818,'ihugdldp',6,NULL,0),(1817,'qfytp423',6,NULL,0),(1816,'yjft8jrh',6,NULL,0),(1815,'m8qdgu07',6,NULL,0),(1814,'5gqck0po',6,NULL,0),(1813,'g1n8j5vl',6,NULL,0),(1812,'qs18zzya',6,NULL,0),(1811,'3xn63r5e',6,NULL,0),(1810,'lq8qvhrs',6,NULL,0),(1809,'ckfntld5',6,NULL,0),(1808,'g06u09cv',6,NULL,0),(1807,'kif6fpjb',6,NULL,0),(1806,'2bdg1z04',6,NULL,0),(1805,'ax30awj8',6,NULL,0),(1804,'rimuinx2',6,NULL,0),(1803,'lfgpb2ni',6,NULL,0),(1802,'kcn807hn',6,NULL,0),(1801,'9wx5aco6',6,NULL,0),(1800,'3lkxustg',6,NULL,0),(1799,'5hax1nlu',6,NULL,0),(1798,'zyaawah3',6,NULL,0),(2003,'8sjn4o6i',6,NULL,0),(2002,'e4ge5ppd',6,NULL,0),(2001,'zmce4ax7',6,NULL,0),(2000,'k359v9dx',6,NULL,0),(1999,'qnvar5nn',6,NULL,0),(1998,'7gx9ob73',6,NULL,0),(1997,'5pa0aw8f',6,NULL,0),(1996,'vr3h51wz',6,NULL,0),(1995,'okffvmwi',6,NULL,0),(1994,'r2ezo38y',6,NULL,0),(1993,'tcc6lwib',6,NULL,0),(1992,'uct4sk6s',6,NULL,0),(1991,'wje87g6d',6,NULL,0),(1990,'yofexkan',6,NULL,0),(1797,'pg1jhjnn',6,NULL,0),(1796,'7rk6inol',6,NULL,0),(1795,'565f8j1l',6,NULL,0),(1794,'ym4dq3vx',6,NULL,0),(1793,'sb2y2ehm',6,NULL,0),(1792,'di6d3olb',6,NULL,0),(1791,'ovlko7wh',6,NULL,0),(1790,'mggy118d',6,NULL,0),(1789,'n9v8ghbz',6,NULL,0),(1788,'s6f0knvz',6,NULL,0),(1787,'hm9g1ymn',6,NULL,0),(1786,'mzjfgknp',6,NULL,0),(1785,'8hq24spo',6,NULL,0),(1784,'e01issw3',6,NULL,0),(1783,'93m8pj94',6,NULL,0),(1782,'kwj1suwi',6,NULL,0),(1781,'tah2jwn3',6,NULL,0),(1780,'ia7i697k',6,NULL,0),(1779,'64189d4c',6,NULL,0),(1778,'oijp29ii',6,NULL,0),(1777,'mosjo4hd',6,NULL,0),(1776,'p4sramc0',6,NULL,0),(1775,'xelaeokd',6,NULL,0),(1774,'xijbztqb',6,NULL,0),(1773,'zk6pmiln',6,NULL,0),(1772,'jp87o2ra',6,NULL,0),(1771,'w97qgr1r',6,NULL,0),(1770,'bsmiveua',6,NULL,0),(1769,'rkpp2mfm',6,NULL,0),(1768,'1d42r54z',6,NULL,0),(1767,'5nnhhx0t',6,NULL,0),(1766,'uxah1u44',6,NULL,0),(1765,'vycj4bev',6,NULL,0),(1764,'ahsnoq0w',6,NULL,0),(1763,'akziqsbb',6,NULL,0),(1762,'5mmkzwae',6,NULL,0),(1761,'qj4yzrg1',6,NULL,0),(1760,'zvx3ga3w',6,NULL,0),(1759,'vu4c5u8i',6,NULL,0),(1758,'mjrgpp8t',6,NULL,0),(1757,'q3meiozh',6,NULL,0),(1756,'ykiauzad',6,NULL,0),(1755,'o1zun1f3',6,NULL,0),(1754,'x24lhzim',6,NULL,0),(1753,'par12k8t',6,NULL,0),(1752,'ae5awjqh',6,NULL,0),(1751,'frism65x',6,NULL,0),(1750,'ivbr8zxr',6,NULL,0),(1749,'sucau4p7',6,NULL,0),(1748,'mutct808',6,NULL,0),(1747,'dnfpllnx',6,NULL,0),(1746,'yxkxjcgf',6,NULL,0),(1745,'ec9a43b2',6,NULL,0),(1744,'7pfkzbud',6,NULL,0),(1743,'ninzsx49',6,NULL,0),(1742,'e89qoita',6,NULL,0),(1741,'iodq7rnh',6,NULL,0),(1740,'zhyg00ua',6,NULL,0),(1739,'qc07iwj2',6,NULL,0),(1738,'70u6faa0',6,NULL,0),(1737,'t9lawizy',6,NULL,0),(1736,'l71y2b7p',6,NULL,0),(1735,'r09is59d',6,NULL,0),(1734,'6q805rpj',6,NULL,0),(1733,'obr8pu27',6,NULL,0),(1732,'r8bboz4e',6,NULL,0),(1731,'2cujkqf9',6,NULL,0),(1730,'q6me1x5s',6,NULL,0),(1729,'gkslr8up',6,NULL,0),(1728,'7yajyk7o',6,NULL,0),(1727,'yrqof71y',6,NULL,0),(1726,'w9q18bx9',6,NULL,0),(1725,'l346zw5w',6,NULL,0),(1724,'ir38j376',6,NULL,0),(1723,'cqfts6v1',6,NULL,0),(1722,'ogvk71u2',6,NULL,0),(1721,'y9e9dim8',6,NULL,0),(1720,'m0x5eys9',6,NULL,0),(1719,'in2cfzxk',6,NULL,0),(1718,'7vjgjw2v',6,NULL,0),(1717,'rs4gexsj',6,NULL,0),(1716,'ip3lz2zi',6,NULL,0),(1715,'3kd7ghw5',6,NULL,0),(1714,'y3ukdqq9',6,NULL,0),(1713,'jw0vsjcf',6,NULL,0),(1712,'7tr4coz5',6,NULL,0),(1711,'jbq3eyp9',6,NULL,0),(1710,'ftcr1g68',6,NULL,0),(1709,'wod1nk3g',6,NULL,0),(1708,'q21zv1se',6,NULL,0),(1707,'674q5gbl',6,NULL,0),(1706,'3qhlvha7',6,NULL,0),(1705,'nmz538wf',6,NULL,0),(1704,'8hbbeim9',6,NULL,0),(1703,'tmhvnfmq',6,NULL,0),(1702,'jizjrj79',6,NULL,0),(1701,'zgy1lkfp',6,NULL,0),(1700,'o0homg2o',6,NULL,0),(1699,'f8x5hms9',6,NULL,0),(1698,'bbsbeh1g',6,NULL,0),(1697,'hfswr6a2',6,NULL,0),(1696,'54l2ccl7',6,NULL,0),(1695,'xx9knafs',6,NULL,0),(1694,'6m8hi96l',6,NULL,0),(1693,'f7r7bopy',6,NULL,0),(1692,'yr6wqm7j',6,NULL,0),(1691,'xb5cplfs',6,NULL,0),(1690,'wei37lka',6,NULL,0),(1689,'xmdhv5y4',6,NULL,0),(1688,'cc4sutrc',6,NULL,0),(1687,'hb9y41fw',6,NULL,0),(1686,'3hj78ee2',6,NULL,0),(1685,'qp94si1t',6,NULL,0),(1684,'fteux2eg',6,NULL,0),(1683,'jkohqbz8',6,NULL,0),(1682,'13j9ud6r',6,NULL,0),(1681,'c6o383n8',6,NULL,0),(1680,'mk7nznyc',6,NULL,0),(1679,'11rjgww8',6,NULL,0),(1678,'rzng9hex',6,NULL,0),(1677,'zj9zd494',6,NULL,0),(1676,'ye6gmint',6,NULL,0),(1675,'o4f7e89e',6,NULL,0),(1674,'vsjtsbaq',6,NULL,0),(1673,'hnxqjjjj',6,NULL,0),(1672,'gcmo70x0',6,NULL,0),(1671,'vuqgori0',6,NULL,0),(1670,'aol8h32j',6,NULL,0),(1669,'a11fed7f',6,NULL,0),(1668,'eneqcilp',6,NULL,0),(1667,'6s3n58sm',6,NULL,0),(1666,'ufexgqkf',6,NULL,0),(1665,'744g2pes',6,NULL,0),(1664,'hn2s72m4',6,NULL,0),(1663,'fbdk0ovo',6,NULL,0),(1662,'a57ohkvm',6,NULL,0),(1661,'cxjthoio',6,NULL,0),(1660,'r6kpgo54',6,NULL,0),(1659,'34d4x0us',6,NULL,0),(1658,'wt3b8clc',6,NULL,0),(1657,'28093xjc',6,NULL,0),(1656,'qtl18vuh',6,NULL,0),(1655,'ihran1af',6,NULL,0),(1654,'xfpqcyw5',6,NULL,0),(1653,'gfculpbs',6,NULL,0),(1652,'95v8mog4',6,NULL,0),(1651,'bktpqq6j',6,NULL,0),(1650,'wapgj8j1',6,NULL,0),(1649,'65961mb0',6,NULL,0),(1648,'3z95eje9',6,NULL,0),(1647,'r79hbxlg',6,NULL,0),(1646,'wycy0gzk',6,NULL,0),(1645,'b9msg3uq',6,NULL,0),(1644,'xzivu09y',6,NULL,0),(1643,'nwho5fbq',6,NULL,0),(1642,'maeuoqch',6,NULL,0),(1641,'ll2768rv',6,NULL,0),(1640,'mzho1ocs',6,NULL,0),(1639,'tmo5j496',6,NULL,0),(1638,'ou2qlce0',6,NULL,0),(1637,'ashc8d98',6,NULL,0),(1636,'7bhx9qkh',6,NULL,0),(1635,'b4xpokul',6,NULL,0),(1634,'ukxxh2hi',6,NULL,0),(1633,'qv1zw7n7',6,NULL,0),(1632,'ohd2yo00',6,NULL,0),(1631,'rna909ih',6,NULL,0),(1630,'cn5y4t45',6,NULL,0),(1629,'uxv11lyv',6,NULL,0),(1628,'3byh7s85',6,NULL,0),(1627,'y4q41fu5',6,NULL,0),(1626,'ym863sts',6,NULL,0),(1625,'9lu0d5so',6,NULL,0),(1624,'d0nw8aso',6,NULL,0),(1623,'z1q2da8k',6,NULL,0),(1622,'gv8umwxi',6,NULL,0),(1621,'8yp9d3p5',6,NULL,0),(1620,'byaw9vtn',6,NULL,0),(1619,'qikkqo9x',6,NULL,0),(1618,'fh4zp4g3',6,NULL,0),(1617,'ok1ur56t',6,NULL,0),(1616,'6um0zz94',6,NULL,0),(1615,'ppma0o7u',6,NULL,0),(1614,'yqxfaovk',6,NULL,0),(1613,'i5em2lqy',6,NULL,0),(1612,'b5myhd28',6,NULL,0),(1611,'iwlh5j93',6,NULL,0),(1610,'ys2wmydz',6,NULL,0),(1609,'7u5y0ws9',6,NULL,0),(1608,'n0p41och',6,NULL,0),(1607,'eywmzuxv',6,NULL,0),(1606,'cz4l10e2',6,NULL,0),(1605,'4pai5idr',6,NULL,0),(1604,'nsaqwt53',6,NULL,0),(1603,'fv540ad0',6,NULL,0),(1602,'eyx5fs10',6,NULL,0),(1601,'x1y355sx',6,NULL,0),(1600,'4jou3i62',6,NULL,0),(1599,'ltd6tmk5',6,NULL,0),(1598,'sevrn0uv',6,NULL,0),(1597,'m1kgtr3q',6,NULL,0),(1596,'xwfi8jo3',6,NULL,0),(1595,'dzddzu7z',6,NULL,0),(1594,'kc4zhxia',6,NULL,0),(1593,'x8o1f1f5',6,NULL,0),(1592,'dvdad4sx',6,NULL,0),(1591,'bsaac09d',6,NULL,0),(1590,'wup76zrr',6,NULL,0),(1589,'34e143ho',6,NULL,0),(1588,'qq7bvbs4',6,NULL,0),(1587,'fwqkl0ba',6,NULL,0),(1586,'13lvgazf',6,NULL,0),(1585,'g737wr32',6,NULL,0),(1584,'j968i8eh',6,NULL,0),(1583,'fiac35wl',6,NULL,0),(1582,'285vtakk',6,NULL,0),(1581,'9tz5cgvh',6,NULL,0),(1580,'n487ggn4',6,NULL,0),(1579,'pfw74qiz',6,NULL,0),(1578,'6uecpazi',6,NULL,0),(1577,'yoj1gg9v',6,NULL,0),(1576,'lr7c0aqe',6,NULL,0),(1575,'181kfea0',6,NULL,0),(1574,'h43pwzl5',6,NULL,0),(1573,'6m6hpnn3',6,NULL,0),(1572,'mec9sl3h',6,NULL,0),(1571,'d9rgde9w',6,NULL,0),(1570,'eyvnmchi',6,NULL,0),(1569,'cy507kzq',6,NULL,0),(1568,'6ltemewg',6,NULL,0),(1567,'nujduc33',6,NULL,0),(1566,'5v7pifx4',6,NULL,0),(1565,'f6m6prmu',6,NULL,0),(1564,'s8h82pl1',6,NULL,0),(1563,'7ewe0osa',6,NULL,0),(1562,'461t5ur8',6,NULL,0),(1561,'8jao9qdy',6,NULL,0),(1560,'sjukd9te',6,NULL,0),(1559,'2q8u9o9c',6,NULL,0),(1558,'svhx0e9s',6,NULL,0),(1557,'ud190nck',6,NULL,0),(1556,'9ffoj6tt',6,NULL,0),(1555,'sxnggjmt',6,NULL,0),(1554,'h6iqkrbf',6,NULL,0),(1553,'bm15t3rp',6,NULL,0),(1552,'mvesffrz',6,NULL,0),(1551,'xeh81otx',6,NULL,0),(1550,'kt8nslkv',6,NULL,0),(1549,'desocphx',6,NULL,0),(1548,'qg5x5wgj',6,NULL,0),(1547,'2j614wjs',6,NULL,0),(1546,'dgt62glo',6,NULL,0),(1545,'6gcce9e2',6,NULL,0),(1544,'s1jhwfex',6,NULL,0),(1543,'jq93h8xq',6,NULL,0),(1542,'lw9dj8cr',6,NULL,0),(1541,'aykctasw',6,NULL,0),(1540,'e1a68wir',6,NULL,0),(1539,'uykmpuxv',6,NULL,0),(1538,'nqbukbq8',6,NULL,0),(1537,'be2wn9i7',6,NULL,0),(1536,'lku7lzvw',6,NULL,0),(1535,'vxj0b9kz',6,NULL,0),(1534,'qa7rpp1p',6,NULL,0),(1533,'uvhdxndo',6,NULL,0),(1532,'2g65kj11',6,NULL,0),(1531,'d8r49d9l',6,NULL,0),(1530,'3j2iz8kq',6,NULL,0),(1529,'wiceae1k',6,NULL,0),(1528,'36xuw6qa',6,NULL,0),(1527,'7drqhm5n',6,NULL,0),(1526,'feznxn64',6,NULL,0),(1525,'6rayl8lz',6,NULL,0),(1524,'481mnm2t',6,NULL,0),(1523,'tm4mfgw5',6,NULL,0),(1522,'al0aq8nx',6,NULL,0),(1521,'p29v2lhh',6,NULL,0),(1520,'a9m0e9rm',6,NULL,0),(1519,'af6xtgxj',6,NULL,0),(1518,'n84dzarg',6,NULL,0),(1517,'e8ejz0m8',6,NULL,0),(1516,'9c6vcsex',6,NULL,0),(1515,'3ohmdstw',6,NULL,0),(1514,'tnpcnjqz',6,NULL,0),(1513,'bmpuu806',6,NULL,0),(1512,'jvipcf16',6,NULL,0),(1511,'4twy63lj',6,NULL,0),(1510,'1nc47kju',6,NULL,0),(1509,'etpfp4v5',6,NULL,0),(1508,'stz0gvvu',6,NULL,0),(1507,'67puz0vi',6,NULL,0),(1506,'jgrnommx',6,NULL,0),(1505,'mw0hymnn',6,NULL,0),(1504,'pj68g69o',6,NULL,0),(1503,'bzy9jnoi',6,NULL,0),(1502,'k07dbuv6',6,NULL,0),(1501,'dgkyo010',6,NULL,0),(1500,'t2fgpkc4',6,NULL,0),(1499,'1zhgq3yx',6,NULL,0),(1498,'7f9b4t9v',6,NULL,0),(1497,'f572ihu6',6,NULL,0),(1496,'wgreeka3',6,NULL,0),(1495,'vl4q1evx',6,NULL,0),(1494,'f8596evb',6,NULL,0),(1493,'ho4zfjh7',6,NULL,0),(1492,'qa70fw44',6,NULL,0),(1491,'f50xn9v1',6,NULL,0),(1490,'yd7x670b',6,NULL,0),(1489,'wbqfulpi',6,NULL,0),(1488,'bhy4er9z',6,NULL,0),(1487,'75pt4512',6,NULL,0),(1486,'n7m0vhkf',6,NULL,0),(1485,'s9r5ja15',6,NULL,0),(1484,'9amxeuoq',6,NULL,0),(1483,'f0rmwstf',6,NULL,0),(1482,'evw23916',6,NULL,0),(1481,'l3t8q1m2',6,NULL,0),(1480,'h4a0xm5o',6,NULL,0),(1479,'d3efnxc8',6,NULL,0),(1478,'tgfx7z6u',6,NULL,0),(1477,'30tok61i',6,NULL,0),(1476,'hkpopgl8',6,NULL,0),(1475,'oi16kogs',6,NULL,0),(1474,'jahek0zu',6,NULL,0),(1473,'q44vqcmn',6,NULL,0),(1472,'vxxtok70',6,NULL,0),(1471,'un5265hx',6,NULL,0),(1470,'hhryf0yr',6,NULL,0),(1469,'652fu651',6,NULL,0),(1468,'7aotxfbv',6,NULL,0),(1467,'guil8mv4',6,NULL,0),(1466,'if6jnit6',6,NULL,0),(1465,'9ot7a2xn',6,NULL,0),(1464,'t7gj1mzm',6,NULL,0),(1463,'4qphmwfg',6,NULL,0),(1462,'9h4t76kz',6,NULL,0),(1461,'jnwno600',6,NULL,0),(1460,'bjuqj06b',6,NULL,0),(1459,'tj7m2spz',6,NULL,0),(1458,'c3jyo7q6',6,NULL,0),(1457,'4jrvcul6',6,NULL,0),(1456,'6djlxs9g',6,NULL,0),(1455,'xld7urdv',6,NULL,0),(1454,'2kip1zlk',6,NULL,0),(1453,'e8bsah3o',6,NULL,0),(1452,'yf6n7afb',6,NULL,0),(1451,'lzlijue2',6,NULL,0),(1450,'6muvv979',6,NULL,0),(1449,'d68t0739',6,NULL,0),(1448,'6vgawupo',6,NULL,0),(1447,'hze3r5yv',6,NULL,0),(1446,'xciboctn',6,NULL,0),(1445,'8fwg1a3x',6,NULL,0),(1444,'98i8ktjz',6,NULL,0),(1443,'5w94jt7u',6,NULL,0),(1442,'lnfllx1o',6,NULL,0),(1441,'64gohnzj',6,NULL,0),(1440,'oqbw0t8x',6,NULL,0),(1439,'yvtnhxpx',6,NULL,0),(1438,'qwjzit5a',6,NULL,0),(1437,'508s2xib',6,NULL,0),(1436,'ymmvcioi',6,NULL,0),(1435,'j9d80lk8',6,NULL,0),(1434,'40trcrn6',6,NULL,0),(1433,'2n6y5qua',6,NULL,0),(1432,'uz2portu',6,NULL,0),(1431,'52b6po3q',6,NULL,0),(1430,'qht3hgrh',6,NULL,0),(1429,'5nwdjc4m',6,NULL,0),(1428,'xd6vmx4y',6,NULL,0),(1427,'wrl38idt',6,NULL,0),(1426,'sp7u51vz',6,NULL,0),(1425,'aj08k8pp',6,NULL,0),(1424,'ywbwe885',6,NULL,0),(1423,'opq5qizb',6,NULL,0),(1422,'vguuojwl',6,NULL,0),(1421,'t93pwnfw',6,NULL,0),(1420,'7mbpejqc',6,NULL,0),(1419,'ekga502k',6,NULL,0),(1418,'w5mda0ti',6,NULL,0),(1417,'bsb3fne7',6,NULL,0),(1416,'ny4ygavy',6,NULL,0),(1415,'8jrb684z',6,NULL,0),(1414,'8v9w7l58',6,NULL,0),(1413,'jr0sd8go',6,NULL,0),(1412,'tg2pye6s',6,NULL,0),(1411,'clasjc7c',6,NULL,0),(1410,'n2mla9lc',6,NULL,0),(1409,'4kcu33ze',6,NULL,0),(1408,'j4abfzqc',6,NULL,0),(1407,'w4zlgfq1',6,NULL,0),(1406,'ms8ndj34',6,NULL,0),(1405,'bsgzgd2v',6,NULL,0),(1404,'uw7m0gjp',6,NULL,0),(1403,'of10c2al',6,NULL,0),(1402,'kgejotyn',6,NULL,0),(1401,'oxqw2exm',6,NULL,0),(1400,'cy6w57iv',6,NULL,0),(1399,'fy3zhxpg',6,NULL,0),(1398,'zkqf8tmr',6,NULL,0),(1397,'qb02pbk1',6,NULL,0),(1396,'qz0im4i6',6,NULL,0),(1395,'p61c22b7',6,NULL,0),(1394,'e0rctqrb',6,NULL,0),(1393,'9d2g9j4v',6,NULL,0),(1392,'jghrn66g',6,NULL,0),(1391,'cquplvle',6,NULL,0),(1390,'idi12c1i',6,NULL,0),(1389,'kw7l8azw',6,NULL,0),(1388,'1nmjwdiq',6,NULL,0),(1387,'h25e11j6',6,NULL,0),(1386,'1f59icwz',6,NULL,0),(1385,'q9ebn6gh',6,NULL,0),(1384,'7ivfimmo',6,NULL,0),(1383,'fin1gpev',6,NULL,0),(1382,'ggvb5ao9',6,NULL,0),(1381,'bplragow',6,NULL,0),(1380,'rec4ssfb',6,NULL,0),(1379,'s98yr9hc',6,NULL,0),(1378,'49pgmnyn',6,NULL,0),(1377,'nyg5j5fy',6,NULL,0),(1376,'zx7z0g28',6,NULL,0),(1375,'uaxl8a6e',6,NULL,0),(1374,'d6mzkp68',6,NULL,0),(1373,'tkae1gls',6,NULL,0),(1372,'1cxw7ww9',6,NULL,0),(1371,'w9865qsg',6,NULL,0),(1370,'7zd26jwb',6,NULL,0),(1369,'qvniralm',6,NULL,0),(1368,'3hpd51l8',6,NULL,0),(1367,'bdpwd4xl',6,NULL,0),(1366,'5mh2uj5v',6,NULL,0),(1365,'gr3176lu',6,NULL,0),(1364,'8vaku8qz',6,NULL,0),(1363,'jq0way8v',6,NULL,0),(1362,'7mi9jb87',6,NULL,0),(1361,'8k6ryw53',6,NULL,0),(1360,'wlp99f0r',6,NULL,0),(1359,'h62zpw3e',6,NULL,0),(1358,'z5xs9l1u',6,NULL,0),(1357,'6bs4vpsz',6,NULL,0),(1356,'gfo9s7ed',6,NULL,0),(1355,'ymx20shz',6,NULL,0),(1354,'zsv8scm7',6,NULL,0),(1353,'zdy3vojb',6,NULL,0),(1352,'ne41yczn',6,NULL,0),(1351,'x81aqaeb',6,NULL,0),(1350,'nkcfav2v',6,NULL,0),(1349,'nqevhqgl',6,NULL,0),(1348,'qhtygzll',6,NULL,0),(1347,'lwst8eqs',6,NULL,0),(1346,'xmx5tfwv',6,NULL,0),(1345,'6jqmngg5',6,NULL,0),(1344,'7y9jesyh',6,NULL,0),(1343,'ozgbmevh',6,NULL,0),(1342,'ujpll4mr',6,NULL,0),(1341,'h295fasr',6,NULL,0),(1340,'rk2u402y',6,NULL,0),(1339,'6671a31l',6,NULL,0),(1338,'77i2zxst',6,NULL,0),(1337,'jicd7wzd',6,NULL,0),(1336,'b3xti14h',6,NULL,0),(1335,'85txduc6',6,NULL,0),(1334,'a3hzzpu1',6,NULL,0),(1333,'3v1jokw0',6,NULL,0),(1332,'pjb70g15',6,NULL,0),(1331,'7ctj5l7q',6,NULL,0),(1330,'at9xa56p',6,NULL,0),(1329,'pv6mzv04',6,NULL,0),(1328,'9nqvdkpl',6,NULL,0),(1327,'ivrpmjtp',6,NULL,0),(1326,'cgccyp8a',6,NULL,0),(1325,'sw92zdew',6,NULL,0),(1324,'7ybmpdsj',6,NULL,0),(1323,'4817vxt1',6,NULL,0),(1322,'14gpzn9n',6,NULL,0),(1321,'tzsiblmk',6,NULL,0),(1320,'iewk9rxd',6,NULL,0),(1319,'qoz5v79y',6,NULL,0),(1318,'r36ac7gm',6,NULL,0),(1317,'xwzz7yl5',6,NULL,0),(1316,'25ewo47l',6,NULL,0),(1315,'wpj1wg4n',6,NULL,0),(1314,'iusdmjlj',6,NULL,0),(1313,'z7u3a3ms',6,NULL,0),(1312,'84kmdo2w',6,NULL,0),(1311,'t5w9ft5x',6,NULL,0),(1310,'9ygjoegd',6,NULL,0),(1309,'q59f65dr',6,NULL,0),(1308,'hzqpjzb0',6,NULL,0),(1307,'svam7up9',6,NULL,0),(1306,'55xo77yh',6,NULL,0),(1305,'l9ywvjlu',6,NULL,0),(1304,'qg4in50a',6,NULL,0),(1303,'vdqy2t72',6,NULL,0),(1302,'2fycf5rd',6,NULL,0),(1301,'qe5ygcnj',6,NULL,0),(1300,'n2o26z1u',6,NULL,0),(1299,'wkrxj4wg',6,NULL,0),(1298,'b8lj6bgy',6,NULL,0),(1297,'ng47hb6v',6,NULL,0),(1296,'ztqa40jw',6,NULL,0),(1295,'l7oh752o',6,NULL,0),(1294,'iym77grt',6,NULL,0),(1293,'chl6al4h',6,NULL,0),(1292,'s3k9i71y',6,NULL,0),(1291,'c1i6hcgm',6,NULL,0),(1290,'te3kyct7',6,NULL,0),(1289,'56e460ia',6,NULL,0),(1288,'tbgknykf',6,NULL,0),(1287,'6j24wlyj',6,NULL,0),(1286,'yw9ee3k5',6,NULL,0),(1285,'god3biy4',6,NULL,0),(1284,'qkrq62tj',6,NULL,0),(1283,'gguhbacn',6,NULL,0),(1282,'if6s0b39',6,NULL,0),(1281,'3uo7ltz0',6,NULL,0),(1280,'6a80bf30',6,NULL,0),(1279,'vioasgj0',6,NULL,0),(1278,'hvkgl8kj',6,NULL,0),(1277,'6pvymjsi',6,NULL,0),(1276,'bslo5ylg',6,NULL,0),(1275,'2cieth66',6,NULL,0),(1274,'rz4ktzlj',6,NULL,0),(1273,'qegm92ez',6,NULL,0),(1272,'8rhe6ym7',6,NULL,0),(1271,'halpjbw8',6,NULL,0),(1270,'s5rsnwvv',6,NULL,0),(1269,'64g9zukd',6,NULL,0),(1268,'auf7mxbj',6,NULL,0),(1267,'tgzee61m',6,NULL,0),(1266,'fh646leg',6,NULL,0),(1265,'iuvjhemh',6,NULL,0),(1264,'wgy75zcc',6,NULL,0),(1263,'1dmu0y4r',6,NULL,0),(1262,'61bhgit2',6,NULL,0),(1261,'7er7po9v',6,NULL,0),(1260,'e4l9eyol',6,NULL,0),(1259,'c3fp7zsn',6,NULL,0),(1258,'ey04jfx2',6,NULL,0),(1257,'mzeyyzft',6,NULL,0),(1256,'xs8h25ew',6,NULL,0),(1255,'d561f9ww',6,NULL,0),(1254,'mzpe180x',6,NULL,0),(1253,'6t10rk3m',6,NULL,0),(1252,'58uxmddd',6,NULL,0),(1251,'osqfspcu',6,NULL,0),(1250,'7d5qygca',6,NULL,0),(1249,'4hn20bpv',6,NULL,0),(1248,'oj4oqugo',6,NULL,0),(1247,'hcpi10un',6,NULL,0),(1246,'qd80f3wj',6,NULL,0),(1245,'7o9648dt',6,NULL,0),(1244,'y8nqa4ny',6,NULL,0),(1243,'aegsx7cw',6,NULL,0),(1242,'lcotr7hp',6,NULL,0),(1241,'oaqktqg8',6,NULL,0),(1240,'8gcfhjta',6,NULL,0),(1239,'9izt551s',6,NULL,0),(1238,'ugvxwpyo',6,NULL,0),(1237,'n2nfjh28',6,NULL,0),(1236,'su70x9ey',6,NULL,0),(1235,'mbgbah4n',6,NULL,0),(1234,'qf2zksq0',6,NULL,0),(1233,'64gqokh9',6,NULL,0),(1232,'o6cghy7e',6,NULL,0),(1231,'yfokyzki',6,NULL,0),(1230,'8lgxct9v',6,NULL,0),(1229,'zqv7oqm1',6,NULL,0),(1228,'4kxfr1r4',6,NULL,0),(1227,'i2703ngw',6,NULL,0),(1226,'3jtfeets',6,NULL,0),(1225,'xv93c7ui',6,NULL,0),(1224,'iv2zzpci',6,NULL,0),(1223,'nuidih1b',6,NULL,0),(1222,'mxwj45aq',6,NULL,0),(1221,'s9q81nt1',6,NULL,0),(1220,'4axopvvd',6,NULL,0),(1219,'gluzfw4d',6,NULL,0),(1218,'r0jka3lv',6,NULL,0),(1217,'tif8pswd',6,NULL,0),(1216,'m4bj07za',6,NULL,0),(1215,'8wwopsda',6,NULL,0),(1214,'6oh3j5qq',6,NULL,0),(1213,'28tevm6h',6,NULL,0),(1212,'r1mjgx04',6,NULL,0),(1211,'ydo23hec',6,NULL,0),(1210,'dwe0bllk',6,NULL,0),(1209,'b3y3j1r0',6,NULL,0),(1208,'17u40wpq',6,NULL,0),(1207,'ajh4paf8',6,NULL,0),(1206,'8zu1fp3q',6,NULL,0),(1205,'d220ga3d',6,NULL,0),(1204,'obyvu2v5',6,NULL,0),(1203,'bwr4n0fs',6,NULL,0),(1202,'twcw5he1',6,NULL,0),(1201,'eicxbffl',6,NULL,0),(1200,'88acuzbp',6,NULL,0),(1199,'dj4qo6nx',6,NULL,0),(1198,'nx4u613m',6,NULL,0),(1197,'5x0ll7uu',6,NULL,0),(1196,'e9bhirrg',6,NULL,0),(1195,'d8q89aj4',6,NULL,0),(1194,'p49ktru2',6,NULL,0),(1193,'29zodaym',6,NULL,0),(1192,'3mdlqowu',6,NULL,0),(1191,'9c2adz4u',6,NULL,0),(1190,'4orgqgmg',6,NULL,0),(1189,'ugzvxq45',6,NULL,0),(1188,'pt4lnlei',6,NULL,0),(1187,'zuijzjkn',6,NULL,0),(1186,'kucev8h5',6,NULL,0),(1185,'gq6iognu',6,NULL,0),(1184,'w0st5x46',6,NULL,0),(1183,'gjdblcme',6,NULL,0),(1182,'372rrqri',6,NULL,0),(1181,'nj7h0gt6',6,NULL,0),(1180,'ccyrijcx',6,NULL,0),(1179,'rea286sf',6,NULL,0),(1178,'qc7dkg44',6,NULL,0),(1177,'q1im6vbh',6,NULL,0),(1176,'fsjfnbuk',6,NULL,0),(1175,'zz89zuy5',6,NULL,0),(1174,'x4iez7mv',6,NULL,0),(1173,'bappxg19',6,NULL,0),(1172,'yfk4zpeb',6,NULL,0),(1171,'55v6exd5',6,NULL,0),(1170,'vndt8ul0',6,NULL,0),(1169,'o6r8fxi8',6,NULL,0),(1168,'1okt14qp',6,NULL,0),(1167,'j12xpvx7',6,NULL,0),(1166,'g84c9eyz',6,NULL,0),(1165,'legmn2ic',6,NULL,0),(1164,'dmg1fuc0',6,NULL,0),(1163,'amwdqh6g',6,NULL,0),(1162,'u3mktrek',6,NULL,0),(1161,'xs1cd5hs',6,NULL,0),(1160,'yuamb3tc',6,NULL,0),(1159,'4rmzcu9q',6,NULL,0),(1158,'celyy1u2',6,NULL,0),(1157,'dn8dwati',6,NULL,0),(1156,'7hoz0mxi',6,NULL,0),(1155,'vumwifzn',6,NULL,0),(1154,'zzlm8o5p',6,NULL,0),(1153,'q14n60oq',6,NULL,0),(1152,'j65sfnya',6,NULL,0),(1151,'d8csk8p7',6,NULL,0),(1150,'l6zm42ef',6,NULL,0),(1149,'wcf7ync1',6,NULL,0),(1148,'2flsce95',6,NULL,0),(1147,'4fuc8tpt',6,NULL,0),(1146,'ue6x58q2',6,NULL,0),(1145,'yq9hpmnq',6,NULL,0),(1144,'oj9i0adp',6,NULL,0),(1143,'38wpzhgw',6,NULL,0),(1142,'42djgr6g',6,NULL,0),(1141,'7xpkx5r6',6,NULL,0),(1140,'l5ew1fxt',6,NULL,0),(1139,'9wa6xdkp',6,NULL,0),(1138,'i2xxcqsj',6,NULL,0),(1137,'d4cxb4lg',6,NULL,0),(1136,'z3osj0mf',6,NULL,0),(1135,'f4z4xe2i',6,NULL,0),(1134,'wlpi6jrs',6,NULL,0),(1133,'xkh38m4b',6,NULL,0),(1132,'r990fobr',6,NULL,0),(1131,'b54mlki2',6,NULL,0),(1130,'o7wu1571',6,NULL,0),(1129,'qm1991wr',6,NULL,0),(1128,'n1xlp2k6',6,NULL,0),(1127,'s62mwyey',6,NULL,0),(1126,'rr3lyyl6',6,NULL,0),(1125,'5vmua7u8',6,NULL,0),(1124,'h4yjmqt1',6,NULL,0),(1123,'1ga3ki3c',6,NULL,0),(1122,'b46h3lx3',6,NULL,0),(1121,'fwgp6jy7',6,NULL,0),(1120,'vch23vmw',6,NULL,0),(1119,'9quvy1pj',6,NULL,0),(1118,'tch7wv6a',6,NULL,0),(1117,'f4mm27iq',6,NULL,0),(1116,'4xp0gzvz',6,NULL,0),(1115,'x1z4lofb',6,NULL,0),(1114,'aea23gki',6,NULL,0),(1113,'vwwl1kpv',6,NULL,0),(1112,'csyhqwlz',6,NULL,0),(1111,'ykzstord',6,NULL,0),(1110,'5s7gbbdj',6,NULL,0),(1109,'s76leotk',6,NULL,0),(1108,'2utv1zta',6,NULL,0),(1107,'72ax2pxl',6,NULL,0),(1106,'lx69k0bq',6,NULL,0),(1105,'s5k55yfz',6,NULL,0),(1104,'cgyx7wzt',6,NULL,0),(1103,'su4l1p13',6,NULL,0),(1102,'slzl5zai',6,NULL,0),(1101,'5ez8zl9d',6,NULL,0),(1100,'ktp2r0xc',6,NULL,0),(1099,'u2tgs1xi',6,NULL,0),(1098,'w5uih18v',6,NULL,0),(1097,'2uppgfrz',6,NULL,0),(1096,'38xxztgw',6,NULL,0),(1095,'se1sekcz',6,NULL,0),(1094,'x6advzjr',6,NULL,0),(1093,'kjehk4xt',6,NULL,0),(1092,'xry79px6',6,NULL,0),(1091,'lk8jqds6',6,NULL,0),(1090,'jd4zlouz',6,NULL,0),(1089,'abtpi87m',6,NULL,0),(1088,'q0eay61h',6,NULL,0),(1087,'qlrjyrd7',6,NULL,0),(1086,'5aww7s13',6,NULL,0),(1085,'2802givy',6,NULL,0),(1084,'idiu10zf',6,NULL,0),(1083,'apsw7rvn',6,NULL,0),(1082,'s2ghojt0',6,NULL,0),(1081,'45qo493m',6,NULL,0),(1080,'ehrxmx9h',6,NULL,0),(1079,'nk9d7fg7',6,NULL,0),(1078,'pdrm877y',6,NULL,0),(1077,'8ep5te93',6,NULL,0),(1076,'7nbfqn3d',6,NULL,0),(1075,'ew5girgi',6,NULL,0),(1074,'vs6tea9h',6,NULL,0),(1073,'j1ecfaos',6,NULL,0),(1072,'5bjh2e5t',6,NULL,0),(1071,'tjaz9jxd',6,NULL,0),(1070,'be1r85gx',6,NULL,0),(1069,'vjin8vg8',6,NULL,0),(1068,'ttojce81',6,NULL,0),(1067,'ffvaoig9',6,NULL,0),(1066,'p1x0ziai',6,NULL,0),(1065,'8t8sjuvr',6,NULL,0),(1064,'gqs69fzn',6,NULL,0),(1063,'glld2ebx',6,NULL,0),(1062,'mibu3wrl',6,NULL,0),(1061,'7sh5udwf',6,NULL,0),(1060,'iz3qgdrn',6,NULL,0),(1059,'9aeielj0',6,NULL,0),(1058,'c5sslqv5',6,NULL,0),(1057,'yuwbgkze',6,NULL,0),(1056,'a0rmfrh4',6,NULL,0),(1055,'rc71mmiu',6,NULL,0),(1054,'us9e8zw0',6,NULL,0),(1053,'d2okx0yz',6,NULL,0),(1052,'85knwmhs',6,NULL,0),(1051,'1aa97v22',6,NULL,0),(1050,'ttxn1aqc',6,NULL,0),(1049,'guqwczi9',6,NULL,0),(1048,'e9vn6yq6',6,NULL,0),(1047,'8fftrbg4',6,NULL,0),(1046,'w9klqsva',6,NULL,0),(1045,'ebuo51y7',6,NULL,0),(1044,'qg5oizrg',6,NULL,0),(1043,'onde3ygx',6,NULL,0),(1042,'u5p9iytv',6,NULL,0),(1041,'zh1cr4ov',6,NULL,0),(1040,'saejfxoq',6,NULL,0),(1039,'ly28uwsa',6,NULL,0),(1038,'mxer46qx',6,NULL,0),(1037,'3rhqfnfh',6,NULL,0),(1036,'mhcgwqr8',6,NULL,0),(1035,'dl7t2ybw',6,NULL,0),(1034,'5aii59jz',6,NULL,0),(1033,'w4c6drr0',6,NULL,0),(1032,'7b6b3oqi',6,NULL,0),(1031,'d500b3iw',6,NULL,0),(1030,'yyccot8n',6,NULL,0),(1029,'4vzhna70',6,NULL,0),(1028,'d8nprifr',6,NULL,0),(1027,'q6ueemqg',6,NULL,0),(1026,'d5ettsq3',6,NULL,0),(1025,'31glfeyl',6,NULL,0),(1024,'5bebwlf3',6,NULL,0),(1023,'nw9hkdx2',6,NULL,0),(1022,'o2oqq7kq',6,NULL,0),(1021,'fwkbcoic',6,NULL,0),(1020,'2hvec26g',6,NULL,0),(1019,'m5t5387t',6,NULL,0),(1018,'3uhuxjub',6,NULL,0),(1017,'adgzx8xh',6,NULL,0),(1016,'8bvvek1s',6,NULL,0),(1015,'y6lsjskt',6,NULL,0),(1014,'s4qhe2o7',6,NULL,0),(1013,'ftq5qecw',6,NULL,0),(1012,'ek8l5g78',6,NULL,0),(1011,'ykdoqlfs',6,NULL,0),(1010,'69cd86dq',6,NULL,0),(1009,'fx3dm032',6,NULL,0),(1008,'5queamcc',6,NULL,0),(2006,'eudt5m11',6,NULL,0),(2007,'rkl0kkjl',6,NULL,0),(2008,'asdadd',6,NULL,0);

UNLOCK TABLES;

/*Table structure for table `master_manage` */

DROP TABLE IF EXISTS `master_manage`;

CREATE TABLE `master_manage` (
  `wId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '站务表id',
  `wName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站务表名称',
  `wAuthor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站务表作者',
  `wTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '站务表更改时间',
  `wCentent` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站务表内容',
  PRIMARY KEY (`wId`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `master_manage` */

LOCK TABLES `master_manage` WRITE;

insert  into `master_manage`(`wId`,`wName`,`wAuthor`,`wTime`,`wCentent`) values (6,'伟大','打','2016-11-12 15:45:07','<img src=\"http://cdn.hinplay.com/static/uploads/file/20161112/93282c6862df4d7cbd49b3ca6dda40f4.jpg\" alt=\"\" /><br /><span style=\"font-size:18px;\"></span>'),(14,'dasdad','adadasda','2016-11-06 22:52:28','<em><span style=\"background-color:#FF9900;\">dasdadasdadad</span></em>'),(15,'dsadad','dasdad','2016-11-06 23:17:39','<em><span style=\"background-color:#FF9900;\">dasdadasdadad</span></em>'),(16,'dsadad','dasdad','2016-11-06 23:18:22','<em><span style=\"background-color:#FF9900;\">dasdadasdadad</span></em>'),(17,'dsadad','dsaDADa','2016-11-06 23:31:58','<em><span style=\"background-color:#FF9900;\">dasdadasdadad</span></em>'),(18,'131','313','2016-11-08 22:46:49','<table style=\"width:100%;\" cellpadding=\"2\" cellspacing=\"0\" border=\"1\" bordercolor=\"#000000\"><tbody><tr><td><br /></td><td><br /></td></tr><tr><td><br /></td><td><br /></td></tr><tr><td><br /></td><td><br /></td></tr></tbody></table><br />'),(19,'1231','3213132','2016-11-12 14:20:59','<img src=\"http://cdn.hinplay.com/static/uploads/file/20161112/93282c6862df4d7cbd49b3ca6dda40f4.jpg\" alt=\"\" /><br /><img src=\"http://cdn.hinplay.com/static/uploads/file/20161112/fc2f7afb7aa64347b5660671434b41ef.jpg\" alt=\"\" /><br /><img src=\"http://cdn.hinplay.com/static/uploads/file/20161112/c1f2ef4878c2459e9c303ff82c5f02a6.jpg\" alt=\"\" /><br /><img src=\"http://cdn.hinplay.com/static/uploads/file/20161112/6cb55488dadc472fb9ac2d33bb8b6f5c.jpg\" alt=\"\" /><br />'),(20,'dsadaddasasdad','sadadsad','2016-11-12 15:31:13','<img src=\"http://cdn.hinplay.com/static/uploads/images/20161112/fbcde38d7d494bf7adf01d2295536b74.jpg\" alt=\"\" />');

UNLOCK TABLES;

/*Table structure for table `picture_manage` */

DROP TABLE IF EXISTS `picture_manage`;

CREATE TABLE `picture_manage` (
  `pId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `pName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片名字',
  `pSize` bigint(20) NOT NULL COMMENT '图片大小',
  `isShow` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示1为显示，0为不显示，默认显示',
  `urlPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片url',
  `ossKey` varchar(255) NOT NULL DEFAULT '' COMMENT '阿里云oss的key',
  `pType` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片类型如：jpg、png',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图片创建时间',
  PRIMARY KEY (`pId`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `picture_manage` */

LOCK TABLES `picture_manage` WRITE;

insert  into `picture_manage`(`pId`,`pName`,`pSize`,`isShow`,`urlPath`,`ossKey`,`pType`,`createTime`) values (50,'slide_2.jpg',116373,1,'http://cdn.hinplay.com/static/uploads/images/20161112/fbcde38d7d494bf7adf01d2295536b74.jpg','static/uploads/images/20161112/fbcde38d7d494bf7adf01d2295536b74.jpg','jpg','2016-11-12 15:27:41'),(48,'slide_3.jpg',97404,1,'http://cdn.hinplay.com/static/uploads/images/20161113/79100c03107b4f5da3d375531bfd1f8f.jpg','static/uploads/images/20161113/79100c03107b4f5da3d375531bfd1f8f.jpg','jpg','2016-11-13 14:38:54'),(47,'slide_2.jpg',116373,1,'http://cdn.hinplay.com/static/uploads/images/20161113/ec43fbfc8458434c97e6d8b092fffabc.jpg','static/uploads/images/20161113/ec43fbfc8458434c97e6d8b092fffabc.jpg','jpg','2016-11-13 14:39:06'),(46,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161113/e9992472a26b4b67909f1200f9aacb16.jpg','static/uploads/images/20161113/e9992472a26b4b67909f1200f9aacb16.jpg','jpg','2016-11-13 14:39:16'),(45,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161112/3c62b8af3849440abad2e047fb52e08c.jpg','static/uploads/images/20161112/3c62b8af3849440abad2e047fb52e08c.jpg','jpg','2016-11-12 14:20:22'),(44,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161112/959c5e40a70e49fb95be24bc28a742b7.jpg','static/uploads/images/20161112/959c5e40a70e49fb95be24bc28a742b7.jpg','jpg','2016-11-12 14:17:06'),(43,'slide_4.jpg',92137,1,'http://cdn.hinplay.com/static/uploads/images/20161108/87e14456681b49bc8276e82d4ef51c5b.jpg','static/uploads/images/20161108/87e14456681b49bc8276e82d4ef51c5b.jpg','jpg','2016-11-08 22:25:44'),(42,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161108/6ad6a7072a274b1ca8acd0096a497c89.jpg','static/uploads/images/20161108/6ad6a7072a274b1ca8acd0096a497c89.jpg','jpg','2016-11-08 22:25:43'),(41,'slide_2.jpg',116373,1,'http://cdn.hinplay.com/static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg','static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg','jpg','2016-11-08 22:25:41'),(40,'slide_3.jpg',97404,1,'http://cdn.hinplay.com/static/uploads/images/20161108/a5779582e0af4386b430de6f9de42e2a.jpg','static/uploads/images/20161108/a5779582e0af4386b430de6f9de42e2a.jpg','jpg','2016-11-08 22:25:39'),(51,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161113/f100ea1bb2cd418f9636fa57394b9a70.jpg','static/uploads/images/20161113/f100ea1bb2cd418f9636fa57394b9a70.jpg','jpg','2016-11-13 14:39:27'),(52,'slide_3.jpg',97404,1,'http://cdn.hinplay.com/static/uploads/images/20161112/7a5694169bbc4da4bf4558f5c5c33e1c.jpg','static/uploads/images/20161112/7a5694169bbc4da4bf4558f5c5c33e1c.jpg','jpg','2016-11-12 21:34:01'),(53,'slide_3.jpg',97404,1,'http://cdn.hinplay.com/static/uploads/images/20161113/418b52af3da24778848274cf8085de33.jpg','static/uploads/images/20161113/418b52af3da24778848274cf8085de33.jpg','jpg','2016-11-13 14:36:27'),(54,'slide_2.jpg',116373,1,'http://cdn.hinplay.com/static/uploads/images/20161113/e9ca9a1e576e4b55bd057b38ec64f105.jpg','static/uploads/images/20161113/e9ca9a1e576e4b55bd057b38ec64f105.jpg','jpg','2016-11-13 14:36:28'),(55,'slide_4.jpg',92137,1,'http://cdn.hinplay.com/static/uploads/images/20161113/f02a69875e2f4e2b973dde69e9f8b4b7.jpg','static/uploads/images/20161113/f02a69875e2f4e2b973dde69e9f8b4b7.jpg','jpg','2016-11-13 14:36:31'),(56,'slide_1.jpg',149751,1,'http://cdn.hinplay.com/static/uploads/images/20161113/201f3b8d01444247883be9881c93b838.jpg','static/uploads/images/20161113/201f3b8d01444247883be9881c93b838.jpg','jpg','2016-11-13 14:36:31');

UNLOCK TABLES;

/*Table structure for table `slide_manage` */

DROP TABLE IF EXISTS `slide_manage`;

CREATE TABLE `slide_manage` (
  `sId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '幻灯片id',
  `sName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '幻灯片名字',
  `sImage` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片路径',
  `sUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '幻灯片链接地址',
  `sOrder` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片顺序',
  `sType` int(1) NOT NULL DEFAULT '0' COMMENT '幻灯片类型，默认为0,0为首页幻灯片',
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `slide_manage` */

LOCK TABLES `slide_manage` WRITE;

insert  into `slide_manage`(`sId`,`sName`,`sImage`,`sUrl`,`sOrder`,`sType`) values (5,'带撒大大','http://cdn.hinplay.com/static/uploads/images/20161108/14208319061b468c8cef832e46f901b9.jpg','http://blog.csdn.net',3,0),(6,'dadad','http://cdn.hinplay.com/static/uploads/images/20161108/6ad6a7072a274b1ca8acd0096a497c89.jpg','http://blog.csdn.net/kingzone_2008/article/details/8444678',9,0);

UNLOCK TABLES;

/*Table structure for table `users_info` */

DROP TABLE IF EXISTS `users_info`;

CREATE TABLE `users_info` (
  `uId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uSex` int(1) NOT NULL DEFAULT '0' COMMENT '用户性别0为未知，1为男，2为女',
  `uName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户昵称',
  `uAvatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户头像路径',
  `uRegTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户注册时间',
  `uLastLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户最后一次登陆，首次注册就是注册时间',
  `uType` int(1) NOT NULL DEFAULT '0' COMMENT '登陆类型0普通登陆，1qq登陆，2微博登陆，3微信登陆',
  PRIMARY KEY (`uId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `users_info` */

LOCK TABLES `users_info` WRITE;

UNLOCK TABLES;

/*Table structure for table `users_local` */

DROP TABLE IF EXISTS `users_local`;

CREATE TABLE `users_local` (
  `uId` int(11) unsigned NOT NULL COMMENT '用户id',
  `uPhone` char(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户手机',
  `uPwd` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户密码',
  `uEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户邮箱',
  KEY `uId` (`uId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `users_local` */

LOCK TABLES `users_local` WRITE;

UNLOCK TABLES;

/*Table structure for table `users_oauth` */

DROP TABLE IF EXISTS `users_oauth`;

CREATE TABLE `users_oauth` (
  `uId` int(11) unsigned NOT NULL COMMENT '会员id',
  `tokenId` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '授权令牌，Access_Token',
  `openId` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '第三方登陆的openid',
  `expiresIn` int(11) NOT NULL DEFAULT '0' COMMENT '第三方应用过期时间',
  KEY `uId` (`uId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `users_oauth` */

LOCK TABLES `users_oauth` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
