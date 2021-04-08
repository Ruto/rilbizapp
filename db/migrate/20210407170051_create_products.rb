class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :type
      t.boolean :durable
      t.string :durability
      t.boolean :convenient
      t.boolean :resaleable
      t.boolean :industrial
      t.boolean :internal_trade
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
