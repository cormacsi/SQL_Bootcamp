WITH dates AS (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_date)
SELECT dates.missing_date::date
FROM dates
LEFT JOIN
     (SELECT visit_date, person_id
      FROM person_visits
      WHERE person_id = 1 OR person_id = 2
      ) AS pv
ON visit_date = missing_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;