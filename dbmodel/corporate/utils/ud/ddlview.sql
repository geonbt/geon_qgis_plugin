/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;

CREATE OR REPLACE VIEW ext_municipality AS SELECT * 
FROM utils.municipality;
	
CREATE OR REPLACE VIEW ext_type_street AS SELECT * 
FROM utils.type_street;

CREATE OR REPLACE VIEW ext_streetaxis as 
SELECT  
id,  
code, type, 
name, 
text, 
the_geom,
ud_expl_id as expl_id, 
muni_id   
FROM utils.streetaxis;

CREATE OR REPLACE VIEW ext_plot AS 
SELECT 
id,
plot_code, 
muni_id,
postcode,
streetaxis_id,
postnumber,
complement,
placement,
square,
observ,
text,
the_geom,
ud_expl_id AS expl_id 
FROM utils.plot;

CREATE OR REPLACE VIEW ext_address as 
SELECT 
id, 
muni_id, 
postcode, 
streetaxis_id, 
postnumber, 
plot_id, 
the_geom, 
ud_expl_id as expl_id 
FROM utils.address;

