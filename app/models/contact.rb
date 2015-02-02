class Contact < ActiveRecord::Base

  has_many :messages_contacts
  has_many :messages, through: :messages_contacts

  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

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

end
