using System;
namespace JDash.WebForms.Design
{
    partial class FmProvider
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
            AppDomain.CurrentDomain.AssemblyResolve -= CurrentDomain_AssemblyResolve;
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FmProvider));
            this.label1 = new System.Windows.Forms.Label();
            this.ctlAuthorization = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.ctlDefaultProvider = new System.Windows.Forms.TextBox();
            this.ctlProviderList = new System.Windows.Forms.ListBox();
            this.ctlGetScript = new System.Windows.Forms.Button();
            this.ctlType = new System.Windows.Forms.Label();
            this.ctlSave = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.ctlConList = new System.Windows.Forms.ComboBox();
            this.ctlAppName = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.button4 = new System.Windows.Forms.Button();
            this.browseFolder = new System.Windows.Forms.FolderBrowserDialog();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.ctlprivRoles = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.ctlKnownRole = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.linkLabel2 = new System.Windows.Forms.LinkLabel();
            this.label14 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.ctlCustomRole = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 164);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(163, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "Authorization Enabled:";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ctlAuthorization
            // 
            this.ctlAuthorization.AutoSize = true;
            this.ctlAuthorization.Location = new System.Drawing.Point(184, 168);
            this.ctlAuthorization.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlAuthorization.Name = "ctlAuthorization";
            this.ctlAuthorization.Size = new System.Drawing.Size(15, 14);
            this.ctlAuthorization.TabIndex = 5;
            this.ctlAuthorization.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 116);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(122, 21);
            this.label5.TabIndex = 3;
            this.label5.Text = "Default Provider:";
            this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ctlDefaultProvider
            // 
            this.ctlDefaultProvider.Location = new System.Drawing.Point(146, 112);
            this.ctlDefaultProvider.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlDefaultProvider.Name = "ctlDefaultProvider";
            this.ctlDefaultProvider.Size = new System.Drawing.Size(227, 29);
            this.ctlDefaultProvider.TabIndex = 4;
            // 
            // ctlProviderList
            // 
            this.ctlProviderList.FormattingEnabled = true;
            this.ctlProviderList.ItemHeight = 21;
            this.ctlProviderList.Location = new System.Drawing.Point(406, 35);
            this.ctlProviderList.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlProviderList.Name = "ctlProviderList";
            this.ctlProviderList.Size = new System.Drawing.Size(224, 256);
            this.ctlProviderList.TabIndex = 4;
            this.ctlProviderList.SelectedIndexChanged += new System.EventHandler(this.ctlProviderList_SelectedIndexChanged);
            // 
            // ctlGetScript
            // 
            this.ctlGetScript.Location = new System.Drawing.Point(637, 207);
            this.ctlGetScript.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlGetScript.Name = "ctlGetScript";
            this.ctlGetScript.Size = new System.Drawing.Size(202, 37);
            this.ctlGetScript.TabIndex = 15;
            this.ctlGetScript.Text = "Get Script";
            this.ctlGetScript.UseVisualStyleBackColor = true;
            this.ctlGetScript.Click += new System.EventHandler(this.ctlGetScript_Click);
            // 
            // ctlType
            // 
            this.ctlType.AutoEllipsis = true;
            this.ctlType.Location = new System.Drawing.Point(638, 35);
            this.ctlType.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.ctlType.Name = "ctlType";
            this.ctlType.Size = new System.Drawing.Size(421, 31);
            this.ctlType.TabIndex = 14;
            this.ctlType.Text = "Type";
            this.ctlType.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.ctlType.Click += new System.EventHandler(this.ctlType_Click);
            // 
            // ctlSave
            // 
            this.ctlSave.Location = new System.Drawing.Point(637, 254);
            this.ctlSave.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlSave.Name = "ctlSave";
            this.ctlSave.Size = new System.Drawing.Size(422, 37);
            this.ctlSave.TabIndex = 11;
            this.ctlSave.Text = "Save Current Changes";
            this.ctlSave.UseVisualStyleBackColor = true;
            this.ctlSave.Click += new System.EventHandler(this.ctlSave_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(857, 207);
            this.button3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(202, 37);
            this.button3.TabIndex = 10;
            this.button3.Text = "Create Metadata";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // ctlConList
            // 
            this.ctlConList.FormattingEnabled = true;
            this.ctlConList.Location = new System.Drawing.Point(778, 130);
            this.ctlConList.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlConList.Name = "ctlConList";
            this.ctlConList.Size = new System.Drawing.Size(281, 29);
            this.ctlConList.TabIndex = 9;
            // 
            // ctlAppName
            // 
            this.ctlAppName.Location = new System.Drawing.Point(778, 80);
            this.ctlAppName.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlAppName.Name = "ctlAppName";
            this.ctlAppName.Size = new System.Drawing.Size(281, 29);
            this.ctlAppName.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(638, 133);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(135, 21);
            this.label4.TabIndex = 7;
            this.label4.Text = "Connection String:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(637, 83);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(133, 21);
            this.label3.TabIndex = 6;
            this.label3.Text = "Application Name:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(402, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 21);
            this.label2.TabIndex = 5;
            this.label2.Text = "Installed Providers";
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(952, 618);
            this.button4.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(100, 37);
            this.button4.TabIndex = 9;
            this.button4.Text = "OK";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(13, 14);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(225, 76);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictureBox1.TabIndex = 13;
            this.pictureBox1.TabStop = false;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label9.Location = new System.Drawing.Point(403, 324);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(0, 13);
            this.label9.TabIndex = 14;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(401, 335);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(573, 84);
            this.label10.TabIndex = 15;
            this.label10.Text = resources.GetString("label10.Text");
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 265);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(113, 21);
            this.label6.TabIndex = 16;
            this.label6.Text = "Privileged Roles";
            this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ctlprivRoles
            // 
            this.ctlprivRoles.Location = new System.Drawing.Point(17, 290);
            this.ctlprivRoles.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlprivRoles.Name = "ctlprivRoles";
            this.ctlprivRoles.Size = new System.Drawing.Size(356, 29);
            this.ctlprivRoles.TabIndex = 17;
            // 
            // label7
            // 
            this.label7.Font = new System.Drawing.Font("Segoe UI Light", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label7.ForeColor = System.Drawing.Color.SteelBlue;
            this.label7.Location = new System.Drawing.Point(13, 185);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(360, 69);
            this.label7.TabIndex = 18;
            this.label7.Text = "If enabled, provider only returns items (i.e. dashboards and dashlet modules) whi" +
    "ch has view/edit permissions for current user.";
            this.label7.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label8
            // 
            this.label8.Font = new System.Drawing.Font("Segoe UI Light", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label8.ForeColor = System.Drawing.Color.SteelBlue;
            this.label8.Location = new System.Drawing.Point(13, 324);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(360, 69);
            this.label8.TabIndex = 19;
            this.label8.Text = "Comma seperated list of role names. If current user belongs one of privileged rol" +
    "es provider skips athorization for that user. This is especially useful for admi" +
    "nistrators.";
            this.label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label11
            // 
            this.label11.Font = new System.Drawing.Font("Segoe UI Light", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label11.ForeColor = System.Drawing.Color.SteelBlue;
            this.label11.Location = new System.Drawing.Point(13, 473);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(360, 94);
            this.label11.TabIndex = 22;
            this.label11.Text = "If your application uses membership role provider set Known Role Provider to Memb" +
    "ershipRoleProvider. If you use custom role provider enter a type name to Custom " +
    "Role Provider.";
            this.label11.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ctlKnownRole
            // 
            this.ctlKnownRole.Location = new System.Drawing.Point(17, 439);
            this.ctlKnownRole.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlKnownRole.Name = "ctlKnownRole";
            this.ctlKnownRole.Size = new System.Drawing.Size(144, 29);
            this.ctlKnownRole.TabIndex = 21;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(13, 413);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(148, 21);
            this.label12.TabIndex = 20;
            this.label12.Text = "Known Role Provider";
            this.label12.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label13.Location = new System.Drawing.Point(402, 303);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(254, 21);
            this.label13.TabIndex = 23;
            this.label13.Text = "Quick steps for SQL Server / MySql";
            // 
            // linkLabel2
            // 
            this.linkLabel2.AutoSize = true;
            this.linkLabel2.Location = new System.Drawing.Point(90, 578);
            this.linkLabel2.Name = "linkLabel2";
            this.linkLabel2.Size = new System.Drawing.Size(128, 21);
            this.linkLabel2.TabIndex = 25;
            this.linkLabel2.TabStop = true;
            this.linkLabel2.Text = "Developers Guide";
            this.linkLabel2.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel2_LinkClicked);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(13, 578);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(71, 21);
            this.label14.TabIndex = 27;
            this.label14.Text = "Get help:";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(225, 413);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(154, 21);
            this.label15.TabIndex = 29;
            this.label15.Text = "Custom Role Provider";
            this.label15.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ctlCustomRole
            // 
            this.ctlCustomRole.Location = new System.Drawing.Point(229, 439);
            this.ctlCustomRole.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.ctlCustomRole.Name = "ctlCustomRole";
            this.ctlCustomRole.Size = new System.Drawing.Size(144, 29);
            this.ctlCustomRole.TabIndex = 31;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(180, 413);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(31, 21);
            this.label16.TabIndex = 32;
            this.label16.Text = "OR";
            // 
            // label17
            // 
            this.label17.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label17.Location = new System.Drawing.Point(401, 439);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(615, 216);
            this.label17.TabIndex = 33;
            this.label17.Text = resources.GetString("label17.Text");
            // 
            // FmProvider
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 21F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1065, 668);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.ctlCustomRole);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.linkLabel2);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.ctlGetScript);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.ctlSave);
            this.Controls.Add(this.ctlType);
            this.Controls.Add(this.ctlKnownRole);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.ctlConList);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.ctlAppName);
            this.Controls.Add(this.ctlprivRoles);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.ctlDefaultProvider);
            this.Controls.Add(this.ctlAuthorization);
            this.Controls.Add(this.ctlProviderList);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.label17);
            this.Font = new System.Drawing.Font("Segoe UI Light", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FmProvider";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "JDash Settings";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FmProvider_FormClosed);
            this.Load += new System.EventHandler(this.FmProvider_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox ctlProviderList;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox ctlConList;
        private System.Windows.Forms.TextBox ctlAppName;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button ctlSave;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox ctlDefaultProvider;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.FolderBrowserDialog browseFolder;
        private System.Windows.Forms.Label ctlType;
        private System.Windows.Forms.Button ctlGetScript;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.CheckBox ctlAuthorization;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox ctlprivRoles;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox ctlKnownRole;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.LinkLabel linkLabel2;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox ctlCustomRole;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
    }
}