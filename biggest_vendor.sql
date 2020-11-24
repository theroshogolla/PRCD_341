SELECT vendor, SUM(qty)
FROM Food
GROUP BY vendor
