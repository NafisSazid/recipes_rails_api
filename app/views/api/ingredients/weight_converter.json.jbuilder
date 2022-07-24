if @error_message.blank?
  json.unit_from @results[:base_unit]
  json.unit_to @results[:conversion_unit]
  json.amount_from @results[:amount]
  json.amount_to @results[:converted_amount]
else
  json.error_message @error_message
end
