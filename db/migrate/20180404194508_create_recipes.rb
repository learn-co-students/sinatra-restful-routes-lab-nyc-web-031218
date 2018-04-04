class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|

      t.string :name
      t.string :ingredients
      t.string :cook_time

    end

  end
end

# let(:recipe_name) { "Bomb.com Mac and Cheese" }
# let(:recipe_ingredients) { "milk, butter, cheese, elbow pasta" }
# let(:recipe_cook_time) { "20 minutes" }
