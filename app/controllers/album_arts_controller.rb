class AlbumArtsController < ApplicationController
  # GET /album_arts
  # GET /album_arts.xml
  def index
    @album_arts = AlbumArt.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @album_arts }
    end
  end

  # GET /album_arts/1
  # GET /album_arts/1.xml
  def show
    @album_art = AlbumArt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album_art }
    end
  end

  # GET /album_arts/new
  # GET /album_arts/new.xml
  def new
    @album_art = AlbumArt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album_art }
    end
  end

  # GET /album_arts/1/edit
  def edit
    @album_art = AlbumArt.find(params[:id])
  end

  # POST /album_arts
  # POST /album_arts.xml
  def create
    @album_art = AlbumArt.new(params[:album_art])

    respond_to do |format|
      if @album_art.save
        flash[:notice] = 'AlbumArt was successfully created.'
        format.html { redirect_to(@album_art) }
        format.xml  { render :xml => @album_art, :status => :created, :location => @album_art }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album_art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /album_arts/1
  # PUT /album_arts/1.xml
  def update
    @album_art = AlbumArt.find(params[:id])

    respond_to do |format|
      if @album_art.update_attributes(params[:album_art])
        flash[:notice] = 'AlbumArt was successfully updated.'
        format.html { redirect_to(@album_art) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album_art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /album_arts/1
  # DELETE /album_arts/1.xml
  def destroy
    @album_art = AlbumArt.find(params[:id])
    @album_art.destroy

    respond_to do |format|
      format.html { redirect_to(album_arts_url) }
      format.xml  { head :ok }
    end
  end
end
