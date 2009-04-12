require File.dirname(__FILE__) + '/../spec_helper'

describe Feedzirra::PushParser do
  describe "#parse" do
    it "should parse an atom feed" do
      pp = Feedzirra::PushParser.new
      sample_atom_feed.each_char { |c|
        pp.push(c)
      }
      feed = pp.finish
      feed.title.should == "Amazon Web Services Blog"
      feed.entries.first.published.to_s.should == "Fri Jan 16 18:21:00 UTC 2009"
      feed.entries.size.should == 10
    end
  end
end
