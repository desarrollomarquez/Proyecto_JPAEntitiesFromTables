DROP TABLE IF EXISTS usuario_rol CASCADE;
DROP TABLE IF EXISTS rol CASCADE;
DROP TABLE IF EXISTS  usuario CASCADE;
DROP TABLE IF EXISTS  persona CASCADE;
DROP TABLE IF EXISTS  tipo_documento CASCADE;


/*
    *********************************** Tabla tipo_documento ***********************************
*/

CREATE TABLE tipo_documento (
  id        SERIAL,
  nombre    VARCHAR NULL,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  update_at TIMESTAMP,
  PRIMARY KEY (id)
);


/*
    *********************************** Tabla persona ***********************************
*/

CREATE TABLE persona (
  id                      serial,
  identificacion          INTEGER      NULL,
  id_tipo_documento       INTEGER      NULL,
  nombres                 VARCHAR(100) NOT NULL,
  apellidos               VARCHAR(100) NOT NULL,
  correo                  VARCHAR(100) NULL UNIQUE,
  descripcion_profesional TEXT         NULL,
  create_at               TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  update_at               TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_persona_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento (id) ON DELETE CASCADE
);

/*
    *********************************** Tabla usuario ***********************************
*/

CREATE TABLE usuario (
  id_persona INTEGER      NOT NULL,
  password   varchar(100) NOT NULL,
  password_decrip   varchar(100) NULL,
  estado     boolean DEFAULT false,
  create_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  update_at  TIMESTAMP,
  PRIMARY KEY (id_persona),
  CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona) REFERENCES persona (id) ON DELETE CASCADE
);

/*
    *********************************** Tabla rol ***********************************
*/

CREATE TABLE rol (
  id          SERIAL,
  nombre      VARCHAR(200) NOT NULL,
  estado      BOOLEAN   DEFAULT FALSE,
  descripcion TEXT         NULL,
  create_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  update_at   TIMESTAMP,
  PRIMARY KEY (id)
);


/*
    *********************************** Tabla usuario_rol ***********************************
*/

CREATE TABLE usuario_rol (
  id_usuario      INTEGER NOT NULL,
  id_rol          INTEGER NOT NULL,
  fecha_caducidad TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  create_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  update_at TIMESTAMP,
  PRIMARY KEY (id_usuario, id_rol),
  CONSTRAINT fk_user_rol_users FOREIGN KEY (id_usuario) REFERENCES usuario (id_persona) ON DELETE CASCADE ,
  CONSTRAINT fk_user_rol_rol FOREIGN KEY (id_rol) REFERENCES rol (id) ON DELETE CASCADE
);