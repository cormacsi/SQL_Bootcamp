WITH c AS (SELECT tmp.id, name, rate_to_usd FROM currency
           INNER JOIN
          (SELECT id, MAX(updated) FROM currency
           GROUP BY id) AS tmp on tmp.max = currency.updated
           AND tmp.id = currency.id),
     b AS (SELECT user_id, SUM(money) AS volume,
                  type, currency_id
           FROM balance
           GROUP BY user_id, type, currency_id)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       b.volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       b.volume * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM "user" u
FULL JOIN b on u.id = b.user_id
FULL JOIN c on c.id = b.currency_id
ORDER BY name DESC, lastname, type;