class Contact < ActiveRecord::Base

  has_many :messages_contacts
  has_many :messages, through: :messages_contacts

  validates :email, presence: true
  validates_format_of :email, with: /^.+@.+$/

  def self.tokens(query)
    where("email like ?", "%#{query}%").map do |contact|
      {id: contact.id,
       name: contact.email}
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(email: $1).id }
    tokens.split(',')
  end

  def name_with_email
    [first_name, last_name, email].compact.join(':')
  end
end
