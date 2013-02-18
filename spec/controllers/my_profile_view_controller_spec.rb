describe MyProfileViewController do
  tests MyProfileViewController
  
  it "should have a title" do
    controller.title.should.not.be.nil
  end
end
