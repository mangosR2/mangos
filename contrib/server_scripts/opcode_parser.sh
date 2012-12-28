#!/bin/bash
version="15952"
_file=opcodes_mangos_$version.sql

echo "-- Opcode table for client build $version" >./$_file
echo "" >>./$_file
echo 'CREATE TABLE IF NOT EXISTS `opcodes` (' >>./$_file
echo '    `version` smallint(5) NOT NULL COMMENT "Client build",' >>./$_file
echo '    `name` varchar(64) NOT NULL COMMENT "opcode name",' >>./$_file
echo '    `value` int(10) NOT NULL COMMENT "opcode value",'>>./$_file
echo '    `flags` int(10) unsigned NOT NULL DEFAULT "0" COMMENT "current opcode flags",' >>./$_file
echo '    UNIQUE KEY `version` (`version`,`name`)' >>./$_file
echo ') ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="Universal opcode storage";' >>./$_file
echo "" >>./$_file
echo 'DELETE FROM `opcodes` WHERE `version` =' $version";" >>./$_file
echo "" >>./$_file
echo 'INSERT INTO `opcodes` (`name`, `value`, `version`, `flags`) VALUES' >>./$_file

cat ./Opcodes.h |grep "^\ *.MSG"|sed 's/^\ */\(\"/'|sed 's/\ *= */\"\,/'|sed 's/ *\/.*$//'|sed "s/\,$/\,"$version"\,0\)\,/" >>./$_file
echo '("NUM_MSG_TYPES",0x0,'$version',1);' >>./$_file

