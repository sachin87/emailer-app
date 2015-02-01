class UserMailer < ActionMailer::Base

  default from: "from@emailer-app.com"

  def schedule_email(message_id, contact)
    message = Message.find(message_id)
    message.delivered!(contact)
    mail(to: contact.email, subject: message.subject,
         body: message.body, content_type: "text/html")
  end

end
