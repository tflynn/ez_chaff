require File.join(File.dirname(__FILE__), "spec_helper")

describe EzChaff do
  
  it "should add chaff to a string and remove chaff from a string" do
    test_string = "This is a string"
    chaffed_string = EzChaff.chaff(test_string)
    chaffed_string.should_not == test_string
    chars_to_test = test_string.length
    chars_to_test.times do |pos|
      chaffed_char_at_pos = chaffed_string[(pos*2),1]
      chaffed_char_at_pos.should == test_string[pos,1]
    end
    unchaffed_string = EzChaff.unchaff(chaffed_string)
    unchaffed_string.should == test_string
  end

end
