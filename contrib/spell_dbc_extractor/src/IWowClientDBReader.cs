using System.IO;

namespace spell_dbc_extractor
{
    interface IWowClientDBReader
    {
        int RecordsCount { get; }
        int FieldsCount { get; }
        int RecordSize { get; }
        int StringTableSize { get; }
        StringTable StringTable { get; }
        BinaryReader this[int row] { get; }
    }
}
