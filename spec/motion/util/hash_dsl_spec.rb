describe BubbleWrap::Util::HashDSL do
  before do
    @dsl = BW::Util::HashDSL.new
  end

  it "should work with one parameter" do
    @dsl.cc "foo@bar.com"
    @dsl.hash[:cc].should == "foo@bar.com"
  end

  it "should work with single array parameter" do
    @dsl.arr_single ["foo@bar.com"]
    @dsl.hash[:arr_single].should == ["foo@bar.com"]
  end

  it "should work with multiple parameters" do
    @dsl.to "contact@example.com","contact2@example.com"
    @dsl.hash[:to].should == ["contact@example.com","contact2@example.com"]
  end

  it "should work with Hash" do
    @dsl.message html:true, body:"<h1>Hi from my super iOS app !</h1>"
    @dsl.hash[:message].should == {html: true, body: "<h1>Hi from my super iOS app !</h1>"}
  end

  it "should work with block" do
    callback = -> (a) { }
    @dsl.callback &callback
    @dsl.hash[:callback].should == callback
  end
end