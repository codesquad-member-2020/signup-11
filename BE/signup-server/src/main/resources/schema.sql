DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users
(
    seq       bigint NOT NULL AUTO_INCREMENT,
    id        varchar(25),
    password  varchar(80),
    name      varchar(10),
--     email     varchar(50),
--     birth     date,
--     phone     varchar(20),
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (seq),
    CONSTRAINT unq_user_id UNIQUE (id)
);

CREATE TABLE interests
(
    seq       bigint NOT NULL AUTO_INCREMENT,
    user_seq  bigint NOT NULL ,
    contents  varchar(100),
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (seq),
    CONSTRAINT fk_interest_to_user FOREIGN KEY (user_seq) REFERENCES users (seq) ON DELETE RESTRICT ON UPDATE  RESTRICT
);
