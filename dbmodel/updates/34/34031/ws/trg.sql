/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


-- 2021/02/10
CREATE TRIGGER gw_trg_edit_inp_node_reservoir
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON v_edit_inp_reservoir
  FOR EACH ROW
  EXECUTE PROCEDURE gw_trg_edit_inp_node('inp_reservoir');
