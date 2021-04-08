class CreateCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :codes do |t|
      t.string :alias
      t.string :cost_code
      t.string :barcode
      t.string :system_code
      t.references :product, null: false, foreign_key: true
      t.references :codable, polymorphic: true, null: false
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
