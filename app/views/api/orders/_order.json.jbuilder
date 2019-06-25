json.id order.id
json.customer_id order.customer_id
json.bartender_id order.bartender_id
json.status order.status




json.drinks do 
  json.array! order.drinks, partial: 'api/drinks/drink', as: :drink
end


 #  order.drinks.each |drink|
 #   json.drink drink.recipe.name
 # end
    





# order.drinks.first.recipe.name