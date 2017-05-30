class AddIndexToBugs < ActiveRecord::Migration
  def change
  	add_index :bugs, [:app_token, :number], unique: true
  end
end
