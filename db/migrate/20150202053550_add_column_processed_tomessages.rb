class AddColumnProcessedTomessages < ActiveRecord::Migration
  def change
    add_column :messages, :processed, :boolean, default: false
    add_index :messages, :processed
  end
end
