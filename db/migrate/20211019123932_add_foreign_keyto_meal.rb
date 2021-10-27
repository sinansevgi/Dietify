class AddForeignKeytoMeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals,:created_by
    change_table :meals do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
