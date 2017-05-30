class AddRegisteredAppModel < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|
      t.string :token
      t.integer :serial, default: 0

      t.timestamps null: false
    end

    remove_column :bugs, :app_token
    add_column :bugs, :registered_app_id, :integer, default: 0
    add_index :bugs, :registered_app_id
  end
end
