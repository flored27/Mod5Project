class AddAttachmentAvatarToLandlords < ActiveRecord::Migration[5.1]
  def self.up
    change_table :landlords do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :landlords, :avatar
  end
end
