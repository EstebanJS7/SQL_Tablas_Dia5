CREATE TABLE "Jugadores" (
  "id_jugador" integer PRIMARY KEY,
  "id_equipo" integer,
  "nombre" varchar,
  "numero" integer,
  "nacionalidad" varchar
);

CREATE TABLE "Equipos" (
  "id_equipo" integer PRIMARY KEY,
  "nombre" varchar,
  "pais" varchar
);

CREATE TABLE "Grupos" (
  "id_grupo" integer PRIMARY KEY,
  "id_equipo" integer,
  "nombre" char
);

CREATE TABLE "Fase" (
  "id_fase" integer PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "FaseEquipos" (
  "id_FE" integer PRIMARY KEY,
  "id_fase" integer,
  "id_equipo" integer
);

CREATE TABLE "Partidos" (
  "id_partido" integer PRIMARY KEY,
  "id_grupo" integer,
  "id_fase" integer,
  "equipo_a" integer,
  "equipo_b" integer,
  "fecha" timestap,
  "resultado" varchar
);

ALTER TABLE "Jugadores" ADD FOREIGN KEY ("id_equipo") REFERENCES "Equipos" ("id_equipo");

ALTER TABLE "Equipos" ADD FOREIGN KEY ("id_equipo") REFERENCES "Grupos" ("id_equipo");

ALTER TABLE "Equipos" ADD FOREIGN KEY ("id_equipo") REFERENCES "FaseEquipos" ("id_equipo");

ALTER TABLE "Fase" ADD FOREIGN KEY ("id_fase") REFERENCES "FaseEquipos" ("id_equipo");

ALTER TABLE "Partidos" ADD FOREIGN KEY ("id_grupo") REFERENCES "Grupos" ("id_equipo");

ALTER TABLE "Partidos" ADD FOREIGN KEY ("id_fase") REFERENCES "Fase" ("id_fase");

ALTER TABLE "Partidos" ADD FOREIGN KEY ("equipo_a") REFERENCES "Equipos" ("id_equipo");

ALTER TABLE "Partidos" ADD FOREIGN KEY ("equipo_b") REFERENCES "Equipos" ("id_equipo");
