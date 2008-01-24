require File.dirname(__FILE__) + '/../spec_helper'

describe AlbumArtsController do
  describe "handling GET /album_arts" do

    before(:each) do
      @album_art = mock_model(AlbumArt)
      AlbumArt.stub!(:find).and_return([@album_art])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all album_arts" do
      AlbumArt.should_receive(:find).with(:all).and_return([@album_art])
      do_get
    end
  
    it "should assign the found album_arts for the view" do
      do_get
      assigns[:album_arts].should == [@album_art]
    end
  end

  describe "handling GET /album_arts.xml" do

    before(:each) do
      @album_art = mock_model(AlbumArt, :to_xml => "XML")
      AlbumArt.stub!(:find).and_return(@album_art)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all album_arts" do
      AlbumArt.should_receive(:find).with(:all).and_return([@album_art])
      do_get
    end
  
    it "should render the found album_arts as xml" do
      @album_art.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /album_arts/1" do

    before(:each) do
      @album_art = mock_model(AlbumArt)
      AlbumArt.stub!(:find).and_return(@album_art)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the album_art requested" do
      AlbumArt.should_receive(:find).with("1").and_return(@album_art)
      do_get
    end
  
    it "should assign the found album_art for the view" do
      do_get
      assigns[:album_art].should equal(@album_art)
    end
  end

  describe "handling GET /album_arts/1.xml" do

    before(:each) do
      @album_art = mock_model(AlbumArt, :to_xml => "XML")
      AlbumArt.stub!(:find).and_return(@album_art)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the album_art requested" do
      AlbumArt.should_receive(:find).with("1").and_return(@album_art)
      do_get
    end
  
    it "should render the found album_art as xml" do
      @album_art.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /album_arts/new" do

    before(:each) do
      @album_art = mock_model(AlbumArt)
      AlbumArt.stub!(:new).and_return(@album_art)
    end
  
    def do_get
      get :new
    end

    def do_login
      controller.stub!(:logged_in?).and_return(true)
    end

    it "should require login" do
      do_get
      response.should be_redirect
    end

    it "should be successful" do
      do_login
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_login
      do_get
      response.should render_template('new')
    end
  
    it "should create an new album_art" do
      do_login
      AlbumArt.should_receive(:new).and_return(@album_art)
      do_get
    end
  
    it "should not save the new album_art" do
      @album_art.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new album_art for the view" do
      do_login
      do_get
      assigns[:album_art].should equal(@album_art)
    end
  end

  describe "handling GET /album_arts/1/edit" do

    before(:each) do
      @album_art = mock_model(AlbumArt)
      AlbumArt.stub!(:find).and_return(@album_art)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    def do_login
      controller.stub!(:logged_in?).and_return(true)
    end

    it "should require login" do
      do_get
      response.should be_redirect
    end

    it "should be successful" do
      do_login
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_login
      do_get
      response.should render_template('edit')
    end
  
    it "should find the album_art requested" do
      do_login
      AlbumArt.should_receive(:find).and_return(@album_art)
      do_get
    end
  
    it "should assign the found AlbumArt for the view" do
      do_login
      do_get
      assigns[:album_art].should equal(@album_art)
    end
  end

  describe "handling POST /album_arts" do

    before(:each) do
      @album_art = mock_model(AlbumArt, :to_param => "1")
      AlbumArt.stub!(:new).and_return(@album_art)
    end
    
    describe "with successful save" do
  
      def do_post
        @album_art.should_receive(:save).and_return(true)
        post :create, :album_art => { }
      end
  
      it "should create a new album_art" do
        AlbumArt.should_receive(:new).with({}).and_return(@album_art)
        do_post
      end

      it "should redirect to the new album_art" do
        do_post
        response.should redirect_to(album_art_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @album_art.should_receive(:save).and_return(false)
        post :create, :album_art => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /album_arts/1" do

    before(:each) do
      @album_art = mock_model(AlbumArt, :to_param => "1")
      AlbumArt.stub!(:find).and_return(@album_art)
    end
    
    describe "with successful update" do

      def do_put
        @album_art.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the album_art requested" do
        AlbumArt.should_receive(:find).with("1").and_return(@album_art)
        do_put
      end

      it "should update the found album_art" do
        do_put
        assigns(:album_art).should equal(@album_art)
      end

      it "should assign the found album_art for the view" do
        do_put
        assigns(:album_art).should equal(@album_art)
      end

      it "should redirect to the album_art" do
        do_put
        response.should redirect_to(album_art_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @album_art.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /album_arts/1" do

    before(:each) do
      @album_art = mock_model(AlbumArt, :destroy => true)
      AlbumArt.stub!(:find).and_return(@album_art)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the album_art requested" do
      AlbumArt.should_receive(:find).with("1").and_return(@album_art)
      do_delete
    end
  
    it "should call destroy on the found album_art" do
      @album_art.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the album_arts list" do
      do_delete
      response.should redirect_to(album_arts_url)
    end
  end
end