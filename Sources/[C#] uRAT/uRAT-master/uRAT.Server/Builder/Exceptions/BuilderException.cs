using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace uRAT.Server.Builder.Exceptions
{
    internal class BuilderException : Exception
    {
        public BuilderException()
        {
        }

        public BuilderException(string message) 
            : base(message)
        {
        }

        public BuilderException(string message, Exception innerException) 
            : base(message, innerException)
        {
        }

        protected BuilderException(SerializationInfo info, StreamingContext context) 
            : base(info, context)
        {
        }
    }
}
