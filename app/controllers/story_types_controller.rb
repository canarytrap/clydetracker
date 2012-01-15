class StoryTypesController < ApplicationController
  # GET /story_types
  # GET /story_types.xml
  def index
    @story_types = StoryType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @story_types }
    end
  end

  # GET /story_types/1
  # GET /story_types/1.xml
  def show
    @story_type = StoryType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story_type }
    end
  end

  # GET /story_types/new
  # GET /story_types/new.xml
  def new
    @story_type = StoryType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story_type }
    end
  end

  # GET /story_types/1/edit
  def edit
    @story_type = StoryType.find(params[:id])
  end

  # POST /story_types
  # POST /story_types.xml
  def create
    @story_type = StoryType.new(params[:story_type])

    respond_to do |format|
      if @story_type.save
        flash[:notice] = 'StoryType was successfully created.'
        format.html { redirect_to(@story_type) }
        format.xml  { render :xml => @story_type, :status => :created, :location => @story_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /story_types/1
  # PUT /story_types/1.xml
  def update
    @story_type = StoryType.find(params[:id])

    respond_to do |format|
      if @story_type.update_attributes(params[:story_type])
        flash[:notice] = 'StoryType was successfully updated.'
        format.html { redirect_to(@story_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /story_types/1
  # DELETE /story_types/1.xml
  def destroy
    @story_type = StoryType.find(params[:id])
    @story_type.destroy

    respond_to do |format|
      format.html { redirect_to(story_types_url) }
      format.xml  { head :ok }
    end
  end
end
