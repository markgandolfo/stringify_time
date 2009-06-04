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
      ( number * 24 ) * 60
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

    time = to_days( self )
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
  
  
  
  def to_hours minutes
    h = minutes / 60
    m = minutes % 60

    [h,m]
  end
  
  def to_days time_in_minutes
    days, minutes, hours = 0
    
    minutes_per_day = 24 * 60
          
    if( time_in_minutes >= minutes_per_day )
      days = time_in_minutes / minutes_per_day
      time_in_minutes = time_in_minutes - ( minutes_per_day * days )
    end
    
    hours_minutes = self.to_hours( time_in_minutes )
    hours = hours_minutes[0]
    minutes = hours_minutes[1]
    
    [days, hours, minutes]
  end  
  
  
end