class AddAttachmentAvatarToLandlords < ActiveRecord::Migration
  def self.up
    change_table :landlords do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :landlords, :avatar
  end
end
