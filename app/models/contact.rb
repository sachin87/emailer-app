class Contact < ActiveRecord::Base

  has_amny :messages_contacts
  has_many :messages, through: :messages_contacts

  validates :email, presence: true
end
