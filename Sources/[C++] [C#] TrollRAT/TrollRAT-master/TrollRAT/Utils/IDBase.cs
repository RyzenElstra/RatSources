using System;

namespace TrollRAT.Utils
{
    public abstract class IDBase
    {
        public abstract int ID { get; }
    }

    public class GenericInt<t>
    {
        public int value;
    }

    public abstract class IDBase<t> : IDBase
    {
        // Generics are used to redefine the ID for every subclass
        private static GenericInt<t> idCounter = new GenericInt<t>();

        protected int id;
        public override int ID => id;

        public IDBase()
        {
            id = idCounter.value++;
        }
    }
}
