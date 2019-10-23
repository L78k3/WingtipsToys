<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WingtipToys.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Shopping Cart</h1></div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="WingtipToys.Models.CartItem" SelectMethod="GetShoppingCartItems" 
        CssClass="table table-striped table-bordered" >   
        <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />        
        <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
        <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField   HeaderText="Quantity">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Item Total">            
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>        
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Remove Item">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong> 
    </div>

    <br />
    <table> 
    <tr>
      <td>
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
      </td>
        <!-- This is the old paypal checkout method. It's supposed to work, but it was deprecated sometime in 2017.
      <td>
        <asp:ImageButton ID="CheckoutImageBtn" runat="server" 
                      ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" 
                      Width="145" AlternateText="Check out with PayPal" 
                      OnClick="CheckoutBtn_Click" 
                      BackColor="Transparent" BorderWidth="0" />
      </td>
        -->
      <td>
    
          <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>
      </td>
    </tr>
    </table>
        <input type="hidden" name="username" id="username"/>
        <input type="hidden" name="firstname" id="firstname" />
        <input type="hidden" name="lastname" id="lastname"/>
        <input type="hidden" name="address" id="address"/>
        <input type="hidden" name="city" id="city"/>
        <input type="hidden" name="state" id="state"/>
        <input type="hidden" name="postalcode" id="postalcode" />
        <input type="hidden" name="country" id="country"/>
        <input type="hidden" name="email" id="email" />
        <input type="hidden" name="total" id="total" />
        <button type="submit" formaction="https://localhost:44300/Checkout/CheckoutReview.aspx" formmethod="post" id="checkoutForm" style="visibility:hidden"></button>
<!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=GBP"></script>

    <script>
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }
        var x = <%=lblTotal.Text.Replace("£","")%>;
        var total = x.toString();
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function (data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: total
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                    console.log(details)
                    //write shit to cookie, open next page, pull from cookie, profit
                    setCookie('username', details.payer.payer_id)
                    setCookie('firstname', details.payer.name.given_name)
                    setCookie('lastname', details.payer.name.surname)
                    setCookie('address', details.payer.address.address_line_1)
                    setCookie('city', details.payer.address.admin_area_2)
                    setCookie('state', details.payer.address.admin_area_1)
                    setCookie('postalcode', details.payer.address.postal_code)
                    setCookie('country', details.payer.address.country_code)
                    setCookie('email', details.payer.email_address)
                    setCookie('total', details.purchase_units[0].amount.value)
                    setCookie('timestamp', details.update_time)
                    setCookie('transactionID', details.id)

                    window.location.href = "https://localhost:44300/checkout/checkoutreview";


                    //document.open("https://localhost:44300/checkout/checkoutreview")
                    //document.getElementById('username').value = details.payer.payer_id;
                    //document.getElementById('firstname').value = details.payer.name.given_name;
                    //document.getElementById('lastname').value = details.payer.name.surname;
                    //document.getElementById('address').value = details.payer.address.address_line_1;
                    //document.getElementById('city').value = details.payer.address.admin_area_2;
                    //document.getElementById('state').value = details.payer.address.admin_area_1;
                    //document.getElementById('postalcode').value = details.payer.address.postal_code;
                    //document.getElementById('country').value = details.payer.address.country_code;
                    //document.getElementById('email').value = details.payer.email_address;
                    //document.getElementById('total').value = details.purchase_units[0].amount.value
                    //document.getElementById('checkoutForm').submit();

                });
            }


        }).render('#paypal-button-container');
    </script>
</asp:Content>
