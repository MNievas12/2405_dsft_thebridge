--1
SELECT c.FirstName || ' ' || c.LastName AS NombreCompleto,
i.InvoiceId AS IdFactura,
i.InvoiceDate AS FechaFactura,
i.BillingCountry AS PaisFactura
FROM customers c 
INNER JOIN invoices i ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Brazil'

--2
SELECT e.FirstName || ' ' || e.LastName AS NombreCompletoEmpleado,
i.*
FROM invoices i
INNER JOIN customers c ON i.CustomerId = c.CustomerId
INNER JOIN employees e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'

--3
SELECT c.FirstName || ' ' || c.LastName AS NombreCompletoCliente,
c.Country AS PaisCliente,
e.FirstName || ' ' || e.LastName AS NombreCompletoEmpleado,
SUM(i.Total)
FROM employees e
INNER JOIN customers c ON c.SupportRepId = e.EmployeeId
INNER JOIN invoices i ON i.CustomerId = c.CustomerId
GROUP BY 1,2,3
ORDER BY 4 DESC

--4
SELECT ii.InvoiceId,
--t.TrackId,
t.Name AS TrackName
FROM invoice_items ii
INNER JOIN tracks t ON ii.TrackId = t.TrackId

--5
SELECT t.Name AS NombreCancion,
a.Title AS NombreAlbum,
g.Name AS NombreGenero,
mt.Name AS NombreFormato
FROM tracks t
INNER JOIN albums a ON t.AlbumId = a.AlbumId
INNER JOIN genres g ON t.GenreId = g.GenreId
INNER JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId

--6
SELECT pt.playlistid,
p.Name AS NombrePlaylist,
COUNT(trackid)
FROM playlist_track pt
INNER JOIN playlists p ON pt.PlaylistId = p.PlaylistId
GROUP BY 1,2
ORDER BY 3 DESC

--7
SELECT e.EmployeeId,
e.FirstName || ' ' || e.LastName AS NombreEmpleado,
COUNT (DISTINCT c.customerid) AS NClientes,
COUNT(i.InvoiceId) AS NFacturas,
SUM(i.Total) AS VVentas
FROM employees e
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY 1,2
ORDER BY VVentas DESC

SELECT c.CustomerId,
COUNT(i.InvoiceId)
FROM customers c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY 1
ORDER BY 2 DESC

-- 8
SELECT e.EmployeeId,
e.FirstName || ' ' || e.LastName AS NombreEmpleado,
COUNT (DISTINCT c.customerid) AS NClientes,
COUNT(i.InvoiceId) AS NFacturas,
SUM(i.Total) AS VVentas
FROM employees e
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE strftime('%Y', i.InvoiceDate) = '2009'
GROUP BY 1,2
ORDER BY VVentas DESC

--9
SELECT a.ArtistId,
a.Name AS NombreArtista,
SUM(i.Total) AS VVentas
FROM artists a
INNER JOIN albums al ON a.ArtistId = al.ArtistId
INNER JOIN tracks t ON al.AlbumId = t.AlbumId
INNER JOIN invoice_items ii ON t.TrackId = ii.TrackId
INNER JOIN invoices i ON ii.InvoiceId = i.InvoiceId
GROUP BY 1,2
ORDER BY VVentas DESC
LIMIT 3


