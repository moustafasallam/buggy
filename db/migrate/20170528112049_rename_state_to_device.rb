class RenameStateToDevice < ActiveRecord::Migration
  def change
  	rename_table :states, :devices
  	rename_column :bugs, :state_id, :device_id
  	rename_column :devices, :device, :name
  	rename_column :bugs, :status, :state
  end
end
