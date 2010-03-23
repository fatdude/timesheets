class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  def index
    @filter = ActivityFilter.new(params[:activity_filter])

    if params[:client_id]
      @client = Client.find params[:client_id]
      @activities = @client.activities.includes([:client, :invoice]).between(@filter.date_from, @filter.date_to).all
    else
      @activities = Activity.between(@filter.date_from, @filter.date_to).by_client(@filter.client_id).includes([:client, :invoice]).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.includes([:client, :project]).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @client = Client.includes(:projects).find(params[:client_id]) if params[:client_id]
    @client = Client.first unless @client
    @activity = Activity.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @activity }
      format.js { render :format => :html, :layout => false }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.includes([:client, :invoice]).find(params[:id])
    @client = @activity.client

    unless @activity.sent?
      respond_to do |format|
        format.html
        format.js { render :format => :html, :layout => false }
      end
    else
      respond_to do |format|
        format.html { redirect_to @activity, :error => "This activity is part of an invoice that has been sent" }
        format.js { render :format => :html, :layout => false }
      end
    end
  end

  # POST /activities
  # POST /activities.xml
  def create
    if params[:client_id]
      @client = Client.find params[:client_id]
      @activity = @client.activities.new(params[:activity])
    else
      @activity = Activity.new(params[:activity])
    end

    respond_to do |format|
      if @activity.save
        format.html { redirect_to(client_activities_path(@activity.client_id), :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.includes([:client, :invoice]).find(params[:id])
    @client = @activity.client

    unless @activity.sent?
      respond_to do |format|
        if @activity.update_attributes(params[:activity])
          format.html { redirect_to(@activity, :notice => 'Activity was successfully updated.') }
          format.xml  { head :ok }
          format.js
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @activity, :error => "This activity is part of an invoice that has been sent" }
        format.js
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @invoice = Invoice.find_by_code params[:invoice_id].upcase if params[:invoice_id]
    @activity = Activity.find(params[:id])

    unless @activity.sent?
      if @invoice
        @activity.update_attribute :invoice_id, nil
        @invoice.remove_activity_total @activity
      else
        @activity.destroy
      end

      respond_to do |format|
        format.html { redirect_to(@invoice || activities_url) }
        format.xml  { head :ok }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to(@invoice || activities_url, :error => "This activity is part of an invoice that has been sent") }
        format.xml  { head :ok }
        format.js
      end
    end
  end
end

