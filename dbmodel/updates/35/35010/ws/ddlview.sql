/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


--2021/06/28
CREATE OR REPLACE VIEW v_edit_inp_rules AS 
SELECT DISTINCT rules.id,
rules.sector_id,
rules.text,
rules.active
FROM selector_sector,
inp_rules rules
WHERE rules.sector_id = selector_sector.sector_id AND selector_sector.cur_user = "current_user"()::text;

CREATE OR REPLACE VIEW v_edit_inp_pattern AS 
 SELECT DISTINCT  
 p.pattern_id,
 observ,
 tscode,
 tsparameters::text as tsparameters,
 p.sector_id
  FROM selector_sector,
   inp_pattern p
  WHERE (p.sector_id = selector_sector.sector_id AND selector_sector.cur_user = "current_user"()::text) OR p.sector_id IS NULL  ORDER BY pattern_id;

CREATE OR REPLACE VIEW v_edit_inp_pattern_value AS 
  SELECT DISTINCT 
  id, 
  p.pattern_id,
  observ,
  tscode,
  tsparameters::text as tsparameters,
  p.sector_id,
  factor_1,
  factor_2,
  factor_3,
  factor_4,
  factor_5,
  factor_6,
  factor_7,
  factor_8,
  factor_9,
  factor_10,
  factor_11,
  factor_12,
  factor_13,
  factor_14,
  factor_15,
  factor_16,
  factor_17,
  factor_18 
   FROM selector_sector,
    inp_pattern p
    JOIN inp_pattern_value USING (pattern_id)
   WHERE (p.sector_id = selector_sector.sector_id AND selector_sector.cur_user = "current_user"()::text) OR p.sector_id IS NULL ORDER BY id;
   
   
CREATE OR REPLACE VIEW v_rtc_hydrometer AS 
 SELECT ext_rtc_hydrometer.id::text AS hydrometer_id,
    ext_rtc_hydrometer.code AS hydrometer_customer_code,
        CASE
            WHEN connec.connec_id IS NULL THEN 'XXXX'::character varying
            ELSE connec.connec_id
        END AS connec_id,
        CASE
            WHEN ext_rtc_hydrometer.connec_id::text IS NULL THEN 'XXXX'::text
            ELSE ext_rtc_hydrometer.connec_id::text
        END AS connec_customer_code,
    ext_rtc_hydrometer_state.name AS state,
    ext_municipality.name AS muni_name,
    connec.expl_id,
    exploitation.name AS expl_name,
    ext_rtc_hydrometer.plot_code,
    ext_rtc_hydrometer.priority_id,
    ext_rtc_hydrometer.catalog_id,
    ext_rtc_hydrometer.category_id,
    ext_rtc_hydrometer.hydro_number,
    ext_rtc_hydrometer.hydro_man_date,
    ext_rtc_hydrometer.crm_number,
    ext_rtc_hydrometer.customer_name,
    ext_rtc_hydrometer.address1,
    ext_rtc_hydrometer.address2,
    ext_rtc_hydrometer.address3,
    ext_rtc_hydrometer.address2_1,
    ext_rtc_hydrometer.address2_2,
    ext_rtc_hydrometer.address2_3,
    ext_rtc_hydrometer.m3_volume,
    ext_rtc_hydrometer.start_date,
    ext_rtc_hydrometer.end_date,
    ext_rtc_hydrometer.update_date,
        CASE
            WHEN (( SELECT config_param_system.value
               FROM config_param_system
              WHERE config_param_system.parameter::text = 'edit_hydro_link_absolute_path'::text)) IS NULL THEN rtc_hydrometer.link
            ELSE concat(( SELECT config_param_system.value
               FROM config_param_system
              WHERE config_param_system.parameter::text = 'edit_hydro_link_absolute_path'::text), rtc_hydrometer.link)
        END AS hydrometer_link,
    is_operative,
    shutdown_date
   FROM selector_hydrometer,
    selector_expl,
    rtc_hydrometer
     LEFT JOIN ext_rtc_hydrometer ON ext_rtc_hydrometer.id::text = rtc_hydrometer.hydrometer_id::text
     JOIN ext_rtc_hydrometer_state ON ext_rtc_hydrometer_state.id = ext_rtc_hydrometer.state_id
     JOIN connec ON connec.customer_code::text = ext_rtc_hydrometer.connec_id::text
     LEFT JOIN ext_municipality ON ext_municipality.muni_id = connec.muni_id
     LEFT JOIN exploitation ON exploitation.expl_id = connec.expl_id
  WHERE selector_hydrometer.state_id = ext_rtc_hydrometer.state_id AND selector_hydrometer.cur_user = "current_user"()::text AND selector_expl.expl_id = connec.expl_id AND selector_expl.cur_user = "current_user"()::text;


CREATE OR REPLACE VIEW vu_node AS 
 SELECT node.node_id,
    node.code,
    node.elevation,
    node.depth,
    cat_node.nodetype_id AS node_type,
    cat_feature.system_id AS sys_type,
    node.nodecat_id,
    cat_node.matcat_id AS cat_matcat_id,
    cat_node.pnom AS cat_pnom,
    cat_node.dnom AS cat_dnom,
    node.epa_type,
    node.expl_id,
    exploitation.macroexpl_id,
    node.sector_id,
    sector.name AS sector_name,
    sector.macrosector_id,
    node.arc_id,
    node.parent_id,
    node.state,
    node.state_type,
    node.annotation,
    node.observ,
    node.comment,
    node.minsector_id,
    node.dma_id,
    dma.name AS dma_name,
    dma.macrodma_id,
    node.presszone_id,
    presszone.name AS presszone_name,
    node.staticpressure,
    node.dqa_id,
    dqa.name AS dqa_name,
    dqa.macrodqa_id,
    node.soilcat_id,
    node.function_type,
    node.category_type,
    node.fluid_type,
    node.location_type,
    node.workcat_id,
    node.workcat_id_end,
    node.builtdate,
    node.enddate,
    node.buildercat_id,
    node.ownercat_id,
    node.muni_id,
    node.postcode,
    node.district_id,
    a.name AS streetname,
    node.postnumber,
    node.postcomplement,
    b.name AS streetname2,
    node.postnumber2,
    node.postcomplement2,
    node.descript,
    cat_node.svg,
    node.rotation,
    concat(cat_feature.link_path, node.link) AS link,
    node.verified,
    node.undelete,
    cat_node.label,
    node.label_x,
    node.label_y,
    node.label_rotation,
    node.publish,
    node.inventory,
    node.hemisphere,
    node.num_value,
    cat_node.nodetype_id,
    date_trunc('second'::text, node.tstamp) AS tstamp,
    node.insert_user,
    date_trunc('second'::text, node.lastupdate) AS lastupdate,
    node.lastupdate_user,
    node.the_geom,
    node.adate,
    node.adescript,
    node.accessibility,
    dma.stylesheet ->> 'featureColor'::text AS dma_style,
    presszone.stylesheet ->> 'featureColor'::text AS presszone_style,
    node.workcat_id_plan,
    node.asset_id
   FROM node
     LEFT JOIN cat_node ON cat_node.id::text = node.nodecat_id::text
     JOIN cat_feature ON cat_feature.id::text = cat_node.nodetype_id::text
     LEFT JOIN dma ON node.dma_id = dma.dma_id
     LEFT JOIN sector ON node.sector_id = sector.sector_id
     LEFT JOIN exploitation ON node.expl_id = exploitation.expl_id
     LEFT JOIN dqa ON node.dqa_id = dqa.dqa_id
     LEFT JOIN presszone ON presszone.presszone_id::text = node.presszone_id::text
     LEFT JOIN ext_streetaxis a ON a.id::text = node.streetaxis_id::text
     LEFT JOIN ext_streetaxis b ON b.id::text = node.streetaxis2_id::text;


CREATE OR REPLACE VIEW v_node AS 
 SELECT vu_node.node_id,
    vu_node.code,
    vu_node.elevation,
    vu_node.depth,
    vu_node.node_type,
    vu_node.sys_type,
    vu_node.nodecat_id,
    vu_node.cat_matcat_id,
    vu_node.cat_pnom,
    vu_node.cat_dnom,
    vu_node.epa_type,
    vu_node.expl_id,
    vu_node.macroexpl_id,
    vu_node.sector_id,
    vu_node.sector_name,
    vu_node.macrosector_id,
    vu_node.arc_id,
    vu_node.parent_id,
    vu_node.state,
    vu_node.state_type,
    vu_node.annotation,
    vu_node.observ,
    vu_node.comment,
    vu_node.minsector_id,
    vu_node.dma_id,
    vu_node.dma_name,
    vu_node.macrodma_id,
    vu_node.presszone_id,
    vu_node.presszone_name,
    vu_node.staticpressure,
    vu_node.dqa_id,
    vu_node.dqa_name,
    vu_node.macrodqa_id,
    vu_node.soilcat_id,
    vu_node.function_type,
    vu_node.category_type,
    vu_node.fluid_type,
    vu_node.location_type,
    vu_node.workcat_id,
    vu_node.workcat_id_end,
    vu_node.builtdate,
    vu_node.enddate,
    vu_node.buildercat_id,
    vu_node.ownercat_id,
    vu_node.muni_id,
    vu_node.postcode,
    vu_node.district_id,
    vu_node.streetname,
    vu_node.postnumber,
    vu_node.postcomplement,
    vu_node.streetname2,
    vu_node.postnumber2,
    vu_node.postcomplement2,
    vu_node.descript,
    vu_node.svg,
    vu_node.rotation,
    vu_node.link,
    vu_node.verified,
    vu_node.undelete,
    vu_node.label,
    vu_node.label_x,
    vu_node.label_y,
    vu_node.label_rotation,
    vu_node.publish,
    vu_node.inventory,
    vu_node.hemisphere,
    vu_node.num_value,
    vu_node.nodetype_id,
    vu_node.tstamp,
    vu_node.insert_user,
    vu_node.lastupdate,
    vu_node.lastupdate_user,
    vu_node.the_geom,
    vu_node.adate,
    vu_node.adescript,
    vu_node.accessibility,
    vu_node.dma_style,
    vu_node.presszone_style,
    vu_node.workcat_id_plan,
    vu_node.asset_id
   FROM vu_node
     JOIN v_state_node USING (node_id);


CREATE OR REPLACE VIEW ve_node AS 
 SELECT v_node.node_id,
    v_node.code,
    v_node.elevation,
    v_node.depth,
    v_node.node_type,
    v_node.sys_type,
    v_node.nodecat_id,
    v_node.cat_matcat_id,
    v_node.cat_pnom,
    v_node.cat_dnom,
    v_node.epa_type,
    v_node.expl_id,
    v_node.macroexpl_id,
    v_node.sector_id,
    v_node.sector_name,
    v_node.macrosector_id,
    v_node.arc_id,
    v_node.parent_id,
    v_node.state,
    v_node.state_type,
    v_node.annotation,
    v_node.observ,
    v_node.comment,
    v_node.minsector_id,
    v_node.dma_id,
    v_node.dma_name,
    v_node.macrodma_id,
    v_node.presszone_id,
    v_node.presszone_name,
    v_node.staticpressure,
    v_node.dqa_id,
    v_node.dqa_name,
    v_node.macrodqa_id,
    v_node.soilcat_id,
    v_node.function_type,
    v_node.category_type,
    v_node.fluid_type,
    v_node.location_type,
    v_node.workcat_id,
    v_node.workcat_id_end,
    v_node.builtdate,
    v_node.enddate,
    v_node.buildercat_id,
    v_node.ownercat_id,
    v_node.muni_id,
    v_node.postcode,
    v_node.district_id,
    v_node.streetname,
    v_node.postnumber,
    v_node.postcomplement,
    v_node.streetname2,
    v_node.postnumber2,
    v_node.postcomplement2,
    v_node.descript,
    v_node.svg,
    v_node.rotation,
    v_node.link,
    v_node.verified,
    v_node.undelete,
    v_node.label,
    v_node.label_x,
    v_node.label_y,
    v_node.label_rotation,
    v_node.publish,
    v_node.inventory,
    v_node.hemisphere,
    v_node.num_value,
    v_node.nodetype_id,
    v_node.tstamp,
    v_node.insert_user,
    v_node.lastupdate,
    v_node.lastupdate_user,
    v_node.the_geom,
    v_node.adate,
    v_node.adescript,
    v_node.accessibility,
    v_node.dma_style,
    v_node.presszone_style,
    v_node.workcat_id_plan,
    v_node.asset_id
   FROM v_node;


CREATE OR REPLACE VIEW v_edit_node AS 
 SELECT v_node.node_id,
    v_node.code,
    v_node.elevation,
    v_node.depth,
    v_node.node_type,
    v_node.sys_type,
    v_node.nodecat_id,
    v_node.cat_matcat_id,
    v_node.cat_pnom,
    v_node.cat_dnom,
    v_node.epa_type,
    v_node.expl_id,
    v_node.macroexpl_id,
    v_node.sector_id,
    v_node.sector_name,
    v_node.macrosector_id,
    v_node.arc_id,
    v_node.parent_id,
    v_node.state,
    v_node.state_type,
    v_node.annotation,
    v_node.observ,
    v_node.comment,
    v_node.minsector_id,
    v_node.dma_id,
    v_node.dma_name,
    v_node.macrodma_id,
    v_node.presszone_id,
    v_node.presszone_name,
    v_node.staticpressure,
    v_node.dqa_id,
    v_node.dqa_name,
    v_node.macrodqa_id,
    v_node.soilcat_id,
    v_node.function_type,
    v_node.category_type,
    v_node.fluid_type,
    v_node.location_type,
    v_node.workcat_id,
    v_node.workcat_id_end,
    v_node.builtdate,
    v_node.enddate,
    v_node.buildercat_id,
    v_node.ownercat_id,
    v_node.muni_id,
    v_node.postcode,
    v_node.district_id,
    v_node.streetname,
    v_node.postnumber,
    v_node.postcomplement,
    v_node.streetname2,
    v_node.postnumber2,
    v_node.postcomplement2,
    v_node.descript,
    v_node.svg,
    v_node.rotation,
    v_node.link,
    v_node.verified,
    v_node.undelete,
    v_node.label,
    v_node.label_x,
    v_node.label_y,
    v_node.label_rotation,
    v_node.publish,
    v_node.inventory,
    v_node.hemisphere,
    v_node.num_value,
    v_node.nodetype_id,
    v_node.tstamp,
    v_node.insert_user,
    v_node.lastupdate,
    v_node.lastupdate_user,
    v_node.the_geom,
    v_node.adate,
    v_node.adescript,
    v_node.accessibility,
    v_node.dma_style,
    v_node.presszone_style,
    man_valve.closed AS closed_valve,
    man_valve.broken AS broken_valve,
    v_node.workcat_id_plan,
    v_node.asset_id
   FROM v_node
     LEFT JOIN man_valve USING (node_id);

CREATE OR REPLACE VIEW vu_arc AS 
 WITH query_node AS (
         SELECT node.node_id,
            node.elevation,
            node.depth,
            cat_node.nodetype_id,
            node.staticpressure
           FROM node
             JOIN cat_node ON node.nodecat_id::text = cat_node.id::text
        )
 SELECT arc.arc_id,
    arc.code,
    arc.node_1,
    arc.node_2,
    a.elevation AS elevation1,
    a.depth AS depth1,
    b.elevation AS elevation2,
    b.depth AS depth2,
    arc.arccat_id,
    cat_arc.arctype_id AS arc_type,
    cat_feature.system_id AS sys_type,
    cat_arc.matcat_id AS cat_matcat_id,
    cat_arc.pnom AS cat_pnom,
    cat_arc.dnom AS cat_dnom,
    arc.epa_type,
    arc.expl_id,
    exploitation.macroexpl_id,
    arc.sector_id,
    sector.name AS sector_name,
    sector.macrosector_id,
    arc.state,
    arc.state_type,
    arc.annotation,
    arc.observ,
    arc.comment,
    st_length2d(arc.the_geom)::numeric(12,2) AS gis_length,
    arc.custom_length,
    arc.minsector_id,
    arc.dma_id,
    dma.name AS dma_name,
    dma.macrodma_id,
    arc.presszone_id,
    presszone.name AS presszone_name,
    arc.dqa_id,
    dqa.name AS dqa_name,
    dqa.macrodqa_id,
    arc.soilcat_id,
    arc.function_type,
    arc.category_type,
    arc.fluid_type,
    arc.location_type,
    arc.workcat_id,
    arc.workcat_id_end,
    arc.buildercat_id,
    arc.builtdate,
    arc.enddate,
    arc.ownercat_id,
    arc.muni_id,
    arc.postcode,
    arc.district_id,
    c.name AS streetname,
    arc.postnumber,
    arc.postcomplement,
    d.name AS streetname2,
    arc.postnumber2,
    arc.postcomplement2,
    arc.descript,
    concat(cat_feature.link_path, arc.link) AS link,
    arc.verified,
    arc.undelete,
    cat_arc.label,
    arc.label_x,
    arc.label_y,
    arc.label_rotation,
    arc.publish,
    arc.inventory,
    arc.num_value,
    cat_arc.arctype_id AS cat_arctype_id,
    a.nodetype_id AS nodetype_1,
    a.staticpressure AS staticpress1,
    b.nodetype_id AS nodetype_2,
    b.staticpressure AS staticpress2,
    date_trunc('second'::text, arc.tstamp) AS tstamp,
    arc.insert_user,
    date_trunc('second'::text, arc.lastupdate) AS lastupdate,
    arc.lastupdate_user,
    arc.the_geom,
    arc.depth,
    arc.adate,
    arc.adescript,
    dma.stylesheet ->> 'featureColor'::text AS dma_style,
    presszone.stylesheet ->> 'featureColor'::text AS presszone_style,
    arc.workcat_id_plan,
    arc.asset_id
   FROM arc
     LEFT JOIN sector ON arc.sector_id = sector.sector_id
     LEFT JOIN exploitation ON arc.expl_id = exploitation.expl_id
     LEFT JOIN cat_arc ON arc.arccat_id::text = cat_arc.id::text
     JOIN cat_feature ON cat_feature.id::text = cat_arc.arctype_id::text
     LEFT JOIN dma ON arc.dma_id = dma.dma_id
     LEFT JOIN query_node a ON a.node_id::text = arc.node_1::text
     LEFT JOIN query_node b ON b.node_id::text = arc.node_2::text
     LEFT JOIN dqa ON arc.dqa_id = dqa.dqa_id
     LEFT JOIN presszone ON presszone.presszone_id::text = arc.presszone_id::text
     LEFT JOIN ext_streetaxis c ON c.id::text = arc.streetaxis_id::text
     LEFT JOIN ext_streetaxis d ON d.id::text = arc.streetaxis2_id::text;


CREATE OR REPLACE VIEW v_arc AS 
 SELECT vu_arc.arc_id,
    vu_arc.code,
    vu_arc.node_1,
    vu_arc.node_2,
    vu_arc.elevation1,
    vu_arc.depth1,
    vu_arc.elevation2,
    vu_arc.depth2,
    vu_arc.arccat_id,
    vu_arc.arc_type,
    vu_arc.sys_type,
    vu_arc.cat_matcat_id,
    vu_arc.cat_pnom,
    vu_arc.cat_dnom,
    vu_arc.epa_type,
    vu_arc.expl_id,
    vu_arc.macroexpl_id,
    vu_arc.sector_id,
    vu_arc.sector_name,
    vu_arc.macrosector_id,
    vu_arc.state,
    vu_arc.state_type,
    vu_arc.annotation,
    vu_arc.observ,
    vu_arc.comment,
    vu_arc.gis_length,
    vu_arc.custom_length,
    vu_arc.minsector_id,
    vu_arc.dma_id,
    vu_arc.dma_name,
    vu_arc.macrodma_id,
    vu_arc.presszone_id,
    vu_arc.presszone_name,
    vu_arc.dqa_id,
    vu_arc.dqa_name,
    vu_arc.macrodqa_id,
    vu_arc.soilcat_id,
    vu_arc.function_type,
    vu_arc.category_type,
    vu_arc.fluid_type,
    vu_arc.location_type,
    vu_arc.workcat_id,
    vu_arc.workcat_id_end,
    vu_arc.buildercat_id,
    vu_arc.builtdate,
    vu_arc.enddate,
    vu_arc.ownercat_id,
    vu_arc.muni_id,
    vu_arc.postcode,
    vu_arc.district_id,
    vu_arc.streetname,
    vu_arc.postnumber,
    vu_arc.postcomplement,
    vu_arc.streetname2,
    vu_arc.postnumber2,
    vu_arc.postcomplement2,
    vu_arc.descript,
    vu_arc.link,
    vu_arc.verified,
    vu_arc.undelete,
    vu_arc.label,
    vu_arc.label_x,
    vu_arc.label_y,
    vu_arc.label_rotation,
    vu_arc.publish,
    vu_arc.inventory,
    vu_arc.num_value,
    vu_arc.cat_arctype_id,
    vu_arc.nodetype_1,
    vu_arc.staticpress1,
    vu_arc.nodetype_2,
    vu_arc.staticpress2,
    vu_arc.tstamp,
    vu_arc.insert_user,
    vu_arc.lastupdate,
    vu_arc.lastupdate_user,
    vu_arc.the_geom,
    vu_arc.depth,
    vu_arc.adate,
    vu_arc.adescript,
    vu_arc.dma_style,
    vu_arc.presszone_style,
    vu_arc.workcat_id_plan,
    vu_arc.asset_id
   FROM vu_arc
     JOIN v_state_arc USING (arc_id);


CREATE OR REPLACE VIEW ve_arc AS 
 SELECT v_arc.arc_id,
    v_arc.code,
    v_arc.node_1,
    v_arc.node_2,
    v_arc.elevation1,
    v_arc.depth1,
    v_arc.elevation2,
    v_arc.depth2,
    v_arc.arccat_id,
    v_arc.arc_type,
    v_arc.sys_type,
    v_arc.cat_matcat_id,
    v_arc.cat_pnom,
    v_arc.cat_dnom,
    v_arc.epa_type,
    v_arc.expl_id,
    v_arc.macroexpl_id,
    v_arc.sector_id,
    v_arc.sector_name,
    v_arc.macrosector_id,
    v_arc.state,
    v_arc.state_type,
    v_arc.annotation,
    v_arc.observ,
    v_arc.comment,
    v_arc.gis_length,
    v_arc.custom_length,
    v_arc.minsector_id,
    v_arc.dma_id,
    v_arc.dma_name,
    v_arc.macrodma_id,
    v_arc.presszone_id,
    v_arc.presszone_name,
    v_arc.dqa_id,
    v_arc.dqa_name,
    v_arc.macrodqa_id,
    v_arc.soilcat_id,
    v_arc.function_type,
    v_arc.category_type,
    v_arc.fluid_type,
    v_arc.location_type,
    v_arc.workcat_id,
    v_arc.workcat_id_end,
    v_arc.buildercat_id,
    v_arc.builtdate,
    v_arc.enddate,
    v_arc.ownercat_id,
    v_arc.muni_id,
    v_arc.postcode,
    v_arc.district_id,
    v_arc.streetname,
    v_arc.postnumber,
    v_arc.postcomplement,
    v_arc.streetname2,
    v_arc.postnumber2,
    v_arc.postcomplement2,
    v_arc.descript,
    v_arc.link,
    v_arc.verified,
    v_arc.undelete,
    v_arc.label,
    v_arc.label_x,
    v_arc.label_y,
    v_arc.label_rotation,
    v_arc.publish,
    v_arc.inventory,
    v_arc.num_value,
    v_arc.cat_arctype_id,
    v_arc.nodetype_1,
    v_arc.staticpress1,
    v_arc.nodetype_2,
    v_arc.staticpress2,
    v_arc.tstamp,
    v_arc.insert_user,
    v_arc.lastupdate,
    v_arc.lastupdate_user,
    v_arc.the_geom,
    v_arc.depth,
    v_arc.adate,
    v_arc.adescript,
    v_arc.dma_style,
    v_arc.presszone_style,
    v_arc.workcat_id_plan,
    v_arc.asset_id
   FROM v_arc;


CREATE OR REPLACE VIEW v_edit_arc AS 
 SELECT v_arc.arc_id,
    v_arc.code,
    v_arc.node_1,
    v_arc.node_2,
    v_arc.elevation1,
    v_arc.depth1,
    v_arc.elevation2,
    v_arc.depth2,
    v_arc.arccat_id,
    v_arc.arc_type,
    v_arc.sys_type,
    v_arc.cat_matcat_id,
    v_arc.cat_pnom,
    v_arc.cat_dnom,
    v_arc.epa_type,
    v_arc.expl_id,
    v_arc.macroexpl_id,
    v_arc.sector_id,
    v_arc.sector_name,
    v_arc.macrosector_id,
    v_arc.state,
    v_arc.state_type,
    v_arc.annotation,
    v_arc.observ,
    v_arc.comment,
    v_arc.gis_length,
    v_arc.custom_length,
    v_arc.minsector_id,
    v_arc.dma_id,
    v_arc.dma_name,
    v_arc.macrodma_id,
    v_arc.presszone_id,
    v_arc.presszone_name,
    v_arc.dqa_id,
    v_arc.dqa_name,
    v_arc.macrodqa_id,
    v_arc.soilcat_id,
    v_arc.function_type,
    v_arc.category_type,
    v_arc.fluid_type,
    v_arc.location_type,
    v_arc.workcat_id,
    v_arc.workcat_id_end,
    v_arc.buildercat_id,
    v_arc.builtdate,
    v_arc.enddate,
    v_arc.ownercat_id,
    v_arc.muni_id,
    v_arc.postcode,
    v_arc.district_id,
    v_arc.streetname,
    v_arc.postnumber,
    v_arc.postcomplement,
    v_arc.streetname2,
    v_arc.postnumber2,
    v_arc.postcomplement2,
    v_arc.descript,
    v_arc.link,
    v_arc.verified,
    v_arc.undelete,
    v_arc.label,
    v_arc.label_x,
    v_arc.label_y,
    v_arc.label_rotation,
    v_arc.publish,
    v_arc.inventory,
    v_arc.num_value,
    v_arc.cat_arctype_id,
    v_arc.nodetype_1,
    v_arc.staticpress1,
    v_arc.nodetype_2,
    v_arc.staticpress2,
    v_arc.tstamp,
    v_arc.insert_user,
    v_arc.lastupdate,
    v_arc.lastupdate_user,
    v_arc.the_geom,
    v_arc.depth,
    v_arc.adate,
    v_arc.adescript,
    v_arc.dma_style,
    v_arc.presszone_style,
    v_arc.workcat_id_plan,
    v_arc.asset_id
   FROM v_arc;


CREATE OR REPLACE VIEW vu_connec AS 
 SELECT connec.connec_id,
    connec.code,
    connec.elevation,
    connec.depth,
    cat_connec.connectype_id AS connec_type,
    cat_feature.system_id AS sys_type,
    connec.connecat_id,
    connec.expl_id,
    exploitation.macroexpl_id,
    connec.sector_id,
    sector.name AS sector_name,
    sector.macrosector_id,
    connec.customer_code,
    cat_connec.matcat_id AS cat_matcat_id,
    cat_connec.pnom AS cat_pnom,
    cat_connec.dnom AS cat_dnom,
    connec.connec_length,
    connec.state,
    connec.state_type,
    a.n_hydrometer,
    connec.arc_id,
    connec.annotation,
    connec.observ,
    connec.comment,
    connec.minsector_id,
    connec.dma_id,
    dma.name AS dma_name,
    dma.macrodma_id,
    connec.presszone_id,
    presszone.name AS presszone_name,
    connec.staticpressure,
    connec.dqa_id,
    dqa.name AS dqa_name,
    dqa.macrodqa_id,
    connec.soilcat_id,
    connec.function_type,
    connec.category_type,
    connec.fluid_type,
    connec.location_type,
    connec.workcat_id,
    connec.workcat_id_end,
    connec.buildercat_id,
    connec.builtdate,
    connec.enddate,
    connec.ownercat_id,
    connec.muni_id,
    connec.postcode,
    connec.district_id,
    c.name AS streetname,
    connec.postnumber,
    connec.postcomplement,
    b.name AS streetname2,
    connec.postnumber2,
    connec.postcomplement2,
    connec.descript,
    cat_connec.svg,
    connec.rotation,
    concat(cat_feature.link_path, connec.link) AS link,
    connec.verified,
    connec.undelete,
    cat_connec.label,
    connec.label_x,
    connec.label_y,
    connec.label_rotation,
    connec.publish,
    connec.inventory,
    connec.num_value,
    cat_connec.connectype_id,
    connec.pjoint_id,
    connec.pjoint_type,
    date_trunc('second'::text, connec.tstamp) AS tstamp,
    connec.insert_user,
    date_trunc('second'::text, connec.lastupdate) AS lastupdate,
    connec.lastupdate_user,
    connec.the_geom,
    connec.adate,
    connec.adescript,
    connec.accessibility,
    dma.stylesheet ->> 'featureColor'::text AS dma_style,
    presszone.stylesheet ->> 'featureColor'::text AS presszone_style,
    connec.workcat_id_plan,
    connec.asset_id
   FROM connec
     LEFT JOIN ( SELECT connec_1.connec_id,
            count(ext_rtc_hydrometer.id)::integer AS n_hydrometer
           FROM selector_hydrometer,
            ext_rtc_hydrometer
             JOIN connec connec_1 ON ext_rtc_hydrometer.connec_id::text = connec_1.customer_code::text
          WHERE selector_hydrometer.state_id = ext_rtc_hydrometer.state_id AND selector_hydrometer.cur_user = "current_user"()::text
          GROUP BY connec_1.connec_id) a USING (connec_id)
     JOIN cat_connec ON connec.connecat_id::text = cat_connec.id::text
     JOIN cat_feature ON cat_feature.id::text = cat_connec.connectype_id::text
     LEFT JOIN dma ON connec.dma_id = dma.dma_id
     LEFT JOIN sector ON connec.sector_id = sector.sector_id
     LEFT JOIN exploitation ON connec.expl_id = exploitation.expl_id
     LEFT JOIN dqa ON connec.dqa_id = dqa.dqa_id
     LEFT JOIN presszone ON presszone.presszone_id::text = connec.presszone_id::text
     LEFT JOIN ext_streetaxis c ON c.id::text = connec.streetaxis_id::text
     LEFT JOIN ext_streetaxis b ON b.id::text = connec.streetaxis2_id::text;


CREATE OR REPLACE VIEW v_connec AS 
 SELECT vu_connec.connec_id,
    vu_connec.code,
    vu_connec.elevation,
    vu_connec.depth,
    vu_connec.connec_type,
    vu_connec.sys_type,
    vu_connec.connecat_id,
    vu_connec.expl_id,
    vu_connec.macroexpl_id,
    vu_connec.sector_id,
    vu_connec.sector_name,
    vu_connec.macrosector_id,
    vu_connec.customer_code,
    vu_connec.cat_matcat_id,
    vu_connec.cat_pnom,
    vu_connec.cat_dnom,
    vu_connec.connec_length,
    vu_connec.state,
    vu_connec.state_type,
    vu_connec.n_hydrometer,
    v_state_connec.arc_id,
    vu_connec.annotation,
    vu_connec.observ,
    vu_connec.comment,
    vu_connec.minsector_id,
    vu_connec.dma_id,
    vu_connec.dma_name,
    vu_connec.macrodma_id,
    vu_connec.presszone_id,
    vu_connec.presszone_name,
    vu_connec.staticpressure,
    vu_connec.dqa_id,
    vu_connec.dqa_name,
    vu_connec.macrodqa_id,
    vu_connec.soilcat_id,
    vu_connec.function_type,
    vu_connec.category_type,
    vu_connec.fluid_type,
    vu_connec.location_type,
    vu_connec.workcat_id,
    vu_connec.workcat_id_end,
    vu_connec.buildercat_id,
    vu_connec.builtdate,
    vu_connec.enddate,
    vu_connec.ownercat_id,
    vu_connec.muni_id,
    vu_connec.postcode,
    vu_connec.district_id,
    vu_connec.streetname,
    vu_connec.postnumber,
    vu_connec.postcomplement,
    vu_connec.streetname2,
    vu_connec.postnumber2,
    vu_connec.postcomplement2,
    vu_connec.descript,
    vu_connec.svg,
    vu_connec.rotation,
    vu_connec.link,
    vu_connec.verified,
    vu_connec.undelete,
    vu_connec.label,
    vu_connec.label_x,
    vu_connec.label_y,
    vu_connec.label_rotation,
    vu_connec.publish,
    vu_connec.inventory,
    vu_connec.num_value,
    vu_connec.connectype_id,
    vu_connec.pjoint_id,
    vu_connec.pjoint_type,
    vu_connec.tstamp,
    vu_connec.insert_user,
    vu_connec.lastupdate,
    vu_connec.lastupdate_user,
    vu_connec.the_geom,
    vu_connec.adate,
    vu_connec.adescript,
    vu_connec.accessibility,
    vu_connec.workcat_id_plan,
    vu_connec.asset_id
   FROM vu_connec
     JOIN v_state_connec USING (connec_id);


CREATE OR REPLACE VIEW ve_connec AS 
 SELECT v_connec.connec_id,
    v_connec.code,
    v_connec.elevation,
    v_connec.depth,
    v_connec.connec_type,
    v_connec.sys_type,
    v_connec.connecat_id,
    v_connec.expl_id,
    v_connec.macroexpl_id,
    v_connec.sector_id,
    v_connec.sector_name,
    v_connec.macrosector_id,
    v_connec.customer_code,
    v_connec.cat_matcat_id,
    v_connec.cat_pnom,
    v_connec.cat_dnom,
    v_connec.connec_length,
    v_connec.state,
    v_connec.state_type,
    v_connec.n_hydrometer,
    v_connec.arc_id,
    v_connec.annotation,
    v_connec.observ,
    v_connec.comment,
    v_connec.minsector_id,
    v_connec.dma_id,
    v_connec.dma_name,
    v_connec.macrodma_id,
    v_connec.presszone_id,
    v_connec.presszone_name,
    v_connec.staticpressure,
    v_connec.dqa_id,
    v_connec.dqa_name,
    v_connec.macrodqa_id,
    v_connec.soilcat_id,
    v_connec.function_type,
    v_connec.category_type,
    v_connec.fluid_type,
    v_connec.location_type,
    v_connec.workcat_id,
    v_connec.workcat_id_end,
    v_connec.buildercat_id,
    v_connec.builtdate,
    v_connec.enddate,
    v_connec.ownercat_id,
    v_connec.muni_id,
    v_connec.postcode,
    v_connec.district_id,
    v_connec.streetname,
    v_connec.postnumber,
    v_connec.postcomplement,
    v_connec.streetname2,
    v_connec.postnumber2,
    v_connec.postcomplement2,
    v_connec.descript,
    v_connec.svg,
    v_connec.rotation,
    v_connec.link,
    v_connec.verified,
    v_connec.undelete,
    v_connec.label,
    v_connec.label_x,
    v_connec.label_y,
    v_connec.label_rotation,
    v_connec.publish,
    v_connec.inventory,
    v_connec.num_value,
    v_connec.connectype_id,
    v_connec.pjoint_id,
    v_connec.pjoint_type,
    v_connec.tstamp,
    v_connec.insert_user,
    v_connec.lastupdate,
    v_connec.lastupdate_user,
    v_connec.the_geom,
    v_connec.adate,
    v_connec.adescript,
    v_connec.accessibility,
    v_connec.workcat_id_plan,
    v_connec.asset_id
   FROM v_connec;


CREATE OR REPLACE VIEW v_edit_connec AS 
 SELECT v_connec.connec_id,
    v_connec.code,
    v_connec.elevation,
    v_connec.depth,
    v_connec.connec_type,
    v_connec.sys_type,
    v_connec.connecat_id,
    v_connec.expl_id,
    v_connec.macroexpl_id,
    v_connec.sector_id,
    v_connec.sector_name,
    v_connec.macrosector_id,
    v_connec.customer_code,
    v_connec.cat_matcat_id,
    v_connec.cat_pnom,
    v_connec.cat_dnom,
    v_connec.connec_length,
    v_connec.state,
    v_connec.state_type,
    v_connec.n_hydrometer,
    v_connec.arc_id,
    v_connec.annotation,
    v_connec.observ,
    v_connec.comment,
    v_connec.minsector_id,
    v_connec.dma_id,
    v_connec.dma_name,
    v_connec.macrodma_id,
    v_connec.presszone_id,
    v_connec.presszone_name,
    v_connec.staticpressure,
    v_connec.dqa_id,
    v_connec.dqa_name,
    v_connec.macrodqa_id,
    v_connec.soilcat_id,
    v_connec.function_type,
    v_connec.category_type,
    v_connec.fluid_type,
    v_connec.location_type,
    v_connec.workcat_id,
    v_connec.workcat_id_end,
    v_connec.buildercat_id,
    v_connec.builtdate,
    v_connec.enddate,
    v_connec.ownercat_id,
    v_connec.muni_id,
    v_connec.postcode,
    v_connec.district_id,
    v_connec.streetname,
    v_connec.postnumber,
    v_connec.postcomplement,
    v_connec.streetname2,
    v_connec.postnumber2,
    v_connec.postcomplement2,
    v_connec.descript,
    v_connec.svg,
    v_connec.rotation,
    v_connec.link,
    v_connec.verified,
    v_connec.undelete,
    v_connec.label,
    v_connec.label_x,
    v_connec.label_y,
    v_connec.label_rotation,
    v_connec.publish,
    v_connec.inventory,
    v_connec.num_value,
    v_connec.connectype_id,
    v_connec.pjoint_id,
    v_connec.pjoint_type,
    v_connec.tstamp,
    v_connec.insert_user,
    v_connec.lastupdate,
    v_connec.lastupdate_user,
    v_connec.the_geom,
    v_connec.adate,
    v_connec.adescript,
    v_connec.accessibility,
    v_connec.workcat_id_plan,
    v_connec.asset_id
   FROM v_connec;


SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_node"], "fieldName":"asset_id", "action":"ADD-FIELD","hasChilds":"True"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_arc"], "fieldName":"asset_id", "action":"ADD-FIELD","hasChilds":"True"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_connec"], "fieldName":"asset_id", "action":"ADD-FIELD","hasChilds":"True"}}$$);

-- View: v_edit_inp_junction

CREATE OR REPLACE VIEW v_edit_inp_junction AS 
 SELECT n.node_id,
    n.elevation,
    n.depth,
    n.nodecat_id,
    n.sector_id,
    n.macrosector_id,
    n.dma_id,
    n.state,
    n.state_type,
    n.annotation,
    inp_junction.demand,
    inp_junction.pattern_id,
    n.the_geom,
    inp_junction.peak_factor
   FROM selector_sector,
    v_edit_node n
     JOIN inp_junction USING (node_id)
  WHERE n.sector_id = selector_sector.sector_id AND selector_sector.cur_user = "current_user"()::text;


CREATE OR REPLACE VIEW v_edit_inp_connec AS 
 SELECT connec.connec_id,
    connec.elevation,
    connec.depth,
    connec.connecat_id,
    connec.arc_id,
    connec.sector_id,
    connec.dma_id,
    connec.state,
    connec.state_type,
    connec.annotation,
    connec.expl_id,
    connec.pjoint_type,
    connec.pjoint_id,
    inp_connec.demand,
    inp_connec.pattern_id,
    connec.the_geom,
    inp_connec.peak_factor
   FROM selector_sector,
    v_connec connec
     JOIN inp_connec USING (connec_id)
  WHERE connec.sector_id = selector_sector.sector_id AND selector_sector.cur_user = "current_user"()::text;


SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_rtc_hydrometer_x_connec","v_ui_hydrometer","vi_parent_hydrometer","v_rtc_hydrometer",
"v_edit_rtc_hydro_data_x_connec","v_om_mincut_hydrometer","v_ui_hydroval_x_connec","v_vnode","v_arc_x_vnode","v_edit_link"], 
"action":"SAVE-VIEW","hasChilds":"False"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_connec"], "action":"SAVE-VIEW","hasChilds":"True"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["vi_parent_connec","ve_connec","vi_pjoint","v_edit_inp_connec","v_edit_inp_demand", 
"v_rtc_interval_nodepattern","v_rtc_period_nodepattern","v_rtc_period_node", "v_rtc_period_pjointpattern", "v_rtc_period_pjoint",
"v_rtc_period_dma","v_rtc_period_hydrometer","v_ui_workcat_x_feature","v_ui_arc_x_relations","v_ui_workcat_x_feature_end","v_connec", "vu_connec"], "action":"SAVE-VIEW","hasChilds":"False"}}$$);

ALTER TABLE ext_rtc_hydrometer ALTER COLUMN m3_volume TYPE float;

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["vu_connec", "v_connec", "v_ui_workcat_x_feature_end", "v_ui_arc_x_relations", "v_ui_workcat_x_feature",
"v_rtc_period_hydrometer","v_rtc_period_dma","v_rtc_period_pjoint","v_rtc_period_pjointpattern", "v_rtc_period_node",
"v_rtc_period_nodepattern","v_rtc_interval_nodepattern","v_edit_inp_demand","v_edit_inp_connec","vi_pjoint","ve_connec","vi_parent_connec"], 
"action":"RESTORE-VIEW","hasChilds":"False"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_connec"], "action":"RESTORE-VIEW","hasChilds":"True"}}$$);

SELECT gw_fct_admin_manage_views($${"client":{"lang":"ES"}, "feature":{},
"data":{"viewName":["v_edit_link", "v_arc_x_vnode", "v_vnode", "v_ui_hydroval_x_connec","v_om_mincut_hydrometer",
"v_edit_rtc_hydro_data_x_connec","v_rtc_hydrometer", "vi_parent_hydrometer", "v_ui_hydrometer","v_rtc_hydrometer_x_connec"], 
"action":"RESTORE-VIEW","hasChilds":"False"}}$$);