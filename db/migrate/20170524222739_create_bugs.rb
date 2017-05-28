class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :app_token
      t.integer :number, default: 0
      t.string :status, default:  "new"
      t.string :priority, default: "minor"
      t.text :comment, default: ""
      t.integer :state_id, default: 0

      t.timestamps null: false
    end

    add_index :bugs, :state_id
  end
end
