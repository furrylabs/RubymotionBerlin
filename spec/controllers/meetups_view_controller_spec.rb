describe MeetupsViewController do
  extend WebStub::SpecHelpers
  
  before do
    stub_request(:get, "http://localhost:3000/meetups.json").to_return(json: {
      :meetups => [
        { :id => 10, :when => '2013-01-01', :address => 'Here' }
      ]
    })
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
  
  it "should show meetup address" do
    wait 0.2 do
      view("Here").should.not.be.nil
    end
  end
  
  it "should show meetup date" do
    wait 0.2 do
      view("2013-01-01").should.not.be.nil
    end
  end
  
  it "should disclose meetup" do
    # controller.navigationController.mock!(:pushViewController)
    tap view("Here")
      
    1.should == 1
  end
end
