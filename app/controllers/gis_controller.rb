class GisController < ApplicationController

  def create
    Gi.create params[:gi] if params[:gi]
    redirect_to :back
  end

  def update
    if gi = Gi.find_by_id(params[:id])
      gi.update_attributes params[:gi] if params[:gi]
    end
    redirect_to :back
  end

  def destroy
    Gi.find_by_id(params[:id]).andand.destroy
    redirect_to :back
  end

end
