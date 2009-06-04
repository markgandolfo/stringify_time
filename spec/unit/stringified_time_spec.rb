require 'spec/spec_helper'

describe StringifiedTime do

  it "should convert strings into minutes" do
    "1m".should eql(1)
  end
    
end