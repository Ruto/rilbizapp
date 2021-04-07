class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :type, null:false
      t.boolean :durable, null: true
      t.string :durability, null: true
      t.boolean :convenient, null: true
      t.boolean :resaleable, null: true
      t.boolean :industrial, null: true
      t.boolean :internal_trade, null: true
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
