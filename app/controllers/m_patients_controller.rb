class MPatientsController < ApplicationController

  def create

  end

  def update

  end

  def destroy
    MPatient.find_by_id(params[:id]).andand.destroy
  end

end
