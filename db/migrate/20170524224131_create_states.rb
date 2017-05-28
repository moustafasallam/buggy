class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :device
      t.string :os
      t.integer :memory, default: 0
      t.integer :storage, default: 0

      t.timestamps null: false
    end
  end
end
