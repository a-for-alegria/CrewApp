
class AddAttachmentAvatarToCrews < ActiveRecord::Migration
  def self.up
    change_table :crews do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :crews, :avatar
  end
end
