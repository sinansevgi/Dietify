class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
