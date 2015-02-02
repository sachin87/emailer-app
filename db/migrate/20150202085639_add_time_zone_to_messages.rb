class AddTimeZoneToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :time_zone, :string
  end
end
