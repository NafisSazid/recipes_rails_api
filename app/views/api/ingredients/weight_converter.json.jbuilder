if @error_message.blank?
  json.base_unit @results[:base_unit]
  json.conversion_unit @results[:conversion_unit]
  json.base_amount @results[:amount]
  json.converted_amount @results[:converted_amount]
else
  json.error_message @error_message
end
