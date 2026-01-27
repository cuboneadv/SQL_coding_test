WITH CTE1 AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
),

CTE2 AS (
    SELECT player_id, DATE_ADD(first_date, INTERVAL 1 DAY) AS next_login_date
    FROM CTE1
),

CTE3 AS (
    SELECT COUNT(*) AS cnt_player_id
    FROM CTE2 C
    JOIN Activity A
      ON A.player_id = C.player_id
     AND A.event_date = C.next_login_date
)
SELECT ROUND((SELECT cnt_player_id FROM CTE3) /
             (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction;
