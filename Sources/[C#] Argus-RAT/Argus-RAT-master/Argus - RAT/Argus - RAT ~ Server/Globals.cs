using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Argus___RAT___Server
{
    class Globals
    {
        //-\\-//-\\-//-\\-//-\\-//- MAIL STUFF -\\-//-\\-//-\\-//-\\-//-\\

        // MAIL SERVER
        public String MailServerPopAddress = "pop3.web.de";
        public String MailServerSmtpAddress = "smtp.web.de";
        public int MailServerSmtpPort = 587;
        public int MailServerPopPort = 995;

        // CLIENT
        public String ClientMailAddress = "client@web.de";

        // SERVER
        public String ServerMailAddress = "server@web.de";
        public String ServerMailPass    = "p455w0rd";

        // ENCRYPTION
        public String XorKey = "testKeyOfDoom";
    }
}
