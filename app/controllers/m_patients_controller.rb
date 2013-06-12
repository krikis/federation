class MPatientsController < ApplicationController

  def create

  end

  def update
    if m_patient = MPatient.find_by_id(params[:id])
      m_patient.update_attributes params[:m_patient]
    end
    redirect_to root_path
  end

  def destroy
    MPatient.find_by_id(params[:id]).andand.destroy
    redirect_to root_path
  end

end
