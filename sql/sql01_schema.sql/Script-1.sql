show databases;
use hospital_noshow;
create table patient(
PatientId int primary KEY ,
Age int,
Gender char(1)
);
desc patient;

use hospital_noshow;
create table appointment(
AppointmentId int primary key AUTO_INCREMENT,
PatientId int ,
AppointmentDay DATE ,
ScheduledDay DATE ,
Neighbourhood varchar (100),
Scholarship tinyint(1),
SMS_received tinyint(1),
No_show varchar(3),
FOREIGN KEY (PatientId) REFERENCES patient(PatientId)
);
desc appointment;

use hospital_noshow;
CREATE  TABLE  patient_condn (
AppointmentId int primary key,
Alcoholism tinyint(1),
Handcap tinyint(1),
Diabetes tinyint(1),
Hypertension tinyint(1),
FOREIGN KEY (AppointmentId) REFERENCES appointment(AppointmentId)
);
desc patient_condn;
alter table patient_condn  rename column Hypertension to  Hipertension;
desc patient_condn;