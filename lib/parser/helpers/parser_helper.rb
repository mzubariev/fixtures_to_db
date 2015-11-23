module ParserHelper
  def data_preparing(keys, values)
    keys = keys.uniq!
    k_length = keys.length
    string_keys = keys.join(', ')
    string_values = ''
    data_former(k_length, values, string_keys, string_values)
  end

  def data_former(k_length, values, string_keys, string_values)
    i = 0
    loop do
      if i != values.length - k_length
        temp = values.slice(i, k_length).collect { |x| "'#{x}'" }.join(', ')
        string_values << "(#{temp}), "
      else
        temp = values.slice(i, k_length).collect { |x| "'#{x}'" }.join(', ')
        string_values << "(#{temp})"
        break
      end
      i += k_length
    end
    fields_vals = {fields: string_keys, vals: string_values}
  end
end