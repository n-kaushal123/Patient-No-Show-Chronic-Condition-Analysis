CREATE TABLE staging_raw (
 PatientId DECIMAL(20,2),
    AppointmentID BIGINT,
    Gender CHAR(1),
    ScheduledDay DATETIME,
    AppointmentDay DATETIME,
    Age INT,
    Neighbourhood VARCHAR(100),
    Scholarship TINYINT,
    Hipertension TINYINT,
    Diabetes TINYINT,
    Alcoholism TINYINT,
    Handcap TINYINT,
    SMS_received TINYINT,
    `No_show` VARCHAR(3)
);
desc staging_raw

desc patient;
INSERT INTO patient (PatientId, Age,Gender)
SELECT DISTINCT PatientId, Age, Gender FROM staging_raw;
select *from patient;

desc appointment;
INSERT INTO appointment ( AppointmentID, PatientId, ScheduledDay, AppointmentDay, Neighbourhood, Scholarship, SMS_received, `No-show`)
SELECT AppointmentID, PatientId, ScheduledDay, AppointmentDay, Neighbourhood, Scholarship, SMS_received, `No-show` FROM staging_raw;
select *from appointment;

desc patient_condn;
insert INTO patient_condn (AppointmentId,Alcoholism,Hipertension,Diabetes,Handcap)
SELECT AppointmentId,Alcoholism,Hipertension,Diabetes,Handcap from staging_raw;
select *from patient_condn;

ALTER TABLE staging_raw MODIFY AppointmentDay VARCHAR(30);
desc staging_raw;
ALTER TABLE staging_raw MODIFY ScheduledDay VARCHAR(30);
desc staging_raw;


SELECT * FROM staging_raw LIMIT 10;
SELECT PatientId  FROM staging_raw LIMIT 5;
SELECT COUNT(*) FROM patient;

TRUNCATE TABLE patient;
INSERT INTO patient (patient_id, age, gender)
SELECT PatientId, MIN(Age), MIN(Gender)
FROM staging_raw
GROUP BY PatientId;
SELECT COUNT(*) FROM patient;


SELECT COUNT(*) FROM appointment;
INSERT INTO appointment (appointment_id, patient_id, scheduled_day, appointment_day, neighbourhood, scholarship, sms_received, no_show)
SELECT 
    AppointmentID, 
    PatientId, 
    STR_TO_DATE(REPLACE(REPLACE(ScheduledDay, 'T', ' '), 'Z', ''), '%Y-%m-%d %H:%i:%s'),
    STR_TO_DATE(REPLACE(REPLACE(AppointmentDay, 'T', ' '), 'Z', ''), '%Y-%m-%d %H:%i:%s'),
    Neighbourhood, 
    Scholarship, 
    SMS_received, 
    `No-show`
FROM staging_raw;
SELECT COUNT(*) FROM appointment;

SELECT COUNT(*)from patient_condn pc;
INSERT INTO patient_condn (appointment_id, hypertension, diabetes, alcoholism, handicap)
SELECT AppointmentID, Hipertension, Diabetes, Alcoholism, Handcap
FROM staging_raw;
SELECT COUNT(*)from patient_condn pc;


