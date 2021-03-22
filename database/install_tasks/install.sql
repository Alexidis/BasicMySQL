# TABLE STRUCTURE FOR: content_type

INSERT INTO vk.`content_type` (`id`, `name`)
VALUES (1, 'post'),
       (2, 'user'),
       (3, 'media');


# TABLE STRUCTURE FOR: content

INSERT INTO vk.`content` (`id`, `content_type_id`)
VALUES (1, 1),
       (4, 1),
       (7, 1),
       (10, 1),
       (13, 1),
       (16, 1),
       (19, 1),
       (22, 1),
       (25, 1),
       (28, 1),
       (31, 1),
       (34, 1),
       (37, 1),
       (40, 1),
       (43, 1),
       (46, 1),
       (49, 1),
       (2, 2),
       (5, 2),
       (8, 2),
       (11, 2),
       (14, 2),
       (17, 2),
       (20, 2),
       (23, 2),
       (26, 2),
       (29, 2),
       (32, 2),
       (35, 2),
       (38, 2),
       (41, 2),
       (44, 2),
       (47, 2),
       (50, 2),
       (3, 3),
       (6, 3),
       (9, 3),
       (12, 3),
       (15, 3),
       (18, 3),
       (21, 3),
       (24, 3),
       (27, 3),
       (30, 3),
       (33, 3),
       (36, 3),
       (39, 3),
       (42, 3),
       (45, 3),
       (48, 3);



# TABLE STRUCTURE FOR: media_type

INSERT INTO vk.`media_type` (`id`, `name`)
VALUES (1, 'image'),
       (2, 'video'),
       (3, 'audio');


# TABLE STRUCTURE FOR: user

INSERT INTO vk.`user` (`id`, `email`, `phone`, `password_hash`, `created_at`, `deleted_at`, `content_id`)
VALUES (1, 'chelsea.nolan@ziemannmorissette.com', '79715642845', '8ccb822da1fea4a5ed5cfad52d7c04bc9e72ad4e', '2001-04-28 09:19:19', NULL, 2),
       (2, 'tillman04@kerluke.com', '79876332479', '2431bbb4ca51fcc6bba8cad64515dabdfce8ce9d', '1972-07-05 09:48:54', NULL, 5),
       (3, 'renner.jamaal@gmail.com', '79807919220', '7e6186199c81c011f47dbb00b4ea8a14ccd24700', '1971-01-15 23:21:19', NULL, 8),
       (4, 'ebony.yost@gmail.com', '79977520655', '7bd284a28273c081ffcb0616680bed9ebe139909', '2003-07-16 16:17:30', NULL, 11),
       (5, 'kiana.little@hotmail.com', '79152036596', '0f09f16e5b546b7a51dbe0326b116a46790545c1', '2001-07-27 03:17:46', NULL, 14),
       (6, 'corkery.margot@gmail.com', '79666851893', '48163d65e8cb0fcf9eb3150c88f18ea1acee1664', '1998-12-24 18:02:33', NULL, 17),
       (7, 'murphy.schowalter@yahoo.com', '79464676340', '3d547958feebe672c3d93b824bec29842aa5c2f5', '2006-04-06 08:44:54', NULL, 20),
       (8, 'broberts@vonrueden.info', '79934492799', '17fdf1bd3f72b9528af12b0145da4394e2d2ead8', '1983-07-27 05:48:33', NULL, 23),
       (9, 'vince.feil@hotmail.com', '79369168289', '1736424e6fab9be08cb6d015383b16117e1f275f', '2017-09-15 10:30:54', NULL, 26),
       (10, 'salvatore26@gmail.com', '79910639098', '7503e372b6d57d4f4a17c8e29eabff9d5841ef3b', '1970-01-27 06:58:28', NULL, 29),
       (11, 'elittle@hotmail.com', '79246482162', '285ca61292a4f609c1e2841734001f6a1012ab79', '1974-02-19 15:36:24', NULL, 32),
       (12, 'kkuvalis@nienow.biz', '79235678267', 'e84dd01104b13f92457a8a344da2c0b3b13702c2', '2006-10-05 03:12:42', NULL, 35),
       (13, 'qschmidt@hotmail.com', '79558475743', '207d17f3e1b03b75e73b47a373bf119918fd9a04', '1992-10-03 04:12:33', NULL, 38),
       (14, 'vkuhn@kreiger.com', '79186991210', 'acf8a45a228d52e4310cf293a8d83685a5dfce80', '1998-03-29 03:07:24', NULL, 41),
       (15, 'louvenia34@feest.org', '79288921220', '322630705a07c4220b7324aff879df3d7ba97de3', '2006-06-06 04:53:11', NULL, 44),
       (16, 'rswaniawski@hotmail.com', '79076299299', 'cd7a22548d46f1b9f37fce0c5865bfce43a4612e', '2007-12-22 12:08:56', NULL, 47),
       (17, 'weissnat.devan@quigleyfadel.org', '79948974990', '2aa51dd013399c3647c9e0ff21b206e07063d977', '2014-01-19 01:09:41', NULL, 50);


# TABLE STRUCTURE FOR: profile

INSERT INTO vk.`profile` (`user_id`, `firstname`, `lastname`, `gender`, `birthday`, `address`)
VALUES (1, 'Sterling', 'Kautzer', 'm', '1971-04-03', '2517 Quitzon Cape\nAdellechester, RI 81069-4265'),
       (2, 'Henriette', 'Armstrong', 'f', '1975-03-05', '224 Schmitt Key Suite 416\nEast Garfield, DC 41160-0427'),
       (3, 'Brielle', 'Parisian', 'f', '1997-01-26', '6328 Robel Lake Suite 498\nPfannerstillborough, MS 83946'),
       (4, 'Ludie', 'Carter', 'f', '1994-04-15', '1534 O\'Hara Station\nEast Bernice, OK 08809'),
       (5, 'Julius', 'Monahan', 'm', '2014-04-20', '6330 Vella Key\nPort Jade, CT 94906'),
       (6, 'Dallas', 'Johns', 'm', '1970-08-03', '948 Cummerata Rue\nJacynthestad, IN 55146'),
       (7, 'Jennyfer', 'Berge', 'f', '2001-11-21', '3038 Adella Plain\nLake Leopoldshire, RI 07012-0525'),
       (8, 'Violette', 'Howe', 'f', '2003-12-26', '9719 Moises Bridge\nSouth Randistad, TN 45018-4699'),
       (9, 'Reese', 'Stanton', 'x', '2007-10-05', '38454 Jeanne Prairie\nEast Jaylan, UT 63474-2543'),
       (10, 'Hardy', 'Hackett', 'x', '2008-01-19', '7357 Shaylee Crossroad\nBeaulahmouth, MT 77591-6541'),
       (11, 'Helena', 'Donnelly', 'f', '1988-03-16', '6922 Lorine Glens Suite 069\nImogenebury, MA 62177'),
       (12, 'Marilyne', 'Hilll', 'f', '2002-02-09', '94282 Malika Port\nPort Cali, ID 76348-7242'),
       (13, 'Shanna', 'Rosenbaum', 'f', '2001-04-10', '9585 Lottie Heights Apt. 745\nPort Antone, AR 54026-8588'),
       (14, 'Diamond', 'Zieme', 'x', '1997-11-17', '163 Dino Vista Suite 036\nPort Emerymouth, MN 46675-7131'),
       (15, 'Jarrell', 'Schowalter', 'm', '2007-05-19', '211 Goodwin Tunnel\nMelodyville, OH 93287'),
       (16, 'Milo', 'Wolff', 'm', '2008-11-09', '077 Osinski Square\nWest Clarabelleberg, FL 07389'),
       (17, 'Mae', 'Nienow', 'f', '1995-07-19', '00644 Lesly Via Apt. 383\nPort Anibal, PA 42952-5025');


# TABLE STRUCTURE FOR: community

INSERT INTO vk.`community` (`id`, `name`, `description`, `admin_id`)
VALUES (1, 'consequatur', 'Praesentium dolorum aut est.', 7),
       (2, 'possimus', 'A cupiditate non ab quis.', 15),
       (3, 'sint', 'Aspernatur nulla et ea corrupti ut vel unde.', 1),
       (4, 'est', 'Velit pariatur saepe consequatur architecto deleniti.', 10),
       (5, 'eligendi', 'Voluptate numquam ea et eum a et.', 8),
       (6, 'magnam', 'Atque itaque voluptatem harum ab ut maxime quis.', 4),
       (7, 'ea', 'Similique veniam enim nesciunt sapiente fugit error earum nesciunt.', 15),
       (8, 'quia', 'Et impedit enim dicta voluptatem et.', 9),
       (9, 'placeat', 'Accusantium eum est culpa earum.', 1),
       (10, 'voluptas', 'Incidunt eius eveniet reiciendis.', 7);


# TABLE STRUCTURE FOR: user_community

INSERT INTO vk.`user_community` (`community_id`, `user_id`)
VALUES (1, 2),
       (1, 5),
       (1, 14),
       (2, 9),
       (2, 15),
       (2, 16),
       (3, 12),
       (4, 3),
       (4, 12),
       (4, 14),
       (4, 15),
       (4, 16),
       (5, 9),
       (5, 13),
       (6, 2),
       (6, 13),
       (7, 7),
       (7, 11),
       (7, 13),
       (7, 17),
       (8, 3),
       (8, 9),
       (8, 14),
       (8, 16),
       (8, 17),
       (9, 2),
       (10, 9),
       (10, 11);


# TABLE STRUCTURE FOR: friend_request

INSERT INTO vk.`friend_request` (`from_user_id`, `to_user_id`, `status`, `created_at`, `updated_at`)
VALUES (2, 12, 0, '1994-09-13 04:17:38', '2011-02-08 18:26:06'),
       (3, 11, 1, '1985-02-02 15:54:22', '2004-05-01 13:10:12'),
       (5, 14, -1, '1986-12-14 17:51:08', Null),
       (6, 3, 1, '2008-05-22 12:40:48', '2005-02-24 12:03:22'),
       (8, 16, -1, '2000-01-19 10:15:23', '2003-03-19 23:26:18'),
       (13, 1, 1, '1990-12-07 11:02:57', Null),
       (13, 2, 0, '1986-02-28 15:04:47', Null),
       (13, 6, 0, '1974-03-18 03:21:29', '1992-04-14 06:10:28'),
       (15, 5, -1, '1977-06-10 22:52:21', Null),
       (16, 13, 0, '1996-05-13 02:56:10', Null),
       (16, 15, 0, '1994-02-04 10:45:39', '2010-07-12 09:29:48');


# TABLE STRUCTURE FOR: message

INSERT INTO vk.`message` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `updated_at`, `deleted_at`)
VALUES (1, 16, 7, 'Hic alias ut nihil vel officiis consequatur.', '2003-03-27 08:09:43', Null, NULL),
       (2, 11, 1, 'Repellendus qui perferendis voluptatem qui et assumenda nobis minima.', '2019-10-31 01:10:06', Null, NULL),
       (3, 11, 17, 'Aut atque in qui cum accusamus et.', '2014-03-16 10:09:14', '1976-07-09 09:50:36', NULL),
       (4, 7, 13, 'Et provident quasi quo et.', '2016-06-14 22:18:55', Null, NULL),
       (5, 9, 17, 'Esse qui rem asperiores a.', '2000-11-01 13:01:22', Null, NULL),
       (6, 6, 3, 'Eos fugit dolores quo nobis fugit ea.', '2007-01-29 23:52:35', '2005-11-12 00:17:46', NULL),
       (7, 4, 4, 'Consequatur ducimus corrupti ipsum et ex.', '2011-01-19 05:38:06', Null, NULL),
       (8, 4, 16, 'Molestiae vel perspiciatis iure molestiae.', '2005-11-27 10:50:34', Null, NULL),
       (9, 6, 15, 'Ipsa perspiciatis ipsum et quo incidunt.', '2015-08-02 20:34:26', '1986-01-08 06:38:46', NULL),
       (10, 10, 10, 'Adipisci nulla quia a rerum ducimus eius neque.', '1983-03-22 12:00:05', '2002-02-06 05:33:48', NULL),
       (11, 7, 15, 'Unde illum nemo ut doloribus aut.', '1981-07-16 10:07:48', Null, NULL),
       (12, 4, 6, 'Nisi minus et mollitia magni et et.', '2008-11-06 14:45:11', '2018-05-02 20:18:56', NULL),
       (13, 5, 10, 'Quis impedit libero perferendis eaque corrupti.', '2014-07-18 19:24:30', Null, NULL),
       (14, 16, 7, 'Odio velit voluptas corrupti neque facere expedita.', '2017-09-24 04:48:51', Null, NULL),
       (15, 2, 10, 'Rerum exercitationem reiciendis eaque sed.', '1979-04-07 23:23:37', '1981-10-10 11:38:17', NULL),
       (16, 11, 1, 'Molestiae excepturi earum sint id voluptate.', '1998-02-07 02:05:44', Null, NULL),
       (17, 17, 5, 'Ab sit et similique laudantium.', '2009-02-06 04:44:51', Null, NULL),
       (18, 1, 11, 'Suscipit fugit voluptatem provident hic nesciunt.', '2004-10-04 05:22:45', Null, NULL),
       (19, 4, 8, 'Ea aut cupiditate sint et.', '2014-08-12 01:55:32', '2019-09-27 19:41:19', NULL),
       (20, 7, 13, 'Rerum delectus accusamus delectus et ut nihil.', '2006-07-23 16:09:17', '1994-05-08 01:06:15', NULL),
       (21, 7, 12, 'Enim quo eos officiis odit soluta.', '1980-09-17 02:14:57', '1999-05-06 16:48:11', NULL),
       (22, 15, 11, 'Vel qui sit unde nesciunt.', '1985-06-10 14:58:02', Null, NULL),
       (23, 15, 2, 'Accusantium quasi quam officia corporis reprehenderit dicta unde.', '2010-06-11 08:55:28', Null, NULL),
       (24, 9, 4, 'Optio eos error fugit voluptates rerum.', '2019-07-28 21:09:26', Null, NULL),
       (25, 16, 1, 'Quas aspernatur omnis molestiae.', '1982-10-21 19:02:31', '1981-01-13 18:45:49', NULL),
       (26, 13, 6, 'Ea maiores recusandae et cumque atque.', '2015-06-20 06:30:59', Null, NULL),
       (27, 16, 17, 'Sapiente sed expedita doloremque libero.', '1970-10-20 10:30:54', Null, NULL),
       (28, 12, 3, 'Molestiae neque provident magni vel animi.', '2009-06-04 15:10:00', Null, NULL),
       (29, 10, 10, 'Perferendis beatae labore impedit doloremque.', '2013-08-13 05:03:15', Null, NULL),
       (30, 9, 11, 'Ab delectus ut dolor accusantium est vitae.', '2018-07-04 17:07:54', '2011-06-19 16:19:36', NULL),
       (31, 3, 2, 'Ducimus et explicabo ea.', '2008-04-10 00:15:02', '1983-03-04 23:52:15', NULL),
       (32, 11, 3, 'Harum voluptatem incidunt sunt eaque dolorum repellat eum.', '2007-08-08 05:48:20', '2008-06-10 22:31:04', NULL),
       (33, 7, 12, 'Officiis rem debitis delectus alias.', '2004-06-30 01:30:12', Null, NULL),
       (34, 13, 10, 'Voluptatem rem pariatur illum et illo quaerat.', '1971-05-10 10:13:08', Null, NULL),
       (35, 2, 2, 'Architecto et cumque eius.', '1974-07-22 19:54:08', Null, NULL),
       (36, 6, 9, 'Voluptas quia vitae non eius laborum quia eveniet.', '1975-09-22 04:00:30', '1982-07-31 18:43:21', NULL),
       (37, 13, 4, 'Maiores maxime ex numquam aut corporis.', '1996-08-12 12:37:52', Null, NULL),
       (38, 2, 11, 'Recusandae ad officiis quos aut est eius.', '1996-06-30 19:50:54', Null, NULL),
       (39, 5, 11, 'Similique rem aliquid ut nemo animi consequatur.', '1978-07-12 02:16:06', '2006-10-16 19:39:53', NULL),
       (40, 14, 4, 'Porro eligendi consequatur ratione.', '1992-02-06 01:06:51', Null, NULL);


# TABLE STRUCTURE FOR: media

INSERT INTO vk.`media` (`id`, `media_type_id`, `user_id`, `url`, `data`, `metadata`, `created_at`, `content_id`)
VALUES (1, 1, 1, 'video/vnd.fvt', NULL, NULL, '2020-12-14 16:22:51', 3),
       (2, 1, 2, 'application/x-tar', NULL, NULL, '1996-06-08 12:41:55', 6),
       (3, 3, 3, 'image/vnd.xiff', NULL, NULL, '1997-12-08 05:00:01', 9),
       (4, 1, 4, 'application/xml-dtd', NULL, NULL, '2001-04-14 09:00:04', 12),
       (5, 1, 5, 'application/vnd.umajin', NULL, NULL, '2014-03-22 12:51:08', 15),
       (6, 1, 6, 'audio/xm', NULL, NULL, '1988-06-10 08:28:38', 18),
       (7, 2, 7, 'application/vnd.mseq', NULL, NULL, '2020-06-03 05:58:19', 21),
       (8, 1, 8, 'application/x-wais-source', NULL, NULL, '1974-08-05 14:54:18', 24),
       (9, 1, 9, 'application/x-texinfo', NULL, NULL, '2016-12-09 08:42:53', 27),
       (10, 3, 10, 'application/vnd.flographit', NULL, NULL, '2020-01-25 12:13:41', 30),
       (11, 1, 11, 'application/vnd.lotus-organizer', NULL, NULL, '2008-07-18 20:51:52', 33),
       (12, 2, 12, 'application/xaml+xml', NULL, NULL, '1980-10-30 19:15:20', 36),
       (13, 3, 13, 'audio/vnd.rip', NULL, NULL, '2019-05-13 07:24:43', 39),
       (14, 2, 14, 'application/vnd.semf', NULL, NULL, '1980-02-24 11:39:13', 42),
       (15, 1, 15, 'video/h264', NULL, NULL, '2018-02-05 08:09:00', 45),
       (16, 2, 16, 'application/vnd.sun.xml.impress', NULL, NULL, '2004-10-01 13:10:02', 48);

# TABLE STRUCTURE FOR: post

INSERT INTO vk.`post` (`id`, `user_id`, `community_id`, `post_id`, `text`, `media_id`, `created_at`, `content_id`)
VALUES (1, 16, NULL, NULL, '', 13, '1980-07-10 07:11:06', 1),
       (2, 5, NULL, NULL, 'Sint facilis odit sit similique nobis occaecati.', 3, '2018-10-21 06:16:37', 4),
       (3, 10, NULL, NULL, '', 6, '2007-06-17 18:35:44', 7),
       (4, 4, NULL, NULL, 'Iusto id maiores nisi voluptatem.', 5, '1973-06-24 15:16:25', 10),
       (5, 5, NULL, NULL, '', 4, '2000-10-07 06:31:39', 13),
       (6, 13, NULL, NULL, '', 5, '2020-11-17 03:48:03', 16),
       (7, 5, NULL, NULL, 'Aut molestias numquam rerum voluptatibus vel sunt.', 1, '2004-05-01 02:37:24', 19),
       (8, 6, NULL, NULL, '', 5, '1993-09-30 01:14:23', 22),
       (9, 15, NULL, NULL, '', 15, '2014-10-30 10:09:10', 25),
       (10, 12, NULL, NULL, '', 12, '1987-11-01 04:20:31', 28),
       (11, 2, NULL, NULL, 'Molestiae numquam odit ut perspiciatis a sequi non.', 11, '1986-02-06 01:42:44', 31),
       (12, 3, NULL, NULL, 'Nam soluta id distinctio ad.', 15, '1997-12-23 21:18:28', 34),
       (13, 6, NULL, NULL, 'Animi eligendi voluptatem sit eaque quisquam iusto odio.', 7, '1973-04-27 15:24:47', 37),
       (14, 15, NULL, NULL, 'Nulla eos sit necessitatibus fugit.', 11, '1976-09-29 00:15:42', 40),
       (15, 16, NULL, NULL, '', 15, '1985-12-13 08:42:35', 43),
       (16, 7, NULL, NULL, '', 10, '2018-04-25 09:02:57', 46),
       (17, 8, NULL, NULL, '', 14, '1973-03-18 20:32:15', 49);



# TABLE STRUCTURE FOR: user_like

INSERT INTO vk.`user_like` (`user_id`, `content_id`, `created_at`)
VALUES (1, 9, '1980-03-25 08:53:50'),
       (1, 19, '2013-03-08 19:09:45'),
       (2, 5, '1972-10-10 11:24:22'),
       (2, 33, '2016-01-08 00:06:56'),
       (4, 12, '1991-09-12 10:07:39'),
       (4, 42, '2001-02-03 02:19:05'),
       (4, 46, '2006-10-14 16:33:30'),
       (5, 6, '1997-03-11 10:38:01'),
       (5, 22, '1972-06-24 19:52:35'),
       (5, 45, '1987-09-02 00:14:10'),
       (6, 12, '1980-11-07 17:44:50'),
       (6, 30, '1981-08-25 11:41:34'),
       (6, 35, '1972-04-28 04:29:00'),
       (6, 43, '2013-08-18 22:22:58'),
       (7, 2, '2014-04-29 02:07:40'),
       (7, 28, '2011-11-14 09:49:29'),
       (7, 44, '2007-12-30 21:31:01'),
       (8, 3, '1981-03-04 00:59:37'),
       (8, 33, '1993-05-10 06:44:32'),
       (9, 5, '2015-09-30 00:02:12'),
       (9, 8, '1994-07-30 15:27:04'),
       (9, 23, '1972-06-04 15:46:47'),
       (9, 39, '1994-06-28 21:03:25'),
       (10, 3, '1988-07-26 14:38:40'),
       (10, 10, '1984-04-25 06:30:32'),
       (10, 25, '1972-12-20 07:50:13'),
       (11, 7, '1977-02-01 08:34:29'),
       (11, 31, '2005-11-22 01:18:23'),
       (12, 29, '1975-02-21 07:32:52'),
       (12, 45, '2019-07-03 14:10:40'),
       (13, 23, '2019-07-22 20:51:06'),
       (13, 32, '2012-03-07 01:07:34'),
       (14, 4, '1970-03-06 10:59:30'),
       (14, 9, '1975-10-28 12:43:19'),
       (14, 15, '1982-03-14 13:08:31'),
       (14, 18, '1998-02-03 00:05:49'),
       (14, 26, '1977-10-02 09:04:44'),
       (15, 15, '2007-10-16 04:03:30'),
       (16, 32, '2000-09-11 17:43:34'),
       (17, 4, '1975-05-14 15:10:43'),
       (17, 32, '1990-10-31 04:07:28');




update vk.user
set created_at = created_at + INTERVAL (2021 - YEAR(created_at)) year
where created_at < '2021-01-01';


update vk.friend_request
set created_at = created_at + INTERVAL (2021 - YEAR(created_at)) year
where created_at < '2021-01-01';


update vk.friend_request
set updated_at = created_at + interval (ceil(RAND() * 100)) day
where updated_at < created_at;


delete from vk.message
where from_user_id = to_user_id;


update vk.message
set created_at = created_at + INTERVAL (2021 - YEAR(created_at)) year
where created_at < '2021-01-01';

update vk.message
set updated_at = created_at + INTERVAL (2021 - YEAR(created_at)) year
where updated_at < created_at;

update vk.media
set created_at = created_at + INTERVAL (2021 - YEAR(created_at)) year
where created_at < '2021-01-01';




update vk.post p
join vk.media m on p.media_id = m.id
set p.created_at = m.created_at + interval floor(RAND() * (1 + 59)) minute
where p.created_at <= m.created_at;


update vk.user_like ul
join vk.content c on
    c.id = ul.content_id
left join vk.user u on
    u.content_id = c.id
left join vk.post p on
    p.content_id = c.id
left join vk.media m on
    m.content_id = c.id
set ul.created_at = coalesce(u.created_at, p.created_at, m.created_at) + interval floor(RAND() * (1 + 59)) minute
where ul.created_at <= coalesce(u.created_at, p.created_at, m.created_at);


select
    ul.created_at,
    coalesce(u.created_at, p.created_at, m.created_at),
    ul.created_at <= coalesce(u.created_at, p.created_at, m.created_at)
from vk.user_like ul
join vk.content c on
    c.id = ul.content_id
left join vk.user u on
    u.content_id = c.id
left join vk.post p on
    p.content_id = c.id
left join vk.media m on
    m.content_id = c.id;
