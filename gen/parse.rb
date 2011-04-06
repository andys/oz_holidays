
require 'date'

state = nil
holidays11 = Hash.new {|h,k| h[k] = {} }
holidays12 = Hash.new {|h,k| h[k] = {} }

STDIN.each_line do |line|
  if line =~ /^\*(.+)$/
    state = $1.strip
  elsif line =~ /^\w+/
    dayname, day11, day12 = line.split(/\t/)
    dayname.strip!
    dayname.gsub! /[^a-zA-Z ]/, ''

    holidays11[state][Date.parse(day11 + ' 2011').to_s] = dayname
    holidays12[state][Date.parse(day12 + ' 2012').to_s] = dayname
  end
end

[holidays11, holidays12].each do |year|
  states = year.keys
  states.each do |state|
    year[state].each do |date, dayname,|
      if states.all? {|other_state| year[other_state].keys.any? {|other_date| other_date == date && year[other_state][other_date].upcase == dayname.upcase }}
        states.each {|s| year[s].delete(date) }
        year['National'][date] = dayname
      end
    end
  end
end
        
holidays = holidays11
holidays12.each do |state, dates|
  holidays[state].merge!(dates)
end

puts "{"
puts(holidays.map do |state, dates|
  "  '#{state}' => {\n" +
  dates.sort.map {|date, dayname| "    '#{date}' => '#{dayname}'" }.join(",\n") +
  "\n  }"
end.join(",\n"))
puts "}"
