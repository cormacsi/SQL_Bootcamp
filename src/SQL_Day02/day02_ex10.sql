SELECT p.name AS person_name1,
       p2.name AS person_name2,
       p.address AS common_address
FROM person p
INNER JOIN person p2 ON p2.address = p.address
WHERE p.id > p2.id
ORDER BY person_name1, person_name2, common_address;