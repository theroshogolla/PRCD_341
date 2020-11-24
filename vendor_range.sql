SELECT vendor, COUNT(vendor)
FROM Food
GROUP BY vendor
HAVING COUNT(vendor) >= 1

