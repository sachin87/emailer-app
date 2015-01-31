class CreateMessageContacts < ActiveRecord::Migration
  def change
    create_table :message_contacts do |t|
      t.integer :receiver_id
      t.integer :message_id
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
