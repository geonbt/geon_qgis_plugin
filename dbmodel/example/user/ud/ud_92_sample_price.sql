/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO plan_price_cat VALUES ('PRICES DB-2018');

INSERT INTO plan_price VALUES ('A_PRE_PE_DN20', 'm', 'Polyethylene pipe designation PE 100, nominal diameter 200mm', 'Polyethylene pipe designation PE 100, nominal diameter 200mm, nominal pressure of 10 bar, SDR series 17, UNE-EN 12201-2, welded and placed at the bottom of the trench.', 63.4800);
INSERT INTO plan_price VALUES ('S_NULL', 'm3', 'Filling conduit material', 'Filling conduit material', 0.0000);
INSERT INTO plan_price VALUES ('S_TRENCH', 'm3', 'Trenchlining of excavation', 'Trenchlining of excavation', 30.0000);
INSERT INTO plan_price VALUES ('P_ASPHALT-10', 'm2', 'Pavement of continuous hot bituminous mix 10cm thick', 'Pavement of continuous hot bituminous mix 10cm thick (6+4), including the base of artificial ballast to 95% of PM, primer and adhesion.', NULL);
INSERT INTO plan_price VALUES ('P_CONCRETE-20', 'm2', 'Concrete pavement HM-30/P/20/I+E, 20cm thick', 'Concrete pavement HM-30/P/20/I+E, 20cm thick, scattered from the truck, and extended vibratge mechanic, mechanical swirling, including the base of artificial ballast to 95% of PM.', NULL);
INSERT INTO plan_price VALUES ('P_SLAB-4P', 'm2', 'Slab pavement 20x20x4 cm', 'Slab pavement 20x20x4 cm, 1st class, higher price, with sand support of 3cm, hammered on mixed mortar 1:0.5:4, made on site with cement mix 165 and concrete.', NULL);
INSERT INTO plan_price VALUES ('A_CON_DN40', 'm', 'Concrete sewer pipe with nominal external diameter of 400mm', 'Concrete sewer pipe with nominal external diameter of 400mm, sealing inside with cement mortar 1:6, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 57.3467);
INSERT INTO plan_price VALUES ('A_CON_DN60', 'm', 'Concrete sewer pipe with nominal external diameter of 600mm', 'Concrete sewer pipe with nominal external diameter of 600mm, sealing inside with cement mortar 1:6, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 86.5815);
INSERT INTO plan_price VALUES ('A_CON_DN80', 'm', 'Concrete sewer pipe with nominal external diameter of 800mm', 'Concrete sewer pipe with nominal external diameter of 800mm, sealing inside with cement mortar 1:6, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 116.1118);
INSERT INTO plan_price VALUES ('A_CON_DN100', 'm', 'Concrete sewer pipe with nominal external diameter of 1000mm', 'Concrete sewer pipe with nominal external diameter of 1000mm, sealing inside with cement mortar 1:6, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 169.5776);
INSERT INTO plan_price VALUES ('A_CON_O150', 'm', 'Ovoid concrete sewer pipe with dimensions 150x100cm', 'Ovoid concrete sewer pipe with dimensions 150x100cm, sealing inside with cement mortar 1:4,base of 10cm filling at 2/3 of a pipe and protected by concrete layer HM-20/P/20/I.', 276.4895);
INSERT INTO plan_price VALUES ('A_PVC_DN40', 'm', 'PVC sewer pipe with nominal diameter of 400mm', 'PVC sewer pipe with nominal diameter of 400mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 22.5959);
INSERT INTO plan_price VALUES ('A_PVC_DN60', 'm', 'PVC sewer pipe with nominal diameter of 600mm', 'PVC sewer pipe with nominal diameter of 600mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 41.4094);
INSERT INTO plan_price VALUES ('A_PVC_DN80', 'm', 'PVC sewer pipe with nominal diameter of 800mm', 'PVC sewer pipe with nominal diameter of 800mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 60.9223);
INSERT INTO plan_price VALUES ('A_PVC_DN20', 'm', 'PVC sewer pipe with nominal diameter of 200mm', 'PVC sewer pipe with nominal diameter of 200mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 9.6727);
INSERT INTO plan_price VALUES ('S_EXC', 'm3', 'Excavation of trench up to 2 m wide and up to 4 meters deep', 'Excavation of trench up to 2 m wide and up to 4 meters deep in compact ground with backhoe and large mechanical load of excavated material', 9.0324);
INSERT INTO plan_price VALUES ('S_TRANS', 'm3', 'Transport of waste to authorized waste management facility', 'Transport of waste to authorized waste management facility, with 12 t truck and waiting time for loading machine, with a distance of more than 15 and up to 20 km', 8.1164);
INSERT INTO plan_price VALUES ('N_PRD100-H160', 'u', 'Circular manhole with diameter of 100cm, 1,6m deep', 'Circular manhole with diameter of 100cm, 1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 709.3478);
INSERT INTO plan_price VALUES ('N_PRD100-H280', 'u', 'Circular manhole with diameter of 100cm, 2,8m deep', 'Circular manhole with diameter of 100cm, 2,8m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 1034.7425);
INSERT INTO plan_price VALUES ('N_PRD80-H160', 'u', 'Circular manhole with diameter of 80cm, 1,6m deep', 'Circular manhole with diameter of 80cm, 1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 650.3955);
INSERT INTO plan_price VALUES ('N_PRD80-H280', 'u', 'Circular manhole with diameter of 80cm, 2,8m deep', 'Circular manhole with diameter of 80cm, 2,8m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 955.9425);
INSERT INTO plan_price VALUES ('N_PRQ100-H160', 'u', 'Rectangle manhole with dimensions of 100x100cm ,1,6m deep', 'Rectangle manhole with dimensions of 100x100cm ,1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 684.9690);
INSERT INTO plan_price VALUES ('N_CH300x250-H300', 'm2', 'Rectangle chamber with dimensions of 300x250m and 3m deep', 'Rectangle chamber with dimensions of 300x250m and 3m deep', 2900.0000);
INSERT INTO plan_price VALUES ('A_CON_R150', 'm', 'Rectangle concrete sewer pipe with with dimensions 1.50x1.50x1.00m', 'Rectangle concrete sewer pipe with dimensions 1.50x1.50x1.00m, assembled, placed on a settlement layer of concrete, joined by cement mortar and protected with concrete.', 360.0000);
INSERT INTO plan_price VALUES ('A_CON_R200', 'm', 'Rectangle concrete sewer pipe with with dimensions 2.0x2.0x1.00m', 'Rectangle concrete sewer pipe with dimensions 2.0x2.0x1.00m, assembled, placed on a settlement layer of concrete, joined by cement mortar and protected with concrete.', 480.0000);
INSERT INTO plan_price VALUES ('S_REB', 'm3', 'Filling and bottom of ditch of more than 1.5 and up to 2 m', 'Filling and compact of ditch of more than 1.5 and up to 2 m, with selected material from the excavation itself in thick, batch of up to 25 cm, using vibrating roller to compact with 95% compaction PM.', 8.9241);
INSERT INTO plan_price VALUES ('S_REP', 'm3', 'Level and compact of ditch soil', 'Level and compact of ditch soil of more than 0,6 and less than 1,5m, with compact of 90% PM.', 2.5708);
INSERT INTO plan_price VALUES ('SECURITY_HEALTH', 'pa', 'Health and safety of works', 'Plan for the implementation of health and safety throughout the works according to the program and instructions of project management.', 0.0200);
INSERT INTO plan_price VALUES ('A_WEIR_60', 'm', 'Weir formation', 'Weir formation', 0.0000);
INSERT INTO plan_price VALUES ('N_PRQ100-H280', 'u', 'Rectangle manhole with dimensions of 100x100cm ,2,8m deep', 'Rectangle manhole with dimensions of 100x100cm ,2,8m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 1004.9955);
INSERT INTO plan_price VALUES ('N_PRQ150-H250', 'u', 'Rectangle manhole with dimensions of 150x150cm ,2,5m deep', 'Rectangle manhole with dimensions of 150x150cm ,2,5m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 1059.3675);
INSERT INTO plan_price VALUES ('N_PRQ200-H250', 'u', 'Rectangle manhole with dimensions of 200x200cm ,2,5m deep', 'Rectangle manhole with dimensions of 200x200cm ,2,5m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 1201.9955);
INSERT INTO plan_price VALUES ('N_PRQ60-H160', 'u', 'Rectangle manhole with dimensions of 60x60cm ,1,6m deep', 'Rectangle manhole with dimensions of 60x60cm ,1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 541.9963);
INSERT INTO plan_price VALUES ('N_PRQ80-H160', 'u', 'Rectangle manhole with dimensions of 80x80cm ,1,6m deep', 'Rectangle manhole with dimensions of 80x80cm ,1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 623.3080);
INSERT INTO plan_price VALUES ('N_PRQ80-H280', 'u', 'Rectangle manhole with dimensions of 80x80cm ,2,8m deep', 'Rectangle manhole with dimensions of 80x80cm ,2,8m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 936.4395);
INSERT INTO plan_price VALUES ('N_STR500x350x475', 'u', 'Construction of retention tank of rainwater of dimensions 500x350x475cm.', 'Construction of retention tank of rainwater of dimensions 500x350x475cm.', 106000.0000);
INSERT INTO plan_price VALUES ('N_VAL_01', 'u', 'Check valve of PVC, with diameter of 400mm.', 'Check valve of PVC, with diameter of 400mm,with polypropylene clapper', 1447.5100);
INSERT INTO plan_price VALUES ('N_JUMP100', 'm', 'Circular jump manhole with diameter of 100cm, 1,6m deep', 'Circular jump manhole with diameter of 100cm, 1,6m deep, with the base of sett over concrete layer HM-20P/20/I, walls of perforated brick of 11,5cm thick,  plastered and slid inside with mixed mortar 1:0.5:4. Iron cover support and manhole''s cover with diameter of 70cm, and iron steps of 200x200x200 mm.', 330.0000);
INSERT INTO plan_price VALUES ('A_PEC_DN315', 'm', 'PEC sewer pipe with nominal internal diameter of 315mm', 'PEC sewer pipe, with internal smooth and outer corrugated wall, HDPE polyethylene, type B, application area U, external nominal diameter 315 mm, annular rigidity SN 4 kN / m2, according to UNE-EN 13476- 3, union of sleeves, with a degree of average difficulty and placed at the bottom of the ditch', 19.7000);
INSERT INTO plan_price VALUES ('A_PEC_DN40', 'm', 'PEC sewer pipe with nominal internal diameter of 400mm', 'PEC sewer pipe, with internal smooth and outer corrugated wall, HDPE polyethylene, type B, application area U, external nominal diameter 400 mm, annular rigidity SN 4 kN / m2, according to UNE-EN 13476- 3, union of sleeves, with a degree of average difficulty and placed at the bottom of the ditch', 29.3400);
INSERT INTO plan_price VALUES ('PROTECT_SERVICES', 'pa', 'Protection of extsting services', 'Location and protection of all existing services that maybe affected by the works.', 0.0300);
INSERT INTO plan_price VALUES ('UNEXPECTED', 'pa', 'Unexpected work', 'Implementation of the unexpected work units in the project application with the same price.', 0.0500);
INSERT INTO plan_price VALUES ('N_CONNECTION', 'u', 'Connection point of connec', 'Connection point of connec', 135.5000);
INSERT INTO plan_price VALUES ('A_PVC_DN25', 'm', 'PVC sewer pipe with nominal diameter of 250mm', 'PVC sewer pipe with nominal diameter of 250mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 13.4500);
INSERT INTO plan_price VALUES ('A_PVC_DN30', 'm', 'PVC sewer pipe with nominal diameter of 300mm', 'PVC sewer pipe with nominal diameter of 300mm with helix form and rigid profile strengthen on the outside, self-supporting, elastic join with polyurethane adhesive putty and located on the ditch bottom.', 19.2000);
INSERT INTO plan_price VALUES ('A_CON_DN30', 'm', 'Concrete sewer pipe with nominal external diameter of 300mm', 'Concrete sewer pipe with nominal external diameter of 300mm, sealing inside with cement mortar 1:4, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 29.3500);
INSERT INTO plan_price VALUES ('A_CON_DN20', 'm', 'Concrete sewer pipe with nominal external diameter of 200mm', 'Concrete sewer pipe with nominal external diameter of 200mm, sealing inside with cement mortar 1:4, base of 25cm filling up half of a pipe and protected by concrete layer HM-20/P/20/I.', 20.1000);
INSERT INTO plan_price VALUES ('N_SGRT1', 'u', 'Prefabricated concrete gully with ductile iron cover of 78x36x60cm.', 'Prefabricated concrete gully with ductile iron cover of 78x36x60cm.', 245.0000);
INSERT INTO plan_price VALUES ('N_SGRT2', 'u', 'Prefabricated concrete gully with ductile iron cover of 78x34x55cm.', 'Prefabricated concrete gully with ductile iron cover of 78x34x55cm.', 214.5000);
INSERT INTO plan_price VALUES ('N_SGRT3', 'u', 'Prefabricated concrete gully with ductile iron cover of 64x30x60cm.', 'Prefabricated concrete gully with ductile iron cover of 64x30x60cm.', 200.2200);
INSERT INTO plan_price VALUES ('N_SGRT4', 'u', 'Prefabricated concrete gully with ductile iron cover of 77x34x60cm.', 'Prefabricated concrete gully with ductile iron cover of 77x34x60cm.', 225.5000);
INSERT INTO plan_price VALUES ('N_SGRT5', 'u', 'Prefabricated concrete gully with ductile iron cover of 98x48x70cm.', 'Prefabricated concrete gully with ductile iron cover of 98x48x70cm.', 298.5000);
INSERT INTO plan_price VALUES ('N_SGRT6', 'u', 'Prefabricated concrete gully with ductile iron cover of 56x30x50cm.', 'Prefabricated concrete gully with ductile iron cover of 56x30x50cm.', 197.4000);
INSERT INTO plan_price VALUES ('N_SGRT7', 'u', 'Prefabricated concrete gully with ductile iron cover of 50x25x50cm.', 'Prefabricated concrete gully with ductile iron cover of 50x25x50cm.', 185.9500);
INSERT INTO plan_price VALUES ('N_BGRT1', 'm', 'Prefabricated concrete interceptor with iron grate of 32x100cm.', 'Prefabricated concrete interceptor with iron grate of 32x100cm.', 80.0500);
INSERT INTO plan_price VALUES ('N_BGRT2', 'm', 'Prefabricated concrete interceptor with ductile iron grate of 20x100cm.', 'Prefabricated concrete interceptor with ductile iron grate of 20x100cm.', 71.1000);
INSERT INTO plan_price VALUES ('N_BGRT3', 'm', 'Prefabricated concrete interceptor with ductile iron grate of 10x100cm.', 'Prefabricated concrete interceptor with ductile iron grate of 10x100cm.', 59.5000);
INSERT INTO plan_price VALUES ('N_BGRT4', 'm', 'Prefabricated concrete interceptor with ductile iron grate of 13x100cm.', 'Prefabricated concrete interceptor with ductile iron grate of 13x100cm.', 64.1500);
INSERT INTO plan_price VALUES ('N_BGRT5', 'm', 'Prefabricated concrete interceptor with ductile iron grate of 48x100cm.', 'Prefabricated concrete interceptor with ductile iron grate of 48x100cm.', 298.5000);
INSERT INTO plan_price VALUES ('F9265C51', 'm3', 'Concret base of HM-20/B/10/ I, soft consistency with mechanical interior transport', 'Concret base of HM-20/B/10/I, of soft consistency and maximum size of 10 mm granulate, with mechanical interior transport with manual extension and vibration, with a rusty finish', 87.0445, NULL);
INSERT INTO plan_price VALUES ('F931201F', 'm3', 'Base of artificial gravels, with extended and compacted material at 95% of the PM', 'Base of artificial gravels, with extended and compacted material at 95% of the PM', 29.2250, NULL);
INSERT INTO plan_price VALUES ('F9E1311N', 'm2', 'Tile pavement for gray sidewalk of 20x20x4 cm on support of 3 cm of sand', 'Tile pavement for gray sidewalk of 20x20x4 cm, first class, top price, on support of 3 cm of sand, made in the work with concrete mixer of 165 l and portland cement', 35.3418, NULL);
INSERT INTO plan_price VALUES ('F9J12X40', 'm2', 'Primer irrigation with specific cationic bituminous emulsion for irrigation of priming', 'Primer irrigation with specific cationic bituminous emulsion for irrigation of priming, ECI type, with a provision of 1 kg / m2', 0.5221, NULL);
INSERT INTO plan_price VALUES ('F9G1A732', 'm3', 'Concrete flooring without additives HA-30/P/20/IIIa + E of plastic consistency', 'Concrete flooring without additives HA-30/P/20/IIIa + E of plastic consistency, maximum size of aggregate, 20 mm, scattered from truck, manual extended and vibration, riveted finish', 105.6413, NULL);
INSERT INTO plan_price VALUES ('F9H11251', 't', 'Continuous bituminous mixing pavement type AC 16 surf B50 / 70 D (D-12)', 'Continuous bituminous mixing pavement type AC 16 surf B50 / 70 D (D-12), with asphalt penetration bitumen, dense granulometry for tread and granite granulate, extended and compacted', 55.8791, NULL);
INSERT INTO plan_price VALUES ('F9H118E1', 't', 'Continuous bituminous mixing flooring type AC 22 surf BC50 / 70 S (S-20)', 'Continuous bituminous mixing flooring type AC 22 surf BC50 / 70 S (S-20)', 57.3861, NULL);
INSERT INTO plan_price VALUES ('F9J13Y40', 'm2', 'Adhesive irrigation with modified bituminous emulsion with fast cationic polymer', 'Adhesive irrigation with modified bituminous emulsion with fast cationic polymers, ECR-1d-m type, with a 1 kg / m2', 0.4334, NULL);
INSERT INTO plan_price VALUES ('VIRTUAL_U', 'u', 'Null price for unitary virtual elements', 'Null price for unitary virtual elements', 0, NULL);
INSERT INTO plan_price VALUES ('VIRTUAL_M', 'm', 'Null price for  m virtual elements', 'Null price for m virtual elements', 0, NULL);
INSERT INTO plan_price VALUES ('VIRTUAL_M2', 'm2', 'Null price for m2 virtual elements', 'Null price for m2 virtual elements', 0, NULL);
INSERT INTO plan_price VALUES ('VIRTUAL_M3', 'm3', 'Null price for m3 virtual elements', 'Null price for m3 virtual elements', 0, NULL);


INSERT INTO plan_price_compost VALUES (1, 'P_ASPHALT-10', 'F931201F', 0.2500);
INSERT INTO plan_price_compost VALUES (2, 'P_ASPHALT-10', 'F9H118E1', 0.1440);
INSERT INTO plan_price_compost VALUES (3, 'P_ASPHALT-10', 'F9H11251', 0.0960);
INSERT INTO plan_price_compost VALUES (4, 'P_ASPHALT-10', 'F9J12X40', 1.0000);
INSERT INTO plan_price_compost VALUES (5, 'P_ASPHALT-10', 'F9J13Y40', 1.0000);
INSERT INTO plan_price_compost VALUES (6, 'P_CONCRETE-20', 'F931201F', 0.2000);
INSERT INTO plan_price_compost VALUES (7, 'P_CONCRETE-20', 'F9G1A732', 0.2000);
INSERT INTO plan_price_compost VALUES (8, 'P_SLAB-4P', 'F9E1311N', 1.0000);
INSERT INTO plan_price_compost VALUES (9, 'P_SLAB-4P', 'F9265C51', 0.1000);


INSERT INTO plan_psector_x_other VALUES (1, 'PROTECT_SERVICES', 41426.44, 1, NULL);
INSERT INTO plan_psector_x_other VALUES (2, 'SECURITY_HEALTH', 41426.44, 1, NULL);
INSERT INTO plan_psector_x_other VALUES (3, 'UNEXPECTED', 41426.44, 1, NULL);
INSERT INTO plan_psector_x_other VALUES (4, 'PROTECT_SERVICES', 14025.04, 2, NULL);
INSERT INTO plan_psector_x_other VALUES (5, 'SECURITY_HEALTH', 14025.04, 2, NULL);
INSERT INTO plan_psector_x_other VALUES (6, 'UNEXPECTED', 14025.04, 2, NULL);
