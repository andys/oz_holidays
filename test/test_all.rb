require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/oz_holidays"
require 'date'


class TestOzHolidays < Test::Unit::TestCase
  def test_new_years_day
    assert_match /New Year/, OzHolidays.national[find_nyd_hol]
  end
  
  def test_anzac_day
    assert_not_nil OzHolidays['NSW']["#{Date.today.year}-04-25"]
  end
  
  def test_to_json
    assert_not_nil OzHolidays.to_json
  end
  
  
private
  def find_nyd_hol
    nyd = Date.parse("#{Date.today.year}-01-01")
    nyd += 1 while(nyd.wday < 1 || nyd.wday > 5)
    nyd.to_s
  end
end
