class MPatientsController < ApplicationController

  def create

  end

  def update

  end

  def destroy
    MPatient.find_by_id(params[:id]).andand.destroy
    redirect_to root_path
  end

end
