# Get number of food for each accomodation 
SELECT accomodations, COUNT(*)
FROM Food
GROUP BY accomodations
ORDER BY COUNT(*) desc