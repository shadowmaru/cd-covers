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
    @album_art.stub!(:image_size).and_return("MyString")
    @album_art.stub!(:image_filesize).and_return("MyString")
    @album_art.stub!(:thumbnail).and_return("MyString")
    @album_art.stub!(:score).and_return("1")
    @album_art.stub!(:created_at).and_return(Time.now)
    assigns[:album_art] = @album_art
  end

  it "should render new form" do
    render "/album_arts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", album_arts_path) do
      with_tag("input#album_art_album_name[name=?]", "album_art[album_name]")
      with_tag("input#album_art_artist_name[name=?]", "album_art[artist_name]")
      with_tag("input#album_art_image[name=?]", "album_art[image]")
      with_tag("input#album_art_image_size[name=?]", "album_art[image_size]")
      with_tag("input#album_art_image_filesize[name=?]", "album_art[image_filesize]")
      with_tag("input#album_art_thumbnail[name=?]", "album_art[thumbnail]")
      with_tag("input#album_art_score[name=?]", "album_art[score]")
    end
  end
end


