require File.dirname(__FILE__) + '/../spec_helper'

describe AlbumArtsController do
  describe "route generation" do

    it "should map { :controller => 'album_arts', :action => 'index' } to /album_arts" do
      route_for(:controller => "album_arts", :action => "index").should == "/album_arts"
    end
  
    it "should map { :controller => 'album_arts', :action => 'new' } to /album_arts/new" do
      route_for(:controller => "album_arts", :action => "new").should == "/album_arts/new"
    end
  
    it "should map { :controller => 'album_arts', :action => 'show', :id => 1 } to /album_arts/1" do
      route_for(:controller => "album_arts", :action => "show", :id => 1).should == "/album_arts/1"
    end
  
    it "should map { :controller => 'album_arts', :action => 'edit', :id => 1 } to /album_arts/1/edit" do
      route_for(:controller => "album_arts", :action => "edit", :id => 1).should == "/album_arts/1/edit"
    end
  
    it "should map { :controller => 'album_arts', :action => 'update', :id => 1} to /album_arts/1" do
      route_for(:controller => "album_arts", :action => "update", :id => 1).should == "/album_arts/1"
    end
  
    it "should map { :controller => 'album_arts', :action => 'destroy', :id => 1} to /album_arts/1" do
      route_for(:controller => "album_arts", :action => "destroy", :id => 1).should == "/album_arts/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'album_arts', action => 'index' } from GET /album_arts" do
      params_from(:get, "/album_arts").should == {:controller => "album_arts", :action => "index"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'new' } from GET /album_arts/new" do
      params_from(:get, "/album_arts/new").should == {:controller => "album_arts", :action => "new"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'create' } from POST /album_arts" do
      params_from(:post, "/album_arts").should == {:controller => "album_arts", :action => "create"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'show', id => '1' } from GET /album_arts/1" do
      params_from(:get, "/album_arts/1").should == {:controller => "album_arts", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'edit', id => '1' } from GET /album_arts/1;edit" do
      params_from(:get, "/album_arts/1/edit").should == {:controller => "album_arts", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'update', id => '1' } from PUT /album_arts/1" do
      params_from(:put, "/album_arts/1").should == {:controller => "album_arts", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'album_arts', action => 'destroy', id => '1' } from DELETE /album_arts/1" do
      params_from(:delete, "/album_arts/1").should == {:controller => "album_arts", :action => "destroy", :id => "1"}
    end
  end
end