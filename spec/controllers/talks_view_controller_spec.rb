describe TalksViewController do
  extend WebStub::SpecHelpers
  extend MotionResource::SpecHelpers
  
  before do
    meetup = Meetup.new(:id => 1)
    stub_request(:get, "http://localhost:3000/meetups/1/talks.json").to_return(json: {
      :talks => [
        { :id => 10, :title => 'RubyMotion', :description => 'Intro talk about RubyMotion' }
      ]
    })
    
    self.controller = TalksViewController.alloc.initWithMeetup(meetup)
  end
  
  tests TalksViewController
  
  it "should have a title" do
    wait 0.2 do
      controller.title.should.not.be.nil
    end
  end
  
  it "should show all talks" do
    wait 0.2 do
      controller.talks.size.should == 1
      controller.tableView.numberOfRowsInSection(0).should == 1
    end
  end
  
  it "should show talk title" do
    wait 0.2 do
      view("RubyMotion").should.not.be.nil
    end
  end
  
  it "should show talk description" do
    wait 0.2 do
      view("Intro talk about RubyMotion").should.not.be.nil
    end
  end
end
