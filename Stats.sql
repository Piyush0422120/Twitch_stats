-- Twitch stats
USE twitch_stats;
-- -------------------------------------------------------
-- Query 1
-- Top 10 channels on basis of watch time

SELECT channel_name,
	   watch_time_in_mins
FROM twitch
ORDER BY watch_time_in_mins DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 2
-- Top 10 channels on basis of stream time

SELECT channel_name,
	   stream_time_in_mins
FROM twitch
ORDER BY stream_time_in_mins DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 3
-- Top 10 channels on basis of watchtime/ one minute of stream

SELECT channel_name,
	   watch_time_in_mins/stream_time_in_mins AS watchtime_per_min_stream
FROM twitch
ORDER BY  watchtime_per_min_stream DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 4
-- Top 10 channels on basis of peak viewers

SELECT Channel_name,
	   peak_viewers
FROM twitch
ORDER BY peak_viewers  DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 5
-- Top 10 channels on basis of average viewers

SELECT Channel_name,
	   average_viewers
FROM twitch
ORDER BY average_viewers  DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 6
-- Top 10 channels on basis of followers

SELECT Channel_name,
	   followers
FROM twitch
ORDER BY followers  DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 7
-- Top 10 Mature (16-18+ content) streamers on basis of watchtime

SELECT Channel_name,
	   watch_time_in_mins
FROM twitch
WHERE Mature='True'
ORDER BY watch_time_in_mins  DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 8
-- Top 10 Non Mature streamers on basis of watchtime

SELECT Channel_name,
	   watch_time_in_mins
FROM twitch
WHERE Mature='False'
ORDER BY watch_time_in_mins  DESC
LIMIT 10;

-- -------------------------------------------------------
-- Query 9
--  Total number of mature and non mature streamers

SELECT 
	   CASE
       WHEN Mature='True' THEN 'Mature'
       ELSE 'NOT MATURE'
       END AS Content_type,
       COUNT(Channel_name) AS channels
FROM twitch
GROUP BY MATURE;

-- -------------------------------------------------------
-- Query 10
--  Compostion of viewership on basis of maturity

SELECT 
	   CASE
       WHEN Mature='True' THEN 'Mature'
       ELSE 'NOT MATURE'
       END AS Content_type,
       SUM(Watch_time_in_mins) AS minutes_watched,
	   ROUND(SUM(Watch_time_in_mins)/(SELECT SUM(watch_time_in_mins)
									  FROM twitch)*100,2) AS Percentage_of_viwership
FROM twitch
GROUP BY MATURE;

-- -------------------------------------------------------
-- Query 11
--  Compostion of streamtime on basis of maturity

SELECT 
	   CASE
       WHEN Mature='True' THEN 'Mature'
       ELSE 'NOT MATURE'
       END AS Content_type,
       SUM(stream_time_in_mins) AS minutes_watched,
	   ROUND(SUM(stream_time_in_mins)/(SELECT SUM(stream_time_in_mins)
									  FROM twitch)*100,2) AS Percentage_of_streaming_time
FROM twitch
GROUP BY MATURE;

-- -------------------------------------------------------
-- Query 12
--  Distribution of followers on basis of maturity

SELECT 
	   CASE
       WHEN Mature='True' THEN 'Mature'
       ELSE 'NOT MATURE'
       END AS Content_type,
       SUM(followers) AS minutes_watched,
	   ROUND(SUM(followers)/(SELECT SUM(followers)
									  FROM twitch)*100,2) AS following_percentage
FROM twitch
GROUP BY MATURE;

-- -------------------------------------------------------
-- Query 13
--  Distribution of streamers according to language

SELECT _language,
	   COUNT(channel_name) AS number_of_channels
FROM twitch
GROUP BY _language
ORDER BY number_of_channels DESC;

-- -------------------------------------------------------
-- Query 14
--  watchtime distribution according to language

SELECT _language,
	   SUM(watch_time_in_mins) AS watchtime,
	   ROUND(SUM(watch_time_in_mins)/(SELECT SUM(watch_time_in_mins)
									  FROM twitch)*100,2) AS watchtime_percentage
FROM twitch
GROUP BY _language
ORDER BY watchtime_percentage DESC;

-- -------------------------------------------------------
-- Query 15
--  streamtime distribution according to language

SELECT _language,
	   SUM(stream_time_in_mins) AS watchtime,
	   ROUND(SUM(stream_time_in_mins)/(SELECT SUM(stream_time_in_mins)
									  FROM twitch)*100,2) AS streamtime_percentage
FROM twitch
GROUP BY _language
ORDER BY streamtime_percentage DESC;

-- -------------------------------------------------------
-- Query 16
--  followers distribution according to language

SELECT _language,
	   SUM(followers) AS watchtime,
	   ROUND(SUM(followers)/(SELECT SUM(followers)
									  FROM twitch)*100,2) AS followers_percentage
FROM twitch
GROUP BY _language
ORDER BY followers_percentage DESC;

-- -------------------------------------------------------
-- Query 17
--  Most watched streamer according to language

SELECT _language,
	   channel_name,
	   MAX(watch_time_in_mins) AS watch_time
FROM Twitch
WHERE (_language,watch_time_in_mins) IN (SELECT _language,
												 MAX(Watch_time_in_mins)
										 FROM twitch
                                         GROUP BY _language ) 
GROUP BY _language, channel_name
ORDER BY watch_time DESC;

-- -------------------------------------------------------
-- Query 18
--  streamers with most streaming minutes according to language

SELECT _language,
	   channel_name,
	   MAX(stream_time_in_mins) AS stream_time
FROM Twitch
WHERE (_language,stream_time_in_mins) IN (SELECT _language,
												 MAX(stream_time_in_mins)
										 FROM twitch
                                         GROUP BY _language )
GROUP BY _language, channel_name
ORDER BY stream_time DESC;

-- -------------------------------------------------------
-- Query 19
--  Streamers with most following according to language

SELECT _language,
	   channel_name,
	   MAX(followers) AS followers
FROM Twitch
WHERE (_language,followers) IN (SELECT _language,
												 MAX(followers)
										 FROM twitch
                                         GROUP BY _language )
GROUP BY _language, channel_name
ORDER BY followers DESC;

-- -----------------------------------------DONE--------------------------


