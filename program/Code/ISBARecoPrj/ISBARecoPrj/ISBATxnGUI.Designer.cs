namespace ISBARecoPrj
{
    partial class ISBATxnGUI
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.lUpload = new System.Windows.Forms.Label();
            this.btn_Engine = new System.Windows.Forms.Button();
            this.btn_Download_Report = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtCustomerFile = new System.Windows.Forms.TextBox();
            this.btnCustFile = new System.Windows.Forms.Button();
            this.btnCustUpload = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtTrxFile = new System.Windows.Forms.TextBox();
            this.btnTrxFile = new System.Windows.Forms.Button();
            this.btnTrxUpload = new System.Windows.Forms.Button();
            this.lRules = new System.Windows.Forms.Label();
            this.lTitle = new System.Windows.Forms.Label();
            this.btnSaveParams = new System.Windows.Forms.Button();
            this.btnLockGrid = new System.Windows.Forms.Button();
            this.dataGridViewRules = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewRules)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.lUpload);
            this.splitContainer1.Panel1.Controls.Add(this.btn_Engine);
            this.splitContainer1.Panel1.Controls.Add(this.btn_Download_Report);
            this.splitContainer1.Panel1.Controls.Add(this.groupBox2);
            this.splitContainer1.Panel1.Controls.Add(this.groupBox1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.lRules);
            this.splitContainer1.Panel2.Controls.Add(this.lTitle);
            this.splitContainer1.Panel2.Controls.Add(this.btnSaveParams);
            this.splitContainer1.Panel2.Controls.Add(this.btnLockGrid);
            this.splitContainer1.Panel2.Controls.Add(this.dataGridViewRules);
            this.splitContainer1.Size = new System.Drawing.Size(1427, 795);
            this.splitContainer1.SplitterDistance = 367;
            this.splitContainer1.TabIndex = 1;
            // 
            // lUpload
            // 
            this.lUpload.AutoSize = true;
            this.lUpload.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.lUpload.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.lUpload.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lUpload.ForeColor = System.Drawing.Color.CornflowerBlue;
            this.lUpload.Location = new System.Drawing.Point(12, 48);
            this.lUpload.Name = "lUpload";
            this.lUpload.Size = new System.Drawing.Size(146, 26);
            this.lUpload.TabIndex = 5;
            this.lUpload.Text = "Upload Facts:";
            // 
            // btn_Engine
            // 
            this.btn_Engine.Location = new System.Drawing.Point(23, 395);
            this.btn_Engine.Name = "btn_Engine";
            this.btn_Engine.Size = new System.Drawing.Size(130, 23);
            this.btn_Engine.TabIndex = 1;
            this.btn_Engine.Text = "Run Rule Engine";
            this.btn_Engine.UseVisualStyleBackColor = true;
            this.btn_Engine.Click += new System.EventHandler(this.Btn_Engine_Click_1);
            // 
            // btn_Download_Report
            // 
            this.btn_Download_Report.Location = new System.Drawing.Point(191, 395);
            this.btn_Download_Report.Name = "btn_Download_Report";
            this.btn_Download_Report.Size = new System.Drawing.Size(136, 23);
            this.btn_Download_Report.TabIndex = 2;
            this.btn_Download_Report.Text = "Download Report";
            this.btn_Download_Report.UseVisualStyleBackColor = true;
            this.btn_Download_Report.Click += new System.EventHandler(this.Btn_Download_Report_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtCustomerFile);
            this.groupBox2.Controls.Add(this.btnCustFile);
            this.groupBox2.Controls.Add(this.btnCustUpload);
            this.groupBox2.Location = new System.Drawing.Point(2, 96);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(362, 101);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Customer Upload";
            // 
            // txtCustomerFile
            // 
            this.txtCustomerFile.Location = new System.Drawing.Point(6, 45);
            this.txtCustomerFile.Name = "txtCustomerFile";
            this.txtCustomerFile.ReadOnly = true;
            this.txtCustomerFile.Size = new System.Drawing.Size(157, 20);
            this.txtCustomerFile.TabIndex = 1;
            // 
            // btnCustFile
            // 
            this.btnCustFile.Location = new System.Drawing.Point(185, 45);
            this.btnCustFile.Name = "btnCustFile";
            this.btnCustFile.Size = new System.Drawing.Size(42, 23);
            this.btnCustFile.TabIndex = 2;
            this.btnCustFile.Text = "...";
            this.btnCustFile.UseVisualStyleBackColor = true;
            this.btnCustFile.Click += new System.EventHandler(this.BtnCustFile_Click);
            // 
            // btnCustUpload
            // 
            this.btnCustUpload.Location = new System.Drawing.Point(242, 45);
            this.btnCustUpload.Name = "btnCustUpload";
            this.btnCustUpload.Size = new System.Drawing.Size(95, 23);
            this.btnCustUpload.TabIndex = 0;
            this.btnCustUpload.Text = "Cust. Upload";
            this.btnCustUpload.UseVisualStyleBackColor = true;
            this.btnCustUpload.Click += new System.EventHandler(this.BtnCustUpload_Click_1);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtTrxFile);
            this.groupBox1.Controls.Add(this.btnTrxFile);
            this.groupBox1.Controls.Add(this.btnTrxUpload);
            this.groupBox1.Location = new System.Drawing.Point(2, 229);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(368, 101);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Transaction Upload";
            // 
            // txtTrxFile
            // 
            this.txtTrxFile.Location = new System.Drawing.Point(6, 45);
            this.txtTrxFile.Name = "txtTrxFile";
            this.txtTrxFile.ReadOnly = true;
            this.txtTrxFile.Size = new System.Drawing.Size(163, 20);
            this.txtTrxFile.TabIndex = 1;
            // 
            // btnTrxFile
            // 
            this.btnTrxFile.Location = new System.Drawing.Point(191, 43);
            this.btnTrxFile.Name = "btnTrxFile";
            this.btnTrxFile.Size = new System.Drawing.Size(42, 23);
            this.btnTrxFile.TabIndex = 2;
            this.btnTrxFile.Text = "...";
            this.btnTrxFile.UseVisualStyleBackColor = true;
            this.btnTrxFile.Click += new System.EventHandler(this.BtnTrxFile_Click);
            // 
            // btnTrxUpload
            // 
            this.btnTrxUpload.Location = new System.Drawing.Point(248, 43);
            this.btnTrxUpload.Name = "btnTrxUpload";
            this.btnTrxUpload.Size = new System.Drawing.Size(95, 23);
            this.btnTrxUpload.TabIndex = 0;
            this.btnTrxUpload.Text = "Txn. Upload";
            this.btnTrxUpload.UseVisualStyleBackColor = true;
            this.btnTrxUpload.Click += new System.EventHandler(this.BtnTrxUpload_Click_1);
            // 
            // lRules
            // 
            this.lRules.AutoSize = true;
            this.lRules.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.lRules.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.lRules.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lRules.ForeColor = System.Drawing.Color.CornflowerBlue;
            this.lRules.Location = new System.Drawing.Point(8, 48);
            this.lRules.Name = "lRules";
            this.lRules.Size = new System.Drawing.Size(74, 26);
            this.lRules.TabIndex = 4;
            this.lRules.Text = "Rules:";
            // 
            // lTitle
            // 
            this.lTitle.AutoSize = true;
            this.lTitle.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.lTitle.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.lTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lTitle.ForeColor = System.Drawing.Color.CornflowerBlue;
            this.lTitle.Location = new System.Drawing.Point(308, 9);
            this.lTitle.Name = "lTitle";
            this.lTitle.Size = new System.Drawing.Size(392, 26);
            this.lTitle.TabIndex = 3;
            this.lTitle.Text = "Suspicious Transaction Recommender:";
            // 
            // btnSaveParams
            // 
            this.btnSaveParams.Location = new System.Drawing.Point(94, 608);
            this.btnSaveParams.Name = "btnSaveParams";
            this.btnSaveParams.Size = new System.Drawing.Size(75, 23);
            this.btnSaveParams.TabIndex = 2;
            this.btnSaveParams.Text = "Save";
            this.btnSaveParams.UseVisualStyleBackColor = true;
            this.btnSaveParams.Click += new System.EventHandler(this.BtnSaveParams_Click);
            // 
            // btnLockGrid
            // 
            this.btnLockGrid.Location = new System.Drawing.Point(3, 608);
            this.btnLockGrid.Name = "btnLockGrid";
            this.btnLockGrid.Size = new System.Drawing.Size(75, 23);
            this.btnLockGrid.TabIndex = 1;
            this.btnLockGrid.Text = "UnLockGrid";
            this.btnLockGrid.UseVisualStyleBackColor = true;
            this.btnLockGrid.Click += new System.EventHandler(this.BtnLockGrid_Click);
            // 
            // dataGridViewRules
            // 
            this.dataGridViewRules.AllowUserToAddRows = false;
            this.dataGridViewRules.AllowUserToDeleteRows = false;
            this.dataGridViewRules.AllowUserToOrderColumns = true;
            this.dataGridViewRules.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dataGridViewRules.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            this.dataGridViewRules.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewRules.Enabled = false;
            this.dataGridViewRules.Location = new System.Drawing.Point(3, 96);
            this.dataGridViewRules.MultiSelect = false;
            this.dataGridViewRules.Name = "dataGridViewRules";
            this.dataGridViewRules.Size = new System.Drawing.Size(1034, 496);
            this.dataGridViewRules.TabIndex = 0;
            this.dataGridViewRules.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.DataGridViewRules_CellValueChanged);
            // 
            // ISBATxnGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1427, 795);
            this.Controls.Add(this.splitContainer1);
            this.Name = "ISBATxnGUI";
            this.Text = "Suspicious Transaction Identifier";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ISBATxnGUI_FormClosing);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewRules)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button btn_Engine;
        private System.Windows.Forms.Button btn_Download_Report;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtCustomerFile;
        private System.Windows.Forms.Button btnCustFile;
        private System.Windows.Forms.Button btnCustUpload;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtTrxFile;
        private System.Windows.Forms.Button btnTrxFile;
        private System.Windows.Forms.Button btnTrxUpload;
        private System.Windows.Forms.Button btnSaveParams;
        private System.Windows.Forms.Button btnLockGrid;
        private System.Windows.Forms.DataGridView dataGridViewRules;
        private System.Windows.Forms.Label lUpload;
        private System.Windows.Forms.Label lRules;
        private System.Windows.Forms.Label lTitle;
    }
}

