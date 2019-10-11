using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace nsoftware.Demos
{

    public partial class getbalanceDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void bGetBalance_Click(object sender, EventArgs e)
        {
            try
            {
                paypalrequest1.URL = "https://api-3t.sandbox.paypal.com/nvp"; //Test Server URL
                paypalrequest1.User = txtUsername.Text;
                paypalrequest1.Password = txtPassword.Text;
                paypalrequest1.Signature = txtSignature.Text;

                paypalrequest1.Method = "GetBalance";
                paypalrequest1.AddRequestParam("RETURNALLCURRENCIES", "1");

                paypalrequest1.SendRequest();

                string result = "Ack  : " + paypalrequest1.Ack + "<BR>";
                result += "Balance  : " + paypalrequest1.GetResponseParam("L_AMT0") + " (" + paypalrequest1.GetResponseParam("L_CURRENCYCODE0") + ")<BR>";

                pnlMain.Visible = false;
                Literal1.Text = result;
                pnlResults.Visible = true;

            }
            catch (nsoftware.InPayPal.InPayPalException ex1)
            {
                Response.Write("Error Details:" + ex1.Code.ToString() + ": " + ex1.Message);
            }
        }
}
}
