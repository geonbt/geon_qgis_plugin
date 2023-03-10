/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

--2021/11/08
DELETE FROM inp_gully WHERE gully_id NOT IN (SELECT gully_id FROM gully);

ALTER TABLE inp_gully DROP CONSTRAINT IF EXISTS inp_gully_gully_id_fkey;
ALTER TABLE inp_gully ADD CONSTRAINT inp_gully_gully_id_fkey FOREIGN KEY (gully_id)
REFERENCES gully (gully_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE;
	  