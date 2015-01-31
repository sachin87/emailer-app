class Message < ActiveRecord::Base

  has_many :messages_contacts
  has_many :receivers, class_name: 'Contact', through: :messages_contacts

  validates :schedule_date, :subject, :body, presence: true

end
