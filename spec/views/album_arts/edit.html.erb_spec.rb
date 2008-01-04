require File.dirname(__FILE__) + '/../../spec_helper'

describe "/album_arts/edit.html.erb" do
  include AlbumArtsHelper
  
  before do
    @album_art = mock_model(AlbumArt)
    @album_art.stub!(:user_id).and_return("1")
    @album_art.stub!(:album_name).and_return("MyString")
    @album_art.stub!(:artist_name).and_return("MyString")
    @album_art.stub!(:image).and_return("MyString")
    @album_art.stub!(:image_size).and_return("MyString")
    @album_art.stub!(:image_filesize).and_return("MyString")
    @album_art.stub!(:thumbnail).and_return("MyString")
    @album_art.stub!(:score).and_return("1")
    @album_art.stub!(:created_at).and_return(Time.now)
    assigns[:album_art] = @album_art
  end

  it "should render edit form" do
    render "/album_arts/edit.html.erb"
    response.should have_tag("form[action=#{album_art_path(@album_art)}][method=post]")
  end
end


