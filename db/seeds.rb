# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ------------------------------------ MPatients -------------------------------
m_patient_1 = 123
MPatient.create m_patient_nr: m_patient_1, date: 20.years.ago, gender: 'M', name: 'Jan met de Pet', phone_number: 87654321
MPatientIsAllergicToDrug.create drug_code: 'Drug1', m_patient_nr: m_patient_1
MPatientIsAllergicToDrug.create drug_code: 'Drug2', m_patient_nr: m_patient_1
MPatientTreatmentInvolvesDrug.create date: 2.weeks.ago, drug_code: 'Drug3', m_patient_nr: m_patient_1, specialist_id: 10
MPatientTreatmentInvolvesDrug.create date: Date.today, drug_code: 'Drug4', m_patient_nr: m_patient_1, specialist_id: 11
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: 2.weeks.ago, m_patient_nr: m_patient_1
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason2', date: Date.today, m_patient_nr: m_patient_1

m_patient_2 = 124
MPatient.create m_patient_nr: m_patient_2, date: 30.years.ago, gender: 'F', name: 'T. Ester', phone_number: 12345678
MartiniTreatmentInvolvesDrug.create date: 1.year.ago, drug_code: 'Drug1', martini_patient_nr: m_patient_2, martini_doctor_id: 10
MPatientAdmittedForAdmissionReasonOnDate.create admission_reason_code: 'AdmissionReason1', date: 1.year.ago, m_patient_nr: m_patient_2

# ------------------------------------ UPatients -------------------------------
u_patient_1 = 2030
UPatient.create u_patient_nr: u_patient_1, date: 25.years.ago, gender: 'Male', name: 'P. Atiënt'
UPatientHasPhone.create phone: 1234567, u_patient_nr: u_patient_1
UPatientHasPhone.create phone: 123456, u_patient_nr: u_patient_1
UPatientHasPhone.create phone: 12345678, u_patient_nr: u_patient_1
UPatientTreatment.create date: 3.weeks.ago, u_patient_nr: u_patient_1, doctor_id: 12
UPatientTreatmentInvolvesDrug.create date: 2.months.ago, drug_code: 'Drug5', u_patient_nr: u_patient_1
UPatientTreatmentInvolvesDrug.create date: 2.days.ago, drug_code: 'Drug6', u_patient_nr: u_patient_1
UPatientWasAdmittedForAdmittanceReasonOnDate.create admittance_reason: 'AdmittanceReason1', date: 4.weeks.ago, u_patient_nr: u_patient_1

u_patient_2 = 2031
UPatient.create u_patient_nr: u_patient_2, date: 10.years.ago, gender: 'Female', name: 'Janette Fictief'
UPatientHasPhone.create phone: 123456789, u_patient_nr: u_patient_2
UPatientHasPhone.create phone: 12345678910, u_patient_nr: u_patient_2
UPatientTreatment.create date: 56.days.ago, u_patient_nr: u_patient_2, doctor_id: 13
UPatientTreatmentInvolvesDrug.create date: 2.weeks.ago, drug_code: 'Drug3', u_patient_nr: u_patient_2
UPatientTreatmentInvolvesDrug.create date: 15.days.ago, drug_code: 'Drug7', u_patient_nr: u_patient_2
UPatientWasAdmittedForAdmittanceReasonOnDate.create admittance_reason: 'AdmittanceReason2', date: 7.weeks.ago, u_patient_nr: u_patient_2
