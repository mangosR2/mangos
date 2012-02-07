using System;
using System.Globalization;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;

namespace spell_dbc_extractor
{
    class Program
    {
        static IWowClientDBReader m_reader;
        static XmlDocument m_definitions;
        static string DBCName;

        static void Main(string[] args)
        {
            Console.WriteLine("Spell.dbc to spell_dbc extractor based on code from TOM_RUS (http://mywowtools.googlecode.com/svn/trunk)");
            if (args.Length < 1)
            {
                Console.WriteLine("Please specify spell number!");
                Console.WriteLine("example: spell_dbc_extractor Spell.dbc 7744");
                return;
            }

            string fileName = "Spell.dbc";
            uint    spellNum = Convert.ToUInt32(args[0]);
            bool found = false;

            if (!File.Exists(fileName))
            {
                Console.WriteLine("File {0} doesn't exist. Put {0} in work directory!", fileName);
                return;
            }

            LoadDefinitions();

            if (Path.GetExtension(fileName).ToLowerInvariant() == ".dbc")
                m_reader = new DBCReader(fileName);
            else
                m_reader = new DB2Reader(fileName);

            Console.WriteLine("Records: {0}, Fields: {1}, Row Size {2}, String Table Size: {3}", m_reader.RecordsCount, m_reader.FieldsCount, m_reader.RecordSize, m_reader.StringTableSize);

            DBCName = Path.GetFileNameWithoutExtension(fileName);

            XmlElement definition = m_definitions["DBFilesClient"][DBCName];

            if (definition == null)
            {
                Console.WriteLine("Definition for file {0} not found! File name is case sensitive!", fileName);
                return;
            }

            XmlNodeList fields = definition.GetElementsByTagName("field");
            XmlNodeList indexes = definition.GetElementsByTagName("index");
            string _comment = "";
            
            for (int i = 0; i < m_reader.RecordsCount; ++i)
            {
                BinaryReader reader = m_reader[i];
                StringBuilder result = new StringBuilder();
                result.Append("VALUES (");
                
                int flds = 0;
                int recordIndex = 0;
                
                foreach (XmlElement field in fields)
                {
                    var status = field.Attributes["method"].Value;

                    if (status != "skip")
                    {
                        if (flds > 0)
                        {
                            result.Append(", ");
                        }

                        switch (field.Attributes["type"].Value)
                        {
                            case "index":
                                recordIndex = reader.ReadInt32();
                                result.Append(recordIndex);
                                break;
                            case "long":
                                result.Append(reader.ReadInt64());
                                break;
                            case "ulong":
                                result.Append(reader.ReadUInt64());
                                break;
                            case "int":
                                result.Append(reader.ReadInt32());
                                break;
                            case "uint":
                                result.Append(reader.ReadUInt32());
                                break;
                            case "short":
                                result.Append(reader.ReadInt16());
                                break;
                            case "ushort":
                                result.Append(reader.ReadUInt16());
                                break;
                            case "sbyte":
                                result.Append(reader.ReadSByte());
                                break;
                            case "byte":
                                result.Append(reader.ReadByte());
                                break;
                            case "float":
                                result.Append(reader.ReadSingle().ToString(CultureInfo.InvariantCulture));
                                break;
                            case "double":
                                result.Append(reader.ReadDouble().ToString(CultureInfo.InvariantCulture));
                                break;
                            case "string":
                                result.Append("\"" + StripBadCharacters(m_reader.StringTable[reader.ReadInt32()]) + "\"");
                                break;
                            case "comment":
                                _comment = "\"" + StripBadCharacters(m_reader.StringTable[reader.ReadInt32()]) + "\"";
                                result.Append(_comment);
                                break;
                            default:
                                throw new Exception(String.Format("Unknown field type {0}!", field.Attributes["type"].Value));
                        }
                        flds++;
                    }
                    else
                    {
                        switch (field.Attributes["type"].Value)
                        {
                            case "uint":
                            case "index":
                            case "int":
                                reader.ReadInt32();
                                break;
                            case "long":
                            case "ulong":
                                reader.ReadInt64();
                                break;
                            case "short":
                            case "ushort":
                                reader.ReadUInt16();
                                break;
                            case "sbyte":
                                reader.ReadSByte();
                                break;
                            case "byte":
                                reader.ReadByte();
                                break;
                            case "float":
                                reader.ReadSingle();
                                break;
                            case "double":
                                reader.ReadDouble();
                                break;
                            case "string":
                            case "comment":
                                StripBadCharacters(m_reader.StringTable[reader.ReadInt32()]);
                                break;
                            default:
                                throw new Exception(String.Format("Unknown field type {0}!", field.Attributes["type"].Value));
                        }
                    }
                }
                result.Append(" );");
                
                if (recordIndex == spellNum)
                {
                    StreamWriter sqlWriter = new StreamWriter("mr9999_mangos_spell_" + spellNum + "_override.sql");
                    sqlWriter.Write("-- Produced by spell_dbc_extractor by /dev/rsa based on code from TOM_RUS \n");
                    sqlWriter.Write("-- Replace DBC values for spell {0} - {1} \n",spellNum,_comment);
                    sqlWriter.Write("-- \n");
                    sqlWriter.Write("DELETE FROM `spell_dbc` WHERE `Id` = {0};\n", spellNum);
                    sqlWriter.Write("INSERT INTO `spell_dbc` \n");
                    WriteSqlHeader(sqlWriter, fileName, fields, indexes);
                    sqlWriter.Write(result);
                    sqlWriter.Write("\n\n");
                    sqlWriter.Write("-- Put there corrects for spell data values in readable form (example below) \n" );
                    sqlWriter.Write("-- UPDATE `spell_dbc` SET \n");
                    sqlWriter.Write("-- `Mechanic` = 0, \n");
                    sqlWriter.Write("-- `Comment` = \'Replacement for spell {0} ({1})\' \n",spellNum, _comment);
                    sqlWriter.Write("-- WHERE `Id` = {0};\n\n", spellNum);
                    
                    found = true;            
                    Console.WriteLine("Found spell {0} - {1}, write to SQL...",spellNum, _comment);
                    sqlWriter.Flush();
                    sqlWriter.Close();
                    break;
                }

                reader.Close();
            }

            
            if (!found)
            {
                Console.WriteLine("Error: NOT Found spell {0} in dbc file.", spellNum);
            }
        }

        static void LoadDefinitions()
        {
            Console.WriteLine("Loading XML configuration file...");
            m_definitions = new XmlDocument();
            m_definitions.Load("dbclayout.xml");
            Console.WriteLine("Done!");
        }

        static void WriteSqlHeader(StreamWriter sqlWriter, string fileName, XmlNodeList fields, XmlNodeList indexes)
        {
            int flds = 0;
            sqlWriter.Write("( ");
            foreach (XmlElement field in fields)
            {
                var status = field.Attributes["method"].Value;
                if (status != "skip")
                {
                    if (flds > 0)
                    {
                        sqlWriter.Write(", ");
                    }
                    sqlWriter.Write(String.Format("`{0}`", field.Attributes["name"].Value));
                    
                    flds++;
                }
            }
            sqlWriter.Write(" )\n");
            
        }

        static string StripBadCharacters(string input)
        {
            input = Regex.Replace(input, @"'", @"\'");
            input = Regex.Replace(input, @"\""", @"\""");
            return input;
        }
    }
}
