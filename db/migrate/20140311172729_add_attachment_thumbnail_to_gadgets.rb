class AddAttachmentThumbnailToGadgets < ActiveRecord::Migration
  def self.up
    change_table :gadgets do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :gadgets, :thumbnail
  end
end
