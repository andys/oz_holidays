require 'json'

holidays = eval File.read('output.rb')


puts("var oz_holidays = " + holidays.to_json.gsub(/:{/, ":{\n  ").gsub(/},/, "},\n") + ";\n")
