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

-- Clave: abc123
INSERT INTO persons (id, email, password, accepts_terms, accept_privacy_terms) VALUES (1, 'car.abr.04@gmail.com', '$2b$10$Hncu.wnnmNtebIPk559MderEhZMOF25dcmdTzVJ7MSA.HDajFuR6u', 1, 1);
INSERT INTO persons (id, email, password, accepts_terms, accept_privacy_terms) VALUES (2, 'ivan-12-12@gmail.com', '$2b$10$Hncu.wnnmNtebIPk559MderEhZMOF25dcmdTzVJ7MSA.HDajFuR6u', 1, 1);
INSERT INTO persons (id, email, password, accepts_terms, accept_privacy_terms) VALUES (3, 'more-24-24@gmail.com', '$2b$10$Hncu.wnnmNtebIPk559MderEhZMOF25dcmdTzVJ7MSA.HDajFuR6u', 1, 1);

INSERT INTO users (id, person_id, rol_id, status_id) VALUES (1, 1, 'C', 'E');
INSERT INTO users (id, person_id, rol_id, status_id) VALUES (2, 2, 'C', 'E');
INSERT INTO users (id, person_id, rol_id, status_id) VALUES (3, 3, 'C', 'E');

INSERT INTO services (type_id, price, duration, status_id, ranking_id) VALUES (1, 50.48, 75, 'E', 1);
INSERT INTO services (type_id, price, duration, status_id, ranking_id) VALUES (2, 102.73, 123, 'E', 1);
INSERT INTO services (type_id, price, duration, status_id, ranking_id) VALUES (3, 85.50, 100, 'E', 1);


INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 1, '2026-09-10 13:00:00', '2026-09-10 04:00:00');
INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 2, '2026-09-10 13:00:00', '2026-09-10 04:00:00');
INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 3, '2026-09-10 13:00:00', '2026-09-10 04:00:00');

INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 1, '2026-09-12 11:00:00', '2026-09-12 03:00:00');
INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 2, '2026-09-12 11:00:00', '2026-09-12 03:00:00');
INSERT INTO schedules (uuid, service_id, start_date, end_date) VALUES (UUID_TO_BIN(UUID()), 3, '2026-09-12 11:00:00', '2026-09-12 03:00:00');




