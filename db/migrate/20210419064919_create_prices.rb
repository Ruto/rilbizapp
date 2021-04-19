class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.references :priceable, polymorphic: true, null: false
      t.string :type
      t.references :code, null: false, foreign_key: true
      t.float :amount, default: 0.00
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
