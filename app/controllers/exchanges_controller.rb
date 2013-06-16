class ExchangesController < ApplicationController

  def show
    @common_objects = CommonObject.all
    common_martini_patient_nrs = @common_objects.map do |common_object|
      common_object.martini_patient.martini_patient_nr
    end
    @m_patients = MPatient.all.reject do |m_patient|
      common_martini_patient_nrs.include? m_patient.m_patient_nr
    end
    common_umcg_patient_nrs = @common_objects.map do |common_object|
      common_object.umcg_patient.umcg_patient_nr
    end
    @u_patients = UPatient.all.reject do |u_patient|
      common_umcg_patient_nrs.include? u_patient.u_patient_nr
    end
    @gis = Gi.all
  end

end
