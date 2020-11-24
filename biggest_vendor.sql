SELECT vendor, SUM(qty)
FROM Items
GROUP BY vendor
