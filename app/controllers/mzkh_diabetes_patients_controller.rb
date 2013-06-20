class MzkhDiabetesPatientsController < ApplicationController

  def show
    @m_patients = MPatient.all
    @u_patients = UPatient.all
    @gis = Gi.all
    @mzkh_diabetes_patients = MzkhDiabetesPatient.all
  end

end
