CREATE TABLE `hibernate_sequence` (`next_val` bigint(20) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `author` (`id` bigint(20) NOT NULL,`city` varchar(255) DEFAULT NULL,`email` varchar(255) DEFAULT NULL,`firstName` varchar(255) DEFAULT NULL,`houseNr` varchar(255) DEFAULT NULL,`lastName` varchar(255) DEFAULT NULL,`passWord` varchar(255) DEFAULT NULL,`photo` longblob,`street` varchar(255) DEFAULT NULL,`userName` varchar(255) DEFAULT NULL,`zip` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authorcomment` (`id` bigint(20) NOT NULL,`comment` varchar(255) DEFAULT NULL,`author_id` bigint(20) DEFAULT NULL,`blogPost_id` bigint(20) DEFAULT NULL,PRIMARY KEY (`id`), KEY `FKdxey7h6lcei4jrv6wchdodqd` (`author_id`), KEY `FKo6vkjqt9jskugi80bwf9wxi4e` (`blogPost_id`), CONSTRAINT `FKdxey7h6lcei4jrv6wchdodqd` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`), CONSTRAINT `FKo6vkjqt9jskugi80bwf9wxi4e` FOREIGN KEY (`blogPost_id`) REFERENCES `blogpost` (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `blogpost` (`id` bigint(20) NOT NULL,`body` varchar(255) DEFAULT NULL,`likeClick` int(11) DEFAULT NULL,`postTime` datetime DEFAULT NULL,`title` varchar(255) DEFAULT NULL,`author_id` bigint(20) DEFAULT NULL, PRIMARY KEY (`id`), KEY `FK6teqwabsksuxeu1map7wdwp5l` (`author_id`), CONSTRAINT `FK6teqwabsksuxeu1map7wdwp5l` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-1, 'Tim', 'Vandale', 'Doggeweg', '50', 'Anderlecht', '1070', 'timbo@gmail.com', 'Timbo', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-2, 'Senan', 'Ninja', 'Steenweg', '23', 'Brussel', '1000', 'optimussenan@gmail.com', 'NinjaSenan', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-3, 'Anastasiia', 'Wonderwoman', 'Hoogstraat', '33', 'Brussel', '1000', 'anastasiia@gmail.com', 'Wonderwoman', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-4, 'Molowayi', 'Lion', 'Louizalaan', '19', 'Brussel', '1000', 'molo@gmail.com', 'Molo','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-5, 'John', 'Beton', 'Eikstraat', '10', 'Brussel', '1000', 'Johnbeton@gmail.com','Concrete', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-6, 'Belex', 'Magerras', 'Cellebroerstraat', '8', 'Brussel', '1000', 'belexf@gmail.com', 'Steel', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-7, 'Claude', 'Dor', 'Gentsesteenweg', '2', 'Brussel', '1000', 'claudedor@gmail.com', 'Chocolate','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-8, 'Geert', 'Peerd', 'Veldstraat', '22', 'Gent', '9000', 'hetpeerd@gmail.com', 'Samson','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-9, 'Frederik', 'Roemelaars', 'Veldstraat', '34', 'Gent', '9000', 'frewilly@gmail.com', 'Frewilly','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-10, 'Jim', 'Vermeire', 'Holstraat', '19', 'Gent', '9000', 'slimjim@gmail.com','slimjim', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-11, 'Jonathan', 'Roels', 'Bondgenotenlaan', '10', 'Leuven', '3000', 'jonaroe@gmail.com','Jojo','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-12, 'Jef', 'Verstraten', 'Diestsestraat', '31', 'Leuven', '3000', 'jef2000@gmail.com', 'Jefke', '123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-13, 'Melinda', 'Groens', 'Schapenstraat', '9', 'Leuven', '3000', 'melindacakes@gmail.com', 'Melicake','123');
INSERT INTO author (id, firstName, lastName, street, houseNr, city, zip, email, userName, password)  VALUES (-14, 'Kim', 'Marynissen', 'Carnotstraat', '22', 'Antwerpen', '2000', 'kimmary@gmail.com','kimmary', '123');


INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-15, 'Now this is the story all about how My life got flipped, turned upside down And I''d like to take a minute just sit right there I''ll tell you how I became the prince of a town called Bel-air', 20, '2018-03-30 19:47:34', 'Will Smith', -1);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-16, 'Kage Bunshin No Jutsu', 55, '2018-01-10 19:25:34', 'Ninjaguide', -2);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-17, 'Front end tips', 55, '2018-01-30 19:10:24','How to front end', -3);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-18, 'Roar', 55, '2018-03-30 19:47:34', 'Beastmode', -4);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-19, 'Blablablablabla', 55, '2018-01-30 19:47:34','blabla', -5);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-20, 'I traveled to the underworld and back', 100, '2018-03-30 12:12:11', 'Hades', -6);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-21, 'I went to Disneyland for the first time', 321, '2018-01-20 14:23:10', 'I saw Mickey!', -7);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-22, 'I don''t even like traveling why am I here', 1, '2018-01-10 19:47:34', 'Why are we still here?', -8);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-23, 'Went to Japan. Sushi was amazing.', 983, '2018-03-30 19:47:22', 'Tokyoooo!', -9);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-24, 'I''m thinking about going to Florida.', 184, '2018-03-30 12:47:20', 'Sunny Florida',-10);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-25, 'Mount Fuji was amazing!!!', 1298, '2018-01-30 12:47:34', 'Fuji', -11);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-26, 'America was pretty cool.', 298, '2018-03-10 12:22:34', 'United States of Awesome', -12);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-27, 'Iceland didn''t have enough ice.', 23, '2018-03-30 19:47:34', 'With ice please', -13);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-28, 'Rainforests are such an amazing bit of nature.', 134, '2018-03-30 19:47:34', 'Nature for the win', -14);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-39, 'American restaurants give you so much food...', 623, '2018-03-30 19:42:31', 'McDonalds!', -6);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-40, 'Scotland is so nice. Really has this medieval feel to it.', 523, '2018-03-20 12:27:34', 'Bagpipes and kilts!', -5);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-41, 'As a fan of Bob Marley I just had to go to Jamaica.', 5311, '2018-03-30 19:47:34', 'Is this love', -10);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-42, 'The moon is the ultimate place to travel. Elon Musk needs to make spacetravel consumer ready!', 2321, '2018-03-30 19:47:34', 'To the moon and back', -12);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-43, 'Egypt was alright, I guess.', 13314, '2018-03-30 19:47:34', 'Sphinxes and jinxes', -13);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-44, 'England was just dreadful. It was constantly raining and people were rude to me.', 2424, '2018-03-30 18:22:34', 'Tea and crumpets but no sunshine', -11);
INSERT INTO blogpost(id, body, likeClick, postTime, title, author_id) VALUES (-45, 'help', 20333, '2018-01-12 19:10:34', 'How do I blog', -1);

INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-29, 'Awful', -2, -15);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-30, 'Very bad.', -3, -15);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-31, 'Yeah really bad', -4, -15);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-32, 'Nice!', -5, -16);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-33, 'Ooh fun', -6, -17);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-34, 'Wow!', -7, -18);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-35, 'Uhuh.', -8, -19);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-36, 'Pretty edgy, bro', -9, -20);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-37, 'Love Disneyland!!!', -10, -21);
INSERT INTO authorcomment (id, comment, author_id, blogPost_id)VALUES(-38, 'Why indeed', -11, -22);