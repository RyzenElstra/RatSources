namespace Argus___RAT___Server
{
    partial class AddClient
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
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxClientMailAddress = new System.Windows.Forms.TextBox();
            this.textBoxServerMailAddress = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxServerMailPass = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxAesKey = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.buttonAddClient = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(80, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Name: ";
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(127, 10);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(211, 20);
            this.textBoxName.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Client\'s Mail Address:";
            // 
            // textBoxClientMailAddress
            // 
            this.textBoxClientMailAddress.Location = new System.Drawing.Point(127, 36);
            this.textBoxClientMailAddress.Name = "textBoxClientMailAddress";
            this.textBoxClientMailAddress.Size = new System.Drawing.Size(211, 20);
            this.textBoxClientMailAddress.TabIndex = 3;
            // 
            // textBoxServerMailAddress
            // 
            this.textBoxServerMailAddress.Location = new System.Drawing.Point(127, 63);
            this.textBoxServerMailAddress.Name = "textBoxServerMailAddress";
            this.textBoxServerMailAddress.Size = new System.Drawing.Size(211, 20);
            this.textBoxServerMailAddress.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 66);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(111, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Server\'s Mail Address:";
            // 
            // textBoxServerMailPass
            // 
            this.textBoxServerMailPass.Location = new System.Drawing.Point(127, 93);
            this.textBoxServerMailPass.Name = "textBoxServerMailPass";
            this.textBoxServerMailPass.Size = new System.Drawing.Size(211, 20);
            this.textBoxServerMailPass.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(4, 96);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(119, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Server\'s Mail Password:";
            // 
            // textBoxAesKey
            // 
            this.textBoxAesKey.Location = new System.Drawing.Point(127, 120);
            this.textBoxAesKey.Name = "textBoxAesKey";
            this.textBoxAesKey.Size = new System.Drawing.Size(211, 20);
            this.textBoxAesKey.TabIndex = 8;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(42, 123);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "Encryption Key:";
            // 
            // buttonAddClient
            // 
            this.buttonAddClient.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.buttonAddClient.Location = new System.Drawing.Point(62, 158);
            this.buttonAddClient.Name = "buttonAddClient";
            this.buttonAddClient.Size = new System.Drawing.Size(85, 27);
            this.buttonAddClient.TabIndex = 10;
            this.buttonAddClient.Text = "Add Client";
            this.buttonAddClient.UseVisualStyleBackColor = true;
            this.buttonAddClient.Click += new System.EventHandler(this.buttonAddClient_Click);
            // 
            // buttonCancel
            // 
            this.buttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.buttonCancel.Location = new System.Drawing.Point(196, 158);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(85, 27);
            this.buttonCancel.TabIndex = 11;
            this.buttonCancel.Text = "Cancel";
            this.buttonCancel.UseVisualStyleBackColor = true;
            // 
            // AddClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(350, 197);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonAddClient);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBoxAesKey);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBoxServerMailPass);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxServerMailAddress);
            this.Controls.Add(this.textBoxClientMailAddress);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.label1);
            this.Name = "AddClient";
            this.Text = "Add Client";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxClientMailAddress;
        private System.Windows.Forms.TextBox textBoxServerMailAddress;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxServerMailPass;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxAesKey;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button buttonAddClient;
        private System.Windows.Forms.Button buttonCancel;
    }
}