module ApplicationHelper

  def contact_tokens(object)
    if object.new_record? || object.receivers.blank?
      [].to_json
    else
      object.receivers.map do |receiver|
         {"id" => object.receiver.try(:id), "name" => object.receiver.try(:email) }
      end
    end.to_json
  end

end
