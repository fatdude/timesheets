class ConfigurationsController < ApplicationController
  # GET /configurations
  # GET /configurations.json
  def index
    @configurations = Configuration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @configurations }
    end
  end

  # GET /configurations/1
  # GET /configurations/1.json
  def show
    @configuration = Configuration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @configuration }
    end
  end

  # GET /configurations/new
  # GET /configurations/new.json
  def new
    @configuration = Configuration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @configuration }
    end
  end

  # GET /configurations/1/edit
  def edit
    @configuration = Configuration.find(params[:id])
  end

  # POST /configurations
  # POST /configurations.json
  def create
    @configuration = Configuration.new(params[:configuration])

    respond_to do |format|
      if @configuration.save
        format.html { redirect_to @configuration, notice: 'Configuration was successfully created.' }
        format.json { render json: @configuration, status: :created, location: @configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /configurations/1
  # PUT /configurations/1.json
  def update
    @configuration = Configuration.find(params[:id])

    respond_to do |format|
      if @configuration.update_attributes(params[:configuration])
        format.html { redirect_to @configuration, notice: 'Configuration was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configurations/1
  # DELETE /configurations/1.json
  def destroy
    @configuration = Configuration.find(params[:id])
    @configuration.destroy

    respond_to do |format|
      format.html { redirect_to configurations_url }
      format.json { head :ok }
    end
  end
end
