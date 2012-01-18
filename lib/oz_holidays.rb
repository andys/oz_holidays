
require 'json' rescue nil

class OzHolidays
  def self.national
    by_state['National']
  end
  def self.for_state(state)
    national.merge(by_state[state])
  end
  def self.[](state)
    for_state(state)
  end

  def self.to_json
    by_state.to_json
  end

  def self.by_state
    {
      'QLD' => {
        '2011-04-25' => 'ANZAC Day',
        '2011-04-26' => 'Easter Monday',
        '2011-05-02' => 'Labour Day',
        '2011-06-13' => 'Queens Birthday',
        '2011-08-17' => 'Royal Qland Show metro',
        '2012-05-07' => 'Labour Day',
        '2012-06-11' => 'Queens Birthday',
        '2012-08-15' => 'Royal Qland Show metro',
        '2013-03-30' => 'Easter Saturday',
        '2013-05-06' => 'Labour Day',
        '2013-10-07' => 'Queens Birthday'
      },
      'SA' => {
        '2011-03-14' => 'Adelaide Cup',
        '2011-04-25' => 'Easter Monday',
        '2011-04-26' => 'ANZAC Day',
        '2011-06-13' => 'Queens Birthday',
        '2011-10-03' => 'Labour Day',
        '2012-03-12' => 'Adelaide Cup',
        '2012-06-11' => 'Queens Birthday',
        '2012-10-01' => 'Labour Day',
        '2013-03-11' => 'Adelaide Cup',
        '2013-03-30' => 'Easter Saturday',
        '2013-06-10' => 'Queens Birthday',
        '2013-10-07' => 'Labour Day'
      },
      'NSW' => {
        '2011-04-25' => 'ANZAC Day',
        '2011-04-26' => 'Easter Monday',
        '2011-06-13' => 'Queens Birthday',
        '2011-10-03' => 'Labour Day',
        '2012-06-11' => 'Queens Birthday',
        '2012-10-01' => 'Labour Day',
        '2013-03-30' => 'Easter Saturday',
        '2013-06-10' => 'Queens Birthday',
        '2013-10-07' => 'Labour Day'
      },
      'WA' => {
        '2011-03-07' => 'Labour Day',
        '2011-04-25' => 'Easter Monday',
        '2011-04-26' => 'ANZAC Day',
        '2011-06-06' => 'Foundation Day',
        '2011-10-03' => 'Queens Birthday',
        '2012-03-05' => 'Labour Day',
        '2012-06-04' => 'Foundation Day',
        '2012-10-01' => 'Queens Birthday',
        '2013-03-04' => 'Labour Day',
        '2013-06-03' => 'Foundation Day',
        '2013-09-30' => 'Queens Birthday'
      },
      'VIC' => {
        '2011-03-14' => 'Labour Day',
        '2011-04-25' => 'Easter Monday',
        '2011-04-26' => 'ANZAC Day',
        '2011-06-13' => 'Queens Birthday',
        '2011-11-01' => 'Melbourne Cup Day',
        '2012-03-12' => 'Labour Day',
        '2012-06-11' => 'Queens Birthday',
        '2012-11-06' => 'Melbourne Cup Day',
        '2013-03-11' => 'Labour Day',
        '2013-03-30' => 'Easter Saturday',
        '2013-06-10' => 'Queens Birthday',
        '2013-11-05' => 'Melbourne Cup Day'
      },
      'TAS' => {
        '2011-02-14' => 'Royal Hobart Regatta',
        '2011-03-14' => 'Eight Hours Day',
        '2011-04-25' => 'ANZAC Day',
        '2011-06-13' => 'Queens Birthday',
        '2012-02-13' => 'Royal Hobart Regatta',
        '2012-03-12' => 'Eight Hours Day',
        '2012-06-11' => 'Queens Birthday',
        '2013-03-11' => 'Eight Hours Day',
        '2013-06-10' => 'Queens Birthday'
      },
      'NT' => {
        '2011-04-25' => 'ANZAC Day',
        '2011-05-02' => 'May Day',
        '2011-06-13' => 'Queens Birthday',
        '2011-08-01' => 'Picnic Day',
        '2012-05-07' => 'May Day',
        '2012-06-11' => 'Queens Birthday',
        '2012-08-06' => 'Picnic Day',
        '2013-03-30' => 'Easter Saturday',
        '2013-06-10' => 'Queens Birthday'
      },
      'ACT' => {
        '2011-03-14' => 'Canberra Day',
        '2011-04-25' => 'Easter Monday',
        '2011-04-26' => 'ANZAC Day',
        '2011-06-13' => 'Queens Birthday',
        '2011-10-03' => 'Labour Day',
        '2012-03-12' => 'Canberra Day',
        '2012-06-11' => 'Queens Birthday',
        '2012-10-01' => 'Labour Day',
        '2013-03-30' => 'Easter Saturday',
        '2013-06-10' => 'Queens Birthday',
        '2013-10-07' => 'Labour Day'
      },
      'National' => {
        '2011-01-03' => 'New Years Day',
        '2011-01-26' => 'Australia Day',
        '2011-04-22' => 'Good Friday',
        '2011-12-26' => 'Christmas Day',
        '2011-12-27' => 'Boxing Day',
        '2012-01-02' => 'New Years Day',
        '2012-01-26' => 'Australia Day',
        '2012-04-06' => 'Good Friday',
        '2012-04-09' => 'Easter Monday',
        '2012-04-25' => 'ANZAC Day',
        '2012-12-25' => 'Christmas Day',
        '2012-12-26' => 'Boxing Day',
        '2013-01-01' => 'New Years Day',
        '2013-01-28' => 'Australia Day',
        '2013-03-29' => 'Good Friday',
        '2013-03-31' => 'Easter Saturday',
        '2013-04-01' => 'Easter Monday',
        '2013-04-25' => 'ANZAC Day',
        '2013-12-25' => 'Christmas Day',
        '2013-12-26' => 'Boxing Day'
      }
    }
  end
end
