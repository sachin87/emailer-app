module ApplicationHelper

  def contact_tokens(object)
    if object.new_record? || object.receivers.blank?
      [].to_json
    else
      object.receivers.map do |receiver|
         {"id" => receiver.try(:id), "name" => receiver.try(:email) }
      end.to_json
    end
  end

  def time_zones
    @time_zones ||= ActiveSupport::TimeZone.all.map{|tz| [[tz.name, tz.formatted_offset].join(" "), tz.name]}
  end

end
