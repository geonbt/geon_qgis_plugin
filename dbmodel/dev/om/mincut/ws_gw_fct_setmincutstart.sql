/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


--FUNCTION CODE: 2990

CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut_start"(p_data json) 
RETURNS pg_catalog.json AS $BODY$
DECLARE

v_version json;
v_mincut_class int2;
v_mincut_feature text;
v_mincut_id int4;
    
BEGIN

	--  set search path to local schema
    SET search_path = "SCHEMA_NAME", public;

	--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

	--  get input parameters
	v_mincut_id := (p_data ->> 'data')::json->> 'mincutId';

	--  Update values
    UPDATE om_mincut SET mincut_state=1, exec_start=now(), exec_user=current_user WHERE id=v_mincut_id;

	-- 	get mincut class and mincut feature
    SELECT mincut_class INTO v_mincut_class FROM om_mincut WHERE id=v_mincut_id;

    IF v_mincut_class=1 THEN
		v_mincut_feature = 'arc';
    ELSIF v_mincut_class=2 THEN
		v_mincut_feature = 'connec';
    ELSIF v_mincut_class=3 THEN
		v_mincut_feature = 'hydrometer';
    END IF;

	--  Return
    RETURN  SCHEMA_NAME.gw_fct_getmincut(null, null, null, v_mincut_id::integer, p_device, v_mincut_feature, 'lang');

	--  Exception handling
    EXCEPTION WHEN OTHERS THEN 
    RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "version":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

