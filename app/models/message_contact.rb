class MessageContact < ActiveRecord::Base

  belongs_to :message
  belongs_to :receiver, class_name: 'Contact'

end
