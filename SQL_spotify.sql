CREATE DATABASE spotify;

CREATE TABLE spotify (
    date DATE,
    position INTEGER,
    song TEXT,
    artist TEXT,
    popularity INTEGER,
    duration_ms INTEGER,
    album_type VARCHAR(20),
    total_tracks INTEGER,
    release_date DATE,
    is_explicit BOOLEAN,
    album_cover_url TEXT
);

Select * from spotify;

-- Find each artist's total number of songs and average song popularity. 
-- Show only artists with at least 5 songs. Sort by average popularity highest to lowest.

		SELECT
	ARTIST,
	COUNT(SONG) AS TOTAL_SONG,
	AVG(POPULARITY) AS AVG_POPULARITY
FROM
	SPOTIFY
GROUP BY
	ARTIST
HAVING
	COUNT(SONG) >= 5
ORDER BY
	AVG_POPULARITY DESC;

-- Find the top 10 most popular songs.

		SELECT
	SONG,
	ARTIST,
	POPULARITY
FROM
	SPOTIFY
ORDER BY
	POPULARITY DESC
LIMIT
	10;
	
-- Find how many NULL values exist in important columns such as artist, song, and popularity.

		SELECT
	COUNT(*) FILTER (
		WHERE
			ARTIST IS NULL
	) AS NULL_ARTIST,
	COUNT(*) FILTER (
		WHERE
			SONG IS NULL
	) AS NULL_SONG,
	COUNT(*) FILTER (
		WHERE
			POPULARITY IS NULL
	) AS NULL_POPULARITY
FROM
	SPOTIFY;

-- Artist KPI Analysis
-- For each artist, calculate
-- Total songs
-- Average popularity
-- Maximum popularity
-- Minimum popularity

SELECT
	ARTIST,
	COUNT(SONG) AS TOTAL_SONGS,
	AVG(POPULARITY) AS AVG_POPULARITY,
	MAX(POPULARITY) AS MAX_POPULARITY,
	MIN(POPULARITY) AS MIN_POPULARITY
FROM
	SPOTIFY
GROUP BY
	ARTIST
ORDER BY
	TOTAL_SONGS DESC;
	
-- Rank each song within its artist based on popularity, where Rank 1 is the most popular song.

SELECT
	ARTIST,
	SONG,
	POPULARITY,
	RANK() OVER (
		PARTITION BY
			ARTIST
		ORDER BY
			POPULARITY DESC
	) AS SONG_RANK
FROM
	SPOTIFY;

-- --Find artists who:
-- Have at least 3 songs
-- Have an average popularity of at least 70

		SELECT
	ARTIST,
	COUNT(SONG) AS TOTAL_SONGS,
	AVG(POPULARITY) AS AVG_POPULARITY
FROM
	SPOTIFY
GROUP BY
	ARTIST
HAVING
	COUNT(SONG) >= 3
	AND AVG(POPULARITY) >= 70
ORDER BY
	AVG_POPULARITY DESC;

-- Find the most popular song for every artist.

WITH ranked_songs AS (
    SELECT artist,
           song,
           popularity,
           RANK() OVER(
               PARTITION BY artist
               ORDER BY popularity DESC
           ) AS song_rank
    FROM spotify
)
SELECT artist,
       song,
       popularity
FROM ranked_songs
WHERE song_rank = 1;









	