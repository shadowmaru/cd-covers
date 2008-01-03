require File.dirname(__FILE__) + '/../../spec_helper'

describe "/album_arts/show.html.erb" do
  include AlbumArtsHelper
  
  before(:each) do
    @album_art = mock_model(AlbumArt)
    @album_art.stub!(:user_id).and_return("1")
    @album_art.stub!(:album_name).and_return("MyString")
    @album_art.stub!(:artist_name).and_return("MyString")
    @album_art.stub!(:image).and_return("MyString")
    @album_art.stub!(:image_size).and_return("MyString")
    @album_art.stub!(:image_filesize).and_return("MyString")
    @album_art.stub!(:score).and_return("1")
    @album_art.stub!(:created_at).and_return(Time.now)

    assigns[:album_art] = @album_art
  end

  it "should render attributes in <p>" do
    render "/album_arts/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

