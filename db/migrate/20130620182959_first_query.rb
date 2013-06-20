class FirstQuery < ActiveRecord::Migration
  def up
    execute <<-SQL
      /* Give all UMCG-doctors that treated patients at the UMCG-hospital */
      /* that were also treated at the MZKH-hospital with the drug having */
      /* code 'ProLife4'                                                  */
      create view umcg_prolife4_doctors as
      select ut.umcg_doctor_id
      from common_objects as p, umcg_patients as u,    umcg_treatments as ut,
                                martini_patients as m, martini_treatment_involves_drugs as mt
      where u.epd_patient_id = p.epd_patient_id and m.epd_patient_id = p.epd_patient_id and
            ut.umcg_patient_nr = u.umcg_patient_nr and mt.martini_patient_nr = m.martini_patient_nr and
            mt.drug_code = 'ProLife4'
    SQL
  end

  def down
    execute 'drop view umcg_prolife4_doctors'
  end
end
