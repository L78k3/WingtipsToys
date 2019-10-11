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
	/// Summary description for transactiondetails.
	/// </summary>
public partial class transactiondetailsDemo : System.Web.UI.Page
	{
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
      this.transactiondetails1 = new nsoftware.InPayPal.Transactiondetails(this.components);
    }
    #endregion	

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (! IsPostBack)
			{
				Table4.Visible = false;
			}
    }

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			btnSubmit.Enabled = false;
      transactiondetails1.URL = "https://api-3t.sandbox.paypal.com/nvp";   //Test server URL
      transactiondetails1.User =txtUsername.Text;
      transactiondetails1.Password = txtPassword.Text;
      transactiondetails1.Signature = txtSignature.Text;
      transactiondetails1.GetTransactionDetails(txtTransToGet.Text);

      FillFormFields();
      btnSubmit.Enabled = true;
      Table4.Visible = true;
		}

		private void FillFormFields()
		{
      txtRecipientBusiness.Text = transactiondetails1.Payer.Business;
      txtRecipientEmail.Text = transactiondetails1.RecipientEmail;
      txtRecipientId.Text = transactiondetails1.RecipientId;

      txtPayerEmail.Text = transactiondetails1.Payer.Email;
      txtPayerId.Text = transactiondetails1.Payer.Id;
      txtPayerStatus.Text = transactiondetails1.Payer.Status;
      txtPayerCity.Text = transactiondetails1.Payer.City;
      txtPayerCountry.Text = transactiondetails1.Payer.CountryName + " (" + transactiondetails1.Payer.CountryCode + ")";
      txtPayerZipCode.Text = transactiondetails1.Payer.Zip;
      txtPayerState.Text = transactiondetails1.Payer.State;
      txtAddressStatus.Text = transactiondetails1.Payer.AddressStatus;
      txtPayerAddress1.Text = transactiondetails1.Payer.Street1;
      txtPayerAddress2.Text = transactiondetails1.Payer.Street2;
      txtPayerName.Text = transactiondetails1.Payer.AddressName;

      txtPaymentDate.Text = transactiondetails1.Payment.Date;
      txtPaymentStatus.Text = transactiondetails1.Payment.Status;
      txtPaymentType.Text = transactiondetails1.Payment.PaymentType;
      txtPendingReason.Text = transactiondetails1.Payment.PendingReason;
      txtReasonCode.Text = transactiondetails1.ReasonCode;
      txtGrossAmount.Text = transactiondetails1.Payment.GrossAmount;
      txtTransactionId.Text = transactiondetails1.Payment.TransactionId;
      txtTransactionType.Text = transactiondetails1.Payment.TransactionType;
      txtFeeAmount.Text = transactiondetails1.Payment.FeeAmount;

      txtSalesTax.Text = transactiondetails1.SalesTax;
      txtInvoiceId.Text = transactiondetails1.InvoiceId;

      for (int i = 0; i<= transactiondetails1.Items.Count - 1; i++)
			{
        tblList.Rows.Add(new TableRow());
        tblList.Rows[i + 1].Cells.Add(new TableCell());
        tblList.Rows[i + 1].Cells[0].Text = transactiondetails1.Items[i].Quantity.ToString();
        tblList.Rows[i + 1].Cells.Add(new TableCell());
        tblList.Rows[i + 1].Cells[1].Text = transactiondetails1.Items[i].Name;
        tblList.Rows[i + 1].Cells.Add(new TableCell());
        tblList.Rows[i + 1].Cells[2].Text = transactiondetails1.Items[i].Number;
        tblList.Rows[i + 1].Cells.Add(new TableCell());
        tblList.Rows[i + 1].Cells[3].Text = transactiondetails1.Items[i].SalesTax;
        tblList.Rows[i + 1].Cells.Add(new TableCell());
        tblList.Rows[i + 1].Cells[4].Text = transactiondetails1.Items[i].Options;
      }
	}
}
}
