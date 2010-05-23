class AddInvitationCodeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :invitation_code, :string
  end

  def self.down
    remove_column :users, :invitation_code
  end
end
