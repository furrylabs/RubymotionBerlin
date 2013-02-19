describe Meetup do
  extend WebStub::SpecHelpers
  extend MotionResource::SpecHelpers
  
  it "should extract attributes" do
    site = Meetup.new(:when => "2013-01-01", :address => 'Here')
    site.when.should == '2013-01-01'
    site.address.should == 'Here'
  end
  
  describe "URLs" do
    before do
      @meetup = Meetup.new(
        :id => 10
      )
    end
    
    it "should have trivial collection URL" do
      @meetup.collection_url.should == "meetups"
    end
  
    it "should build member URL" do
      @meetup.member_url.should == "meetups/10"
    end
  end
  
  describe 'has many' do
    before do
      @meetup = Meetup.new(:id => 1)
    end
    
    it "should have many talks" do
      stub_request(:get, 'http://localhost:3000/meetups/1/talks.json').to_return(json: { talks: [{ id: 10 }, { id: 11 }] })
      @meetup.talks do |results|
        @results = results
        resume
      end
      
      wait_max 1.0 do
        @results.size.should == 2
      end
    end
  end
end
