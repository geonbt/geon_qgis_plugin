/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

--2022/05/24
DROP TRIGGER IF EXISTS gw_trg_mincut ON om_mincut;
CREATE TRIGGER gw_trg_mincut
  AFTER UPDATE OF work_order, mincut_class, mincut_type, received_date, expl_id, macroexpl_id, muni_id, postcode, streetaxis_id, postnumber, 
  anl_cause, anl_tstamp, anl_user, anl_descript, anl_feature_id, anl_feature_type, anl_the_geom, forecast_start, forecast_end, assigned_to, output
  ON om_mincut
  FOR EACH ROW
  EXECUTE PROCEDURE gw_trg_mincut();



