using System;
using System.IO;
using System.Windows.Forms;
using uRAT.Server.Builder;
using uRAT.Server.Tools;
using Res = uRAT.Server.Tools.ResourcesHelper;


namespace uRAT.Server.Forms
{
    public partial class BuildClientForm : Form
    {
        public BuildClientForm()
        {
            InitializeComponent();
            LoadProfiles();
        }

        private void LoadProfiles()
        {
            foreach (var profile in Globals.SettingsHelper.FetchAllBuilderProfiles())
                cbProfile.Items.Add(profile);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            InstallationPath path;
            switch (cbPath.SelectedIndex)
            {
                case 0:
                    path = InstallationPath.Default;
                    break;
                case 1:
                    path = InstallationPath.AppData;
                    break;
                case 2:
                    path = InstallationPath.ProgramFiles;
                    break;
                default:
                    path = InstallationPath.Default;
                    break;
            }
            var settings = new BuildSettings(txtHostname.Text, (int) numPort.Value, txtFilename.Text, path,
                (int) numDelay.Value, cbMerge.Checked);
            var builder = new StubBuilder(settings);
            using (var ofd = new SaveFileDialog())
            {
                ofd.Filter = "Executable (*.exe)|*.exe";
                if (ofd.ShowDialog() == DialogResult.OK)
                    builder.Build(ofd.FileName);
            }
        }

        private void BuildClientForm_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            InstallationPath path;
            switch (cbPath.SelectedIndex)
            {
                case 0:
                    path = InstallationPath.Default;
                    break;
                case 1:
                    path = InstallationPath.AppData;
                    break;
                case 2:
                    path = InstallationPath.ProgramFiles;
                    break;
                default:
                    path = InstallationPath.Default;
                    break;
            }
            var settings = new BuildSettings(txtHostname.Text, (int) numPort.Value, txtFilename.Text, path,
                (int) numDelay.Value, cbMerge.Checked);
            if (cbProfile.Text == "")
                Globals.SettingsHelper.CreateBuilderProfile(
                    PromptDialog.Create("Enter profile name:", "Create new profile"), settings);
            else
                Globals.SettingsHelper.UpdateBuilderProfile(cbProfile.SelectedItem.ToString(), _settings =>
                {
                    _settings.Filename = settings.Filename;
                    _settings.Hostname = settings.Hostname;
                    _settings.InstallationPath = settings.InstallationPath;
                    _settings.MergeDependencies = settings.MergeDependencies;
                    _settings.Port = settings.Port;
                    _settings.ReconnectDelay = settings.ReconnectDelay;
                });
        }

        private void cbProfile_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbProfile.SelectedItem.ToString() == "")
                return;
            var profile = Globals.SettingsHelper.FetchBuilderProfile(cbProfile.SelectedItem.ToString());
            txtHostname.Text = profile.Hostname;
            txtFilename.Text = profile.Filename;
            numPort.Value = profile.Port;
            numDelay.Value = profile.ReconnectDelay;
            cbMerge.Checked = profile.MergeDependencies;
            cbPath.SelectedIndex = (int) profile.InstallationPath;
        }
    }
}
