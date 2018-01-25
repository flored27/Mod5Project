class AddAttachmentAvatarToApartments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :apartments do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :apartments, :avatar
  end
end
