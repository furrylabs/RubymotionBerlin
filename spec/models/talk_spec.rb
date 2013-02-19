describe Talk do
  extend WebStub::SpecHelpers
  extend MotionResource::SpecHelpers
  
  it "should extract attributes" do
    site = Talk.new(:title => "RubyMotion", :description => 'Intro talk about RubyMotion')
    site.title.should == 'RubyMotion'
    site.description.should == 'Intro talk about RubyMotion'
  end
  
  describe "URLs" do
    before do
      @talk = Talk.new(
        :meetup_id => 1,
        :id => 10
      )
    end
    
    it "should have trivial collection URL" do
      @talk.collection_url.should == "meetups/1/talks"
    end
  
    it "should build member URL" do
      @talk.member_url.should == "meetups/1/talks/10"
    end
  end
  
  describe 'belongs to' do
    before do
      @meetup = Meetup.new(:id => 1)
    end
    
    it "should belong to meetup" do
      talk = Talk.new(:meetup => { :id => 10, :address => 'Here' })
      talk.meetup.should.not.be.nil
      talk.meetup.address.should == 'Here'
    end
  end
end
