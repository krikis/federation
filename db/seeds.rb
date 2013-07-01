# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_birthdate
  (5000 + rand(10000)).days.ago
end

def random_date
  rand(2000).days.ago.to_date
end

def random_phone_nr
  (SecureRandom.random_number * 100000000).round
end

# ------------------------------------ MPatients -------------------------------
m_patient_1 = 123
MPatient.create m_patient_nr: m_patient_1, date: random_birthdate, gender: 'M', name: 'Jan met de Pet', phone_number: random_phone_nr
MPatientIsAllergicToDrug.create drug_code: 'Drug1', m_patient_nr: m_patient_1
MPatientIsAllergicToDrug.create drug_code: 'Drug2', m_patient_nr: m_patient_1
MPatientTreatmentInvolvesDrug.create date: random_date, drug_code: 'Drug3', m_patient_nr: m_patient_1, specialist_id: 10
MPatientTreatmentInvolvesDrug.create date: random_date, drug_code: 'Drug4', m_patient_nr: m_patient_1, specialist_id: 11
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: random_date, m_patient_nr: m_patient_1
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason2', date: random_date, m_patient_nr: m_patient_1

m_patient_2 = 124
MPatient.create m_patient_nr: m_patient_2, date: random_birthdate, gender: 'F', name: 'T. Ester', phone_number: random_phone_nr
MartiniTreatmentInvolvesDrug.create date: random_date, drug_code: 'Drug1', martini_patient_nr: m_patient_2, martini_doctor_id: 10
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: random_date, m_patient_nr: m_patient_2

m_patient_3 = 125
MPatient.create m_patient_nr: m_patient_3, date: random_birthdate, name: 'Second Opinion'
MPatientIsAllergicToDrug.create drug_code: 'Drug6', m_patient_nr: m_patient_3
MartiniTreatmentInvolvesDrug.create date: random_date, drug_code: 'Drug7', martini_patient_nr: m_patient_3, martini_doctor_id: 10
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason2', date: random_date, m_patient_nr: m_patient_3

# ------------------------------------ UPatients -------------------------------
u_patient_1 = 2030
UPatient.create u_patient_nr: u_patient_1, date: random_birthdate, gender: 'Male', name: 'P. Atiënt'
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_1
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_1
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_1
treatment_date = random_date
UPatientTreatment.create date: treatment_date, u_patient_nr: u_patient_1, doctor_id: 12
UPatientTreatmentInvolvesDrug.create date: treatment_date, drug_code: 'Drug5', u_patient_nr: u_patient_1
UPatientTreatmentInvolvesDrug.create date: treatment_date, drug_code: 'Drug6', u_patient_nr: u_patient_1
UPatientWasAdmittedForAdmittanceReasonOnDate.create admittance_reason: 'AdmittanceReason1', date: random_date, u_patient_nr: u_patient_1

u_patient_2 = 2031
UPatient.create u_patient_nr: u_patient_2, date: random_date, gender: 'Female', name: 'Janette Fictief'
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_2
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_2
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_2
treatment_date = random_date
UPatientTreatment.create date: treatment_date, u_patient_nr: u_patient_2, doctor_id: 13
UPatientTreatmentInvolvesDrug.create date: treatment_date, drug_code: 'Drug3', u_patient_nr: u_patient_2
UPatientTreatmentInvolvesDrug.create date: treatment_date, drug_code: 'Drug7', u_patient_nr: u_patient_2
UPatientWasAdmittedForAdmittanceReasonOnDate.create admittance_reason: 'AdmittanceReason2', date: random_date, u_patient_nr: u_patient_2

u_patient_3 = 2032
UPatient.create u_patient_nr: u_patient_3, gender: 'Female'
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_3
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_3
UPatientHasPhone.create phone: random_phone_nr, u_patient_nr: u_patient_3
treatment_date = random_date
UPatientTreatment.create date: treatment_date, u_patient_nr: u_patient_3, doctor_id: 12
UPatientTreatmentInvolvesDrug.create date: treatment_date, drug_code: 'Drug8', u_patient_nr: u_patient_3
UPatientWasAdmittedForAdmittanceReasonOnDate.create admittance_reason: 'AdmittanceReason3', date: random_date, u_patient_nr: u_patient_3

# ------------------------------------ Gis -------------------------------------
Gi.where(local_nr: u_patient_3, role: 'UMCG').first.update_attributes epd_patient_id: Gi.where(local_nr: m_patient_3, role: 'MZKH').first.epd_patient_id


