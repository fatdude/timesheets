class SettingsController < ApplicationController
  # GET /settings
  # GET /settings.xml
  def index
    @setting = Setting.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  # PUT /settings/1
  # PUT /settings/1.xml
  def update
    @setting = Setting.first

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to(settings_path, :notice => 'Settings were successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end

