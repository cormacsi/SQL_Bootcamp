SELECT p.name,
       count(*) AS count_of_visits
FROM person_visits
INNER JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
HAVING count(*) > 3;