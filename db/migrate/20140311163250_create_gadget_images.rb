class CreateGadgetImages < ActiveRecord::Migration
  def change
    create_table :gadget_images do |t|
      t.integer 'gadget_id', index: true
      t.timestamps
    end
  end
end
