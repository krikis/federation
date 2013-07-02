class CreateUPatients < ActiveRecord::Migration
  def change
    create_table :u_patients do |t|
      t.integer :u_patient_nr, null: false
      t.datetime :date, null: false
      t.string :gender, null: false
      t.string :name, null: false

      t.timestamps
    end

    execute 'alter table u_patients add unique index (u_patient_nr)'
  end
end
