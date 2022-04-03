DROP DATABASE IF EXISTS drive_sound;
create database drive_sound;
use drive_sound;
create table user_info(
	user_id			varchar(5)   primary key,
    user_username	varchar(45)  not null,
    user_fname		varchar(45)	 not null,
    user_lname		varchar(45)	 not null,
    user_bdate		datetime	 not null,
    user_tel		varchar(10)  not null,
    user_bio		varchar(1000) 
);
insert into user_info(user_id,user_username,user_fname,user_lname,user_bdate,user_tel,user_bio) VALUES
('u0001','Steve_Jo','Steve','Jolington','1985-1-20','0919998877','I am one of music lover and I want to share my opinion in many sound that I know'),
('a0002','PPan01','Peter','Pan','1980-6-10','0834455667','My rating 4-5 - special/like my life, 3 - It great but not the best for me, 2 - just good, 0 - 1 - not ok for me'),
('u0003','Li_Lo','Lily','Lonatta','2002-10-20','0889988776','Satit to Muict, like photograhpy and drawing ^^');

Create table `users_login` (
`id`         int            NOT NULL primary key auto_increment,
`name`         varchar(45)       ,
`email`        varchar(255)    ,
`password`     varchar(255)    ,
`time`         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP   
)engine = InnoDB ;



Create table playlist(
	playlist_id			int				primary key,
    playlist_title		varchar(100)	not null,
    playlist_bywho		varchar(45)		not null
);
INSERT INTO playlist(playlist_id,playlist_title,playlist_bywho) values
(10001,'myplaylist','Steve_Jo'),
(10002,'Lighten Up ','PPan01'),
(10003,'Supportive list','Li_Lo');

create table song_info(
	song_id				int		 		primary key,
	song_name			varchar(20)  	not null,
    song_produced_date	date		 	,
    song_rating			int		 		,
    song_brand		   	varchar(20)  	,
    song_solo_musician	varchar(20)		,
    song_type_song		varchar(20)		,
    song_detail			varchar(1000)	,
    song_chord			varchar(1000)	,
    song_lyric			varchar(1000)	,
    song_album			varchar(100)	
);
insert into song_info(song_id,song_name,song_produced_date,song_rating,song_brand,song_solo_musician,song_type_song,song_detail,song_chord,song_lyric,song_album) VALUES
(00000001,'Sugar','2015-1-13','4','Maroon 5',null,'Pop','"Sugar" is a song recorded by American band Maroon 5 ..........',null,null,'V'),
(00000002,'Imagine','1971-9-9','4',null,'John Lennon','Rock','Imagine is the second studio album by English musician John Lennon, released on 9 September 1971 by Apple Records...........',null,null,'Imagine'),
(00000003,'Blinding light','2019-11-29','4',null,'The Weeknd','Electropop','"Blinding Lights" is a song by Canadian singer-songwriter the Weeknd. It was released on November 29, 2019,..........',null,null,'After Hours'),
(00000004,'Sugar2','2015-1-13','4','Maroon 5',null,'Pop','"Sugar" is a song recorded by American band Maroon 5 ..........',null,null,'V'),
(00000005,'Sugar3','2015-1-13','4','Maroon 5',null,'Pop','"Sugar" is a song recorded by American band Maroon 5 ..........',null,null,'V'),
(00000006,'Sugar4','2015-1-13','4','Maroon 5',null,'Pop','"Sugar" is a song recorded by American band Maroon 5 ..........',null,null,'V');

create table user_like(
	userid			varchar(5)	not null,
    songid			int			not null,
	FOREIGN KEY (userid) REFERENCES user_info(user_id),
    FOREIGN KEY (songid) REFERENCES song_info(song_id)
);

ALTER TABLE user_like
  ADD PRIMARY KEY (userid,songid);

insert into user_like(userid,songid) VALUES
('u0001',00000001),
('u0001',00000002),
('u0003',00000003);

create table user_listened(
	userid			varchar(5)	not null,
    songid			int			not null,
	FOREIGN KEY (userid) REFERENCES user_info(user_id),
    FOREIGN KEY (songid) REFERENCES song_info(song_id)
);

ALTER TABLE user_listened
  ADD PRIMARY KEY (userid,songid);
  
insert into user_listened(userid,songid) VALUES
('u0003',00000003),
('u0003',00000002),
('u0001',00000001);

create table user_listen_later(
	userid			varchar(5)	not null,
    songid			int			not null,
	FOREIGN KEY (userid) REFERENCES user_info(user_id),
    FOREIGN KEY (songid) REFERENCES song_info(song_id)
);

ALTER TABLE user_listen_later
  ADD PRIMARY KEY (userid,songid);
  
insert into user_listen_later(userid,songid) VALUES
('a0002',00000002),
('a0002',00000001),
('u0001',00000003);

create table add_song_to_playlist(
	playlistid		int		not null,
    songid			int		not null,
	FOREIGN KEY (playlistid) REFERENCES playlist(playlist_id),
    FOREIGN KEY (songid) REFERENCES song_info(song_id)
);

ALTER TABLE add_song_to_playlist
  ADD PRIMARY KEY (playlistid,songid);
  
insert into add_song_to_playlist(playlistid,songid) VALUES
(10003,00000003),
(10003,00000002),
(10001,00000001);

create table user_add_playlist(
	userid			varchar(5)	not null,
    playlistid		int			not null,
    FOREIGN KEY (userid) REFERENCES user_info(user_id),
	FOREIGN KEY (playlistid) REFERENCES playlist(playlist_id)
);

ALTER TABLE user_add_playlist
  ADD PRIMARY KEY (userid,playlistid);
  
insert into user_add_playlist(userid,playlistid) VALUES
('u0003',10001),
('u0003',10002),
('u0001',10003);
