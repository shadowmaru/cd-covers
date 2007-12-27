require File.dirname(__FILE__) + '/../spec_helper'

describe AlbumArt do
  before(:each) do
    @album_art = AlbumArt.new
  end

  it "should be valid" do
    @album_art.should be_valid
  end
end
