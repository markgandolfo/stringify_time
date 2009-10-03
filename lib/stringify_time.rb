module StringifyTime

  DEFAULT_HOURS_PER_DAY = 6
  mattr_accessor :hours_per_day
  @@hours_per_day = DEFAULT_HOURS_PER_DAY
    
  String.class_eval do
    def minutes
      Integer mins = 0
  
      self.each(' ') do |word|
        mins = mins + mins = word.stringified_to_minutes
      end
      mins
    end

    def stringified_to_minutes
      number  = self[/^[0-9]+/].to_i
      type    = self[/h|H|d|D|m|M/]
  
      type.downcase unless type.nil?
  
      case type
        when 'd'
          ( number * @@hours_per_day ) * 60
        when 'h'
          number * 60
        else
          number
      end 
    end  
  end



  Integer.class_eval do

    # This will convert minutes into a human readable 2d 2h, etc.
    def humanize
      time = self.to_days
      stringified_time = ""

      if( time[0] > 0 )
        stringified_time = stringified_time + time[0].to_s + "d "
      end

      if( time[1] > 0 )
        stringified_time = stringified_time + time[1].to_s + "h "
      end

      if( time[2] > 0 )
          stringified_time = stringified_time + time[2].to_s + "m "
      end

      if( stringified_time == "")
        return "0m"
      else
        return stringified_time.rstrip
      end
    end    



    def to_hours
      h = self / 60
      m = self % 60

      [h,m]
    end
     
    #
    # will take self. and convert to array representing [days, hours, minutes]
    # e.g.
    # 60.to_days #=> [0,1,0]
    #
    def to_days
      days,minutes,hours = 0
      minutes_per_day = @@hours_per_day * 60
      time = self

      # get days, time is now hours/minutes
      if time >= minutes_per_day
        days = time / minutes_per_day
        time = time - ( minutes_per_day * days )
      end
      
      [days, time.to_hours].flatten!
    end    
  end
end