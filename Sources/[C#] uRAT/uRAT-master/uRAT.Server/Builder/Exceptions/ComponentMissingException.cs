using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace uRAT.Server.Builder.Exceptions
{
    internal class ComponentMissingException : BuilderException
    {
        public ComponentMissingException()
        {
        }

        public ComponentMissingException(string message) 
            : base(message)
        {
        }

        public ComponentMissingException(string message, Exception innerException) 
            : base(message, innerException)
        {
        }

        protected ComponentMissingException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
        }
    }
}
