class MPatientsController < ApplicationController

  def create
    if m_patient_params = params[:m_patient]
      MPatient.transaction do
        MPatient.create m_patient_params
        MPatient.associations.each do |association|
          params[association.name].andand[:new].andand.each do |new_associated|
            association.klass.create new_associated
          end
        end
      end
    end
    redirect_to :back
  end

  def update
    if m_patient = MPatient.find_by_id(params[:id])
      MPatient.transaction do
        old_m_patient_nr = m_patient.m_patient_nr
        m_patient.update_attributes params[:m_patient] if params[:m_patient]
        MPatient.associations.each do |association|
          if associated = params[association.name]
            new_associated = associated.delete(:new)
            associated.keys.each do |associated_id|
              if associated[associated_id]['m_patient_nr'] == old_m_patient_nr.to_s
                associated[associated_id]['m_patient_nr'] = m_patient.m_patient_nr
              end
              association.klass.find_by_id(associated_id).andand
                .update_attributes associated[associated_id]
            end
            new_associated.andand.each do |new_associated|
              association.klass.create new_associated
            end
          end
        end
      end
    end
    redirect_to :back
  end

  def destroy
    MPatient.find_by_id(params[:id]).andand.destroy
    redirect_to :back
  end

end
