class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :user_id
      t.string :code
      t.string :email
      t.integer :invited_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
