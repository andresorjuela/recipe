class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :recipe_name
      t.text :instruction
      t.string :portion
      t.string :variation
      t.string :storage
      t.text :comment

      t.timestamps null: false
    end
  end
end
