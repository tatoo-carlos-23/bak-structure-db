INSERT INTO user_status (id, description) VALUES ('E', 'Enable');
INSERT INTO user_status (id, description) VALUES ('D', 'Disable');
INSERT INTO user_status (id, description) VALUES ('C', 'Created');

INSERT INTO user_roles (id, description) VALUES ('C', 'Client');
INSERT INTO user_roles (id, description) VALUES ('A', 'Admin');

INSERT INTO service_status (id, description) VALUES ('E', 'Enable');
INSERT INTO service_status (id, description) VALUES ('D', 'Disable');

INSERT INTO service_types (id, name)VALUES (1, 'Corte');
INSERT INTO service_types (id, name) VALUES (2, 'Masaje');
INSERT INTO service_types (id, name) VALUES (3, 'Manicure');

INSERT INTO service_rankings (id, name)VALUES (1, 'ORO');
INSERT INTO service_rankings (id, name)VALUES (2, 'PLATINO');
INSERT INTO service_rankings (id, name)VALUES (3, 'BRONCE');

INSERT INTO booking_status (id, description)VALUES (1, 'Sin iniciar');
INSERT INTO booking_status (id, description)VALUES (2, 'Confirmada');
INSERT INTO booking_status (id, description)VALUES (3, 'En ejecución');
INSERT INTO booking_status (id, description)VALUES (4, 'Finalizada');


SELECT * FROM user_status;
SELECT * FROM user_roles;
SELECT * FROM service_status;
SELECT * FROM service_types;
SELECT * FROM service_rankings;
SELECT * FROM booking_status;


-- Clave: abc123
INSERT INTO persons (id, email, password, accepts_terms, accept_privacy_terms) VALUES (1, 'car.abr.04@gmail.com', '$2b$10$Hncu.wnnmNtebIPk559MderEhZMOF25dcmdTzVJ7MSA.HDajFuR6u', 1, 1);
INSERT INTO users (id, person_id, rol_id, status_id) VALUES (1, 1, 'C', 'E');
SELECT * FROM persons;
SELECT * FROM users;



INSERT INTO services (type_id, price, duration, status_id, ranking_id) VALUES (1, 50.48, 75, 'E', 1);