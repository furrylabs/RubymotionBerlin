describe Meetup do
  extend MotionParse::SpecHelper
  
  it "should extract attributes" do
    meetup = Meetup.new(:title => 'March Madness', :when => Date.new(2013, 01, 01), :address => 'Here')
    meetup.title.should == 'March Madness'
    meetup.when.should == Date.new(2013, 01, 01)
    meetup.address.should == 'Here'
  end
  
  describe 'has many' do
    before do
      @meetup = Meetup.new(:id => 1)
    end
    
    it "should have many talks" do
      PFQuery.result_objects = [Talk.new, Talk.new]
      @meetup.talks do |results|
        @results = results
      end
      
      @results.size.should == 2
    end
  end
end
