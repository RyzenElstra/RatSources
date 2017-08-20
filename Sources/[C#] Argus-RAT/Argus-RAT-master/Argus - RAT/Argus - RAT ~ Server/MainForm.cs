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
    public partial class MainForm : Form
    {
        String currentClient = null;

        public MainForm()
        {
            InitializeComponent();

            SetupDirectory();

            FillClientComboBox();
        }

        /// <summary>
        /// Creates required Directory and File
        /// </summary>
        private void SetupDirectory()
        {
            if (!Directory.Exists("Clients"))
                Directory.CreateDirectory("Clients");

            if (!File.Exists(@"Clients\Clients.txt"))
            {
                File.Create(@"Clients\Clients.txt").Close();
            }
        }

        private void buttonAddClient_Click(object sender, EventArgs e)
        {
            AddClient AddClientForm = new AddClient();
            if (AddClientForm.ShowDialog(this) == DialogResult.OK)
            {
                FillClientComboBox();
            }
        }

        private bool FillClientComboBox()
        {
            comboBoxClient.Items.Clear();

            String line;

            try
            {
                // Read all Clients
                StreamReader file = new StreamReader(@"Clients\Clients.txt");
                while ((line = file.ReadLine()) != null)
                {
                    comboBoxClient.Items.Add(line);
                }

                file.Close();

                // If Some Client was selected -> select him
                if (currentClient != null)
                    comboBoxClient.SelectedIndex = comboBoxClient.FindStringExact(currentClient);

                return true;
            }

            catch (FileNotFoundException ex)
            {
                MessageBox.Show("An error occured while reading Client text file: File Not Found!", "Error in Client Text File");
                return false;
            }
        }

        private void comboBoxClient_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentClient = comboBoxClient.SelectedItem.ToString();
        }

        private void buttonCategoryMessaging_Click(object sender, EventArgs e)
        {
            CategoryMessaging MessagingForm = new CategoryMessaging(currentClient);
            MessagingForm.Show(this);
        }
    }
}
