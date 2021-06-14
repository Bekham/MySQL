INSERT INTO friend_requests (initiator_user_id,target_user_id,status,requested_at,updated_at) VALUES
	 (1001,1002,'unfriended','2001-09-09 11:25:35','2021-06-04 21:18:38'),
	 (1002,1002,'declined','2010-01-15 00:12:23','2021-06-04 21:18:38'),
	 (1003,1002,'declined','1993-02-17 09:42:31','2021-06-04 21:18:38'),
	 (1005,1002,'unfriended','1988-07-12 18:41:54','2021-06-04 21:18:38'),
	 (1009,1002,'requested','1984-05-12 11:21:29','2021-06-04 21:18:38'),
	 (1011,1002,'approved','1975-01-25 09:05:57','2021-06-04 21:18:38'),
	 (1012,1002,'requested','1996-03-13 17:38:33','2021-06-04 21:18:38'),
	 (1014,1002,'unfriended','1977-07-09 21:16:18','2021-06-04 21:18:38'),
	 (1015,1002,'approved','2010-05-26 00:11:50','2021-06-04 21:18:38'),
	 (1020,1002,'declined','2010-11-09 13:04:15','2021-06-04 21:18:38');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('1', '1', '1');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('2', '2', '2');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('3', '3', '3');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('4', '4', '4');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('5', '5', '5');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('6', '6', '6');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('7', '7', '7');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('8', '8', '8');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('9', '9', '9');
UPDATE friend_requests set target_user_id = target_user_id + 1;
DELETE FROM users_communities 
WHERE user_id < 1010;