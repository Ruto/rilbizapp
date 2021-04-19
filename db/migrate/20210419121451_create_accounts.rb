class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :accountable, polymorphic: true, null: false
      t.string :type
      t.string :name
      t.string :contacts
      t.text :memo
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
