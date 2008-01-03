require File.dirname(__FILE__) + '/../spec_helper'

module AlbumArtSpecHelper

  def valid_album_art_attributes
    {
      :user_id => 1,
      :album_name => "Anacrônico",
      :artist_name => "Pitty",
      :score => 0,
      :image => fixture_file_upload("/files/anacronico.jpg", "image/jpeg")
    }
  end

end

describe AlbumArt do
  
  include AlbumArtSpecHelper
  
  before(:each) do
    @album_art = AlbumArt.new
  end

  it "should be valid" do
    @album_art.attributes = valid_album_art_attributes
    @album_art.should be_valid
  end

  it "should have 1 error on user_id" do
    @album_art.should have(1).error_on(:user_id)
  end

  it "should have 1 error on album name" do
    @album_art.should have(1).error_on(:album_name)
  end
  
  it "should have 1 error on artist name" do
    @album_art.should have(1).error_on(:artist_name)
  end
  
  it "should have 1 error on image" do
    @album_art.should have(1).error_on(:image)
  end
  
  it "should have a initial score of zero" do
    @album_art.attributes = valid_album_art_attributes
    @album_art.score.should equal(0)
  end

  it "should get the image file size" do
    @album_art.attributes = valid_album_art_attributes
    @album_art.image_filesize.should == '32299'
  end

  it "should get the image dimensions" do
    @album_art.attributes = valid_album_art_attributes
    @album_art.image_size.should == '300x300'
  end
end
