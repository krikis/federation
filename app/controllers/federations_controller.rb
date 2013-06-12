class FederationsController < ApplicationController

  def show
    @m_patients = MPatient.all
    @u_patients = UPatient.all
    @gis = Gi.all
    @epd_patients = EpdPatient.all
  end

end
