require File.dirname(__FILE__) + '/../spec_helper'

describe AlbumArtImage do
  
  TEST_FILE = RAILS_ROOT + '/spec/fixtures/files/anacronico.jpg'

  before(:each) do
    @album_art_image = AlbumArtImage.new
    @album_art_image.uploaded_data = ActionController::TestUploadedFile.new(TEST_FILE,'image/jpg')
    @album_art_image.send :process_attachment
  end
  
  it "should be valid" do
    @album_art_image.should be_valid
  end

end