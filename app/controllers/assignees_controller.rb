class AssigneesController < ApplicationController
  # GET /assignees
  # GET /assignees.xml
  def index
    @assignees = Assignee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignees }
    end
  end

  # GET /assignees/1
  # GET /assignees/1.xml
  def show
    @assignee = Assignee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignee }
    end
  end

  # GET /assignees/new
  # GET /assignees/new.xml
  def new
    @assignee = Assignee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignee }
    end
  end

  # GET /assignees/1/edit
  def edit
    @assignee = Assignee.find(params[:id])
  end

  # POST /assignees
  # POST /assignees.xml
  def create
    @assignee = Assignee.new(params[:assignee])

    respond_to do |format|
      if @assignee.save
        flash[:notice] = 'Assignee was successfully created.'
        format.html { redirect_to(@assignee) }
        format.xml  { render :xml => @assignee, :status => :created, :location => @assignee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignees/1
  # PUT /assignees/1.xml
  def update
    @assignee = Assignee.find(params[:id])

    respond_to do |format|
      if @assignee.update_attributes(params[:assignee])
        flash[:notice] = 'Assignee was successfully updated.'
        format.html { redirect_to(@assignee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignees/1
  # DELETE /assignees/1.xml
  def destroy
    @assignee = Assignee.find(params[:id])
    @assignee.destroy

    respond_to do |format|
      format.html { redirect_to(assignees_url) }
      format.xml  { head :ok }
    end
  end
end
