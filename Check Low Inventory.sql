# Return type and vendor of low stock inventory

SELECT type, vendor 
FROM Inventory
WHERE qty < 5
