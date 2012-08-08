
require 'date'

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
  
  def self.by_date
    by(:date, :title)
  end

  def self.by(field1, field2)
    field3 = (all.first.keys - [field1, field2]).first
    result = Hash.new {|h,k| h[k] = {} }
    all.inject(Hash.new {|h,k| h[k] = {} }) do |result, hol|
      if result[hol[field1]].has_key? hol[field2]
        result[hol[field1]][hol[field2]] = [result[hol[field1]][hol[field2]], hol[field3]].flatten
      else
        result[hol[field1]][hol[field2]] = hol[field3]
      end
      result
    end
  end
  
  def self.by_state
    by(:state, :date)
  end

  def self.all
    [
      {:state => 'QLD',      :date => Date.new(2011,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'QLD',      :date => Date.new(2011,  4, 26), :title => 'Easter Monday'          },
      {:state => 'QLD',      :date => Date.new(2011,  5,  2), :title => 'Labour Day'             },
      {:state => 'QLD',      :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'QLD',      :date => Date.new(2011,  8, 17), :title => 'Royal Qland Show metro' },
      {:state => 'QLD',      :date => Date.new(2012,  5,  7), :title => 'Labour Day'             },
      {:state => 'QLD',      :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'QLD',      :date => Date.new(2012,  8, 15), :title => 'Royal Qland Show metro' },
      {:state => 'QLD',      :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'QLD',      :date => Date.new(2013,  5,  6), :title => 'Labour Day'             },
      {:state => 'QLD',      :date => Date.new(2013, 10,  7), :title => 'Queens Birthday'        },
      {:state => 'SA',       :date => Date.new(2011,  3, 14), :title => 'Adelaide Cup'           },
      {:state => 'SA',       :date => Date.new(2011,  4, 25), :title => 'Easter Monday'          },
      {:state => 'SA',       :date => Date.new(2011,  4, 26), :title => 'ANZAC Day'              },
      {:state => 'SA',       :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'SA',       :date => Date.new(2011, 10,  3), :title => 'Labour Day'             },
      {:state => 'SA',       :date => Date.new(2012,  3, 12), :title => 'Adelaide Cup'           },
      {:state => 'SA',       :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'SA',       :date => Date.new(2012, 10,  1), :title => 'Labour Day'             },
      {:state => 'SA',       :date => Date.new(2013,  3, 11), :title => 'Adelaide Cup'           },
      {:state => 'SA',       :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'SA',       :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'SA',       :date => Date.new(2013, 10,  7), :title => 'Labour Day'             },
      {:state => 'NSW',      :date => Date.new(2011,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'NSW',      :date => Date.new(2011,  4, 26), :title => 'Easter Monday'          },
      {:state => 'NSW',      :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'NSW',      :date => Date.new(2011, 10,  3), :title => 'Labour Day'             },
      {:state => 'NSW',      :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'NSW',      :date => Date.new(2012, 10,  1), :title => 'Labour Day'             },
      {:state => 'NSW',      :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'NSW',      :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'NSW',      :date => Date.new(2013, 10,  7), :title => 'Labour Day'             },
      {:state => 'WA',       :date => Date.new(2011,  3,  7), :title => 'Labour Day'             },
      {:state => 'WA',       :date => Date.new(2011,  4, 25), :title => 'Easter Monday'          },
      {:state => 'WA',       :date => Date.new(2011,  4, 26), :title => 'ANZAC Day'              },
      {:state => 'WA',       :date => Date.new(2011,  6,  6), :title => 'Foundation Day'         },
      {:state => 'WA',       :date => Date.new(2011, 10,  3), :title => 'Queens Birthday'        },
      {:state => 'WA',       :date => Date.new(2012,  3,  5), :title => 'Labour Day'             },
      {:state => 'WA',       :date => Date.new(2012,  6,  4), :title => 'Foundation Day'         },
      {:state => 'WA',       :date => Date.new(2012, 10,  1), :title => 'Queens Birthday'        },
      {:state => 'WA',       :date => Date.new(2013,  3,  4), :title => 'Labour Day'             },
      {:state => 'WA',       :date => Date.new(2013,  6,  3), :title => 'Foundation Day'         },
      {:state => 'WA',       :date => Date.new(2013,  9, 30), :title => 'Queens Birthday'        },
      {:state => 'VIC',      :date => Date.new(2011,  3, 14), :title => 'Labour Day'             },
      {:state => 'VIC',      :date => Date.new(2011,  4, 25), :title => 'Easter Monday'          },
      {:state => 'VIC',      :date => Date.new(2011,  4, 26), :title => 'ANZAC Day'              },
      {:state => 'VIC',      :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'VIC',      :date => Date.new(2011, 11,  1), :title => 'Melbourne Cup Day'      },
      {:state => 'VIC',      :date => Date.new(2012,  3, 12), :title => 'Labour Day'             },
      {:state => 'VIC',      :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'VIC',      :date => Date.new(2012, 11,  6), :title => 'Melbourne Cup Day'      },
      {:state => 'VIC',      :date => Date.new(2013,  3, 11), :title => 'Labour Day'             },
      {:state => 'VIC',      :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'VIC',      :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'VIC',      :date => Date.new(2013, 11,  5), :title => 'Melbourne Cup Day'      },
      {:state => 'TAS',      :date => Date.new(2011,  2, 14), :title => 'Royal Hobart Regatta'   },
      {:state => 'TAS',      :date => Date.new(2011,  3, 14), :title => 'Eight Hours Day'        },
      {:state => 'TAS',      :date => Date.new(2011,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'TAS',      :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'TAS',      :date => Date.new(2012,  2, 13), :title => 'Royal Hobart Regatta'   },
      {:state => 'TAS',      :date => Date.new(2012,  3, 12), :title => 'Eight Hours Day'        },
      {:state => 'TAS',      :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'TAS',      :date => Date.new(2013,  3, 11), :title => 'Eight Hours Day'        },
      {:state => 'TAS',      :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'NT',       :date => Date.new(2011,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'NT',       :date => Date.new(2011,  5,  2), :title => 'May Day'                },
      {:state => 'NT',       :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'NT',       :date => Date.new(2011,  8,  1), :title => 'Picnic Day'             },
      {:state => 'NT',       :date => Date.new(2012,  5,  7), :title => 'May Day'                },
      {:state => 'NT',       :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'NT',       :date => Date.new(2012,  8,  6), :title => 'Picnic Day'             },
      {:state => 'NT',       :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'NT',       :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'ACT',      :date => Date.new(2011,  3, 14), :title => 'Canberra Day'           },
      {:state => 'ACT',      :date => Date.new(2011,  4, 25), :title => 'Easter Monday'          },
      {:state => 'ACT',      :date => Date.new(2011,  4, 26), :title => 'ANZAC Day'              },
      {:state => 'ACT',      :date => Date.new(2011,  6, 13), :title => 'Queens Birthday'        },
      {:state => 'ACT',      :date => Date.new(2011, 10,  3), :title => 'Labour Day'             },
      {:state => 'ACT',      :date => Date.new(2012,  3, 12), :title => 'Canberra Day'           },
      {:state => 'ACT',      :date => Date.new(2012,  6, 11), :title => 'Queens Birthday'        },
      {:state => 'ACT',      :date => Date.new(2012, 10,  1), :title => 'Labour Day'             },
      {:state => 'ACT',      :date => Date.new(2013,  3, 30), :title => 'Easter Saturday'        },
      {:state => 'ACT',      :date => Date.new(2013,  6, 10), :title => 'Queens Birthday'        },
      {:state => 'ACT',      :date => Date.new(2013, 10,  7), :title => 'Labour Day'             },
      {:state => 'National', :date => Date.new(2011,  1,  3), :title => 'New Years Day'          },
      {:state => 'National', :date => Date.new(2011,  1, 26), :title => 'Australia Day'          },
      {:state => 'National', :date => Date.new(2011,  4, 22), :title => 'Good Friday'            },
      {:state => 'National', :date => Date.new(2011, 12, 26), :title => 'Christmas Day'          },
      {:state => 'National', :date => Date.new(2011, 12, 27), :title => 'Boxing Day'             },
      {:state => 'National', :date => Date.new(2012,  1,  2), :title => 'New Years Day'          },
      {:state => 'National', :date => Date.new(2012,  1, 26), :title => 'Australia Day'          },
      {:state => 'National', :date => Date.new(2012,  4,  6), :title => 'Good Friday'            },
      {:state => 'National', :date => Date.new(2012,  4,  9), :title => 'Easter Monday'          },
      {:state => 'National', :date => Date.new(2012,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'National', :date => Date.new(2012, 12, 25), :title => 'Christmas Day'          },
      {:state => 'National', :date => Date.new(2012, 12, 26), :title => 'Boxing Day'             },
      {:state => 'National', :date => Date.new(2013,  1,  1), :title => 'New Years Day'          },
      {:state => 'National', :date => Date.new(2013,  1, 28), :title => 'Australia Day'          },
      {:state => 'National', :date => Date.new(2013,  3, 29), :title => 'Good Friday'            },
      {:state => 'National', :date => Date.new(2013,  3, 31), :title => 'Easter Saturday'        },
      {:state => 'National', :date => Date.new(2013,  4,  1), :title => 'Easter Monday'          },
      {:state => 'National', :date => Date.new(2013,  4, 25), :title => 'ANZAC Day'              },
      {:state => 'National', :date => Date.new(2013, 12, 25), :title => 'Christmas Day'          },
      {:state => 'National', :date => Date.new(2013, 12, 26), :title => 'Boxing Day'             }
    ]
  end
end
