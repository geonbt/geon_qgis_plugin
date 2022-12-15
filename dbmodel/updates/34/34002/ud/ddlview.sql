/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = SCHEMA_NAME, public, pg_catalog;
--2020/02/21

CREATE OR REPLACE VIEW vi_pollutants AS 
 SELECT inp_pollutant.poll_id,
    inp_pollutant.units_type,
    inp_pollutant.crain,
    inp_pollutant.cgw,
    inp_pollutant.cii,
    inp_pollutant.kd,
    inp_pollutant.sflag,
    inp_pollutant.copoll_id,
    inp_pollutant.cofract,
    inp_pollutant.cdwf,
    inp_pollutant.cinit
   FROM inp_pollutant
  ORDER BY inp_pollutant.poll_id;

/*

--2020/02/21

CREATE OR REPLACE VIEW ve_arc AS 
 SELECT v_arc_x_node.arc_id,
    v_arc_x_node.code,
    v_arc_x_node.node_1,
    v_arc_x_node.node_2,
    v_arc_x_node.y1,
    v_arc_x_node.custom_y1,
    v_arc_x_node.sys_y1,
    v_arc_x_node.elev1,
    v_arc_x_node.custom_elev1,
    v_arc_x_node.sys_elev1,
    v_arc_x_node.y2,
    v_arc_x_node.custom_y2,
    v_arc_x_node.sys_y2,
    v_arc_x_node.elev2,
    v_arc_x_node.custom_elev2,
    v_arc_x_node.sys_elev2,
    v_arc_x_node.z1,
    v_arc_x_node.z2,
    v_arc_x_node.r1,
    v_arc_x_node.r2,
    v_arc_x_node.slope,
    v_arc_x_node.arc_type,
    v_arc_x_node.sys_type,
    v_arc_x_node.arccat_id,
    v_arc_x_node.matcat_id AS cat_matcat_id,
    v_arc_x_node.shape AS cat_shape,
    v_arc_x_node.geom1 AS cat_geom1,
    v_arc_x_node.geom2 AS cat_geom2,
    v_arc_x_node.gis_length,
    v_arc_x_node.epa_type,
    v_arc_x_node.sector_id,
    v_arc_x_node.macrosector_id,
    v_arc_x_node.state,
    v_arc_x_node.state_type,
    v_arc_x_node.annotation,
    v_arc_x_node.observ,
    v_arc_x_node.comment,
    v_arc_x_node.label,
    v_arc_x_node.inverted_slope,
    v_arc_x_node.custom_length,
    v_arc_x_node.dma_id,
    v_arc_x_node.soilcat_id,
    v_arc_x_node.function_type,
    v_arc_x_node.category_type,
    v_arc_x_node.fluid_type,
    v_arc_x_node.location_type,
    v_arc_x_node.workcat_id,
    v_arc_x_node.workcat_id_end,
    v_arc_x_node.buildercat_id,
    v_arc_x_node.builtdate,
    v_arc_x_node.enddate,
    v_arc_x_node.ownercat_id,
    v_arc_x_node.muni_id,
    v_arc_x_node.postcode,
    v_arc_x_node.streetaxis_id,
    v_arc_x_node.postnumber,
    v_arc_x_node.postcomplement,
    v_arc_x_node.postcomplement2,
    v_arc_x_node.streetaxis2_id,
    v_arc_x_node.postnumber2,
    v_arc_x_node.descript,
    v_arc_x_node.link,
    v_arc_x_node.verified,
    v_arc_x_node.the_geom,
    v_arc_x_node.undelete,
    v_arc_x_node.label_x,
    v_arc_x_node.label_y,
    v_arc_x_node.label_rotation,
    v_arc_x_node.publish,
    v_arc_x_node.inventory,
    v_arc_x_node.uncertain,
    v_arc_x_node.macrodma_id,
    v_arc_x_node.expl_id,
    v_arc_x_node.num_value,
    date_trunc('second', v_arc_x_node.lastupdate) as lastupdate,
    v_arc_x_node.lastupdate_user,
    v_arc_x_node.insert_user
   FROM v_arc_x_node;



CREATE OR REPLACE VIEW ve_gully AS 
 SELECT gully.gully_id,
    gully.code,
    gully.top_elev,
    gully.ymax,
    gully.sandbox,
    gully.matcat_id,
    gully.gully_type,
    gully_type.type AS sys_type,
    gully.gratecat_id,
    cat_grate.matcat_id AS cat_grate_matcat,
    gully.units,
    gully.groove,
    gully.siphon,
    gully.connec_arccat_id,
    gully.connec_length,
    gully.connec_depth,
    gully.arc_id,
    gully.sector_id,
    sector.macrosector_id,
    gully.state,
    gully.state_type,
    gully.annotation,
    gully.observ,
    gully.comment,
    cat_grate.label,
    gully.dma_id,
    gully.soilcat_id,
    gully.function_type,
    gully.category_type,
    gully.fluid_type,
    gully.location_type,
    gully.workcat_id,
    gully.workcat_id_end,
    gully.buildercat_id,
    gully.builtdate,
    gully.enddate,
    gully.ownercat_id,
    gully.muni_id,
    gully.postcode,
    gully.streetaxis_id,
    gully.postnumber,
    gully.postcomplement,
    gully.streetaxis2_id,
    gully.postnumber2,
    gully.postcomplement2,
    gully.descript,
    cat_grate.svg,
    gully.rotation,
    concat(gully_type.link_path, gully.link) AS link,
    gully.verified,
    gully.the_geom,
    gully.undelete,
    gully.featurecat_id,
    gully.feature_id,
    gully.label_x,
    gully.label_y,
    gully.label_rotation,
    gully.publish,
    gully.inventory,
    gully.expl_id,
    dma.macrodma_id,
    gully.uncertain,
    gully.num_value,
    date_trunc('second', gully.lastupdate) as lastupdate,
    gully.lastupdate_user,
    gully.insert_user
   FROM gully
     JOIN v_state_gully ON gully.gully_id::text = v_state_gully.gully_id::text
     LEFT JOIN cat_grate ON gully.gratecat_id::text = cat_grate.id::text
     LEFT JOIN ext_streetaxis ON gully.streetaxis_id::text = ext_streetaxis.id::text
     LEFT JOIN dma ON gully.dma_id = dma.dma_id
     LEFT JOIN sector ON gully.sector_id = sector.sector_id
     LEFT JOIN gully_type ON gully.gully_type::text = gully_type.id::text;



CREATE OR REPLACE VIEW ve_node AS 
 SELECT v_node.node_id,
    v_node.code,
    v_node.top_elev,
    v_node.custom_top_elev,
    v_node.sys_top_elev,
    v_node.ymax,
    v_node.custom_ymax,
    v_node.sys_ymax,
    v_node.elev,
    v_node.custom_elev,
        CASE
            WHEN v_node.sys_elev IS NOT NULL THEN v_node.sys_elev
            ELSE (v_node.sys_top_elev - v_node.sys_ymax)::numeric(12,3)
        END AS sys_elev,
    v_node.node_type,
    v_node.sys_type,
    v_node.nodecat_id,
    v_node.cat_matcat_id,
    v_node.epa_type,
    v_node.sector_id,
    v_node.macrosector_id,
    v_node.state,
    v_node.state_type,
    v_node.annotation,
    v_node.observ,
    v_node.comment,
    v_node.dma_id,
    v_node.soilcat_id,
    v_node.function_type,
    v_node.category_type,
    v_node.fluid_type,
    v_node.location_type,
    v_node.workcat_id,
    v_node.workcat_id_end,
    v_node.buildercat_id,
    v_node.builtdate,
    v_node.enddate,
    v_node.ownercat_id,
    v_node.muni_id,
    v_node.postcode,
    v_node.streetaxis_id,
    v_node.postnumber,
    v_node.postcomplement,
    v_node.postcomplement2,
    v_node.streetaxis2_id,
    v_node.postnumber2,
    v_node.descript,
    v_node.svg,
    v_node.rotation,
    v_node.link,
    v_node.verified,
    v_node.the_geom,
    v_node.undelete,
    v_node.label_x,
    v_node.label_y,
    v_node.label_rotation,
    v_node.publish,
    v_node.inventory,
    v_node.uncertain,
    v_node.xyz_date,
    v_node.unconnected,
    v_node.macrodma_id,
    v_node.expl_id,
    v_node.num_value,
    date_trunc('second', v_node.lastupdate) as lastupdate,
    v_node.lastupdate_user,
    v_node.insert_user
   FROM v_node;



CREATE OR REPLACE VIEW ve_connec AS 
 SELECT connec.connec_id,
    connec.code,
    connec.customer_code,
    connec.top_elev,
    connec.y1,
    connec.y2,
    connec.connecat_id,
    connec.connec_type,
    connec_type.type AS sys_type,
    connec.private_connecat_id,
    cat_connec.matcat_id AS cat_matcat_id,
    connec.sector_id,
    sector.macrosector_id,
    connec.demand,
    connec.state,
    connec.state_type,
    connec.connec_depth,
    connec.connec_length,
    connec.arc_id,
    connec.annotation,
    connec.observ,
    connec.comment,
    cat_connec.label,
    connec.dma_id,
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
    connec.streetaxis_id,
    connec.postnumber,
    connec.postcomplement,
    connec.streetaxis2_id,
    connec.postnumber2,
    connec.postcomplement2,
    connec.descript,
    cat_connec.svg,
    connec.rotation,
    concat(connec_type.link_path, connec.link) AS link,
    connec.verified,
    connec.the_geom,
    connec.undelete,
    connec.featurecat_id,
    connec.feature_id,
    connec.label_x,
    connec.label_y,
    connec.label_rotation,
    connec.accessibility,
    connec.diagonal,
    connec.publish,
    connec.inventory,
    connec.uncertain,
    dma.macrodma_id,
    connec.expl_id,
    connec.num_value,
    connec.pjoint_type,
    connec.pjoint_id,
    date_trunc('second', connec.lastupdate) as lastupdate,
    connec.lastupdate_user,
    connec.insert_user
   FROM connec
     JOIN v_state_connec ON connec.connec_id::text = v_state_connec.connec_id::text
     JOIN cat_connec ON connec.connecat_id::text = cat_connec.id::text
     LEFT JOIN ext_streetaxis ON connec.streetaxis_id::text = ext_streetaxis.id::text
     LEFT JOIN dma ON connec.dma_id = dma.dma_id
     LEFT JOIN sector ON connec.sector_id = sector.sector_id
     LEFT JOIN connec_type ON connec.connec_type::text = connec_type.id::text;
*/