class SettingsController < ApplicationController

  # GET /settings/1/edit
  def edit
    @setting = Setting.first
  end
  
  # PUT /settings/1
  # PUT /settings/1.json
  def update
    @setting = Setting.first

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to edit_settings_path, notice: 'Settings were successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
end
