class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    # TODO: move everything below to model
    if params[:title].empty?
      flash[:notice] = 'You did not enter anything.'
      return redirect_to root_url
    end
    
    @story = Story.new    
    @story.author_id      = 1
    @story.section_id     = 1

    # parse first word for story type
    if params[:title].index("bug") == 0
      @story.story_type_id = 3
      story_title = params[:title][3, params[:title].length]
    elsif params[:title].index("tech") == 0
      @story.story_type_id = 2
      story_title = params[:title][4, params[:title].length]
    else
      @story.story_type_id = 1
      story_title = params[:title]
    end
    
    @story.title = story_title

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story has been added to icebox'
        format.html { redirect_to root_url }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    # TODO: move everything below to model
    if params[:title].empty?
      flash[:notice] = 'You did not enter anything.'
      return redirect_to root_url
    end

    @story.title        = params[:title]
    @story.description  = params[:description]
    @story.points       = params[:points]
    @story.assignee_id  = params[:assignee_id]
    @story.status_id    = params[:status_id]
    @story.story_type_id = params[:story_type_id]
    @story.section_id   = params[:section_id]

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story has been updated.'
        format.html { redirect_to root_url }
        format.xml  { head :ok }
      else
        flash[:notice] = 'There was an error while updating.'
        format.html { redirect_to root_url }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    flash[:notice] = 'Story has been deleted.'
    
    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
    end
  end
end
