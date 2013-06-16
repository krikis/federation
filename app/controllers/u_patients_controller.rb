class UPatientsController < ApplicationController

  def create
    if u_patient_params = params[:u_patient]
      UPatient.create u_patient_params
      UPatient.associations.each do |association|
        params[association.name].andand[:new].andand.each do |new_associated|
          association.klass.create new_associated
        end
      end
    end
    redirect_to :back
  end

  def update
    if u_patient = UPatient.find_by_id(params[:id])
      u_patient.update_attributes params[:u_patient] if params[:u_patient]
      UPatient.associations.each do |association|
        if associated = params[association.name]
          new_associated = associated.delete(:new)
          associated.keys.each do |associated_id|
            association.klass.find_by_id(associated_id).andand
              .update_attributes associated[associated_id]
          end
          new_associated.andand.each do |new_associated|
            association.klass.create new_associated
          end
        end
      end
    end
    redirect_to :back
  end

  def destroy
    UPatient.find_by_id(params[:id]).andand.destroy
    redirect_to :back
  end

end
