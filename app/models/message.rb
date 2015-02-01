class Message < ActiveRecord::Base

  has_many :messages_contacts, class_name: 'MessageContact'
  has_many :receivers, class_name: 'Contact', through: :messages_contacts

  validates :schedule_date, :subject, :body, presence: true

  has_many :authorships
  has_many :authors, :through => :authorships
  attr_reader :receiver_tokens

  def receiver_tokens=(tokens)
    self.receiver_ids = Contact.ids_from_tokens(tokens)
  end


  def delivered!(contact)
    messages_contact = messages_contacts.where(receiver_id: contact.id).first
    messages_contact.delivered = true
    messages_contact.save
  end

end
