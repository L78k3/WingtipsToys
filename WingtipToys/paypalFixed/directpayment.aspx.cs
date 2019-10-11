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
using nsoftware.InPayPal;

namespace nsoftware.Demos
{
	/// <summary>
	/// Summary description for directpayment.
	/// </summary>
public partial class directpaymentDemo : System.Web.UI.Page
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
      this.directpayment1 = new nsoftware.InPayPal.Directpayment(this.components);

    }
    #endregion

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		protected void bCharge_Click(object sender, System.EventArgs e)
		{
			directpayment1.URL = "https://api-3t.sandbox.paypal.com/nvp"; //Test server URL    
			directpayment1.User =txtUsername.Text;
			directpayment1.Password = txtPassword.Text;
            directpayment1.Signature = txtSignature.Text;    

			directpayment1.OrderTotal = txtOrderTotal.Text;
			directpayment1.OrderDescription = txtOrderDescription.Text;

      directpayment1.Card.CardType = CardTypes.ccVisa;
			directpayment1.Card.Number = txtCardNumber.Text;
			directpayment1.Card.ExpMonth = ddlCardExpMonth.SelectedIndex + 1;
			directpayment1.Card.ExpYear = Convert.ToInt32(ddlCardExpYear.SelectedItem.Value);
			directpayment1.Card.CVV = txtCardCVV2.Text;
    
			directpayment1.Payer.FirstName = txtCustomerFirstName.Text;
			directpayment1.Payer.LastName = txtCustomerLastName.Text;
			directpayment1.Payer.Street1 = txtCustomerAddress.Text;
			directpayment1.Payer.City = txtCustomerCity.Text;
			directpayment1.Payer.State = txtCustomerState.Text;
			directpayment1.Payer.Zip = txtCustomerZip.Text;
			directpayment1.Payer.IPAddress = "127.0.0.1"; //IP Address of customer
    
			try
			{
				directpayment1.Sale();
			
				string result = "Ack  : " + directpayment1.Ack + "<BR>";
				result += "Amt  : " + directpayment1.Response.Amount + "<BR>";
				result += "AVS  : " + directpayment1.Response.AVS + "<BR>";
				result += "CVV  : " + directpayment1.Response.CVV + "<BR>";
				result += "TxnId: " + directpayment1.Response.TransactionId;
				
				pnlMain.Visible = false;
				Literal1.Text = result;
				pnlResults.Visible = true;
				
			} catch (InPayPalException ex1)
			{
    			Response.Write("Error Details:" + ex1.Code.ToString() + ": " + ex1.Message);
			} 		
		}
	}
}
