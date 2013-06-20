class UmcgProlife4DoctorsController < ApplicationController

  def show
    @m_patients = MPatient.all
    @u_patients = UPatient.all
    @gis = Gi.all
    @umcg_prolife4_doctors = UmcgProlife4Doctor.all
  end

end
