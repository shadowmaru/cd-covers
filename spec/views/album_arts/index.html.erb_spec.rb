require File.dirname(__FILE__) + '/../../spec_helper'

describe "/album_arts/index.html.erb" do
  include AlbumArtsHelper
  
  before(:each) do
    album_art_98 = mock_model(AlbumArt)
    album_art_98.should_receive(:user_id).and_return("1")
    album_art_98.should_receive(:album_name).and_return("MyString")
    album_art_98.should_receive(:artist_name).and_return("MyString")
    album_art_98.should_receive(:image).and_return("MyString")
    album_art_98.should_receive(:image_size).and_return("MyString")
    album_art_98.should_receive(:image_filesize).and_return("MyString")
    album_art_98.should_receive(:score).and_return("1")
    album_art_98.should_receive(:created_at).and_return(Time.now)
    album_art_99 = mock_model(AlbumArt)
    album_art_99.should_receive(:user_id).and_return("1")
    album_art_99.should_receive(:album_name).and_return("MyString")
    album_art_99.should_receive(:artist_name).and_return("MyString")
    album_art_99.should_receive(:image).and_return("MyString")
    album_art_99.should_receive(:image_size).and_return("MyString")
    album_art_99.should_receive(:image_filesize).and_return("MyString")
    album_art_99.should_receive(:score).and_return("1")
    album_art_99.should_receive(:created_at).and_return(Time.now)

    assigns[:album_arts] = [album_art_98, album_art_99]
  end

end

