/* $Id: tables.sql,v 1.1 2003-05-19 20:00:13 juranj Exp $ */

CREATE TABLE description (
  id char(5),
  cctopic char(1),
  name char(50));

CREATE TABLE partners (
  region char(2),
  partner char(5),
  topic char(1),
  type char(1),
  contact char(1),
  name char(100),
  degree char(20),
  title char(100),
  org1 char(100),
  org2 char(100),
  orgurl char(200),
  address1 char(100),
  address2 char(100),
  city char(50),
  state char(3),
  zip char(15),
  phone char(50),
  fax char(50),
  cell char(50),
  email char(100));


CREATE TABLE states (
  state char(2) DEFAULT '' NOT NULL,
  name varchar(32) DEFAULT '' NOT NULL,
  type char(1),
  PRIMARY KEY (state));