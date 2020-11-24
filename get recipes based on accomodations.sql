SELECT Recipe.name
FROM Recipe, UsedIn, Food
WHERE Food.category = UsedIn.category AND UsedIn.recipe_id = Recipe.recipe_id
GROUP BY Food.accomodations

