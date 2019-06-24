json.cocktails do 
  json.array! @cocktails, partial: 'recipe', as: :recipe
end

json.beers do 
  json.array! @beers, partial: 'recipe', as: :recipe
end

json.hard_liquors do 
  json.array! @hard_liquors, partial: 'recipe', as: :recipe
end
