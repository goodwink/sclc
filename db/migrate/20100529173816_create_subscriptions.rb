class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :publisher_id
      t.integer :subscriber_id
      t.datetime :expires_at

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
