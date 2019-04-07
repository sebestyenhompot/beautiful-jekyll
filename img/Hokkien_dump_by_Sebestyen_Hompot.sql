CREATE DATABASE  IF NOT EXISTS `hokkien` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `hokkien`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hokkien
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_english` varchar(50) NOT NULL,
  `name_asianchar` varchar(50) DEFAULT NULL,
  `name_former` varchar(50) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Beijing','北京','Peking',2),(2,'Chiayi','嘉義',NULL,12),(3,'Douliu','斗六',NULL,12),(4,'Guangzhou','廣州','Canton',2),(5,'Hong Kong','香港',NULL,3),(6,'Jakarta',NULL,'Batavia',4),(7,'Kowloon','九龍',NULL,3),(8,'Kuala Lumpur',NULL,NULL,7),(9,'Leiden',NULL,NULL,8),(10,'London',NULL,NULL,13),(11,'Macau','澳門',NULL,6),(12,'Madrid',NULL,NULL,11),(13,'Malacca',NULL,NULL,7),(14,'Manila',NULL,NULL,9),(15,'Osaka','大阪',NULL,5),(16,'Quanzhou','泉州','Chinchew, Choan-Chiu, Zayton',2),(17,'Shanghai','上海',NULL,2),(18,'Singapore','新加坡',NULL,10),(19,'Taichung','台中',NULL,12),(20,'Tainan','台南',NULL,12),(21,'Taipei','台北',NULL,12),(22,'Tenri','天理',NULL,5),(23,'Tokyo','東京',NULL,5),(24,'Xiamen','廈門','Amoy',2),(25,'Zhangzhou','漳州','Changchow, Chiang-Chiu, Chio Chiu',2);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_english` varchar(50) NOT NULL,
  `name_former` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Canada',NULL),(2,'China',NULL),(3,'Hong Kong (China)',NULL),(4,'Indonesia','Dutch East Indies'),(5,'Japan',NULL),(6,'Macau (China)',NULL),(7,'Malaysia','British Malaya'),(8,'Netherlands',NULL),(9,'Philippines',NULL),(10,'Singapore',NULL),(11,'Spain',NULL),(12,'Taiwan','Formosa'),(13,'United Kingdom',NULL),(14,'United States',NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missionary_societies`
--

DROP TABLE IF EXISTS `missionary_societies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `missionary_societies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `church` enum('Catholic','Protestant','other') DEFAULT NULL,
  `home_country` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_country` (`home_country`),
  CONSTRAINT `missionary_societies_ibfk_1` FOREIGN KEY (`home_country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missionary_societies`
--

LOCK TABLES `missionary_societies` WRITE;
/*!40000 ALTER TABLE `missionary_societies` DISABLE KEYS */;
INSERT INTO `missionary_societies` VALUES (1,'Canadian Presbyterian Mission','Protestant',1),(2,'Church of the Brethren','Protestant',NULL),(3,'English Presbyterian Mission','Protestant',13),(4,'London Missionary Society','Protestant',13),(5,'Reformed Church of America','Protestant',14),(6,'Scottish Presbyterian Mission','Protestant',13),(7,'Spanish Dominicans','Catholic',11),(8,'Spanish Jesuits','Catholic',11),(9,'Unspecified Protestant mission','Protestant',NULL);
/*!40000 ALTER TABLE `missionary_societies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_orig` varchar(255) NOT NULL,
  `name_asianchar` varchar(50) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `occupation` enum('interpreter','missionary','official','scholar','unspecified') DEFAULT NULL,
  `missionary_society` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nationality` (`nationality`),
  KEY `missionary_society` (`missionary_society`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`),
  CONSTRAINT `people_ibfk_2` FOREIGN KEY (`missionary_society`) REFERENCES `missionary_societies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Anonymous Chinese author',NULL,2,NULL,NULL),(2,'Anonymous Spanish Dominican missionary',NULL,11,'missionary',7),(3,'Barclay, Thomas','巴克禮',13,'missionary',3),(4,'Benavides, Miguel de',NULL,11,'missionary',7),(5,'Cai Peihuo','蔡培火 ',NULL,NULL,NULL),(6,'Cai Zhangji','蔡章機',12,NULL,NULL),(7,'Campbell, William','甘為霖',13,'missionary',6),(8,'Chen Chengfu','陳成福 ',NULL,NULL,NULL),(9,'Chen Fujin','沈富進 ',NULL,NULL,NULL),(10,'Chen Guanxue','陳冠學 ',NULL,NULL,NULL),(11,'Chen Jiade','陳嘉德 ',NULL,NULL,NULL),(12,'Chen Qingzhou','陳慶洲',NULL,NULL,NULL),(13,'Chen Xianguo','陳憲國 ',NULL,NULL,NULL),(14,'Chen Xiu','陳修 ',NULL,NULL,NULL),(15,'Chen Yuxun','陳宇勳 ',NULL,NULL,NULL),(16,'Chen Zhuxian','陳主顯 ',NULL,NULL,NULL),(17,'Chirino, Pedro',NULL,11,'missionary',8),(18,'Colomer, Ramon',NULL,NULL,'missionary',NULL),(19,'de Grijs, C. F. M. ',NULL,8,'scholar',NULL),(20,'de Pree, Henry P.',NULL,14,'missionary',5),(21,'Dong Fengzheng','董峰政 ',NULL,NULL,NULL),(22,'Doty, Elihu','羅啻',14,'missionary',5),(23,'Douglas, Carstairs ','杜嘉德',13,'missionary',3),(24,'Dyer, Samuel',NULL,13,'missionary',4),(25,'Embree, Bernard L. M. ',NULL,NULL,NULL,NULL),(26,'Er Shu\'an','二樹庵 ',NULL,NULL,NULL),(27,'Francken, J. J. C.',NULL,8,'scholar',NULL),(28,'Hare, George Thompson',NULL,13,'official',NULL),(29,'Higashikata Takayoshi','東方孝義 ',5,'interpreter',NULL),(30,'Hong Weiren','洪惟仁 ',12,'scholar',NULL),(31,'Hu Lu, Master (pen-name)','壺麓主人',2,NULL,NULL),(32,'Hu Xinlin','胡鑫麟 ',NULL,NULL,NULL),(33,'Huang Diancheng','黃典誠',NULL,NULL,NULL),(34,'Huang Qian','黃謙',2,NULL,NULL),(35,'Iwasaki Keitarou','岩崎敬太郎',5,'missionary',9),(36,'Jiang Weiwen','蔣為文 ',NULL,NULL,NULL),(37,'Kanematsu Isokuma','兼松礒熊',5,NULL,NULL),(38,'Ke Qiujie','柯秋潔',12,'scholar',NULL),(39,'Kihara Chitate',' 木原千楯',5,NULL,NULL),(40,'Li Dingchen','李鼎臣',2,'scholar',NULL),(41,'Lian Heng','連橫 ',NULL,NULL,NULL),(42,'Liao Lunji','廖綸璣',2,'scholar',NULL),(43,'Lin Jiusan','林久三',12,'interpreter',NULL),(44,'Lin Yangmin','林央敏 ',NULL,NULL,NULL),(45,'Lu Guangcheng','盧廣誠 ',NULL,NULL,NULL),(46,'Lu Zhuangzhang','盧戆章',2,'scholar',NULL),(47,'Macgowan, John','麥高溫',13,'missionary',4),(48,'Mackay, George Leslie','馬偕',1,'missionary',1),(49,'Mançano, Melchior de',NULL,11,'missionary',7),(50,'Mao Ting','懋亭',2,NULL,NULL),(51,'Maryknoll Language Service Center, members of The',NULL,NULL,NULL,NULL),(52,'Matano Wakichi','俣野保和',5,NULL,NULL),(53,'Medhurst, Walter Henry','麥都思',13,'missionary',4),(54,'Minakami Umehiko','水上梅彦',5,NULL,NULL),(55,'Murakami Yoshihide','村上嘉英 ',5,NULL,NULL),(56,'National Institute for Compilation and Translation (Taiwan), members of','國立編譯館 ',NULL,NULL,NULL),(57,'Ogawa Naoyoshi','小川尚義',5,'scholar',NULL),(58,'Piñol y Andreu, Francisco',NULL,11,'missionary',7),(59,'Qiu Wenxi','邱文錫',NULL,NULL,NULL),(60,'Qiu Yanling','邱豔菱',NULL,NULL,NULL),(61,'Riccio, Victorio',NULL,11,'missionary',7),(62,'Sakai Hashigorou','坂井釟五郎',5,NULL,NULL),(63,'Schlegel, Gustaaf',NULL,8,'scholar',NULL),(64,'Sugi Fusanosuke','杉房之助 ',5,NULL,NULL),(65,'Taiwan Governorate-General Police and Prison Administration, members of the Training School of','台湾総督府警察官及司獄官練習所',NULL,NULL,NULL),(66,'Talmage, John van Nest','打馬字',14,'missionary',5),(67,'Tanabe Shichirou','田部七郎',5,NULL,NULL),(68,'Tauchi Yaokuma','田内八百久万',5,NULL,NULL),(69,'Tipson, Ernest',NULL,13,'missionary',2),(70,'Ueda Kazutoshi','上田萬年',5,'scholar',NULL),(71,'Unknown author',NULL,NULL,NULL,NULL),(72,'Wang Huanan','王華南 ',NULL,NULL,NULL),(73,'Wang Renchen','王壬辰 ',NULL,NULL,NULL),(74,'Wang Shunlong','王順隆 ',NULL,NULL,NULL),(75,'Wang Yude','王育德 ',NULL,NULL,NULL),(76,'Warnshuis, Abbe Livingston ',NULL,14,'missionary',5),(77,'Wei Nan\'an','魏南安 ',NULL,NULL,NULL),(78,'Williams, Samuel Wells','衛三畏',14,'missionary',9),(79,'Wiⁿ, J. A.',NULL,NULL,NULL,NULL),(80,'Wu Kunsong','吳崑松 ',NULL,NULL,NULL),(81,'Wu Shouli','吳守禮 ',NULL,NULL,NULL),(82,'Xie Datian','謝達鈿 ',NULL,NULL,NULL),(83,'Xie Xiulan','謝秀嵐',2,NULL,NULL),(84,'Xu Chengzhang','許成章 ',NULL,NULL,NULL),(85,'Xu Fuquan','徐福全 ',NULL,NULL,NULL),(86,'Xu Jidun','許極燉 ',NULL,NULL,NULL),(87,'Xu Jinsong','徐金松 ',NULL,NULL,NULL),(88,'Yang Qingchu','楊青矗 ',NULL,NULL,NULL),(89,'Ye Kai\'en','葉開恩',2,NULL,NULL),(90,'Yoshida Kiichi','吉田起一',5,NULL,NULL),(91,'Zhan Zhenqing','詹鎮卿 ',NULL,NULL,NULL),(92,'Zhang Guangyu','張光裕 ',NULL,NULL,NULL),(93,'Zhang Hongyu','張宏宇 ',NULL,NULL,NULL),(94,'Zhang Yuhong','張裕宏 ',NULL,NULL,NULL),(95,'Zhou Bianming','周辨明',2,'scholar',NULL),(96,'Zhuang Shengxiong','莊勝雄',NULL,NULL,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pub_author`
--

DROP TABLE IF EXISTS `pub_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pub_author` (
  `author` int(11) NOT NULL,
  `publication` int(11) NOT NULL,
  KEY `author` (`author`),
  KEY `publication` (`publication`),
  CONSTRAINT `pub_author_ibfk_1` FOREIGN KEY (`author`) REFERENCES `people` (`id`),
  CONSTRAINT `pub_author_ibfk_2` FOREIGN KEY (`publication`) REFERENCES `publications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub_author`
--

LOCK TABLES `pub_author` WRITE;
/*!40000 ALTER TABLE `pub_author` DISABLE KEYS */;
INSERT INTO `pub_author` VALUES (1,7),(2,3),(3,54),(4,1),(5,71),(7,115),(7,47),(8,83),(8,109),(8,111),(9,68),(10,114),(11,72),(12,94),(13,91),(13,97),(13,103),(14,82),(15,94),(16,93),(17,2),(18,35),(19,19),(20,46),(21,106),(22,14),(23,16),(24,12),(25,73),(26,66),(26,90),(27,19),(28,33),(28,40),(29,57),(30,80),(31,10),(32,88),(32,89),(33,78),(34,8),(35,53),(36,118),(37,36),(38,49),(39,29),(40,37),(41,70),(42,6),(43,38),(44,81),(45,119),(46,23),(46,24),(46,42),(46,43),(46,48),(46,51),(46,52),(47,20),(48,22),(49,4),(50,50),(51,74),(51,75),(51,102),(51,121),(52,26),(52,32),(53,11),(54,31),(55,77),(55,112),(56,100),(57,34),(57,44),(57,45),(57,56),(57,59),(57,60),(57,64),(58,55),(58,63),(59,91),(59,97),(59,103),(60,104),(61,1),(62,28),(63,21),(64,39),(64,58),(65,65),(66,13),(66,25),(67,30),(68,27),(69,61),(69,62),(70,34),(71,5),(72,120),(73,98),(74,108),(74,113),(75,69),(76,46),(77,84),(78,17),(79,15),(80,107),(81,79),(81,99),(82,105),(83,9),(84,86),(85,95),(86,85),(86,96),(87,76),(88,87),(88,92),(88,101),(89,18),(90,41),(91,66),(91,90),(92,110),(93,117),(94,116),(95,67),(96,104);
/*!40000 ALTER TABLE `pub_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_orig` varchar(255) NOT NULL,
  `title_asianchar` varchar(255) DEFAULT NULL,
  `title_translated` varchar(255) DEFAULT NULL,
  `year_pub` int(11) NOT NULL,
  `city_pub` int(11) DEFAULT NULL,
  `country_pub` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `type` enum('dictionary','manuscript','phrasebook','rime chart','rime dictionary','textbook','unspecified') DEFAULT NULL,
  `language` enum('Classical Chinese','Dutch','English','Hokkien','Japanese','Latin','Mandarin','Spanish','other') DEFAULT NULL,
  `transcription_method` int(11) DEFAULT NULL,
  `digitized_at` varchar(255) DEFAULT NULL,
  `paper_version_available_at` varchar(255) DEFAULT NULL,
  `mentioned_in` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_pub` (`city_pub`),
  KEY `country_pub` (`country_pub`),
  KEY `publisher` (`publisher`),
  KEY `transcription_method` (`transcription_method`),
  CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`city_pub`) REFERENCES `cities` (`id`),
  CONSTRAINT `publications_ibfk_2` FOREIGN KEY (`country_pub`) REFERENCES `countries` (`id`),
  CONSTRAINT `publications_ibfk_3` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id`),
  CONSTRAINT `publications_ibfk_4` FOREIGN KEY (`transcription_method`) REFERENCES `transcription_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,'[16-17th centuries Spanish manuscripts mentioned in Gonzalez 1955. Historia de las Misiones Dominicanas en China Vol. 1., by authors Miguel de Benavides, Victorio Riccio etc.]',NULL,NULL,1600,NULL,NULL,NULL,'manuscript','Spanish',NULL,NULL,NULL,'mentioned in Klöter 2010. The Language of the Sangleys ref. to González 1955.'),(2,'Dictionarium Sino-Hispanicum',NULL,'Sino-Spanish Dictionary',1604,NULL,9,39,'manuscript','Spanish',13,NULL,'Biblioteca Angelica, Rome','Klöter, Henning 2010. The Language of the Sangleys p. 56.'),(3,'Bocabulario de la lengua sangleya por las letraz de el ABC',NULL,'Dictionary of the Sangley language by the letters of the ABC',1617,NULL,NULL,NULL,'manuscript','Spanish',13,NULL,'British Library','Klöter, Henning 2010. The Language of the Sangleys p. 68.'),(4,'Arte de la lengua Chio Chiu',NULL,'Grammar of the Chio Chiu [Zhangzhou] language',1620,NULL,9,38,'manuscript','Spanish',13,'http://cls.lib.ntu.edu.tw/LM/bookscan/chiochiu/content2.htm',NULL,NULL),(5,'Conlectio Liturgiae aliorumque merorum opusculorum lingua Chin cheu seu una cum Gramatica & Lexico eius linguae.',NULL,'Liturgical collection, opuscules in the Chin cheu [Zhangzhou] language together with the grammar and vocabulary of the language',1688,NULL,NULL,NULL,'manuscript','Latin',NULL,NULL,'University of Glasgow','http://special.lib.gla.ac.uk/manuscripts/search/detail_c.cfm?ID=36304'),(6,'Paizhang zhiyin','拍掌知音','Clapping and understanding sounds',1700,NULL,2,22,'rime chart','Classical Chinese',2,NULL,NULL,'http://xuewen.cnki.net/R2006070130001962.html'),(7,'Du jiang shu shiwu yin','渡江書十五音','Book of crossing the river - Fifteen sounds',1716,NULL,2,51,'rime dictionary','Classical Chinese',2,NULL,'https://book.douban.com/subject/1660160/',NULL),(8,'Huiyin miaowu','彙音妙悟','Gathering and understanding sounds',1800,16,2,52,'rime dictionary','Classical Chinese',12,NULL,'https://www.worldcat.org/title/hui-yin-miao-wu/oclc/68337879',NULL),(9,'Huiji ya su tong shiwu yin','彙集雅俗通十五音','Compilation of the fifteen sounds of refined and popular speech',1818,25,2,56,'rime dictionary','Classical Chinese',2,'https://archive.org/details/02077330.cn/page/n8',NULL,NULL),(10,'Zengbu huiyin','增補彙音','Supplement to Huiyin miaowu [Gathering and understanding sounds]',1820,25,2,56,'rime dictionary','Classical Chinese',2,NULL,NULL,'https://zh.wikipedia.org/wiki/%E5%A2%9E%E8%A3%9C%E5%BD%99%E9%9F%B3'),(11,'Dictionary of the Hok-keen Dialect of the Chinese Language, According to the Reading and Colloquial Idioms ','福建方言字典',NULL,1837,11,6,11,'dictionary','English',7,'https://archive.org/details/dictionaryofhokk00medhrich/page/n4',NULL,NULL),(12,'A vocabulary of the Hok-keen Dialect as spoken in the county of Tsheang-tshew','漳州語彙',NULL,1838,13,7,1,'dictionary','English',3,NULL,'https://www.worldcat.org/title/vocabulary-of-the-hok-keen-dialect-as-spoken-in-the-county-of-tsheang-tshew-to-which-is-prefixed-a-treatise-on-the-hok-keen-tones/oclc/969428301',NULL),(13,'Tng-oe Hoan-ji Chho-hak','唐話番字初學','Introduction to Chinese Romanization',1852,24,2,55,'textbook','Hokkien',11,NULL,NULL,'NONEXTANT, mentioned in later sources, see http://ip194097.ntcu.edu.tw/giankiu/GTH/2002/TOLMJ/giteng/lunbun/K2-kloeter.pdf'),(14,'Anglo-Chinese Manual with Romanized Colloquial in the Amoy Dialect','翻譯英華廈腔語彙',NULL,1853,4,2,32,'textbook','English',11,NULL,'https://www.worldcat.org/title/anglo-chinese-manual-with-romanized-colloquial-in-the-amoy-dialect/oclc/20605114',NULL),(15,'A Vocabulary of the Hokkien Dialect, as Spoken at Amoy and Singapore ',NULL,NULL,1866,18,10,54,NULL,'English',NULL,NULL,NULL,'Chiung in [http://uibun.twl.ncku.edu.tw/chuliau/lunsoat/english/2015/taiwanese.pdf[ referring to Hong Weiren Ang, Ui-jin. 1996. 台灣文獻書目題解:語言類[A list of Historical Materials: Language Category]. Taipei: NCL-Taiwan.'),(16,'Chinese-English Dictionary of the Vernacular or Spoken Language of Amoy','廈英大辭典',NULL,1873,10,13,29,'dictionary','English',11,'https://archive.org/details/chineseenglish00doug/page/n4',NULL,NULL),(17,'A Syllabic Dictionary of the Chinese Language; Arranged According to the Wu-Fang Yuen Yin, with the Pronunciations of Peking, Canton, Amoy, and Shanghai ','漢英韻府',NULL,1874,17,2,34,'dictionary','English',11,NULL,'https://www.worldcat.org/title/syllabic-dictionary-of-the-chinese-language-arranged-according-to-the-wu-fang-yuen-yin-with-the-pronunciation-of-the-characters-as-heard-in-peking-canton-amoy-and-shanghai/oclc/6641918',NULL),(18,'Ba yin ding jue','八音定訣','Rime sets of the eight sounds',1875,24,2,64,'rime dictionary','Classical Chinese',2,NULL,NULL,'https://ndltd.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/login?o=dnclcdr&s=id=%22089NTNU0045009%22.&searchmode=basic'),(19,'Chineesch-Hollandsch Woordenbook van het Emoi Dialekt','廈荷辭典','Chinese-Dutch dictionary of the Amoy dialect',1882,6,4,4,'dictionary','Dutch',4,NULL,'https://www.worldcat.org/title/chineesch-hollandsch-woordenboek-van-het-emoi-dialekt/oclc/23410247',NULL),(20,'English and Chinese Dictionary of the Amoy Dialect','英廈辭典',NULL,1883,10,13,50,'dictionary','English',11,'https://archive.org/stream/cu31924023550878#page/n6/mode/2up',NULL,NULL),(21,'Nederlandsch-Chineesch woordenboek met de transcriptie der Chineesche karakters in het Tsiang-tsiu dialekt, hoofdzakelijk ten behoeve der tolken voor de Chineesche taal in Nederlandsch-Indië ','荷華文語類參','Dutch-Chinese dictionary with transcription of Chinese characters in the Zhangzhou dialect, mainly for the purpose of translating the Chinese language in Netherlands India',1890,9,8,10,'dictionary','Dutch',4,NULL,'https://www.worldcat.org/title/nederlandsch-chineesch-woordenboek-met-de-transcriptie-der-chineesche-karakters-in-het-tsiang-tsiu-dialekt-hoofdzakelijk-ten-behoeve-der-tolken-voor-de-chineesche-taal-in-nederlandsch-indie/oclc/7475562',NULL),(22,'Chinese Romanized Dictionary of the Formosan Vernacular ','中西字典',NULL,1891,17,2,34,'dictionary','English',11,NULL,'https://www.worldcat.org/title/chinese-romanized-dictionary-of-the-formosan-vernacular/oclc/47246037',NULL),(23,'Yimu liaoran chujie','一目了然初階','First steps in understanding at a glance',1892,24,2,55,'textbook','Classical Chinese',17,NULL,'https://www.worldcat.org/title/yimuliaoran-chu-jie/oclc/66762283&referer=brief_results',NULL),(24,'Xin zi chujie','新字初階','First steps in the new script',1893,24,2,55,'textbook','Classical Chinese',17,NULL,NULL,'location unclear, mentioned in Xu Chang\'an 2000. Yuwen xiandaihua xianqu: Lu Zhuangzhang (https://www.worldcat.org/title/yu-wen-xian-dai-hua-xian-qu-lu-gangzhang/oclc/47255954)'),(25,'E-mng-im e ji-tian',' 廈門音的字典','Dictionary of the Xiamen dialect',1894,24,2,12,'dictionary','Hokkien',11,NULL,'https://www.worldcat.org/title/e-mng-im-e-ji-tian-tan-ma-ji-bok-su-new-dictionary-in-the-amoy-dialect/oclc/41548900',NULL),(26,'Taiwango shuu (Taiwan nichiyou dogoshuu)','台湾語集 (台湾日用土語集)','Compilation on Taiwanese language (Compilation on everyday Taiwanese vernacular)',1895,23,5,23,'textbook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000039-I001833254-00',NULL),(27,'Taiwango','台湾語','Taiwanese language',1895,15,5,28,NULL,'Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500174-00',NULL),(28,'Taiwango kaiwahen','台湾語会話編','Taiwanese conversation compilation',1895,23,5,41,'phrasebook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500171-00',NULL),(29,'Taiwango zenshuu: Dokushuu jizai','台湾語全集：独習自在','Compilation of Teach-yourself-Taiwanese',1896,15,5,21,'textbook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500177-00',NULL),(30,'Taiwan dogo','台湾土語','Taiwanese vernacular',1896,23,5,27,NULL,'Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000039-I001542648-00',NULL),(31,'Nittai kaiwa taizen','日台会話大全','Japanese-Taiwanese conversation complete',1896,23,5,23,'phrasebook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500232-00',NULL),(32,'Gunjinyou Taiwango','軍人用台湾語','Taiwanese for military personnel',1897,23,5,13,'phrasebook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500049-00',NULL),(33,'The Hokkien Vernacular. Part I (Chinese text)',NULL,NULL,1897,18,10,37,'textbook','Hokkien',2,'http://ebook.lib.hku.hk/CADAL/B33651309V1/',NULL,NULL),(34,'Nittai shoujiten','日臺小字典 ','Concise Japanese-Taiwanese dictionary',1898,21,12,45,'dictionary','Japanese',15,NULL,'https://catalog.hathitrust.org/Record/100177239',NULL),(35,'Diccinario Tonico Sino-Espanol, Del Dialecto de Emoy, Chiang-chiu, Choan-chiu Formosa ',NULL,'Tonal Sino-Spanish dictionary of the dialects of Xiamen, Zhangzhou, Quanzhou and Taiwan',1900,24,2,12,'dictionary','Spanish',NULL,NULL,NULL,'Chiung in [http://uibun.twl.ncku.edu.tw/chuliau/lunsoat/english/2015/taiwanese.pdf[ referring to Hong Weiren Ang, Ui-jin. 1996. 台灣文獻書目題解:語言類[A list of Historical Materials: Language Category]. Taipei: NCL-Taiwan.'),(36,'Taiwango hatsuongaku','台湾語発音学','Phonology of Taiwanese',1900,21,12,16,'textbook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000001-I075160525-00',NULL),(37,'[Phonological works of Li Dingchen] (ca. 1832-1911)',NULL,NULL,1900,24,2,55,NULL,NULL,6,NULL,NULL,'NONEXTANT, mentioned in Xiamen shizhi (Minguo), Wenyuan zhuan 廈門市誌 (民國) ・文苑傳 (Beijing: Fangzhi Chubanshe 1999)'),(38,'Taiwango hatsuon kokoroe','台湾語発音心得','Understanding Taiwanese pronunciation',1903,15,5,33,NULL,'Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000500178-00',NULL),(39,'Nittai shin jiten','日臺新辭典 ','New Japanese-Taiwanese dictionary',1904,21,12,26,'dictionary','Japanese',NULL,NULL,'https://catalog.hathitrust.org/Record/009453751',NULL),(40,'The Hokkien Vernacular. Part II (English text with English notes and Chinese Romanized version). ',NULL,NULL,1904,8,7,40,'textbook','English',11,'http://ebook.lib.hku.hk/CADAL/B33651309V2/',NULL,NULL),(41,'Taiwango shoukei','台湾語捷径','Shortcut to Taiwanese',1905,23,5,2,NULL,'Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000039-I001905807-00',NULL),(42,'Beijing qieyin jiaokeshu','北京切音教科書','Beijing qieyin textbook ',1906,17,2,53,'textbook','Classical Chinese',18,NULL,'https://www.worldcat.org/title/beijing-qie-yin-jiao-ke-shu/oclc/502426774&referer=brief_results',NULL),(43,'Zhongguo zimu Beijing qieyin heding','中國字母北京切音合訂','Compilation of the Beijing qieyin method of Chinese letters',1906,17,2,8,'textbook','Classical Chinese',18,NULL,'https://www.worldcat.org/title/zhongguo-zi-mu-beijing-qie-yin-he-ding/oclc/21574179&referer=brief_results',NULL),(44,'Nittai daijiten','日臺大辭典 ','Comprehensive Japanese-Taiwanese dictionary',1907,21,12,45,'dictionary','Japanese',15,'http://ip194097.ntcu.edu.tw/memory/TGB/thak.asp?id=179&page=1',NULL,NULL),(45,'Nittai shoujiten','日臺小辭典 ','Concise Japanese-Taiwanese dictionary',1908,23,5,6,'dictionary','Japanese',NULL,'http://dl.ndl.go.jp/info:ndljp/pid/869488/1',NULL,NULL),(46,'Lessons in the Amoy Vernacular',NULL,NULL,1911,24,2,65,'textbook','English',11,NULL,'https://www.worldcat.org/title/lessons-in-the-amoy-vernacular/oclc/4765138',NULL),(47,'A Dictionary of the Amoy Vernacular Spoken Throughout the Prefectures of Chin-chiu, Chiang-chiu and Formosa (Taiwan) ','廈門音新字典',NULL,1913,20,12,43,'dictionary','English',11,NULL,'https://www.worldcat.org/title/dictionary-of-the-amoy-vernacular-spoken-throughout-the-prefectures-of-chin-chiu-chiang-chiu-and-formosa/oclc/68338478/editions?referer=di&editionsView=true&fq=ln%3Achi',NULL),(48,'Zhongguo xin zi','中國新字','New Chinese letters',1915,24,2,55,NULL,NULL,19,NULL,NULL,'location unclear, mentioned in Xu Chang\'an 2000. Yuwen xiandaihua xianqu: Lu Zhuangzhang (https://www.worldcat.org/title/yu-wen-xian-dai-hua-xian-qu-lu-gangzhang/oclc/47255954)'),(49,'Taiwango kyouhon','台湾語教本','Taiwanese textbook',1915,23,5,49,'textbook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000002-I000000559244-00',NULL),(50,'Huiji ya su tong shiwu yin quanben','彙集雅俗通十五音全本','Complete edition of Huiji ya su tong shiwu yin [Compilation of the fifteen sounds of refined and popular speech]',1916,25,2,56,'rime dictionary','Classical Chinese',2,NULL,NULL,'https://zh.wikipedia.org/wiki/%E5%BD%99%E9%9B%86%E9%9B%85%E4%BF%97%E9%80%9A%E5%8D%81%E4%BA%94%E9%9F%B3%E5%85%A8%E6%9C%AC'),(51,'Zhonghua xin zi','中華新字','New Chinese letters',1916,24,2,55,NULL,NULL,20,NULL,NULL,'location unclear, mentioned in Xu Chang\'an 2000. Yuwen xiandaihua xianqu: Lu Zhuangzhang (https://www.worldcat.org/title/yu-wen-xian-dai-hua-xian-qu-lu-gangzhang/oclc/47255954)'),(52,'Zhuyin zimu yu Zhonghua xinzi bijiaobiao ','注音字母與中華新字比較表','Comparative table of the zhuyin letters and the New Chinese script',1920,24,2,55,NULL,NULL,20,NULL,NULL,'location unclear, mentioned in Xu Chang\'an 2000. Yuwen xiandaihua xianqu: Lu Zhuangzhang (https://www.worldcat.org/title/yu-wen-xian-dai-hua-xian-qu-lu-gangzhang/oclc/47255954)'),(53,'Taiwan goten: Roomaji hatsuonshiki ','台湾語典：羅馬字発音式','Taiwanese dictionary: Pronunciation with Latin letters',1922,21,12,42,'textbook','Japanese',15,NULL,'https://www.worldcat.org/title/romaji-hatsuonshiki-taiwan-goten/oclc/35827002',NULL),(54,'Supplement to Dictionary of the Vernecular or Spoken Language of Amoy','廈英大辭典補編',NULL,1923,17,2,34,'dictionary','English',11,NULL,'https://www.worldcat.org/title/supplement-to-dictionary-of-the-vernacular-or-spoken-language-of-amoy/oclc/29362276',NULL),(55,'Gramática China del Dialecto de Amoy',NULL,'Chinese Grammar of the Xiamen dialect',1928,5,3,15,NULL,'Spanish',NULL,NULL,'https://www.worldcat.org/title/gramatica-china-del-dialecto-de-amoy/oclc/14918914',NULL),(56,'Tai-nichi shin jisho','臺日新辭書 ','New Taiwanese-Japanese dictionary',1931,21,12,44,'dictionary','Japanese',15,NULL,'https://ndlonline.ndl.go.jp/#!/detail/R300000001-I000000910345-00',NULL),(57,'Tai-nichi daijiten (jou)','臺日大辭典(上)','Comprehensive Taiwanese-Japanese dictionary (Vol. 1.)',1931,21,12,45,'dictionary','Japanese',15,NULL,'https://ndlonline.ndl.go.jp/#!/detail/R300000003-I1218326-00',NULL),(58,'Nittai kaiwa taizen','日台会話大全','Japanese-Taiwanese conversation complete',1931,21,12,68,'phrasebook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000001-I023050019-00',NULL),(59,'Tai-nichi daijiten (ge)','臺日大辭典(下) ','Comprehensive Taiwanese-Japanese dictionary (Vol. 2.)',1932,21,12,45,'dictionary','Japanese',15,NULL,'https://ndlonline.ndl.go.jp/#!/detail/R300000003-I1218365-00',NULL),(60,'Tai-nichi shoujiten','臺日小辭典 ','Concise Taiwanese-Japanese dictionary',1932,21,12,45,'dictionary','Japanese',NULL,NULL,NULL,'Chiung in [http://uibun.twl.ncku.edu.tw/chuliau/lunsoat/english/2015/taiwanese.pdf[ referring to Hong Weiren Ang, Ui-jin. 1996. 台灣文獻書目題解:語言類[A list of Historical Materials: Language Category]. Taipei: NCL-Taiwan.'),(61,'A Pocket Dictionary of the Amoy Vernacular. Chinese-English',NULL,NULL,1934,18,10,19,'dictionary','English',11,NULL,'https://www.worldcat.org/title/pocket-dictionary-of-the-amoy-vernacular-english-chinese/oclc/504142973',NULL),(62,'A Pocket Dictionary of the Amoy Vernacular. English-Chinese',NULL,NULL,1935,18,10,30,'dictionary','English',11,NULL,'https://www.worldcat.org/title/pocket-dictionary-of-the-amoy-vernacular-chinese-english/oclc/266709168&referer=brief_results',NULL),(63,'Diccionario chino-español : del dialecto de Amoy, Chiang-chiu, Choan-chiu, Formosa, etc.',NULL,'Chinese-Spanish dictionary: of the dialects of Xiamen, Zhangzhou, Quanzhou, Formosa, etc.',1937,5,3,15,'dictionary','Spanish',NULL,NULL,'https://www.worldcat.org/title/diccionario-chino-espanol-del-dialecto-de-amoy-chiang-chiu-choan-chiu-formosa-etc/oclc/31147021',NULL),(64,'Shintei nittai daijiten (jou)','新訂日臺大辭典(上) ','Revised comprehensive Japanese-Taiwanese dictionary (Vol. 1.)',1938,21,12,45,'dictionary','Japanese',NULL,NULL,NULL,'http://www.ntcu.edu.tw/taiwanese/ogawa100/a/tsuliau/%E6%9D%8E%E5%A3%AC%E7%99%B8--%E5%8F%B0%E7%81%A3%E8%AA%9E%E8%A8%80%E5%AD%B8%E5%85%88%E9%A9%85.pdf'),(65,'Taiwango kyoukasho','台湾語教科書','Taiwanese textbook',1944,21,12,45,'phrasebook','Japanese',15,NULL,'http://iss.ndl.go.jp/books/R100000001-I010063185-00',NULL),(66,'Guo-tai yin wan zi dian','國臺音萬字典 ','Mandarin-Taiwanese dictionary of ten thousand characters',1946,2,12,18,NULL,NULL,NULL,NULL,'https://www.worldcat.org/title/guo-tai-yin-wan-zi-dian/oclc/744500454?referer=di&ht=edition',NULL),(67,'Everyday sentences in spoken English – Reedited with Parallel Quoyu-Halgur-Character Texts for Instruction in English and Chinese Conversation.',NULL,NULL,1951,18,10,25,'phrasebook','English',5,NULL,'https://www.worldcat.org/title/everyday-sentences-in-spoken-english-with-parallel-chinese-texts/oclc/43746287&referer=brief_results',NULL),(68,'Zengbu huiyin baojian','增補彙音寶鑑 ','Precious mirror of Zengbu Huiyin [Supplement to Huiyin Miaowu]',1954,3,12,62,NULL,NULL,NULL,NULL,NULL,NULL),(69,'Taiwanyu changyong yuhui','臺灣語常用語彙 ','Common Taiwanese vocabulary',1957,23,5,71,NULL,NULL,NULL,NULL,NULL,NULL),(70,'Taiwan yudian','台灣語典 ','Taiwan dictionary',1957,21,12,75,NULL,NULL,NULL,NULL,NULL,NULL),(71,'Minnanyu guoyu duizhao changyong cidian','閩南語國語對照常用辭典','Comparative dictionary of everyday Southern Min and Mandarin',1969,21,12,74,NULL,NULL,NULL,NULL,NULL,NULL),(72,'Han-ying Taiwan fangyan cidian','漢英台灣方言辭典 ','Chinese-English dictionary of the Taiwanese dialect',1970,21,12,24,NULL,NULL,NULL,NULL,NULL,NULL),(73,'A Dictionary of Southern Min ',NULL,NULL,1973,7,3,14,'dictionary','English',NULL,NULL,'https://www.worldcat.org/title/dictionary-of-southern-min/oclc/663727535?referer=di&ht=edition',NULL),(74,'Amoy-English Dictionary','中國閩南語英語字典',NULL,1976,19,12,20,NULL,NULL,NULL,NULL,NULL,NULL),(75,'English-Amoy Dictionary','英廈辭典',NULL,1979,19,12,20,NULL,NULL,NULL,NULL,NULL,NULL),(76,'Taiyu cidian','臺語辭典 ','Taiwanese dictionary',1980,21,12,24,NULL,NULL,NULL,NULL,NULL,NULL),(77,'Gendai minnango jiten','現代閩南語辭典 ','Dictionary of modern Southern Min',1981,22,5,47,NULL,NULL,NULL,NULL,NULL,NULL),(78,'Putonghua Minnan fangyan cidian','普通話閩南方言詞典 ','Basic dictionary of Mandarin and Southern Min dialect',1984,24,2,65,'dictionary','Mandarin',1,NULL,NULL,NULL),(79,'Zonghe Minnan fangyan jiben zidian','綜合閩南方言基本字典 ','Comprehensive basic dictionary of the Southern',1986,21,12,60,NULL,NULL,NULL,NULL,NULL,NULL),(80,'Taiwan lisu yudian','台灣禮俗語典 ','Dictionary of Taiwanese etquette and customs',1986,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(81,'Jianming taiyu zidian','簡明台語字典 ','Concise dictionary of Taiwanese',1991,21,12,31,NULL,NULL,NULL,NULL,NULL,NULL),(82,'Taiwanhua dacidian','台灣話大詞典 ','Comprehensive dictionary of Taiwanese speech',1991,21,12,72,NULL,NULL,NULL,NULL,NULL,NULL),(83,'Guo-tai yinhui yin','國台音彙音寶典 ','Treasured book of Mandarin-Taiwanese sounds',1991,20,12,66,NULL,NULL,NULL,NULL,NULL,NULL),(84,'Taiyu dazidian','台語大字典 ','Comprehensive dictionary of Taiwanese',1992,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(85,'Changyong hanzi taiyu cidian','常用漢字臺語詞典 ','Dictionary of common Chinese characters and Taiwanese',1992,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(86,'Taiwan hanyu cidian','台灣漢語辭典 ','Taiwanese-Chinese dictionary',1992,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(87,'Guo-tai shuangyu cidian','國台雙語辭典 ','Bilingual Mandarin-Taiwanese dictionary',1992,21,12,9,NULL,NULL,NULL,NULL,NULL,NULL),(88,'Fenlei taiyu xiaocidian','分類臺語小辭典 ','Classified small dictionary of Taiwanese',1994,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(89,'Shiyong taiyu xiaozidian','實用臺語小字典 ','Practical small dictionary of Taiwanese',1994,21,12,76,NULL,NULL,NULL,NULL,NULL,NULL),(90,'Lanji taiyu zidian','蘭記臺語字典 ','Lanji Taiwanese dictionary',1995,2,12,18,NULL,NULL,NULL,NULL,NULL,NULL),(91,'Shiyong huayu taiyu duizhao dian','實用華語臺語對照典 ','Practical comparative Chinese-Taiwanese dictionary',1996,21,12,73,NULL,NULL,NULL,NULL,NULL,NULL),(92,'Taiyu yuhui cidian','台語語彙辭典 ','Dictionary of Taiwanese vocabulary',1997,21,12,9,NULL,NULL,NULL,NULL,NULL,NULL),(93,'Taiwan su yanyu dian','台灣俗諺語典 ','Dictionary of Taiwanese proverbs',1997,21,12,31,NULL,NULL,NULL,NULL,NULL,NULL),(94,'Tai-hua zidian','台華字典 ','Taiwanese-Chinese dictionary',1998,21,12,5,NULL,NULL,NULL,NULL,NULL,NULL),(95,'Fuquan tai yanyu dian','福全台諺語典 ','Fuquan dictionary of Taiwanese proverbs',1998,21,12,69,NULL,NULL,NULL,NULL,NULL,NULL),(96,'Changyong hanzi taiyu cidian','常用漢字台語詞典 ','Dictionary of common Chinese characters and Taiwanese',1998,21,12,31,NULL,NULL,NULL,NULL,NULL,NULL),(97,'Shiyong Taiwan yanyu dian','實用臺灣諺語典 ','Practical dictionary of Taiwanese proverbs',1999,21,12,73,NULL,NULL,NULL,NULL,NULL,NULL),(98,'Taiyu zihui','台語字彙 ','Glossary of Taiwanese',2000,21,12,58,NULL,NULL,NULL,NULL,NULL,NULL),(99,'Guo-tai duizhao huoyong cidian','國臺對照活用辭典 ','Creative Mandarin-Taiwanese comparative dictionary',2000,21,12,72,NULL,NULL,NULL,NULL,NULL,NULL),(100,'Taiwan minnanyu cidian','台灣閩南語辭典 ','Dictionary of Taiwanese Southern Min language',2001,21,12,63,NULL,NULL,NULL,NULL,NULL,NULL),(101,'Taiyu suyu cidian','台語俗語辭典','Dictionary of Taiwanese common sayings',2001,21,12,9,NULL,NULL,NULL,NULL,NULL,NULL),(102,'Taiwanese-English Dictionary ',NULL,NULL,2001,19,12,20,NULL,NULL,NULL,NULL,NULL,NULL),(103,'Xinbian hua taiyu duizhao dian','新編華台語對照典 ','Revised Chinese-Taiwanese comparative dictionary',2002,21,12,73,NULL,NULL,NULL,NULL,NULL,NULL),(104,'Pushi tai-hua cidian','普實台華詞典 ','General Taiwanese-Chinese dictionary',2002,19,12,46,NULL,NULL,NULL,NULL,NULL,NULL),(105,'Taiwan huiyin zidian','台灣彙音字典 ','Taiwanese phonological dictionary',2002,19,12,67,NULL,NULL,NULL,NULL,NULL,NULL),(106,'Taiyu shiyong zidian','台語實用字典 ','Practical Taiwanese dictionary',2003,20,12,3,NULL,NULL,NULL,NULL,NULL,NULL),(107,'Tongyong taiyu zidian','通用台語字典 ','Dictionary of common Taiwanese',2003,21,12,24,NULL,NULL,NULL,NULL,NULL,NULL),(108,'Shinpen tai-nichi daijiten','新編台日大辭典 ','Revised comprehensive Japanese-Taiwanese dictionary',2004,21,12,57,NULL,NULL,NULL,NULL,NULL,NULL),(109,'Guoyu taiyu duibi cidian','國語台語對比辭典 ','Comparative Mandarin-Taiwanese dictionary',2004,20,12,17,NULL,NULL,NULL,NULL,NULL,NULL),(110,'Taiyuyin wailaiyu cidian','台語音外來語辭典 ','Dictionary of Taiwanese loanwords',2005,19,12,36,NULL,NULL,NULL,NULL,NULL,NULL),(111,'Guoyu taiyu zonghe zidian','國語臺語綜合字典 ','Comprehensive Mandarin-Taiwanese dictionary',2005,23,5,48,NULL,NULL,NULL,NULL,NULL,NULL),(112,'Touhou taiwango jiten','東方台湾語辞典 ','Toho Taiwanese dictionary',2007,23,5,48,NULL,NULL,NULL,NULL,NULL,NULL),(113,'Juuhen shintei nittai daijiten joukan','重編新訂日台大辭典上卷','New revised comprehensive Japanese-Taiwanese dictionary (Vol. 1.)',2007,21,12,57,NULL,NULL,NULL,NULL,NULL,NULL),(114,'Gaojie biaozhun taiyu zidian','高階標準臺語字典 ','Dictionary of high-class standard Taiwanese',2007,21,12,31,NULL,NULL,NULL,NULL,NULL,NULL),(115,'Kam Ui-lim Tai-gu Ji-tian','甘為霖台語字典 ','William Campbell’s Taiwanese Dictionary',2009,20,12,43,NULL,NULL,NULL,NULL,NULL,NULL),(116,'Taiyu baihua xiaocidian','台語白話小詞典 ','Concise dictionary of spoken Taiwanese',2009,20,12,70,NULL,NULL,NULL,NULL,NULL,NULL),(117,'Fu\'ermosa yuyan wenhua cidian','福爾摩莎語言文化詞典','Dictionary of Formosan languages and culture',2009,21,12,59,NULL,NULL,NULL,NULL,NULL,NULL),(118,'Quanmin taiyu renzheng yuci fenji baodian','全民台語認證語詞分級寶典','Classified dictionary of common authentic Taiwanese',2011,20,12,70,NULL,NULL,NULL,NULL,NULL,NULL),(119,'Shiyong taiyu cidian','實用台語詞典 ','Practical Taiwanese dictionary',2011,21,12,61,NULL,NULL,NULL,NULL,NULL,NULL),(120,'Qingjie taiyu hanzi cidian','精解台語漢字詞典 ','Detailed Taiwanese-Chinese characters dictionary',2012,21,12,61,NULL,NULL,NULL,NULL,NULL,NULL),(121,'English- Taiwanese Dictionary ',NULL,NULL,2013,19,12,20,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_orig` varchar(255) NOT NULL,
  `name_asianchar` varchar(255) DEFAULT NULL,
  `name_translated` varchar(255) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  CONSTRAINT `publishers_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`),
  CONSTRAINT `publishers_ibfk_2` FOREIGN KEY (`country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Anglo-Chinese College Press',NULL,NULL,13,7),(2,'Aoki Suuzandou','青木嵩山堂','Aoki Suzando',23,5),(3,'Baihe Wenhua','百合文化 ',NULL,20,12),(4,'Bataviaasch Genootschap van Kunsten en Wetenschappen',NULL,'Batavian Society of Arts and Sciences',6,4),(5,'Chen Qingzhou','陳慶洲 ',NULL,21,12),(6,'Dainippon Tosho Kabushikigaisha','大日本図書株式会社','Dainippon Tosho Publishing Ltd.',23,5),(7,'Dazheng Shuju','大正書局 ',NULL,20,12),(8,'Dian Shi Zhai','點石齋','Dian Shi House',17,2),(9,'Dunli','敦理 ',NULL,21,12),(10,'E. J. Brill',NULL,NULL,9,8),(11,'East India Company',NULL,NULL,11,6),(12,'Gulangyu Cuijing Tang','鼓浪嶼萃經堂 ','Gulangyu Cuijing Temple',24,2),(13,'Gunjin Kyouikukai','軍人教育会','Association of Military Personnel Education',23,5),(14,'Hong Kong Language Institute',NULL,NULL,7,3),(15,'Imprenta de Nazaret',NULL,NULL,5,3),(16,'Inae Gijuku','稲江義塾','Inae Private School',21,12),(17,'Jianli Shuju','建利書局 ',NULL,20,12),(18,'Lanji','蘭記 ',NULL,2,12),(19,'Lithographers',NULL,NULL,18,10),(20,'Maryknoll Language Service Center, The',NULL,NULL,19,12),(21,'Matsumura Kyuubei','松村九兵衛','Matsumura Kyube',15,5),(22,'Mei Xuan Shuwu Cang','梅軒書屋藏','Plum Pavilion Bookstore Depository',NULL,2),(23,'Minyuusha','民友社','Minyu Press',23,5),(24,'Nantian','南天 ',NULL,21,12),(25,'Nanyang Book Company Ltd.',NULL,NULL,18,10),(26,'Nihon Bussan Goushigaisha','日本物産合資会社','Nihon Bussan Ltd.',21,12),(27,'Ookura Bunji','大倉文二','Okura Bunji',23,5),(28,'Otagumi Jimusho','太田組事務所','Otagumi Office',15,5),(29,'Presbyterian Church of England',NULL,NULL,10,13),(30,'Printers Ltd.',NULL,NULL,18,10),(31,'Qianwei','前衛 ',NULL,21,12),(32,'Samuel Wells Williams',NULL,NULL,4,2),(33,'Seibunkan','盛文館','Seibunkan',15,5),(34,'Shanghai Presbyterian Mission','上海長老教會 ',NULL,17,2),(35,'Shangwu Yinshuguan','商務印書館','Commercial Press',17,2),(36,'Shuangyu','雙語 ',NULL,19,12),(37,'Singapore Government Printing Office',NULL,NULL,18,10),(38,'Spanish Dominicans in the Philippines',NULL,NULL,NULL,9),(39,'Spanish Jesuits in the Philippines',NULL,NULL,NULL,9),(40,'Straits Settlements and Selangor Government Printing Offices',NULL,NULL,8,7),(41,'Susebou','嵩山房','Suse House',23,5),(42,'Taiwan Goten Hakkousho','台湾語典発行所','Taiwanese Dictionary Publisher',21,12),(43,'Taiwan Jiaohui Gongbaoshe','台灣教會公報社 ','Taiwan Church News Press',20,12),(44,'Taiwan Keisatsu Kyoukai','台湾警察協会','Taiwan Police Association',21,12),(45,'Taiwan Soutokufu','台湾総督府','Governorate-General of Taiwan [Japanese colonial period]',21,12),(46,'Taiwan Yuwen Yanjiushe','台灣語文研究社 ',NULL,19,12),(47,'Tenri Daigaku','天理大學 ',NULL,22,5),(48,'Touhou Shoten','東方書店 ',NULL,23,5),(49,'Touyou Kyoukai Senmon Gakkou','東洋協会専門学校','Toyo Association Vocational School',23,5),(50,'Trübner & Co.',NULL,NULL,10,13),(51,'Unspecified Chinese publisher',NULL,NULL,NULL,2),(52,'Unspecified Quanzhou publisher',NULL,NULL,16,2),(53,'Unspecified Shanghai publisher',NULL,NULL,17,2),(54,'Unspecified Singapore publisher',NULL,NULL,18,10),(55,'Unspecified Xiamen publisher',NULL,NULL,24,2),(56,'Unspecified Zhangzhou publisher',NULL,NULL,25,2),(57,'Wang Shunlong','王順隆 ',NULL,21,12),(58,'Wanren','萬人 ',NULL,21,12),(59,'Wen He','文鶴 ',NULL,21,12),(60,'Wenshizhe','文史哲 ',NULL,21,12),(61,'Wenshui Yiwen','文水藝文 ',NULL,21,12),(62,'Wenyi Xueshe','文藝學社 ',NULL,3,12),(63,'Wunan','五南 ',NULL,21,12),(64,'Xiamen Bei Wen Zhai Huoban','廈門倍文齋活版','Xiamen Bei Wen House Press',24,2),(65,'Xiamen Daxue Chubanshe','廈門大學出版社','Xiamen/Amoy University Press',24,2),(66,'Xibei','西北 ',NULL,20,12),(67,'Xie Datian','謝達鈿 ',NULL,19,12),(68,'Xin Gao Tang','新高堂','Xin Gao Tang',21,12),(69,'Xu Fuquan','徐福全 ',NULL,21,12),(70,'Yaxiya Guoji Chuanboshe','亞細亞國際傳播社',NULL,20,12),(71,'Yonghe Yuxueshe','永和語學社 ',NULL,23,5),(72,'Yuanliu','遠流 ',NULL,21,12),(73,'Zhangshu','樟樹 ',NULL,21,12),(74,'Zhengzhong','正中 ',NULL,21,12),(75,'Zhonghua Congshu Bianshe Weiyuanhui','中華叢書編審委員會',NULL,21,12),(76,'Zili Wanbao','自立晚報 ',NULL,21,12);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcription_methods`
--

DROP TABLE IF EXISTS `transcription_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transcription_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_orig` varchar(255) NOT NULL,
  `name_asianchar` varchar(255) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `first_appearance` int(11) DEFAULT NULL,
  `based_on` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`),
  CONSTRAINT `transcription_methods_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcription_methods`
--

LOCK TABLES `transcription_methods` WRITE;
/*!40000 ALTER TABLE `transcription_methods` DISABLE KEYS */;
INSERT INTO `transcription_methods` VALUES (1,'Bbanlam Hong\'ggian Pingyim Hong\'an','閩南方言拼音方案 ',33,78,'Hanyu Pinyin for Mandarin','Romanization'),(2,'Chinese characters including non-standard characters for Hokkien',NULL,NULL,NULL,NULL,'extended Chinese characters'),(3,'Dyer Romanization',NULL,24,12,'Medhurst Romanization','Romanization'),(4,'Francken - de Grijs Romanization (19th century Dutch East Indies)',NULL,27,19,NULL,'Romanization'),(5,'Halgur Alphabet','廈語字母',95,67,NULL,'Romanization'),(6,'Li Dingchen method',NULL,40,37,NULL,'own invention'),(7,'Medhurst Romanization',NULL,53,11,'Morrison Romanization for Mandarin','Romanization'),(8,'Mixed Chinese characters-Peh-oe-ji',NULL,NULL,NULL,NULL,'mixed Chinese character-Romanization'),(9,'Mixed Chinese characters-Tai-lo',NULL,NULL,NULL,NULL,'mixed Chinese character-Romanization'),(10,'Modern Literal Taiwanese (MLT)','現代台語文',NULL,NULL,NULL,'Romanization'),(11,'Peh-oe-ji','白話字',NULL,14,NULL,'Romanization'),(12,'San tui cheng zi fa (tripartite numerical phonetization method)','三推成字法',34,8,NULL,'own invention'),(13,'Spanish-based Romanizations (16-18th century Philippines)',NULL,NULL,2,NULL,'Romanization'),(14,'Tai-lo (Taiwanese Romanization)','台羅',NULL,NULL,'Peh-oe-ji','Romanization'),(15,'Taiwanese Kana','台湾語仮名',NULL,26,'Katakana for Japanese','modified Katakana'),(16,'Taiwanese Phonetic Symbols (Extended Bopomofo)','台灣方音符號',NULL,NULL,'Bopomofo for Mandarin','modified Bopomofo'),(17,'Zhongguo qieyin xinzi (New Chinese qieyin characters)','中國切音新字',46,23,NULL,'own invention'),(18,'Zhongguo qieyin zimu (Chinese qieyin letters)','中國切音字母',46,42,NULL,'own invention'),(19,'Zhongguo xinzi (New Chinese Letters version 1)','中國新字',46,48,'Zhongguo qieyin zimu (Chinese qieyin letters)','own invention'),(20,'Zhonghua xinzi (New Chinese Letters version 2)','中華新字',46,51,'Zhongguo qieyin zimu (Chinese qieyin letters)','own invention');
/*!40000 ALTER TABLE `transcription_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-03 12:42:12
