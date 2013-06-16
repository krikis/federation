class CommonObjectsController < ApplicationController

  def show
    @m_patients = MPatient.all
    @u_patients = UPatient.all
    @gis = Gi.all
    @common_objects = CommonObject.all
  end

end
