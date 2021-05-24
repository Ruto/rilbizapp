class RolifyCreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:accounts_roles) do |t|
      t.references :user
      t.references :account
      t.references :role
      t.boolean :active, default: true
      t.integer :created_by
    end

    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:accounts_roles, [ :user_id, :role_id, :account_id, :created_by ])
  end
end
