SELECT usr.id as id, per.email, per.password, per.names, per.last_names,
       per.accepts_terms, per.accept_privacy_terms
FROM users as usr INNER JOIN persons as per ON per.id = usr.person_id
WHERE per.email = 'car.abr.04@gmail.com' AND usr.rol_id = 'C' AND usr.status_id = 'E';



SELECT * FROM service_types;
SELECT * FROM services;
SELECT * FROM service_rankings;
SELECT * FROM service_status;

SELECT ser.id, ser.type_id, sty.name as type_name, ser.price, ser.duration, ser.ranking_id, sra.name as ranking_name
FROM services as ser
INNER JOIN service_types as sty ON sty.id = ser.type_id
INNER JOIN service_rankings as sra ON sra.id = ser.ranking_id
WHERE ser.status_id = 'E';



SELECT * FROM schedules AS  sch;



SELECT sch.id, BIN_TO_UUID(sch.uuid) AS uuid, sch.start_date, sch.end_date, sch.service_id, sty.id AS service_type_id, sty.name AS service_type_name
FROM schedules AS sch
INNER JOIN services as ser ON ser.id = sch.service_id
INNER JOIN service_types as sty ON sty.id = ser.type_id;


SELECT * FROM bookings;

SELECT boo.id
FROM bookings AS boo
INNER JOIN schedules as sch ON sch.id = boo.schedule_id
WHERE ('2026-08-09' BETWEEN sch.start_date AND sch.end_date) AND boo.schedule_id = 1;


SELECT boo.id
FROM bookings AS boo
INNER JOIN schedules as sch ON sch.id = boo.schedule_id
WHERE ('2026-08-10 09:00:00' BETWEEN sch.start_date AND sch.end_date) AND boo.schedule_id = 1 LIMIT 1;


SELECT boo.id, boo.status_id AS status_id, bta.description AS status_name, boo.start_time,
       boo.schedule_id AS schedule_id, ser.id AS service_id, ser.duration AS service_duration,
       sty.name AS service_type_name
FROM bookings AS boo
INNER JOIN schedules AS ach ON ach.id = boo.schedule_id
INNER JOIN services AS ser ON ser.id = ach.service_id
INNER JOIN service_types as sty ON sty.id = ser.type_id
INNER JOIN booking_status as bta ON bta.id = boo.status_id
WHERE boo.client_id = 1;



SELECT boo.id, boo.status_id AS status_id, bta.description AS status_name, boo.start_time,boo.schedule_id AS schedule_id, ser.id AS service_id, ser.duration AS service_duration, sty.name AS service_type_name FROM bookings AS boo INNER JOIN schedules AS ach ON ach.id = boo.schedule_id INNER JOIN services AS ser ON ser.id = ach.service_id INNER JOIN service_types as sty ON sty.id = ser.type_id INNER JOIN booking_status as bta ON bta.id = boo.status_id WHERE boo.client_id = 1;
