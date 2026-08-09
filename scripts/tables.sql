DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS booking_status;
DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS service_types;
DROP TABLE IF EXISTS service_status;
DROP TABLE IF EXISTS service_rankings;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS user_status;
DROP TABLE IF EXISTS user_types;



CREATE TABLE persons
(
    id                   BIGINT PRIMARY KEY AUTO_INCREMENT,
    email                VARCHAR(150) NOT NULL UNIQUE,
    password             TEXT         NULL,
    names                VARCHAR(70)  NULL,
    last_names           VARCHAR(70)  NULL,
    accepts_terms        SMALLINT     NOT NULL DEFAULT 0,
    accept_privacy_terms SMALLINT     NOT NULL DEFAULT 0,
    created_at           TIMESTAMP    NULL     DEFAULT CURRENT_TIMESTAMP,
    updated_at           TIMESTAMP    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE user_roles
(
    id          CHAR(1) PRIMARY KEY,
    description VARCHAR(30) NOT NULL,
    created_at  TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE user_status
(
    id          CHAR(1) PRIMARY KEY,
    description VARCHAR(30) NOT NULL,
    created_at  TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE users
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    person_id  BIGINT    NOT NULL,
    rol_id     CHAR(1)   NOT NULL,
    status_id  CHAR(1)   NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);



ALTER TABLE users
    ADD CONSTRAINT uq_user_rol
        UNIQUE (person_id, rol_id);

ALTER TABLE users
    ADD CONSTRAINT fk_persons
        FOREIGN KEY (person_id)
            REFERENCES persons (id);

ALTER TABLE users
    ADD CONSTRAINT fk_user_status
        FOREIGN KEY (status_id)
            REFERENCES user_status (id);

ALTER TABLE users
    ADD CONSTRAINT fk_user_roles
        FOREIGN KEY (rol_id)
            REFERENCES user_roles (id);


CREATE TABLE service_types
(
    id         SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    comment    TEXT         NULL,
    created_at TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP    NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by BIGINT       NULL,
    updated_by BIGINT       NULL
);


CREATE TABLE service_status
(
    id          CHAR(1) PRIMARY KEY,
    description VARCHAR(30) NOT NULL,
    comment     TEXT        NULL,
    created_at  TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by  BIGINT      NULL,
    updated_by  BIGINT      NULL
);

CREATE TABLE service_rankings
(
    id         SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(120) NOT NULL,
    comment    TEXT         NULL,
    created_at TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP    NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by BIGINT       NULL,
    updated_by BIGINT       NULL
);

CREATE TABLE services
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    type_id    SMALLINT          NOT NULL,
    price      DECIMAL(10, 2)    NOT NULL,
    duration   SMALLINT UNSIGNED NOT NULL,
    status_id  CHAR(1)           NOT NULL,
    ranking_id SMALLINT          NOT NULL,
    created_at TIMESTAMP         NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP         NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by BIGINT            NULL,
    updated_by BIGINT            NULL
);


ALTER TABLE services
    ADD CONSTRAINT fk_service_types
        FOREIGN KEY (type_id)
            REFERENCES service_types (id);


ALTER TABLE services
    ADD CONSTRAINT fk_service_status
        FOREIGN KEY (status_id)
            REFERENCES service_status (id);

ALTER TABLE services
    ADD CONSTRAINT fk_service_rankings
        FOREIGN KEY (ranking_id)
            REFERENCES service_rankings (id);



CREATE TABLE schedules
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    uuid       BINARY(16) NOT NULL UNIQUE,
    service_id BIGINT     NOT NULL,
    start_date TIMESTAMP  NOT NULL,
    end_date   TIMESTAMP  NOT NULL,
    created_at TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP  NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by BIGINT     NULL,
    updated_by BIGINT     NULL
);

ALTER TABLE schedules
    ADD CONSTRAINT fk_services
        FOREIGN KEY (service_id)
            REFERENCES services (id);



CREATE TABLE booking_status
(
    id          SMALLINT PRIMARY KEY,
    description VARCHAR(30) NOT NULL,
    created_at  TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE bookings
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT,
    schedule_id BIGINT    NOT NULL,
    client_id   BIGINT    NOT NULL,
    status_id   SMALLINT  NOT NULL,
    start_time  TIMESTAMP NOT NULL,
    created_at  TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    created_by  BIGINT    NULL,
    updated_by  BIGINT    NULL
);


ALTER TABLE bookings
    ADD CONSTRAINT fk_schedules
        FOREIGN KEY (schedule_id)
            REFERENCES schedules (id);

ALTER TABLE bookings
    ADD CONSTRAINT fk_booking_status
        FOREIGN KEY (status_id)
            REFERENCES booking_status (id);


ALTER TABLE bookings
    ADD CONSTRAINT fk_users
        FOREIGN KEY (client_id)
            REFERENCES users (id);