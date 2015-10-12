alter table t_gameAnnouncement MODIFY column content mediumtext ;

alter table t_game MODIFY column description mediumtext ;

ALTER  table t_gameAnnouncement  ADD column annoTitle  varchar(500);