class CreateUPatients < ActiveRecord::Migration
  def change
    create_table :u_patients do |t|
      t.integer :u_patient_nr
      t.datetime :date
      t.string :gender
      t.string :name

      t.timestamps
    end
  end
end
