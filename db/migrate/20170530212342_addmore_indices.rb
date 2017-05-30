class AddmoreIndices < ActiveRecord::Migration
  def change
  	add_index :registered_apps, :token, unique: true
  	add_index :bugs, [:registered_app_id, :number], unique: true
  end
end
