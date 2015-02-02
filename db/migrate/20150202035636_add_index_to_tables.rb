class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :message_contacts, :receiver_id
    add_index :message_contacts, :message_id
    add_index :message_contacts, :delivered
    add_index :message_contacts, [:receiver_id, :message_id, :delivered ], name: "combine_index"
    add_index :messages, :schedule_date
    add_index :contacts, :email
  end
end
