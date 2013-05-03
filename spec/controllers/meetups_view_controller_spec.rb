describe MeetupsViewController do
  extend MotionParse::SpecHelper
  
  before do
    PFQuery.result_objects = [Meetup.new(:title => 'March Madness', :when => Date.new(2013, 01, 01), :address => 'Here')]
  end
  
  tests MeetupsViewController
  
  it "should have a title" do
    wait 0.2 do
      controller.title.should.not.be.nil
    end
  end
  
  it "should show all meetups" do
    wait 0.2 do
      controller.meetups.size.should == 1
      controller.tableView.numberOfRowsInSection(0).should == 1
    end
  end
  
  it "should show meetup title" do
    wait 0.2 do
      view("March Madness").should.not.be.nil
    end
  end
  
  it "should show meetup address and date" do
    wait 0.2 do
      view("Here - 2013-1-1").should.not.be.nil
    end
  end
  
  it "should disclose meetup" do
    controller.navigationController.mock!(:pushViewController)
    tap view("Here - 2013-1-1")
    
    1.should == 1
  end
end
