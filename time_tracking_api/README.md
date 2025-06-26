# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## API-Dokumentation

Die Swagger UI für die API-Dokumentation ist unter `/api-docs` verfügbar.

## Projekte-API

Folgende Endpunkte sind verfügbar:

- `GET    /projects`          – Liste aller Projekte
- `GET    /projects/{id}`     – Ein einzelnes Projekt anzeigen
- `POST   /projects`          – Ein neues Projekt anlegen (JSON-Body: `{ "name": "..." }`)
- `PUT    /projects/{id}`     – Ein bestehendes Projekt aktualisieren (JSON-Body: `{ "name": "..." }`)
- `DELETE /projects/{id}`     – Ein Projekt löschen

## Einträge-API

Folgende Endpunkte sind verfügbar:

- `GET    /entries`           – Liste aller Einträge
- `GET    /entries/{id}`      – Einen einzelnen Eintrag anzeigen
- `POST   /entries`           – Einen neuen Eintrag anlegen (JSON-Body: `{ "date": "YYYY-MM-DD", "duration": <Minuten>, "description": "...", "project_id": <Projekt-ID> }`)
- `PUT    /entries/{id}`      – Einen bestehenden Eintrag aktualisieren (JSON-Body: wie POST)
- `DELETE /entries/{id}`      – Einen Eintrag löschen
