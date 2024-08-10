# Twitch_stats
Objective: Analysing twitch dataset (2023)

Total number of Queries: 19

![image](https://github.com/user-attachments/assets/5fde0dc8-2c59-4bd5-b12c-deb5176203e7)

---
## SNAPSHOTS  


#1 Top 10 channels on basis of watch time <BR>

```
-- Query 1
-- Top 10 channels on basis of watch time

SELECT channel_name,
       watch_time_in_mins
FROM twitch
ORDER BY watch_time_in_mins DESC
LIMIT 10;

```
![image](https://github.com/user-attachments/assets/ce9cc7c6-9b45-473c-9912-1c16b08a3f7a)


<BR>

#2 Top 10 channels on basis of average viewers<BR>

```
-- Query 5
-- Top 10 channels on basis of average viewers

SELECT Channel_name,
       average_viewers
FROM twitch
ORDER BY average_viewers  DESC
LIMIT 10;


```
![image](https://github.com/user-attachments/assets/147ffd56-565e-49b5-bea3-23dc4611443c)

<BR>

#3 Compostion of viewership on basis of maturity <BR>

```
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

```
![image](https://github.com/user-attachments/assets/04335617-26d8-49c6-a669-1004b5868bb9)

<BR>

#4  Watchtime distribution according to language <BR>

```
-- Query 14
--  watchtime distribution according to language

SELECT _language,
       SUM(watch_time_in_mins) AS watchtime,
       ROUND(SUM(watch_time_in_mins)/ (SELECT SUM(watch_time_in_mins)
                                       FROM twitch)*100,2) AS watchtime_percentage
FROM twitch
GROUP BY _language
ORDER BY watchtime_percentage DESC;

```
![image](https://github.com/user-attachments/assets/f1982ecf-d5f9-431b-baf5-a9a274f45e93)

<BR>

#5 Most watched streamer according to language <BR>

```
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

```
![image](https://github.com/user-attachments/assets/041519fe-260f-404e-8e29-deca0ff1de5c)

<BR>

#6 Streamers with most following according to language <BR>

```
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

```
![image](https://github.com/user-attachments/assets/7fbe44fb-28a3-434b-b421-d35f96513f5b)

<BR>
