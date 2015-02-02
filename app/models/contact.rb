class Contact < ActiveRecord::Base

  has_many :messages_contacts, class_name: 'MessageContact', foreign_key: :receiver_id
  has_many :messages, through: :messages_contacts

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def self.tokens(query)
    contacts = where("email like ?", "%#{query}%").map do |contact|
      {id: contact.id,
       name: contact.email}
    end

    # if contacts.empty?
    #   [{id: "<<<#{query}>>>", email: "New: \"#{query}\""}]
    # else
    #   contacts
    # end

  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(email: $1).id }
    tokens.split(',')
  end

end
