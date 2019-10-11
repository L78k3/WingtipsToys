using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace nsoftware.Demos
{
	/// <summary>
	/// Summary description for masspay.
	/// </summary>
public partial class masspayDemo : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Table tblList1;
		private System.ComponentModel.IContainer components;

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
      //
      // CODEGEN: This call is required by the ASP.NET Web Form Designer.
      //
      InitializeComponent();
      base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
      this.components = new System.ComponentModel.Container();
      this.masspay1 = new nsoftware.InPayPal.Masspay(this.components);
    }
    #endregion

		protected void Page_Load(object sender, System.EventArgs e)
		{
			tblList1 = ( System.Web.UI.WebControls.Table)Session["display"];
			if (tblList1 != null) 
			{
				Display_Table();
			}
			else
			{
				Session.Add("display", tblList);
			}
		
			if (! IsPostBack) 
			{

				tblList.Rows.Add(new TableRow());
				tblList.Rows[1].Cells.Add(new TableCell());
				tblList.Rows[1].Cells[0].Text = "AkiraKurosawa@nsoftware.com";
				tblList.Rows[1].Cells.Add(new TableCell());
				tblList.Rows[1].Cells[1].Text = "10.00";
				tblList.Rows[1].Cells.Add(new TableCell());
				tblList.Rows[1].Cells[2].Text = "USD";
				tblList.Rows[1].Cells.Add(new TableCell());
				tblList.Rows[1].Cells[3].Text = "123456789";
				tblList.Rows[1].Cells.Add(new TableCell());
				tblList.Rows[1].Cells[4].Text = "Test payment.";

				tblList.Rows.Add(new TableRow());
				tblList.Rows[2].Cells.Add(new TableCell());
				tblList.Rows[2].Cells[0].Text = "hide@nsoftware.com";
				tblList.Rows[2].Cells.Add(new TableCell());
				tblList.Rows[2].Cells[1].Text = "23.76";
				tblList.Rows[2].Cells.Add(new TableCell());
				tblList.Rows[2].Cells[2].Text = "USD";
				tblList.Rows[2].Cells.Add(new TableCell());
				tblList.Rows[2].Cells[3].Text = "987654321";
				tblList.Rows[2].Cells.Add(new TableCell());
				tblList.Rows[2].Cells[4].Text = "Test payment.";

				tblList.Rows.Add(new TableRow());
				tblList.Rows[3].Cells.Add(new TableCell());
				tblList.Rows[3].Cells[0].Text = "testmerchant@nsoftware.com";
				tblList.Rows[3].Cells.Add(new TableCell());
				tblList.Rows[3].Cells[1].Text = "34.76";
				tblList.Rows[3].Cells.Add(new TableCell());
				tblList.Rows[3].Cells[2].Text = "USD";
				tblList.Rows[3].Cells.Add(new TableCell());
				tblList.Rows[3].Cells[3].Text = "8675309";
				tblList.Rows[3].Cells.Add(new TableCell());
				tblList.Rows[3].Cells[4].Text = "Test payment.";

				lblTrsmStatus.Visible = false;
				Table2.Visible = false;
			}
		}

		protected void btnSend_Click(object sender, System.EventArgs e)
		{
			btnSend.Enabled = false;

			//Set the test server url and merchant username and password.
			masspay1.URL = "https://api-3t.sandbox.paypal.com/nvp";   //Test server URL
			masspay1.User =txtUsername.Text;
			masspay1.Password = txtPassword.Text;
      masspay1.Signature = txtSignature.Text;

			for (int i = 1; i<=tblList.Rows.Count - 1; i++)
			{
        masspay1.Transactions.Add(new nsoftware.InPayPal.MassPayTransaction());
        masspay1.Transactions[i - 1].RecipientEmail = tblList.Rows[i].Cells[0].Text;
				masspay1.Transactions[i-1].Amount = tblList.Rows[i].Cells[1].Text;
        masspay1.Transactions[i - 1].TransactionId = tblList.Rows[i].Cells[3].Text;
        masspay1.Transactions[i - 1].Note = tblList.Rows[i].Cells[4].Text;
			}

			//This is the subject that will appear in the email sent by PayPal to each recipient.
			masspay1.EmailSubject = "Notification of test payment.";

			masspay1.SendMassPayment();
			for (int i = 1; i<=tblList.Rows.Count - 1; i++)
			{
				tblList.Rows[i].Cells.Clear();
			}
			lblTrsmStatus.Text = "Transmission Status: " + masspay1.Ack + "!";
			lblTrsmStatus.Visible = true;
			btnSend.Enabled = false;
		}

		protected void btnClear_Click(object sender, System.EventArgs e)
		{
			Session.Add("display", tblList);

			for (int i = 1; i<=tblList.Rows.Count - 1; i++)
			{
				for (int j = tblList.Rows[i].Cells.Count - 1; j>=0; j--)
				{
					tblList.Rows[i].Cells.RemoveAt(j);
				}
      	tblList.Rows.Clear();
			}
		}

		protected void btnRemove_Click(object sender, System.EventArgs e)
		{
			Panel1.Enabled = false;
			Label1.Visible = false;
			Panel2.Visible = true;
		}

		protected void btnNew_Click(object sender, System.EventArgs e)
		{
			lblTrsmStatus.Visible = false;
			Panel1.Enabled = false;
			Table2.Visible = true;
		}

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			Session.Add("display", tblList);

			tblList.Rows.Add(new TableRow());
			int idx = tblList.Rows.Count - 1;
			tblList.Rows[idx].Cells.Add(new TableCell());
			tblList.Rows[idx].Cells[0].Text = txtEmail.Text;
			tblList.Rows[idx].Cells.Add(new TableCell());
			tblList.Rows[idx].Cells[1].Text = txtAmount.Text;
			tblList.Rows[idx].Cells.Add(new TableCell());
			tblList.Rows[idx].Cells[2].Text = ddlCurrency.SelectedItem.ToString();
			tblList.Rows[idx].Cells.Add(new TableCell());
			tblList.Rows[idx].Cells[3].Text = txtUniqueId.Text;
			tblList.Rows[idx].Cells.Add(new TableCell());
			tblList.Rows[idx].Cells[4].Text = txtNote.Text;

			txtEmail.Text = "";
			txtAmount.Text = "";
			txtUniqueId.Text = "";
			txtNote.Text = "";
			ddlCurrency.SelectedIndex = 0;
			Table2.Visible = false;
			btnSend.Enabled = true;
			Panel1.Enabled = true;
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
			txtEmail.Text = "";
			txtAmount.Text = "";
			txtUniqueId.Text = "";
			txtNote.Text = "";
			ddlCurrency.SelectedIndex = 0;
			Table2.Visible = false;
			Panel1.Enabled = true;
		}
		
		private void Display_Table()
		{
			for (int i = 1; i<=tblList1.Rows.Count - 1; i++)
			{
				tblList.Rows.Add(new TableRow());
				for (int j = 0; j<= tblList1.Rows[i].Cells.Count - 1; j++)
				{
					tblList.Rows[i].Cells.Add(new TableCell());
					tblList.Rows[i].Cells[j].Text = tblList1.Rows[i].Cells[j].Text;
				}
			}
		}

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			Session.Add("display", tblList);

      for (int i = 1; i<=tblList.Rows.Count - 1; i++)
			{
				if (tblList.Rows[i].Cells[3].Text == txtUniqId.Text)
				{
					for (int j = tblList.Rows[i].Cells.Count - 1; j>=0; j--)
					{
						tblList.Rows[i].Cells.RemoveAt(j);
					}
          tblList.Rows.RemoveAt(i);
					i = tblList.Rows.Count;
				}
			}
      Panel1.Enabled = true;
      Panel2.Visible = false;
      Label1.Visible = true;
      txtUniqId.Text = "";
		}
	}
}
