ï»¿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using nsoftware.InPayPal;


namespace nsoftware.Demos
{
  public partial class adaptivepayDemo : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btCreatePayment_Click(object sender, EventArgs e)
    {
      try
      {
        Adaptivepay pay = new Adaptivepay();
        pay.URL = "https://svcs.sandbox.paypal.com";
        pay.User = txtUser.Text;
        pay.Password = txtPassword.Text;
        pay.Signature = txtSignature.Text;
        pay.ApplicationId = txtApplicationId.Text;
        pay.OnSSLServerAuthentication += new Adaptivepay.OnSSLServerAuthenticationHandler(delegate(object sender1, AdaptivepaySSLServerAuthenticationEventArgs e1) { e1.Accept = true; });
        pay.Config("TransferredRequest=On");
        pay.SenderEmail = txtSenderEmail.Text;

        if (txtRecipientemail1.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail1.Text, txtRecipientamount1.Text, txtRecipientphone1.Text));
        }

        if (txtRecipientemail2.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail2.Text, txtRecipientamount2.Text, txtRecipientphone2.Text));
        }

        if (txtRecipientemail3.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail3.Text, txtRecipientamount3.Text, txtRecipientphone3.Text));
        }

        pay.CurrencyCode = txtCurrency.Text;
        pay.FeesPayer = (AdaptivepayFeesPayers)combFeesPayer.SelectedIndex;
        pay.Memo = txtMemo.Text;
        pay.CancelURL = "http://your_cancel_url";
        pay.ReturnURL = "http://your_return_url";
        pay.NotificationURL = "http://your_notification_url";
        pay.CreatePayment();

        string result = "Ack  : " + pay.Ack + "<BR>";
        result += "PaymentStatus: " + pay.PaymentStatus + "<BR>";
        result += "PaymentKey: " + pay.PaymentKey + "<BR>";
        result += "TimeStamp: " + pay.TimeStamp + "<BR>";

        pnlResults.Visible = true;
        Literal1.Text = result;
      }
      catch (Exception ex)
      {
        pnlResults.Visible = true;
        Literal1.Text = ex.Message;
      }

    }
    protected void btPay_Click(object sender, EventArgs e)
    {
      try
      {
        Adaptivepay pay = new Adaptivepay();
        pay.URL = "https://svcs.sandbox.paypal.com";
        pay.User = txtUser.Text;
        pay.Password = txtPassword.Text;
        pay.Signature = txtSignature.Text;
        pay.ApplicationId = txtApplicationId.Text;
        pay.OnSSLServerAuthentication += new Adaptivepay.OnSSLServerAuthenticationHandler(delegate(object sender1, AdaptivepaySSLServerAuthenticationEventArgs e1) { e1.Accept = true; });
        pay.Config("TransferredRequest=On");
        pay.SenderEmail = txtSenderEmail.Text;

        if (txtRecipientemail1.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail1.Text, txtRecipientamount1.Text, txtRecipientphone1.Text));
        }

        if (txtRecipientemail2.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail2.Text, txtRecipientamount2.Text, txtRecipientphone2.Text));
        }

        if (txtRecipientemail3.Text != "")
        {
          pay.Recipients.Add(new Recipient(txtRecipientemail3.Text, txtRecipientamount3.Text, txtRecipientphone3.Text));
        }

        pay.CurrencyCode = txtCurrency.Text;
        pay.FeesPayer = (AdaptivepayFeesPayers)combFeesPayer.SelectedIndex;
        pay.Memo = txtMemo.Text;
        pay.CancelURL = "http://your_cancel_url";
        pay.ReturnURL = "http://your_return_url";
        pay.NotificationURL = "http://your_notification_url";
        pay.Pay();

        string result = "Ack  : " + pay.Ack + "<BR>";
        result += "PaymentStatus: " + pay.PaymentStatus + "<BR>";
        result += "PaymentKey: " + pay.PaymentKey + "<BR>";
        result += "TimeStamp: " + pay.TimeStamp + "<BR>";

        pnlResults.Visible = true;
        Literal1.Text = result;
      }
      catch (Exception ex)
      {
        pnlResults.Visible = true;
        Literal1.Text = ex.Message;
      }
    }
  }

}