# 🎵 Spotify Data Analysis Dashboard

> An end-to-end data analytics project exploring Spotify song and artist performance using SQL, Power Query, and Power BI.

![Dashboard Preview](https://github.com/DataWithDilkhush/Spotify-Data-Analysis-Dashboard-Power-BI-Postgre-SQL/blob/main/Dashboard.png)

---

## 📌 Project Objective

Analyze Spotify chart data to uncover **popularity patterns**, compare **artist performance**, identify **trending songs**, and present insights through an interactive **Power BI dashboard**.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Database creation & storage |
| **SQL** | Data analysis & querying |
| **Power Query** | Data cleaning & transformation |
| **Power BI** | Dashboard & visualization |
| **Excel** | Supporting data validation |

---

## 📁 Dataset Overview

- **Records:** 27,800 rows
- **Source:** Spotify Charts

| Column | Description |
|--------|-------------|
| `date` | Chart date |
| `position` | Chart position of the song |
| `song` | Song name |
| `artist` | Artist name |
| `popularity` | Spotify popularity score (0–100) |
| `duration_ms` | Song duration in milliseconds |
| `album_type` | Album / Single / Compilation |
| `total_tracks` | Total tracks in the album |
| `release_date` | Album release date |
| `is_explicit` | Whether the song has explicit content |
| `album_cover_url` | URL to album cover image |

---

## 🔄 Project Workflow

```
Data Collection → Data Cleaning → SQL Analysis → Power BI Modeling → Dashboard → Insights
```

1. **Data Collection** — Spotify chart data collected in CSV format
2. **Data Cleaning & Validation** — Handled NULLs, data types, and duplicates using Power Query
3. **SQL Analysis** — Wrote queries for KPIs, rankings, and artist comparisons
4. **Power BI Data Modeling** — Built relationships and calculated measures
5. **Dashboard Development** — Designed a 3-page interactive dashboard
6. **Insight Generation** — Extracted key findings from the visuals

---

## 🔍 SQL Analysis Highlights

```sql
-- Top 10 Most Popular Songs
SELECT song, artist, popularity
FROM spotify
ORDER BY popularity DESC
LIMIT 10;

-- Artist KPI Analysis
SELECT artist,
       COUNT(song) AS total_songs,
       AVG(popularity) AS avg_popularity,
       MAX(popularity) AS max_popularity,
       MIN(popularity) AS min_popularity
FROM spotify
GROUP BY artist
ORDER BY total_songs DESC;

-- Most Popular Song Per Artist (Window Function)
WITH ranked_songs AS (
    SELECT artist, song, popularity,
           RANK() OVER (PARTITION BY artist ORDER BY popularity DESC) AS song_rank
    FROM spotify
)
SELECT artist, song, popularity
FROM ranked_songs
WHERE song_rank = 1;
```

### Queries Included:
- ✅ Top 10 most popular songs
- ✅ Artist-wise song count & average popularity
- ✅ Artist KPI analysis (Total, Avg, Max, Min popularity)
- ✅ Song ranking within each artist using Window Functions
- ✅ Most popular song for each artist
- ✅ NULL value validation
- ✅ Filtered artists with ≥ 3 songs and avg popularity ≥ 70

---

## 📊 Power BI Dashboard

The dashboard contains **3 interactive pages:**

### 🏠 Overview Page
- KPI Cards — Distinct Songs, Avg Popularity, Distinct Artists, Top Song
- Song By Artist (bar chart)
- Song By Popularity by Day
- Total Song & Popularity donut charts
- Album Type distribution
- Monthly popularity trend

### 🎤 Artists Page
- Artist-level performance breakdown
- Popularity comparison across artists
- Top artist leaderboard

### 🎵 Songs Page
- Individual song explorer
- Song ranking table
- Album cover display

---

---

## 📈 Key Insights

- 🎵 **789 distinct songs** analyzed across the dataset
- 🎤 **342 unique artists** featured in the charts
- ⭐ **Average popularity score: 90/100**
- 👑 **Taylor Swift** leads with 1,871 total song appearances
- 📅 **Wednesday** sees the highest song popularity overall
- 💿 **Albums** dominate over singles and compilations in chart performance
- 🔝 **"All I Want for Christmas Is You"** ranked as the Top Song

---

## 💡 Inspiration & Credits

This project was inspired by the following YouTube tutorial:

> 📺 **[Spotify Data Analysis Dashboard — YouTube Tutorial](https://youtu.be/MjeDkDHJqzc?si=jTYA8oaZ4V2Vl0zO)**

I followed the tutorial as a learning exercise and extended it with my own SQL analysis, additional queries, and custom dashboard design.

---

## 👤 Author

**Dilkhush Godsay** — Aspiring Data Analyst

---

## 📫 Connect With Me

<p align="center">
  <a href="https://www.linkedin.com/in/dilkhush-godsay">
    <img src="https://img.shields.io/badge/LinkedIn-dilkhush--godsay-F97316?style=for-the-badge&logo=linkedin&logoColor=white" />
  </a>
  &nbsp;
  <a href="mailto:godsaydilkhushemail@gmail.com">
    <img src="https://img.shields.io/badge/Gmail-godsaydilkhush-F97316?style=for-the-badge&logo=gmail&logoColor=white" />
  </a>
  &nbsp;
  <a href="https://github.com/DataWithDilkhush">
    <img src="https://img.shields.io/badge/GitHub-DataWithDilkhush-F97316?style=for-the-badge&logo=github&logoColor=white" />
  </a>
</p>

---

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Times+New+Roman&size=14&pause=1000&color=F97316&center=true&vCenter=true&width=500&lines=Thanks+for+visiting+my+profile!+⭐;Let's+connect+and+grow+together!" alt="footer typing" />
</p>
