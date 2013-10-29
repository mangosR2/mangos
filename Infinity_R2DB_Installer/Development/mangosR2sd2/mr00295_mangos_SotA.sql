-- SotA
UPDATE creature_template SET ScriptName='npc_sa_vendor' WHERE entry IN (29260, 29262);
UPDATE gameobject_template SET ScriptName='go_sa_def_portal' WHERE entry = 191575;
UPDATE gameobject_template SET ScriptName='' WHERE entry IN (194086, 190753);
