class Gi < ActiveRecord::Base

  include HasDetails
  set_table_name 'epd_patient_plays_role_using_local_nrs'
  self.primary_key = :id

end
