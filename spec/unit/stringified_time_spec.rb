require 'spec/spec_helper'

describe StringifyTime do

  it "should convert strings into minutes" do
    "1m".minutes.should eql(1)
    "60m".minutes.should eql(60)
    "6h".minutes.should eql(360)
    "12h".minutes.should eql(720)
  end

  it "should convert minutes into hours" do
    1.to_hours.should eql([0,1])
    60.to_hours.should eql([1,0])
    360.to_hours.should eql([6,0])
    720.to_hours.should eql([12,0])
    721.to_hours.should eql([12,1])
  end

  it "should convert minutes into days" do
    1.to_days.should eql([0,0,1])
    60.to_days.should eql([0,1,0])
    360.to_days.should eql([1,0,0])
    720.to_days.should eql([2,0,0])
    780.to_days.should eql([2,1,0])
    781.to_days.should eql([2,1,1])
  end

  it "should humanize time" do
    1.humanize.should eql("1m")
    60.humanize.should eql("1h")
    360.humanize.should eql("1d")
    720.humanize.should eql("2d")
    780.humanize.should eql("2d 1h")
    781.humanize.should eql("2d 1h 1m")
  end
end