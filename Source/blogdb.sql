/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : blogdb

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 08/02/2020 16:07:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT '博文编号(主码，自动增长编号)',
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '博文标题',
  `Context` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '博文内容',
  `CreatedTime` datetime NULL DEFAULT NULL COMMENT '博文发布时间',
  `ClassId` int(4) NOT NULL COMMENT '所属分类编号',
  `Picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (33, '2020公车卖出废铁价，谁贱卖了真相？', '<p>43辆超编公车，只拍卖了39.11万元，部分车辆中拍价比评估价还低。河南省中牟县公开拍卖公车被网友戏称“公车卖出了废铁价”。细心网友发现，参与此次拍卖的评估公司河南中达信资产评估有限公司，其法人代表、负责人钟某，也是负责拍卖的河南拍卖行有限公司的拍卖师。业内人士指出，此种情况就是左手评估、右手拍卖，直接影响估值独立性，存在不小操作空间。</p><p>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 河南省中牟县的这个公车拍卖结果，犹如一个让人面面相觑的冷笑话。这是卖汽车还是卖废铁？一方面是网友如潮的质疑，另一方面是中牟县相关部门的委屈。评估师与拍卖师是同一人的事实，则瞬间击垮了相关人员的委屈。左手评估、右手拍卖，何以保障拍卖公平？<br>\n<br>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 关于公共管理领域的程序安排，美国政治哲学家罗尔斯有一个著名论断：“切蛋糕的权力和分蛋糕的权力必须分开，切蛋糕的人最后一个拿蛋糕，才可以最有效地保证蛋糕切得均匀”。按照这样的道理，评估师和拍卖师为同一人，绝难保证独立和公平。诚如报道所称，这其中可能存在的情况是：其一，拍卖师为了顺利拍出公车，故意评估低价；二是业主可以借此自由掌控中标人。这两种后果都将造成国有资产的流失。<br>\n<br>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 耐人寻味的是，中牟县国资局已经承认钟某确实同在两家公司任职，分别扮演着评估师与拍卖师的角色。不敢肯定中牟县国资局是在什么时候知道评估师和拍卖师是同一人的，因此我们只能这样设问：如果拍卖前就知道钟某既是评估师又是拍卖师，为何不叫停？如果是事后知道，为何不纠错？<br>\n<br>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 目前尚无法确定此次拍卖是否存在猫腻或腐败问题，但评估师和拍卖师为同一个人，不能不让人产生怀疑。而从评估价和实际拍卖价看，同样值得推敲。比如，一辆牌号为豫AP2062的昌河车，登记于2003年6月，右后有破损，评估价为2200元，成交价1600元。成交价居然比评估价还低，区区一千多元是不是真当废铁卖了？再比如，一辆普桑轿车，评估价为1500元，成交价为3500元。评估价才1500元，这真是坑爹啊！是的，这些公车也许车龄长、车型老、车况差，但总不能当废铁卖吧？如此种种，评估价、成交价可谓太低，难怪有网友表示，这么便宜的车，他们要是知道消息，一定会去“团购”的。<br>\n<br>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 评估师和拍卖师是同一个人，买受人是不是同一人你？有网友猜测买受人估计与拍卖师存在利益输送，或许是内部人。虽是推测，但足以说明此次拍卖难以让人信服。那么，能否公开买受人的真实信息，由相关部门进行公开调查？<br>\n<br>\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr> 中牟县公车拍卖事件十分可疑，如果确实存有猫腻，就必须取消此次拍卖，收回已经拍卖的公车。若重新拍卖，则须由真正独立的评估公司、拍卖公司操作。当然，此次拍卖若存在腐败，亦应依法依纪严惩幕后操作人员。</p>', '2011-12-23 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141903217.jpg');
INSERT INTO `article` VALUES (64, '2020春节快乐', '2020年是不平凡的一年', '2020-01-16 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141856219.jpg');
INSERT INTO `article` VALUES (78, '长沙是哪个省份的城市', '是湖南的', '2020-01-03 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141848088.jpg');
INSERT INTO `article` VALUES (94, '疫情冲击下，中小微企业如何渡过难关？', '<p class=\"one-p\">疫情突如其来，中小微企业普遍遭受冲击。从中央到地方陆续出台各种措施，多管齐下力挺中小微企业。</p><p class=\"one-p\">2月3日，中央政治局常委会再次专题研究疫情，会议提到，<span>要在做好防控工作的前提下，全力支持和组织推动各类生产企业复工复产。</span></p><p class=\"one-p\">扶助的政策还有哪些？岛妹做了整理，一起来看。</p><p class=\"one-p\">部署</p><p class=\"one-p\">中小微企业最难的是资金周转，急需从资金端对企业进行重点保障。</p><p class=\"one-p\">2月1日，央行、财政部、银保监会、证监会、外汇管理局五部门联合出台了<span>《关于进一步强化金融支持防控新型冠状病毒感染肺炎疫情的通知》</span>，旨在维护疫情防控特殊时期银行体系资金合理充裕。</p><p class=\"one-p\">《通知》指出，对受疫情影响较大的批发零售、住宿餐饮、物流运输、文化旅游等行业，以及有发展前景但受疫情影响暂遇困难的企业，特别是小微企业，不得盲目抽贷、断贷、压贷。</p><p class=\"one-p\">对受疫情影响严重的企业到期还款困难的，可予以展期或续贷。通过适当下调贷款利率、增加信用贷款和中长期贷款等方式，支持相关企业战胜疫情灾害影响。</p><p class=\"one-p\">前述通知下发后，央行火速向市场投放资金。其在2月3日<span>开展1.2万亿逆回购操作</span>，实现流动性净投放近1500亿；2月3日，央行下调7天期和14天期逆回购利率10个基点，继续释放流动性。2月4日，央行继续开展逆回购操作，实现流动性净投放4000亿。至此，银行体系流动性已比去年同期多出超1万亿元。</p><p class=\"one-p\">资金投放市场之后，能否流入中小微企业的口袋，是接下来的一个关键。</p><p class=\"one-p\">对此，网商、微众、华瑞等民营银行表示，对受疫情影响较大的行业及有发展前景但暂时受困的企业<span>不抽贷、不断贷、不压贷</span>，将通过展期、无还本续贷、信贷重组、减免逾期利息等方式予以全力支持。</p><p class=\"one-p\">苏州银行则针对防疫物资和保障民生生产、流通、运输的贷款需求给出利率优惠，提出可低至3.98%的贷款年化利率；对相关企业的票据、结算、资金汇划等手续费也给予减免优惠。</p><p class=\"one-p\">信贷发力的同时，财政补贴也在跟进。2月2日，财政部发布通知，<span>要求对疫情防控重点保障企业贷款给予</span><span>财政贴息支持</span>，加大对受疫情影响个人和企业的创业担保贷款贴息支持力度，优化对受疫情影响企业的融资担保服务。</p>', '2020-02-06 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208142111037.png');
INSERT INTO `article` VALUES (95, '资讯管理系统', '<p>第一篇文章</p><p><img src=\"http://localhost:8080/Source_war_exploded/uploadfile/20200204232757365.png\" alt=\"20200204232757365.png\"><img src=\"http://localhost:8080/Source_war_exploded/uploadfile/20200206191241783.png\" alt=\"20200206191241783.png\"><br></p>', '2020-02-14 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141839670.jpg');
INSERT INTO `article` VALUES (96, '详解李兰娟团队重大抗疫药物成果：2款处方药，已在浙江临床使用', '<div class=\"introduction\">中国工程院院士、国家卫健委高级别专家组成员李兰娟团队，在武汉公布治疗新冠病毒肺炎的最新研究成果：对多种抗病毒药物筛选之后，发现阿比朵尔和达芦那韦两种药物，能有效抑制冠状病毒。</div><p class=\"one-p\">赖可 乾明 发自 凹非寺</p><p class=\"one-p\">量子位 报道 | 公众号 QbitAI</p><p class=\"one-p\">药，药，初步验证有效的药。</p><p class=\"one-p\">治疗新冠肺炎，再次传来好消息，而且直接来自疫区中心——武汉。</p><p class=\"one-p\">2月4日下午，中国工程院院士、国家卫健委高级别专家组成员李兰娟团队，在武汉公布治疗新冠病毒肺炎的最新研究成果：</p><p class=\"one-p\">对多种抗病毒药物筛选之后，发现阿比朵尔和达芦那韦两种药物，能有效抑制冠状病毒。</p><p class=\"one-p\">根据长江日报报道，这些结果来自于体外细胞实验，李兰娟院士团队已经完成了初步测试，已经在浙江的患者资料中使用。</p><p class=\"one-p\">她还建议，将以上两种药物列入国家卫健委《新型冠状病毒感染的肺炎诊疗方案（试行第六版）》。</p><p class=\"one-p\"><img src=\"http://localhost:8080/Source_war_exploded/uploadfile/20200205140634587.png\" alt=\"20200205140634587.png\"><br></p>', '2020-02-08 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141827729.jpg');
INSERT INTO `article` VALUES (98, '从人人人人', '内容填写在此处人', '2020-02-21 00:00:00', 1, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141820274.jpg');
INSERT INTO `article` VALUES (100, '迪丽热巴为武汉疫情喊话加油，淡妆出镜美得让人挑不出毛病', '<h1>迪丽热巴为武汉疫情喊话加油，淡妆出镜美得让人挑不出毛病</h1>', '2020-02-07 22:24:32', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141812925.jpg');
INSERT INTO `article` VALUES (101, '刘亦菲花木兰造型登上迪士尼杂志封面，英姿飒爽眼神坚毅气场足', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A0K7L200.html\" target=\"_blank\">刘亦菲花木兰造型登上迪士尼杂志封面，英姿飒爽眼神坚毅气场足</a></h3>', '2020-02-07 22:24:54', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141759321.jpg');
INSERT INTO `article` VALUES (102, '从迪士尼到环球影业、索尼，2020缺失中国市场的好莱坞', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A0PQOG00.html\" target=\"_blank\">从迪士尼到环球影业、索尼，2020缺失中国市场的好莱坞</a></h3>', '2020-02-07 22:25:11', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141750312.jpg');
INSERT INTO `article` VALUES (103, '赵本山一对龙凤胎23岁生日，兄妹俩一同庆生，妈妈罕见出镜气质佳', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A0DONV00.html\" target=\"_blank\">赵本山一对龙凤胎23岁生日，兄妹俩一同庆生，妈妈罕见出镜气质佳</a></h3>', '2020-02-07 22:25:23', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141742709.jpg');
INSERT INTO `article` VALUES (104, '昆凌街拍与儿子温馨对视，小小周与外公同框出镜呆萌十足', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A07K9O00.html\" target=\"_blank\">昆凌街拍与儿子温馨对视，小小周与外公同框出镜呆萌十足</a></h3>', '2020-02-07 22:25:35', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141733256.jpg');
INSERT INTO `article` VALUES (105, '吴尊以儿女名义为疫区工作人员捐款，儿子大名罕见曝光', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A0ACW300.html\" target=\"_blank\">吴尊以儿女名义为疫区工作人员捐款，儿子大名罕见曝光</a></h3>', '2020-02-07 22:25:45', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141721252.jpg');
INSERT INTO `article` VALUES (106, '陈浩民一家居住小区发现肺炎确诊病例，全家自我隔离并消毒全屋', '<h3><a href=\"https://new.qq.com/omn/20200207/20200207A0KZAE00.html\" target=\"_blank\">陈浩民一家居住小区发现肺炎确诊病例，全家自我隔离并消毒全屋</a></h3>', '2020-02-07 22:25:55', 8, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208142023728.png');
INSERT INTO `article` VALUES (107, '彻底释放！中国女足5分钟2球 姑娘们大雨中疯狂庆祝', '<p><a target=\"_blank\" href=\"https://new.qq.com/rain/a/20200207A0BN7C00\" class=\"\">彻底释放！中国女足5分钟2球 姑娘们大雨中疯狂庆祝</a></p>', '2020-02-07 22:26:23', 9, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141935823.jpg');
INSERT INTO `article` VALUES (108, '女足取14个月来最大比分胜利 这场进的比去年一年都多', '<p><a target=\"_blank\" href=\"https://new.qq.com/rain/a/20200207A0DFR700\" class=\" icon-v\">女足取14个月来最大比分胜利 这场进的比去年一年都多</a></p>', '2020-02-07 22:26:34', 9, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141633028.jpg');
INSERT INTO `article` VALUES (109, '郑智向武汉疫区捐50万！', '<p>郑智向武汉疫区捐50万！</p>', '2020-02-07 22:26:51', 9, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141708391.jpg');
INSERT INTO `article` VALUES (110, '足协已跟泰国打招呼', '<p><a target=\"_blank\" href=\"https://new.qq.com/rain/a/20200207A0MB0A00\" class=\"\">足协已跟泰国打招呼</a></p>', '2020-02-07 22:27:02', 9, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141625679.jpg');
INSERT INTO `article` VALUES (111, '尘埃落定？曝郜林已与绯闻东家面谈，名记：谈判很顺利', '<p><a target=\"_blank\" href=\"https://new.qq.com/rain/a/20200207A0NI6700\" class=\"\">尘埃落定？曝郜林已与绯闻东家面谈，名记：谈判很顺利</a></p>', '2020-02-07 22:27:13', 9, 'http://localhost:8080/Source_war_exploded/uploadfile/20200208141618505.jpg');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT '分类编号(主码，自动增长编号)',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `Sort` int(4) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '最新时事', 1);
INSERT INTO `category` VALUES (8, '娱乐新闻', 2);
INSERT INTO `category` VALUES (9, '体育新闻', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名(设置为主码)',
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码(MD5)',
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'email',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'abc', '49ba59abbe56e057', 'aa@sina.com');
INSERT INTO `user` VALUES (2, 'keke1111', '965eb72c92a549dd', '11111@aaa.com');
INSERT INTO `user` VALUES (5, 'admin', '49ba59abbe56e057', 'admin@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
