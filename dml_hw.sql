DELETE FROM customer
WHERE customer_id in (
                    SELECT max (customer_id)
                    FROM customer
                    GROUP BY customer_name
                    HAVING count(*) > 1);

INSERT INTO customer(
    customer_name,
    phone,
    email,
    age,
    VIP
) VALUES (
'Jules Winfield',
'(972)083-4974',
'pulp@fiction.com',
29,
'true'
),
(
  'Vincent',
  '(635)4635414',
'Vega@mwallace.com',
34,
'true'
),
(
  'Mia',
  '(635)4635414',
'misswallace@mwallace.com',
28,
'true'
),
(
  'Butch',
  '(635)4632314',
'butch@zedsdead.com',
40,
'true'
);


INSERT INTO sale(
    customer_id,
    amount
) VALUES (
    2,
    400
);

INSERT INTO concession(
    sale_id,
    price,
    concession_name,
    concession_desc
) VALUES (
    2,
    120,
    'chocolate bar',
    'popcorn and soda combo!'
);

INSERT INTO movie(
    ticket_id,
    movie_title,
    movie_genre
) VALUES (
    1,
    'Horror',
    'Action'
);

INSERT INTO ticket (
    ticket_id,
    sale_id
) VALUES (
    1, 
    2
);

