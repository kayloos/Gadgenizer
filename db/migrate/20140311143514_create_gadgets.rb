class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string "name"
      t.text "description"
      t.integer "user_id", index: "true"

      t.timestamps
    end
  end
end
