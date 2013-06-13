class MPatientsController < ApplicationController

  def create
    if m_patient_params = params[:m_patient]
      MPatient.create m_patient_params
      if admissions = params[:m_patient_admitted_for_admission_reason_on_date]
        new_admissions = admissions.delete(:new)
        new_admissions.andand.each do |new_admission|
          MPatientAdmittedForAdmissionReasonOnDate.create new_admission
        end
      end
    end
    redirect_to root_path
  end

  def update
    if m_patient = MPatient.find_by_id(params[:id])
      m_patient.update_attributes params[:m_patient] if params[:m_patient]
      if admissions = params[:m_patient_admitted_for_admission_reason_on_date]
        new_admissions = admissions.delete(:new)
        admissions.keys.each do |admission_id|
          MPatientAdmittedForAdmissionReasonOnDate.find_by_id(admission_id).andand
            .update_attributes admissions[admission_id]
        end
        new_admissions.andand.each do |new_admission|
          MPatientAdmittedForAdmissionReasonOnDate.create new_admission
        end
      end
    end
    redirect_to root_path
  end

  def destroy
    MPatient.find_by_id(params[:id]).andand.destroy
    redirect_to root_path
  end

end
