/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : wechat

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 13/05/2020 07:51:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文代码',
  `cn_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `num_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数字码',
  `dialing_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码区号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'AFGHANISTAN', 'AF', '阿富汗', '4', '93');
INSERT INTO `country` VALUES (2, 'ÅLAND ISLANDS', 'AX', '奥兰群岛(芬兰属)', '248', NULL);
INSERT INTO `country` VALUES (3, 'ALBANIA', 'AL', '阿尔巴尼亚', '8', '355');
INSERT INTO `country` VALUES (4, 'ALGERIA', 'DZ', '阿尔及利亚', '12', '213');
INSERT INTO `country` VALUES (5, 'AMERICAN SAMOA', 'AS', '美属萨摩亚', '16', '684');
INSERT INTO `country` VALUES (6, 'ANDORRA', 'AD', '安道尔', '20', '376');
INSERT INTO `country` VALUES (7, 'ANGOLA', 'AO', '安哥拉', '24', '244');
INSERT INTO `country` VALUES (8, 'ANGUILLA', 'AI', '安圭拉岛', '660', '1264');
INSERT INTO `country` VALUES (9, 'ANTARCTICA', 'AQ', '南极洲', '10', NULL);
INSERT INTO `country` VALUES (10, 'ANTIGUA AND BARBUDA', 'AG', '安提瓜和巴布达', '28', '1268');
INSERT INTO `country` VALUES (11, 'ARGENTINA', 'AR', '阿根廷', '32', '54');
INSERT INTO `country` VALUES (12, 'ARMENIA', 'AM', '亚美尼亚', '51', '374');
INSERT INTO `country` VALUES (13, 'ARUBA', 'AW', '阿鲁巴', '533', NULL);
INSERT INTO `country` VALUES (14, 'AUSTRALIA', 'AU', '澳大利亚', '36', '61');
INSERT INTO `country` VALUES (15, 'AUSTRIA', 'AT', '奥地利', '40', '43');
INSERT INTO `country` VALUES (16, 'AZERBAIJAN', 'AZ', '阿塞拜疆', '31', '994');
INSERT INTO `country` VALUES (17, 'BAHAMAS', 'BS', '巴哈马', '44', '1242');
INSERT INTO `country` VALUES (18, 'BAHRAIN', 'BH', '巴林', '48', '973');
INSERT INTO `country` VALUES (19, 'BANGLADESH', 'BD', '孟加拉国', '50', '880');
INSERT INTO `country` VALUES (20, 'BARBADOS', 'BB', '巴巴多斯', '52', '1246');
INSERT INTO `country` VALUES (21, 'BELARUS', 'BY', '白俄罗斯', '112', '375');
INSERT INTO `country` VALUES (22, 'BELGIUM', 'BE', '比利时', '56', '32');
INSERT INTO `country` VALUES (23, 'BELIZE', 'BZ', '伯利兹', '84', '501');
INSERT INTO `country` VALUES (24, 'BENIN', 'BJ', '贝宁', '204', '229');
INSERT INTO `country` VALUES (25, 'BERMUDA', 'BM', '百慕大群岛', '60', '1441');
INSERT INTO `country` VALUES (26, 'BHUTAN', 'BT', '不丹', '64', NULL);
INSERT INTO `country` VALUES (27, 'BOLIVIA, PLURINATIONAL STATE OF', 'BO', '玻利维亚', '68', '591');
INSERT INTO `country` VALUES (28, 'BOSNIA AND HERZEGOVINA', 'BA', '波斯尼亚和黑塞哥维那', '70', NULL);
INSERT INTO `country` VALUES (29, 'BOTSWANA', 'BW', '博茨瓦纳', '72', '267');
INSERT INTO `country` VALUES (30, 'BOUVET ISLAND', 'BV', '布韦岛', '74', NULL);
INSERT INTO `country` VALUES (31, 'BRAZIL', 'BR', '巴西', '76', '55');
INSERT INTO `country` VALUES (32, 'BRITISH INDIAN OCEAN TERRITORY', 'IO', '英属印度洋领地', '86', NULL);
INSERT INTO `country` VALUES (33, 'BRUNEI DARUSSALAM', 'BN', '文莱', '96', '673');
INSERT INTO `country` VALUES (34, 'BULGARIA', 'BG', '保加利亚', '100', '359');
INSERT INTO `country` VALUES (35, 'BURKINA FASO', 'BF', '布基纳法索', '854', '226');
INSERT INTO `country` VALUES (36, 'BURUNDI', 'BI', '布隆迪', '108', '257');
INSERT INTO `country` VALUES (37, 'CAMBODIA', 'KH', '柬埔寨', '116', '855');
INSERT INTO `country` VALUES (38, 'CAMEROON', 'CM', '喀麦隆', '120', '237');
INSERT INTO `country` VALUES (39, 'CANADA', 'CA', '加拿大', '124', '1');
INSERT INTO `country` VALUES (40, 'CAPE VERDE', 'CV', '佛得角', '132', NULL);
INSERT INTO `country` VALUES (41, 'CAYMAN ISLANDS', 'KY', '开曼群岛', '136', '1345');
INSERT INTO `country` VALUES (42, 'CENTRAL AFRICAN REPUBLIC', 'CF', '中非共和国', '140', '236');
INSERT INTO `country` VALUES (43, 'CHAD', 'TD', '乍得', '148', '235');
INSERT INTO `country` VALUES (44, 'CHILE', 'CL', '智利', '152', '56');
INSERT INTO `country` VALUES (45, 'CHINA', 'CN', '中国', '156', '86');
INSERT INTO `country` VALUES (46, 'CHRISTMAS ISLAND', 'CX', '圣诞岛', '162', NULL);
INSERT INTO `country` VALUES (47, 'COCOS (KEELING) ISLANDS', 'CC', '科科斯群岛（基灵群岛）', '166', NULL);
INSERT INTO `country` VALUES (48, 'COLOMBIA', 'CO', '哥伦比亚', '170', '57');
INSERT INTO `country` VALUES (49, 'COMOROS', 'KM', '科摩罗', '174', NULL);
INSERT INTO `country` VALUES (50, 'CONGO', 'CG', '刚果', '178', '242');
INSERT INTO `country` VALUES (51, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', '刚果民主共和国', '180', NULL);
INSERT INTO `country` VALUES (52, 'COOK ISLANDS', 'CK', '库克群岛', '184', '682');
INSERT INTO `country` VALUES (53, 'COSTA RICA', 'CR', '哥斯达黎加', '188', '506');
INSERT INTO `country` VALUES (54, 'CÔTE D\'IVOIRE', 'CI', '科特迪瓦', '384', '225');
INSERT INTO `country` VALUES (55, 'CROATIA', 'HR', '克罗地亚', '191', NULL);
INSERT INTO `country` VALUES (56, 'CUBA', 'CU', '古巴', '192', '53');
INSERT INTO `country` VALUES (57, 'CYPRUS', 'CY', '塞浦路斯', '196', '357');
INSERT INTO `country` VALUES (58, 'CZECH REPUBLIC', 'CZ', '捷克共和国', '203', '420');
INSERT INTO `country` VALUES (59, 'DENMARK', 'DK', '丹麦', '208', '45');
INSERT INTO `country` VALUES (60, 'DJIBOUTI', 'DJ', '吉布提', '262', '253');
INSERT INTO `country` VALUES (61, 'DOMINICA', 'DM', '多米尼加', '212', NULL);
INSERT INTO `country` VALUES (62, 'DOMINICAN REPUBLIC', 'DO', '多米尼加共和国', '214', '1890');
INSERT INTO `country` VALUES (63, 'ECUADOR', 'EC', '厄瓜多尔', '218', '593');
INSERT INTO `country` VALUES (64, 'EGYPT', 'EG', '埃及', '818', '20');
INSERT INTO `country` VALUES (65, 'EL SALVADOR', 'SV', '萨尔瓦多', '222', '503');
INSERT INTO `country` VALUES (66, 'EQUATORIAL GUINEA', 'GQ', '赤道几内亚', '226', NULL);
INSERT INTO `country` VALUES (67, 'ERITREA', 'ER', '厄立特里亚', '232', NULL);
INSERT INTO `country` VALUES (68, 'ESTONIA', 'EE', '爱沙尼亚', '233', '372');
INSERT INTO `country` VALUES (69, 'ETHIOPIA', 'ET', '埃塞俄比亚', '231', '251');
INSERT INTO `country` VALUES (70, 'FALKLAND ISLANDS (MALVINAS)', 'FK', '福克兰群岛(马尔维纳斯群岛)', '238', NULL);
INSERT INTO `country` VALUES (71, 'FAROE ISLANDS', 'FO', '法罗群岛', '234', NULL);
INSERT INTO `country` VALUES (72, 'FIJI', 'FJ', '斐济群岛', '242', '679');
INSERT INTO `country` VALUES (73, 'FINLAND', 'FI', '芬兰', '246', '358');
INSERT INTO `country` VALUES (74, 'FRANCE', 'FR', '法国', '250', '33');
INSERT INTO `country` VALUES (75, 'FRENCH GUIANA', 'GF', '法属圭亚那', '254', '594');
INSERT INTO `country` VALUES (76, 'FRENCH POLYNESIA', 'PF', '法属波利尼西亚', '258', '689');
INSERT INTO `country` VALUES (77, 'FRENCH SOUTHERN TERRITORIES', 'TF', '法属南极地区', '260', NULL);
INSERT INTO `country` VALUES (78, 'GABON', 'GA', '加蓬', '266', '241');
INSERT INTO `country` VALUES (79, 'GAMBIA', 'GM', '冈比亚', '270', '220');
INSERT INTO `country` VALUES (80, 'GEORGIA', 'GE', '乔治亚', '268', '995');
INSERT INTO `country` VALUES (81, 'GERMANY', 'DE', '德国', '276', '49');
INSERT INTO `country` VALUES (82, 'GHANA', 'GH', '加纳', '288', '233');
INSERT INTO `country` VALUES (83, 'GIBRALTAR', 'GI', '直布罗陀', '292', '350');
INSERT INTO `country` VALUES (84, 'GREECE', 'GR', '希腊', '300', '30');
INSERT INTO `country` VALUES (85, 'GREENLAND', 'GL', '格陵兰', '304', NULL);
INSERT INTO `country` VALUES (86, 'GRENADA', 'GD', '格林纳达', '308', '1809');
INSERT INTO `country` VALUES (87, 'GUADELOUPE', 'GP', '瓜德罗普岛', '312', NULL);
INSERT INTO `country` VALUES (88, 'GUAM', 'GU', '关岛', '316', '1671');
INSERT INTO `country` VALUES (89, 'GUATEMALA', 'GT', '危地马拉', '320', '502');
INSERT INTO `country` VALUES (90, 'GUERNSEY', 'GG', '格恩西', '831', NULL);
INSERT INTO `country` VALUES (91, 'GUINEA', 'GN', '几内亚', '324', '224');
INSERT INTO `country` VALUES (92, 'GUINEA-BISSAU', 'GW', '几内亚比绍', '624', NULL);
INSERT INTO `country` VALUES (93, 'GUYANA', 'GY', '圭亚那', '328', '592');
INSERT INTO `country` VALUES (94, 'HAITI', 'HT', '海地', '332', '509');
INSERT INTO `country` VALUES (95, 'HEARD ISLAND AND MCDONALD ISLANDS', 'HM', '赫德和麦克唐纳群岛', '334', NULL);
INSERT INTO `country` VALUES (96, 'HOLY SEE (VATICAN CITY STATE)', 'VA', '梵蒂冈城', '336', NULL);
INSERT INTO `country` VALUES (97, 'HONDURAS', 'HN', '洪都拉斯', '340', '504');
INSERT INTO `country` VALUES (98, 'HONG KONG', 'HK', '中国香港', '344', '852');
INSERT INTO `country` VALUES (99, 'HUNGARY', 'HU', '匈牙利', '348', '36');
INSERT INTO `country` VALUES (100, 'ICELAND', 'IS', '冰岛', '352', '354');
INSERT INTO `country` VALUES (101, 'INDIA', 'IN', '印度', '356', '91');
INSERT INTO `country` VALUES (102, 'INDONESIA', 'ID', '印度尼西亚', '360', '62');
INSERT INTO `country` VALUES (103, 'IRAN, ISLAMIC REPUBLIC OF', 'IR', '伊朗', '364', '98');
INSERT INTO `country` VALUES (104, 'IRAQ', 'IQ', '伊拉克', '368', '964');
INSERT INTO `country` VALUES (105, 'IRELAND', 'IE', '爱尔兰', '372', '353');
INSERT INTO `country` VALUES (106, 'ISLE OF MAN', 'IM', '马恩岛', '833', NULL);
INSERT INTO `country` VALUES (107, 'ISRAEL', 'IL', '以色列', '376', '972');
INSERT INTO `country` VALUES (108, 'ITALY', 'IT', '意大利', '380', '39');
INSERT INTO `country` VALUES (109, 'JAMAICA', 'JM', '牙买加', '388', '1876');
INSERT INTO `country` VALUES (110, 'JAPAN', 'JP', '日本', '392', '81');
INSERT INTO `country` VALUES (111, 'JERSEY', 'JE', '泽西', '832', NULL);
INSERT INTO `country` VALUES (112, 'JORDAN', 'JO', '约旦', '400', '962');
INSERT INTO `country` VALUES (113, 'KAZAKHSTAN', 'KZ', '哈萨克斯坦', '398', '327');
INSERT INTO `country` VALUES (114, 'KENYA', 'KE', '肯尼亚', '404', '254');
INSERT INTO `country` VALUES (115, 'KIRIBATI', 'KI', '基里巴斯', '296', NULL);
INSERT INTO `country` VALUES (116, 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'KP', '朝鲜', '408', '850');
INSERT INTO `country` VALUES (117, 'KOREA, REPUBLIC OF', 'KR', '韩国', '410', '82');
INSERT INTO `country` VALUES (118, 'KUWAIT', 'KW', '科威特', '414', '965');
INSERT INTO `country` VALUES (119, 'KYRGYZSTAN', 'KG', '吉尔吉斯斯坦', '417', '331');
INSERT INTO `country` VALUES (120, 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'LA', '老挝', '418', '856');
INSERT INTO `country` VALUES (121, 'LATVIA', 'LV', '拉脱维亚', '428', '371');
INSERT INTO `country` VALUES (122, 'LEBANON', 'LB', '黎巴嫩', '422', '961');
INSERT INTO `country` VALUES (123, 'LESOTHO', 'LS', '莱索托', '426', '266');
INSERT INTO `country` VALUES (124, 'LIBERIA', 'LR', '利比里亚', '430', '231');
INSERT INTO `country` VALUES (125, 'LIBYAN ARAB JAMAHIRIYA', 'LY', '利比亚', '434', '218');
INSERT INTO `country` VALUES (126, 'LIECHTENSTEIN', 'LI', '列支敦士登', '438', '423');
INSERT INTO `country` VALUES (127, 'LITHUANIA', 'LT', '立陶宛', '440', '370');
INSERT INTO `country` VALUES (128, 'LUXEMBOURG', 'LU', '卢森堡', '442', '352');
INSERT INTO `country` VALUES (129, 'MACAO', 'MO', '中国澳门', '446', '853');
INSERT INTO `country` VALUES (130, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', '马其顿,前南斯拉夫共和国', '807', NULL);
INSERT INTO `country` VALUES (131, 'MADAGASCAR', 'MG', '马达加斯加', '450', '261');
INSERT INTO `country` VALUES (132, 'MALAWI', 'MW', '马拉维', '454', '265');
INSERT INTO `country` VALUES (133, 'MALAYSIA', 'MY', '马来西亚', '458', '60');
INSERT INTO `country` VALUES (134, 'MALDIVES', 'MV', '马尔代夫', '462', '960');
INSERT INTO `country` VALUES (135, 'MALI', 'ML', '马里', '466', '223');
INSERT INTO `country` VALUES (136, 'MALTA', 'MT', '马耳他', '470', '356');
INSERT INTO `country` VALUES (137, 'MARSHALL ISLANDS', 'MH', '马绍尔群岛', '584', NULL);
INSERT INTO `country` VALUES (138, 'MARTINIQUE', 'MQ', '马提尼克岛', '474', '596');
INSERT INTO `country` VALUES (139, 'MAURITANIA', 'MR', '毛里塔尼亚', '478', NULL);
INSERT INTO `country` VALUES (140, 'MAURITIUS', 'MU', '毛里求斯', '480', '230');
INSERT INTO `country` VALUES (141, 'MAYOTTE', 'YT', '马约特岛', '175', NULL);
INSERT INTO `country` VALUES (142, 'MEXICO', 'MX', '墨西哥', '484', '52');
INSERT INTO `country` VALUES (143, 'MICRONESIA, FEDERATED STATES OF', 'FM', '密克罗尼西亚', '583', NULL);
INSERT INTO `country` VALUES (144, 'MOLDOVA, REPUBLIC OF', 'MD', '摩尔多瓦', '498', '373');
INSERT INTO `country` VALUES (145, 'MONACO', 'MC', '摩纳哥', '492', '377');
INSERT INTO `country` VALUES (146, 'MONGOLIA', 'MN', '蒙古', '496', '976');
INSERT INTO `country` VALUES (147, 'MONTENEGRO', 'ME', '门的内哥罗(黑山)', '499', NULL);
INSERT INTO `country` VALUES (148, 'MONTSERRAT', 'MS', '蒙特塞拉特', '500', '1664');
INSERT INTO `country` VALUES (149, 'MOROCCO', 'MA', '摩洛哥', '504', '212');
INSERT INTO `country` VALUES (150, 'MOZAMBIQUE', 'MZ', '莫桑比克', '508', '258');
INSERT INTO `country` VALUES (151, 'MYANMAR', 'MM', '缅甸', '104', '95');
INSERT INTO `country` VALUES (152, 'NAMIBIA', 'NA', '纳米比亚', '516', '264');
INSERT INTO `country` VALUES (153, 'NAURU', 'NR', '瑙鲁', '520', '674');
INSERT INTO `country` VALUES (154, 'NEPAL', 'NP', '尼泊尔', '524', '977');
INSERT INTO `country` VALUES (155, 'NETHERLANDS', 'NL', '荷兰', '528', '31');
INSERT INTO `country` VALUES (156, 'NETHERLANDS ANTILLES', 'AN', '荷属安的列斯群岛', '530', '599');
INSERT INTO `country` VALUES (157, 'NEW CALEDONIA', 'NC', '新喀里多尼亚', '540', NULL);
INSERT INTO `country` VALUES (158, 'NEW ZEALAND', 'NZ', '新西兰', '554', '64');
INSERT INTO `country` VALUES (159, 'NICARAGUA', 'NI', '尼加拉瓜', '558', '505');
INSERT INTO `country` VALUES (160, 'NIGER', 'NE', '尼日尔', '562', '227');
INSERT INTO `country` VALUES (161, 'NIGERIA', 'NG', '尼日利亚', '566', '234');
INSERT INTO `country` VALUES (162, 'NIUE', 'NU', '纽埃', '570', NULL);
INSERT INTO `country` VALUES (163, 'NORFOLK ISLAND', 'NF', '诺福克岛', '574', NULL);
INSERT INTO `country` VALUES (164, 'NORTHERN MARIANA ISLANDS', 'MP', '北马里亚纳群岛', '580', NULL);
INSERT INTO `country` VALUES (165, 'NORWAY', 'NO', '挪威', '578', '47');
INSERT INTO `country` VALUES (166, 'OMAN', 'OM', '阿曼', '512', '968');
INSERT INTO `country` VALUES (167, 'PAKISTAN', 'PK', '巴基斯坦', '586', '92');
INSERT INTO `country` VALUES (168, 'PALAU', 'PW', '帕劳群岛', '585', NULL);
INSERT INTO `country` VALUES (169, 'PALESTINIAN TERRITORY, OCCUPIED', 'PS', '巴勒斯坦当局', '275', NULL);
INSERT INTO `country` VALUES (170, 'PANAMA', 'PA', '巴拿马', '591', '507');
INSERT INTO `country` VALUES (171, 'PAPUA NEW GUINEA', 'PG', '巴布亚新几内亚', '598', '675');
INSERT INTO `country` VALUES (172, 'PARAGUAY', 'PY', '巴拉圭', '600', '595');
INSERT INTO `country` VALUES (173, 'PERU', 'PE', '秘鲁', '604', '51');
INSERT INTO `country` VALUES (174, 'PHILIPPINES', 'PH', '菲律宾', '608', '63');
INSERT INTO `country` VALUES (175, 'PITCAIRN', 'PN', '皮特克恩群岛', '612', NULL);
INSERT INTO `country` VALUES (176, 'POLAND', 'PL', '波兰', '616', '48');
INSERT INTO `country` VALUES (177, 'PORTUGAL', 'PT', '葡萄牙', '620', '351');
INSERT INTO `country` VALUES (178, 'PUERTO RICO', 'PR', '波多黎各', '630', '1787');
INSERT INTO `country` VALUES (179, 'QATAR', 'QA', '卡塔尔', '634', '974');
INSERT INTO `country` VALUES (180, 'REUNION', 'RE', '留尼汪岛', '638', '262');
INSERT INTO `country` VALUES (181, 'ROMANIA', 'RO', '罗马尼亚', '642', '40');
INSERT INTO `country` VALUES (182, 'RUSSIAN FEDERATION', 'RU', '俄罗斯', '643', '7');
INSERT INTO `country` VALUES (183, 'RWANDA', 'RW', '卢旺达', '646', NULL);
INSERT INTO `country` VALUES (184, 'SAINT BARTHÉLEMY', 'BL', '圣巴泰勒米', '652', NULL);
INSERT INTO `country` VALUES (185, 'SAINT HELENA', 'SH', '圣赫勒拿岛', '654', NULL);
INSERT INTO `country` VALUES (186, 'SAINT KITTS AND NEVIS', 'KN', '圣基茨和尼维斯', '659', NULL);
INSERT INTO `country` VALUES (187, 'SAINT LUCIA', 'LC', '圣卢西亚', '662', '1758');
INSERT INTO `country` VALUES (188, 'SAINT MARTIN', 'MF', '圣马丁', '663', NULL);
INSERT INTO `country` VALUES (189, 'SAINT PIERRE AND MIQUELON', 'PM', '圣皮埃尔岛和密克隆岛', '666', NULL);
INSERT INTO `country` VALUES (190, 'SAINT VINCENT AND THE GRENADINES', 'VC', '圣文森特和格林纳丁斯', '670', '1784');
INSERT INTO `country` VALUES (191, 'SAMOA', 'WS', '萨摩亚', '882', '685');
INSERT INTO `country` VALUES (192, 'SAN MARINO', 'SM', '圣马力诺', '674', '378');
INSERT INTO `country` VALUES (193, 'SAO TOME AND PRINCIPE', 'ST', '圣多美和普林西比', '678', '239');
INSERT INTO `country` VALUES (194, 'SAUDI ARABIA', 'SA', '沙特阿拉伯', '682', '966');
INSERT INTO `country` VALUES (195, 'SENEGAL', 'SN', '塞内加尔', '686', '221');
INSERT INTO `country` VALUES (196, 'SERBIA', 'RS', '塞尔维亚', '688', NULL);
INSERT INTO `country` VALUES (197, 'SEYCHELLES', 'SC', '塞舌尔', '690', '248');
INSERT INTO `country` VALUES (198, 'SIERRA LEONE', 'SL', '塞拉利昂', '694', '232');
INSERT INTO `country` VALUES (199, 'SINGAPORE', 'SG', '新加坡', '702', '65');
INSERT INTO `country` VALUES (200, 'SLOVAKIA', 'SK', '斯洛伐克', '703', '421');
INSERT INTO `country` VALUES (201, 'SLOVENIA', 'SI', '斯洛文尼亚', '705', '386');
INSERT INTO `country` VALUES (202, 'SOLOMON ISLANDS', 'SB', '所罗门群岛', '90', '677');
INSERT INTO `country` VALUES (203, 'SOMALIA', 'SO', '索马里', '706', '252');
INSERT INTO `country` VALUES (204, 'SOUTH AFRICA', 'ZA', '南非', '710', '27');
INSERT INTO `country` VALUES (205, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'GS', '南乔治亚和南桑德威奇群岛', '239', NULL);
INSERT INTO `country` VALUES (206, 'SPAIN', 'ES', '西班牙', '724', '34');
INSERT INTO `country` VALUES (207, 'SRI LANKA', 'LK', '斯里兰卡', '144', '94');
INSERT INTO `country` VALUES (208, 'SUDAN', 'SD', '苏丹', '736', '249');
INSERT INTO `country` VALUES (209, 'SURINAME', 'SR', '苏里南', '740', '597');
INSERT INTO `country` VALUES (210, 'SVALBARD AND JAN MAYEN', 'SJ', '斯瓦尔巴群岛和扬马延', '744', NULL);
INSERT INTO `country` VALUES (211, 'SWAZILAND', 'SZ', '斯威士兰', '748', '268');
INSERT INTO `country` VALUES (212, 'SWEDEN', 'SE', '瑞典', '752', '46');
INSERT INTO `country` VALUES (213, 'SWITZERLAND', 'CH', '瑞士', '756', '41');
INSERT INTO `country` VALUES (214, 'SYRIAN ARAB REPUBLIC', 'SY', '叙利亚', '760', '963');
INSERT INTO `country` VALUES (215, 'TAIWAN, PROVINCE OF CHINA', 'TW', '中国台湾', '158', '886');
INSERT INTO `country` VALUES (216, 'TAJIKISTAN', 'TJ', '塔吉克斯坦', '762', '992');
INSERT INTO `country` VALUES (217, 'TANZANIA, UNITED REPUBLIC OF', 'TZ', '坦桑尼亚', '834', '255');
INSERT INTO `country` VALUES (218, 'THAILAND', 'TH', '泰国', '764', '66');
INSERT INTO `country` VALUES (219, 'TIMOR-LESTE', 'TL', '东帝汶', '626', NULL);
INSERT INTO `country` VALUES (220, 'TOGO', 'TG', '多哥', '768', '228');
INSERT INTO `country` VALUES (221, 'TOKELAU', 'TK', '托克劳', '772', NULL);
INSERT INTO `country` VALUES (222, 'TONGA', 'TO', '汤加', '776', '676');
INSERT INTO `country` VALUES (223, 'TRINIDAD AND TOBAGO', 'TT', '特立尼达和多巴哥', '780', '1809');
INSERT INTO `country` VALUES (224, 'TUNISIA', 'TN', '突尼斯', '788', '216');
INSERT INTO `country` VALUES (225, 'TURKEY', 'TR', '土耳其', '792', '90');
INSERT INTO `country` VALUES (226, 'TURKMENISTAN', 'TM', '土库曼斯坦', '795', '993');
INSERT INTO `country` VALUES (227, 'TURKS AND CAICOS ISLANDS', 'TC', '特克斯群岛和凯科斯群岛', '796', NULL);
INSERT INTO `country` VALUES (228, 'TUVALU', 'TV', '图瓦卢', '798', NULL);
INSERT INTO `country` VALUES (229, 'UGANDA', 'UG', '乌干达', '800', '256');
INSERT INTO `country` VALUES (230, 'UKRAINE', 'UA', '乌克兰', '804', '380');
INSERT INTO `country` VALUES (231, 'UNITED ARAB EMIRATES', 'AE', '阿拉伯联合酋长国', '784', '971');
INSERT INTO `country` VALUES (232, 'UNITED KINGDOM', 'GB', '英国', '826', '44');
INSERT INTO `country` VALUES (233, 'UNITED STATES', 'US', '美国', '840', '1');
INSERT INTO `country` VALUES (234, 'UNITED STATES MINOR OUTLYING ISLANDS', 'UM', '美属小奥特兰群岛', '581', NULL);
INSERT INTO `country` VALUES (235, 'URUGUAY', 'UY', '乌拉圭', '858', '598');
INSERT INTO `country` VALUES (236, 'UZBEKISTAN', 'UZ', '乌兹别克斯坦', '860', '233');
INSERT INTO `country` VALUES (237, 'VANUATU', 'VU', '瓦努阿图', '548', NULL);
INSERT INTO `country` VALUES (238, 'VENEZUELA, BOLIVARIAN REPUBLIC OF', 'VE', '委内瑞拉', '862', '58');
INSERT INTO `country` VALUES (239, 'VIET NAM', 'VN', '越南', '704', '84');
INSERT INTO `country` VALUES (240, 'VIRGIN ISLANDS, BRITISH', 'VG', '维尔京群岛（英属）', '92', NULL);
INSERT INTO `country` VALUES (241, 'VIRGIN ISLANDS, U.S.', 'VI', '维尔京群岛', '850', NULL);
INSERT INTO `country` VALUES (242, 'WALLIS AND FUTUNA', 'WF', '瓦利斯群岛和富图纳群岛', '876', NULL);
INSERT INTO `country` VALUES (243, 'WESTERN SAHARA', 'EH', '西撒哈拉', '732', NULL);
INSERT INTO `country` VALUES (244, 'YEMEN', 'YE', '也门', '887', '967');
INSERT INTO `country` VALUES (245, 'ZAMBIA', 'ZM', '赞比亚', '894', '260');
INSERT INTO `country` VALUES (246, 'ZIMBABWE', 'ZW', '津巴布韦', '716', '263');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送者uid',
  `touid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收者uid',
  `chat_type` tinyint(2) NOT NULL COMMENT '会话类型',
  `msg_type` tinyint(2) NOT NULL COMMENT '消息类型',
  `msg_info` json NOT NULL COMMENT '消息信息',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `send_time` datetime(0) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `friend_id` int(11) NULL DEFAULT NULL,
  `rtime` int(10) NULL DEFAULT NULL COMMENT '关系建立时间',
  `remark` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '好友备注',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '关系状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES (1, 1, 2, NULL, '鲁班', 1);
INSERT INTO `relation` VALUES (2, 2, 1, NULL, '后裔', 1);
INSERT INTO `relation` VALUES (3, 1, 3, NULL, '刘德华', 1);
INSERT INTO `relation` VALUES (4, 3, 1, NULL, '后羿', 1);
INSERT INTO `relation` VALUES (5, 4, 1, NULL, '射手', 1);
INSERT INTO `relation` VALUES (6, 1, 1, NULL, '美女', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `nickname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `psw` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `provincial` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `country_id` tinyint(4) NULL DEFAULT NULL COMMENT '国家ID',
  `avatar` blob NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123abc', 'houyi', '18652955171', '1@qq.com', '1', '1', '江苏', '南京', NULL, NULL, 0x68747470733A2F2F706963342E7A68696D672E636F6D2F35302F76322D66633666656435616638366531613836623830613562656664336266356539315F68642E6A7067);
INSERT INTO `user` VALUES (2, 'wer4fr', '鲁班七号', '18652955172', '2@qq.com', '2', '1', '浙江', '杭州', NULL, NULL, 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F706F702F6A66732F7432353732302F3134382F3232313332373436332F33343435372F616337663966302F35623639366135374E34336466323463642E6A7067);
INSERT INTO `user` VALUES (3, '34345er', 'jack', '18652955173', '3@qq.com', '3', '1', '江苏', '苏州', NULL, NULL, 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F706F702F6A66732F7432323935312F3336302F313831333437373838352F33353239382F38353563383664612F35623639366135374E37633766633738352E6A7067);
INSERT INTO `user` VALUES (4, 'adsd231', '王昭君', '18652955174', '4@qq.com', '4', '2', '安徽', '合肥', NULL, NULL, 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F706F702F6A66732F7432353136382F3131352F3234313231353334352F32393034322F34376461346262612F35623639366135374E30393633646332392E6A7067);
INSERT INTO `user` VALUES (18, 'wxid', '123', '18652955175', NULL, '41d87d82ac2297aecf443c94e308ddb16b50348b07862503f4af57327a745ab1', NULL, NULL, NULL, '2020-04-17 09:45:13', 11, 0x76391D8DF91D8DF765);
INSERT INTO `user` VALUES (19, 'MTI1MDk2OTE0NDE1NzgwMjQ5Ng==', '123', '18652955176', NULL, '4796d5b2aac0c00d512e50268f9c6e6c0ad34d49bf6cc5b03387afcaf945799d', NULL, NULL, NULL, '2020-04-17 10:07:40', 11, 0x76391D8DF91D8DF765);
INSERT INTO `user` VALUES (20, 'wxidMTI1MDk3NTAzMTU1NTUyNjY1Ng', '123', '18652955177', NULL, 'c11455acbe19e6e4c99f046b337b2aa5a245e62ff9c641c1ec1d095e62ec807b', NULL, NULL, NULL, '2020-04-17 10:31:04', 11, 0x76391D8DF91D8DF765);

SET FOREIGN_KEY_CHECKS = 1;
