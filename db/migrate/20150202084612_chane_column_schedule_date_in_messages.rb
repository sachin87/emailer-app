class ChaneColumnScheduleDateInMessages < ActiveRecord::Migration
  def change
    change_column :messages, :schedule_date, :string
  end
end
