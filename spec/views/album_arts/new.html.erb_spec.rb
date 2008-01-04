require File.dirname(__FILE__) + '/../../spec_helper'

describe "/album_arts/new.html.erb" do
  include AlbumArtsHelper
  
  before(:each) do
    @album_art = mock_model(AlbumArt)
    @album_art.stub!(:new_record?).and_return(true)
    @album_art.stub!(:user_id).and_return("1")
    @album_art.stub!(:album_name).and_return("MyString")
    @album_art.stub!(:artist_name).and_return("MyString")
    @album_art.stub!(:image).and_return("MyString")
    @album_art.stub!(:image_temp).and_return("MyString")
    @album_art.stub!(:created_at).and_return(Time.now)
    assigns[:album_art] = @album_art
  end

  it "should render new form" do
    render "/album_arts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", album_arts_path)
  end
end


