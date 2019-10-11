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
  /// Summary description for ExpressCheckout.
  /// </summary>
    public partial class expresscheckoutDemo : System.Web.UI.Page
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
      this.expresscheckout1 = new nsoftware.InPayPal.Expresscheckout(this.components);
      // 
      // expresscheckout1
      // 
      this.expresscheckout1.About = "";
      this.expresscheckout1.PaymentAction = nsoftware.InPayPal.ExpresscheckoutPaymentActions.aSale;

    }
    #endregion

    //IMPORTANT: In order to use this sample with the PayPal sandbox you must first login 
    //to PayPal Developer Central at https://developer.paypal.com.  In addition, you you'll 
    //need to have at least&nbsp;two sandbox test account configured.  One of othese sandbox 
    //test accounts must be a business account.  This will be your API account.  Your API 
    //username, password, and certificate must be provided as inputs to the ExpressCheckout 
    //component in Page_Load function of this demo.  The other sandbox test account(s) can be 
    //used as the test payer.

    private const string SandboxAPIUsername = "sb-vkain326712_api1.personal.example.com";
    private const string SandboxAPIPassword = "6TMJWJQ9AWJ2SETR";
    private const string APISignature = "AujTvHNHq3fCgLKJNH3XnSe2GJIRALxuVNR23htYrD6ftsY0VtLmyBeJ";

    protected void Page_Load(object sender, System.EventArgs e)
    {
      // Put user code to initialize the page here
      //Put user code to initialize the page here
      //My sandbox test account:
      expresscheckout1.URL = "https://api-3t.sandbox.paypal.com/nvp"; //Test server URL
      expresscheckout1.User = SandboxAPIUsername;
      expresscheckout1.Password = SandboxAPIPassword;
      expresscheckout1.Signature = APISignature;

      if (Request.QueryString["status"] == "paid")
      {
        CompletePayment(Request.QueryString["token"]);
      }
      else if (Request.QueryString["status"] == "cancelled")
      {
        Cancel();
      }
    }

    protected void bCharge_Click(object sender, System.EventArgs e)
    {
      expresscheckout1.OrderTotal = "45.00";
      string currentpath = "http://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + Request.ServerVariables["PATH_INFO"];
      expresscheckout1.ReturnURL = currentpath + "?status=paid";
      expresscheckout1.CancelURL = currentpath + "?status=cancelled";
      expresscheckout1.PaymentAction = ExpresscheckoutPaymentActions.aSale;
      expresscheckout1.BuyerEmail = txtEmail.Text;
      expresscheckout1.SetCheckout();

      string responsetoken = expresscheckout1.ResponseToken;
      Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=" + responsetoken);
    }

    private void CompletePayment(string token)
    {
      expresscheckout1.Token = token;
      expresscheckout1.GetCheckoutDetails();

      if (expresscheckout1.Ack.Equals("Success"))
      {
        pnlCart.Visible = false;
        pnlComplete.Visible = true;

        //The "Payer" properties contain information about the payer
        lblPayerName.Text = expresscheckout1.Payer.FirstName + " " + expresscheckout1.Payer.LastName;
        lblPayerEmail.Text = expresscheckout1.Payer.Email;

        //capture the payment
        expresscheckout1.PaymentAction = ExpresscheckoutPaymentActions.aSale;
        expresscheckout1.Token = token;
        expresscheckout1.OrderTotal = "45.00";
        expresscheckout1.CheckoutPayment();

        //The "Payment" properties contain information about the payment
        lblDate.Text = expresscheckout1.Payment.Date;
        lblGrossAmount.Text = expresscheckout1.Payment.GrossAmount;
        lblFee.Text = expresscheckout1.Payment.FeeAmount;
      }
      else
      {
        HandleError("PayPal: " + expresscheckout1.Ack + ", Payment Status: " + expresscheckout1.Payment.Status);
      }
    }

    private void Cancel()
    {
      //output cancellation page
      pnlCart.Visible = false;
      pnlCancel.Visible = true;
    }

    private void HandleError(string details)
    {
      pnlCart.Visible = false;
      pnlError.Visible = true;
      lblError.Text = details;
    }

  }
}
