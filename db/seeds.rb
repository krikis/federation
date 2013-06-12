# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m_patient_1 = 123
MPatient.create m_patient_nr: m_patient_1, date: Date.today, gender: 'M', name: 'some_name', phone_number: 87654321

MPatientIsAllergicToDrug.create drug_code: 'Drug1', m_patient_nr: m_patient_1
MPatientIsAllergicToDrug.create drug_code: 'Drug2', m_patient_nr: m_patient_1

MartiniTreatmentInvolvesDrug.create date: 2.weeks.ago, drug_code: 'Drug3', martini_patient_nr: m_patient_1, martini_doctor_id: 10
MartiniTreatmentInvolvesDrug.create date: Date.today, drug_code: 'Drug4', martini_patient_nr: m_patient_1, martini_doctor_id: 11

MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: 2.weeks.ago, m_patient_nr: m_patient_1
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason2', date: Date.today, m_patient_nr: m_patient_1


m_patient_2 = 124
MPatient.create m_patient_nr: m_patient_2, date: Date.today, gender: 'M', name: 'some_name', phone_number: 87654321

MartiniTreatmentInvolvesDrug.create date: 1.year.ago, drug_code: 'Drug1', martini_patient_nr: m_patient_2, martini_doctor_id: 10

MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: 1.year.ago, m_patient_nr: m_patient_2