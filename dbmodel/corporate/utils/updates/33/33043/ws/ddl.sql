/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;

-- 2020/01/08
DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem ON raster_dem;
DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem_insert ON ext_raster_dem;
DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem_delete ON ext_raster_dem;

DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem ON raster_dem_old;
DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem_insert ON ext_raster_dem_old;
DROP TRIGGER IF EXISTS gw_trg_manage_raster_dem_delete ON ext_raster_dem_old;

DROP FUNCTION IF EXISTS gw_trg_manage_raster_dem();


