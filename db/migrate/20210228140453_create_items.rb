class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.integer :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
