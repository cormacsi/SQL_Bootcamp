SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT DISTINCT visit_date
FROM person_visits
ORDER BY missing_date;