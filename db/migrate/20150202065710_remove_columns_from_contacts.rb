class RemoveColumnsFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :first_name
    remove_column :contacts, :last_name
  end
end
