ALTER TABLE `twitch_stats`.`twitch` 
CHANGE COLUMN `Watch time(Minutes)` `Watch_time_in_mins` BIGINT NULL DEFAULT NULL ,
CHANGE COLUMN `Stream time(minutes)` `Stream_time_in_mins` BIGINT NULL DEFAULT NULL ,
CHANGE COLUMN `Peak viewers` `Peak_viewers` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Average viewers` `Average_viewers` INT NULL DEFAULT NULL ;
ALTER TABLE `twitch_stats`.`twitch` 
CHANGE COLUMN `Channel` `Channel_name` TEXT NULL DEFAULT NULL ;
ALTER TABLE `twitch_stats`.`twitch` 
CHANGE COLUMN `Language` `_Language` TEXT NULL DEFAULT NULL ;