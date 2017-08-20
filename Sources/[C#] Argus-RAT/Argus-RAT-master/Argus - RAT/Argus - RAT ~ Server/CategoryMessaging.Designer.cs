namespace Argus___RAT___Server
{
    partial class CategoryMessaging
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBoxToast = new System.Windows.Forms.TextBox();
            this.buttonSendToast = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.textBoxWebpage = new System.Windows.Forms.TextBox();
            this.buttonOpenWebpage = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // textBoxToast
            // 
            this.textBoxToast.Location = new System.Drawing.Point(6, 19);
            this.textBoxToast.Name = "textBoxToast";
            this.textBoxToast.Size = new System.Drawing.Size(357, 20);
            this.textBoxToast.TabIndex = 0;
            this.textBoxToast.Text = "Argus is watching you...";
            // 
            // buttonSendToast
            // 
            this.buttonSendToast.Location = new System.Drawing.Point(369, 17);
            this.buttonSendToast.Name = "buttonSendToast";
            this.buttonSendToast.Size = new System.Drawing.Size(75, 23);
            this.buttonSendToast.TabIndex = 1;
            this.buttonSendToast.Text = "Send";
            this.buttonSendToast.UseVisualStyleBackColor = true;
            this.buttonSendToast.Click += new System.EventHandler(this.buttonSendToast_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textBoxToast);
            this.groupBox1.Controls.Add(this.buttonSendToast);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(457, 54);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Send Toast";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.buttonOpenWebpage);
            this.groupBox2.Controls.Add(this.textBoxWebpage);
            this.groupBox2.Location = new System.Drawing.Point(12, 73);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(457, 55);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Open Webpage";
            // 
            // textBoxWebpage
            // 
            this.textBoxWebpage.Location = new System.Drawing.Point(7, 20);
            this.textBoxWebpage.Name = "textBoxWebpage";
            this.textBoxWebpage.Size = new System.Drawing.Size(356, 20);
            this.textBoxWebpage.TabIndex = 0;
            this.textBoxWebpage.Text = "https://0x00sec.org";
            // 
            // buttonOpenWebpage
            // 
            this.buttonOpenWebpage.Location = new System.Drawing.Point(369, 18);
            this.buttonOpenWebpage.Name = "buttonOpenWebpage";
            this.buttonOpenWebpage.Size = new System.Drawing.Size(75, 23);
            this.buttonOpenWebpage.TabIndex = 1;
            this.buttonOpenWebpage.Text = "Open";
            this.buttonOpenWebpage.UseVisualStyleBackColor = true;
            this.buttonOpenWebpage.Click += new System.EventHandler(this.buttonOpenWebpage_Click);
            // 
            // CategoryMessaging
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(479, 203);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "CategoryMessaging";
            this.Text = "Messaging";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxToast;
        private System.Windows.Forms.Button buttonSendToast;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button buttonOpenWebpage;
        private System.Windows.Forms.TextBox textBoxWebpage;
    }
}