# Get quantity of each volunteer 
SELECT type, COUNT(*)
FROM Volunteers
GROUP BY type
ORDER BY COUNT(*) desc

