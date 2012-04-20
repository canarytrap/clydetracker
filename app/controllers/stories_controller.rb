class StoriesController < ApplicationController

  layout "welcome"

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
    @story = Story.new

    # setting the title, as we came from a form on welcome page
    @story.title = params[:title]

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story has been added to icebox'
        format.html { redirect_to root_url }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        flash[:notice] = @story.errors[:title]
        format.html { redirect_to root_url }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    # mapping the params as this is from a custom form
    @story.title        = params[:title]
    @story.description  = params[:description]
    @story.points       = params[:points]
    @story.assignee_id  = params[:assignee_id]
    @story.status_id    = params[:status_id]
    @story.story_type_id = params[:story_type_id]
    @story.section_id   = params[:section_id]

    # TODO: move to model
    # if a task was specified
    @tasks = Task.find_all_by_story_id(params[:id])
    if @tasks.length > 0
# how to do updates?
=begin
      @tasks.each do |task|
        # reconstructing the suffixed task ID from view
        @story.tasks << task.title = params[:task + '_' + task.id]
      end
=end
    else
      if params[:task].length > 2
        @story.tasks << Task.new(:title => params[:task], :status_id => 1)
      end
    end

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
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @stories = Story.search(params[:search_string])

    @search_string = params[:search_string]

    # for select boxes
    @users            = User.find :all, :order => "name"
    @statuses         = Status.find :all, :order => "id ASC"
    @story_types      = StoryType.find :all, :order => "name ASC"
    @sections         = Section.select_box
  end
end
