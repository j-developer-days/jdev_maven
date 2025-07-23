--liquibase formatted sql

--changeset userName:1 runInTransaction:false runAlways:true
--comment: drop database, tablespace and role
--DROP DATABASE IF EXISTS ${db.name};
--DROP TABLESPACE IF EXISTS ${tablespace.name};
--DROP ROLE IF EXISTS ${db.username};