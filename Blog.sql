CREATE TABLE "Usuario" (
  "id_usuario" integer PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "nombre" varchar,
  "fecha_nac" timestamp,
  "rol" integer,
  "email" varchar
);

CREATE TABLE "Posts" (
  "id_post" integer PRIMARY KEY,
  "id_autor" integer,
  "id_comentario" integer,
  "titulo" varchar,
  "texto" text,
  "estado" boolean,
  "fecha_creacion" timestamp,
  "fecha_edicion" timestamp
);

CREATE TABLE "Comentario" (
  "id_comentario" integer PRIMARY KEY,
  "id_autor" integer,
  "id_post" integer,
  "body" text,
  "fecha_creacion" timestamp
);

COMMENT ON COLUMN "Comentario"."body" IS 'Content of the post';

ALTER TABLE "Posts" ADD FOREIGN KEY ("id_autor") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Comentario" ADD FOREIGN KEY ("id_autor") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Comentario" ADD FOREIGN KEY ("id_post") REFERENCES "Posts" ("id_post");
