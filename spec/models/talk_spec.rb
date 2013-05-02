describe Talk do
  extend WebStub::SpecHelpers
  
  it "should extract attributes" do
    site = Talk.new(:title => "RubyMotion", :text => 'Intro talk about RubyMotion')
    site.title.should == 'RubyMotion'
    site.text.should == 'Intro talk about RubyMotion'
  end
end
