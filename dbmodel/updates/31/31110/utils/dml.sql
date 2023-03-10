/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;


--2019/03/26
UPDATE audit_cat_table SET qgis_role_id=NULL, sys_role_id='role_om' WHERE id='v_ui_anl_mincut_result_cat';

--2021/02/26 (add Undefined municipality here to add it to new schemas but not in production schmas)
INSERT INTO ext_municipality (muni_id, name) VALUES (0, 'Undefined');