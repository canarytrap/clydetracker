class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.xml
  def index
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        flash[:notice] = 'Section was successfully created.'
        format.html { redirect_to(@section) }
        format.xml  { render :xml => @section, :status => :created, :location => @section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @section = Section.find(params[:id])

    # TODO: move both these validations to model    
    current_sprint_start  = DateTime.strptime(params[:start_date], "%Y-%m-%d");
    current_sprint_end    = DateTime.strptime(params[:end_date], "%Y-%m-%d");
    last_sprint_end       = DateTime.strptime(Section.previous_sprint.end_date.to_s, "%Y-%m-%d");

    # end_date must be at least 5 days greater than start_date
    if current_sprint_end < (current_sprint_start + 5)
      flash[:notice] = 'Sprint must be at least 5 days long.'
      return redirect_to root_url
    end

    # start_date cannot be earlier than last sprints end date
    if current_sprint_start <= last_sprint_end
      flash[:notice] = 'Start Date cannot overlap with the previous sprint.'
      return redirect_to root_url
    end

    # set these as we are currently coming from welcome page
    @section.start_date = params[:start_date]
    @section.end_date   = params[:end_date]

    respond_to do |format|
      if @section.update_attributes(params[:section])
        flash[:notice] = 'Sprint was successfully updated.'
        format.html { redirect_to root_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(sections_url) }
      format.xml  { head :ok }
    end
  end
end
