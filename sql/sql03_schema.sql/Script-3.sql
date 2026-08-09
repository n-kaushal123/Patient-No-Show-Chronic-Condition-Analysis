SELECT COUNT(*)from patient p ;
SELECT COUNT(*)from patient_condn pc;
SELECT COUNT(*)from appointment a ;

SELECT 
    ROUND(SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment;

SELECT 
    pc.diabetes,
    COUNT(*) AS total_appointments,
    ROUND(SUM(CASE WHEN a.no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment a
JOIN patient_condn pc ON a.appointment_id = pc.appointment_id
GROUP BY pc.diabetes;
// 0=no diabetes 1=have diabetes

SELECT 
    pc.hypertension,
    COUNT(*) AS total_appointments,
    ROUND(SUM(CASE WHEN a.no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment a
JOIN patient_condn pc ON a.appointment_id = pc.appointment_id
GROUP BY pc.hypertension;

SELECT 
    sms_received,
    COUNT(*) AS total_appointments,
    ROUND(SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment
GROUP BY sms_received;
// 1=get sms 0=dont


SELECT 
    CASE 
        WHEN DATEDIFF(appointment_day, scheduled_day) = 0 THEN 'Same day'
        WHEN DATEDIFF(appointment_day, scheduled_day) BETWEEN 1 AND 7 THEN '1-7 days'
        WHEN DATEDIFF(appointment_day, scheduled_day) BETWEEN 8 AND 30 THEN '8-30 days'
        ELSE '30+ days'
    END AS lead_time_bucket,
    COUNT(*) AS total_appointments,
    ROUND(SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment
GROUP BY lead_time_bucket
ORDER BY MIN(DATEDIFF(appointment_day, scheduled_day));

SELECT 
 CASE 
 	when p.age<18 then 'under 18'
 	when p.age BETWEEN 18 AND 35 then'18-35'
 	when p.age BETWEEN 36 AND 55 then'36-55'
 	ELSE '55+'
 	end as age_group,
 	count(*) as total_appointments,
 	ROUND(SUM(CASE WHEN a.no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_percent
FROM appointment a
JOIN patient p on a.patient_id = p.patient_id
GROUP BY age_group;
 
 

