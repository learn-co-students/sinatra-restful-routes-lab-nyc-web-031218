class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
   create_table :recipes do |t|
     t.string :name
     t.string :ingredients
     t.integer :cooktime
   end 
  end
end
