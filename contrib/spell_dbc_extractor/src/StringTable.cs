using System.Collections.Generic;

namespace spell_dbc_extractor
{
    class StringTable : Dictionary<int, string>
    {
        public StringTable()
            : base()
        {
        }

        public new string this[int offset]
        {
            get { return base[offset]; }
            set { base[offset] = value; }
        }
    }
}
