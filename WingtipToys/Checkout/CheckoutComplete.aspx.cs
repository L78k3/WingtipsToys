using System;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using WingtipToys.Models;
namespace WingtipToys.Checkout
{
    public partial class CheckoutComplete : System.Web.UI.Page
    {
        public static string GetFromCookie(string cookieName, string keyName)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[cookieName];
            if (cookie != null)
            {
                string val = (!String.IsNullOrEmpty(keyName)) ? cookie[keyName] : cookie.Value;
                if (!String.IsNullOrEmpty(val)) return Uri.UnescapeDataString(val);
            }
            return null;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verify user has completed the checkout process.
                if ((string)Session["userCheckoutCompleted"] != "true")
                {
                    Session["userCheckoutCompleted"] = string.Empty;
                    Response.Redirect("CheckoutError.aspx?" + "Desc=Unvalidated%20Checkout.");
                }
                NVPAPICaller payPalCaller = new NVPAPICaller();
                string retMsg = "";
                string token = "";
                string finalPaymentAmount = "";
                string PayerID = "";
                NVPCodec decoder = new NVPCodec();
                //token = Session["token"].ToString();
                PayerID = Session["payerId"].ToString();
                finalPaymentAmount = GetFromCookie("total", null).ToString();
                //bool ret = payPalCaller.DoCheckoutPayment(finalPaymentAmount, token, PayerID, ref decoder, ref retMsg);
                if (true)
                {
                    // Retrieve PayPal confirmation value.
                    string PaymentConfirmation = GetFromCookie("transactionID", null).ToString();
                    TransactionId.Text = PaymentConfirmation;
                    ProductContext _db = new ProductContext();
                    // Get the current order id.
                    
                    // Clear shopping cart.
                    using (WingtipToys.Logic.ShoppingCartActions usersShoppingCart = new WingtipToys.Logic.ShoppingCartActions())
                    {
                        usersShoppingCart.EmptyCart();
                    }
                    // Clear order id.
                    Session["currentOrderId"] = string.Empty;
                }
                else
                {
                    Response.Redirect("CheckoutError.aspx?" + retMsg);
                }
            }
        }
        protected void Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
