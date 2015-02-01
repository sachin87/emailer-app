class ScheduleMail
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.find(message_id)
    message.receivers.each do |receiver|
      UserMailer.schedule_email(message_id,receiver).deliver
    end
  end

end