class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.datetime :schedule_date
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
