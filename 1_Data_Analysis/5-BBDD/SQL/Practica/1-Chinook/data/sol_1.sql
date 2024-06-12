-- 5
SELECT firstname || ' ' || lastname AS NombreCompleto,
city || ' ' || state || ' ' || country AS Direccion,
email
FROM employees
WHERE title = 'Sales Support Agent';

-- 6
SELECT DISTINCT billingcountry
FROM invoices
ORDER BY 1 ASC;

-- 7
SELECT state,
COUNT(customerid)
FROM customers
WHERE country = 'USA'
GROUP BY 1
ORDER BY 2 DESC

--8
SELECT 
invoiceid,
COUNT(trackid)
FROM invoice_items
WHERE invoiceid = 37
GROUP BY 1

SELECT * FROM invoice_items LIMIT 10;

--9
SELECT COUNT(t.TrackId)
FROM tracks AS t
INNER JOIN albums AS a ON t.AlbumId = a.AlbumId
INNER JOIN artists AS ar ON a.ArtistId = ar.ArtistId
WHERE ar.Name = 'AC/DC';

--10
SELECT 
invoiceid,
COUNT(trackid)
FROM invoice_items
--WHERE invoiceid = 37
GROUP BY 1

--11
SELECT billingcountry AS pais,
COUNT(invoiceid)
FROM invoices
GROUP BY 1
ORDER BY 2 DESC

--12
SELECT strftime('%Y', invoicedate) AS año,
COUNT(invoiceid)
FROM invoices
WHERE año in ('2009', '2011')
GROUP BY 1

--13
SELECT strftime('%Y', invoicedate) AS año,
COUNT(invoiceid)
FROM invoices
WHERE año BETWEEN '2009' AND '2011'
GROUP BY 1

--14
SELECT * FROM customers
WHERE country = 'Brazil' OR country = 'Spain';

SELECT country,
COUNT(customerid)
FROM customers
WHERE country IN ('Brazil','Spain')
GROUP BY 1;

--15
SELECT *
FROM tracks
WHERE name LIKE 'You%'