class AddAttachmentImageToGadgetImages < ActiveRecord::Migration
  def self.up
    change_table :gadget_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :gadget_images, :image
  end
end
