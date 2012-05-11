using System;
using System.IO;
using System.Text;

namespace spell_dbc_extractor
{
    class DB2Reader : IWowClientDBReader
    {
        private const int HeaderSize = 48;
        private const uint DB2FmtSig = 0x32424457;          // WDB2
        private const uint ADBFmtSig = 0x32484357;          // WCH2

        public int RecordsCount { get; private set; }
        public int FieldsCount { get; private set; }
        public int RecordSize { get; private set; }
        public int StringTableSize { get; private set; }

        public StringTable StringTable { get; private set; }

        private byte[][] m_rows;

        public BinaryReader this[int row]
        {
            get { return new BinaryReader(new MemoryStream(m_rows[row]), Encoding.UTF8); }
        }

        public DB2Reader(string fileName)
        {
            using (var reader = BinaryReaderExtensions.FromFile(fileName))
            {
                if (reader.BaseStream.Length < HeaderSize)
                {
                    Console.WriteLine("File {0} is corrupted!", fileName);
                    return;
                }

                var signature = reader.ReadUInt32();

                if (signature != DB2FmtSig && signature != ADBFmtSig)
                {
                    Console.WriteLine("File {0} isn't valid DBC file!", fileName);
                    return;
                }

                RecordsCount = reader.ReadInt32();
                FieldsCount = reader.ReadInt32(); // not fields count in WCH2
                RecordSize = reader.ReadInt32();
                StringTableSize = reader.ReadInt32();

                // WDB2/WCH2 specific fields
                uint tableHash = reader.ReadUInt32(); // new field in WDB2
                uint build = reader.ReadUInt32(); // new field in WDB2

                int unk1 = reader.ReadInt32(); // new field in WDB2 (Unix time in WCH2)
                int unk2 = reader.ReadInt32(); // new field in WDB2
                int unk3 = reader.ReadInt32(); // new field in WDB2 (index table?)
                int locale = reader.ReadInt32(); // new field in WDB2
                int unk5 = reader.ReadInt32(); // new field in WDB2

                if (unk3 != 0)
                {
                    reader.ReadBytes(unk3 * 4 - HeaderSize);     // an index for rows
                    reader.ReadBytes(unk3 * 2 - HeaderSize * 2); // a memory allocation bank
                }

                m_rows = new byte[RecordsCount][];

                for (int i = 0; i < RecordsCount; i++)
                    m_rows[i] = reader.ReadBytes(RecordSize);

                int stringTableStart = (int)reader.BaseStream.Position;

                StringTable = new StringTable();

                while (reader.BaseStream.Position != reader.BaseStream.Length)
                {
                    int index = (int)reader.BaseStream.Position - stringTableStart;
                    StringTable[index] = reader.ReadStringNull();
                }
            }
        }
    }
}
