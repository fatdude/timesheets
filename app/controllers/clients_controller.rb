class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
      format.pdf do
        render :pdf => 'test',
               :layout => 'pdf.html',
               :show_as_html => !params[:debug].blank?,
               :lowquality => false,
               :template => '/clients/show.html'
      end
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.js { render :layout => false }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.js { render :layout => false }
    end
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to(clients_path, :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to(clients_path, :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
      format.js
    end
  end
end

