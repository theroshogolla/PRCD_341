# Get count of steering committee members with roles
SELECT role, COUNT(*)
FROM Steering_Committee
GROUP BY role
ORDER BY COUNT(*) desc