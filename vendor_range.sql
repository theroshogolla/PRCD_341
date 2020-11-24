SELECT vendor, COUNT(vendor)
FROM Items
GROUP BY vendor
HAVING COUNT(vendor) >= 1

