class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :order_id
      t.integer :recipe_id
      t.integer :rating
      t.string :comment
      t.integer :status

      t.timestamps
    end
  end
end
