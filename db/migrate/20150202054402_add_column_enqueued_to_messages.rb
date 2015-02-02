class AddColumnEnqueuedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :enqueued, :boolean, default: false
    add_index :messages, :enqueued
  end
end
