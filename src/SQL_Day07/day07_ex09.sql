SELECT address,
       round(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
       round(avg(age), 2) AS average,
       round(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) > round(avg(age), 2) AS comparison
FROM person
GROUP BY address
ORDER BY address;