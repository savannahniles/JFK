require 'spec_helper'

describe Post do
  before { @post = Post.new(content: "Here is a post. It has content. Maybe this is a memory. Maybe not.", lat: 40.6743890, long: -73.9455, originLat: 40.6743890, originLong: -73.9455, distanceTraveled: 0) }

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:lat) }
  it { should respond_to(:long) }
  it { should respond_to(:originLat) }
  it { should respond_to(:originLong) }
  it { should respond_to(:distanceTraveled) }

  it { should be_valid }

  describe "when lat is not present" do
    before { @post.lat = " " }
    it { should_not be_valid }
  end

  describe "when lat is not present" do
    before { @post.lat = nil }
    it { should_not be_valid }
  end

  describe "when long is not present" do
    before { @post.long = " " }
    it { should_not be_valid }
  end

  describe "when long is not present" do
    before { @post.long = nil }
    it { should_not be_valid }
  end

  describe "when originLat is not present" do
    before { @post.originLat = " " }
    it { should_not be_valid }
  end

  describe "when originLat is not present" do
    before { @post.originLat = nil }
    it { should_not be_valid }
  end

  describe "when originLong is not present" do
    before { @post.originLong = " " }
    it { should_not be_valid }
  end

  describe "when originLong is not present" do
    before { @post.originLong = nil }
    it { should_not be_valid }
  end

  describe "when distanceTraveled is not present" do
    before { @post.distanceTraveled = " " }
    it { should_not be_valid }
  end

  describe "when distanceTraveled is not present" do
    before { @post.distanceTraveled = nil }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @post.content = "a" * 1201 }
    it { should_not be_valid }
  end

  describe "post ordering" do

    let!(:older_post) do
      Post.new(content: "Here is a post. It has content. Maybe this is a memory. Maybe not.", lat: 40.6743890, long: -73.9455, originLat: 40.6743890, originLong: -73.9455, distanceTraveled: 0, created_at: 1.day.ago) 
    end
    let!(:newer_post) do
      Post.new(content: "Here is a post. It has content. Maybe this is a memory. Maybe not.", lat: 40.6743890, long: -73.9455, originLat: 40.6743890, originLong: -73.9455, distanceTraveled: 0, created_at: 1.hour.ago) 
    end

    it "should have the right posts in the right order" do
    	#Post.order('created_at desc').all.should == [newer_post, older_post]
    end
  end

end
