class CreateUPatients < ActiveRecord::Migration
  def change
    create_table :u_patients do |t|
      t.integer :u_patient_nr
      t.datetime :date
      t.string :gender
      t.string :name

      t.timestamps
    end

    execute 'alter table u_patients drop primary key, add primary key (id, u_patient_nr), add index (u_patient_nr)'
  end
end
