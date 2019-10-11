<%@ Page language="c#" Inherits="nsoftware.Demos.adaptivepayDemo" CodeFile="adaptivepay.aspx.cs" ValidateRequest="false"%>
<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>PayPal ASP.NET - AdaptivePay</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<link href="stylesheet.css" type="text/css" rel="stylesheet" />
	  <style type="text/css">
      .style6
      {
        width: 99px;
      }
    </style>
	  </head>
	<body>
		<form id="Form1" method="post" runat="server">
			<h1>PayPal nbsp;ASP.NET Edition - Demo Pages</h1>
			<h2>AdaptivePay</h2>
			<p/>This demo shows the use of the AdaptivePay component to create and 
			    execute a payment from a Paypal account.  To test with your own 
			    accounts, you must first sign up with PayPal and enable API access. 
			    For more details see <a href="https://www.x.com/community/ppx/testing">https://www.x.com/community/ppx/testing</a>
				<HR SIZE="1">
				<BR>
			<P>
        <cc1:Adaptivepay ID="adaptivepay1" runat="server">
        </cc1:Adaptivepay>
      </P>
      <center>
			<asp:Panel id="pnlMain" runat="server" Width="605px" Height="456px">
				<TABLE id="Table4" cellSpacing="3" cellPadding="4" border="0">
					<TR><th colspan="4" nowrap>
						API Configuration
					</th><tr>
						<td align="right">API Username:</td>
						<td align="left" colspan="4">
							<asp:TextBox ID="txtUser" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Width="390px">xtest1_1199718490_biz_api1.hotmail.com</asp:TextBox></td>
					</tr><tr>
						<td align="right">API Password:</td>
						<td align="left" colspan="4">
							<asp:TextBox ID="txtPassword" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Width="390px">1199718508</asp:TextBox></td>
					</tr><tr>
						<td align="right">API Signature:</td>
						<td align="left" colspan="4">
							<asp:TextBox ID="txtSignature" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Width="390px">ArZVhsgMt2Xnh-0gEb7CLza-WEc8Anplrd01chp0nKBXOTWQFcUxhPZX</asp:TextBox></td>
					</tr><tr>
						<td align="right">ApplicationId:</td>
						<td align="left" colspan="4">
							<asp:TextBox ID="txtApplicationId" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Width="390px">APP-80W284485P519543T</asp:TextBox></td>
					</tr><tr>
							<th colspan="4" nowrap>
								Payment Info
							</th>
						</tr><tr>
							<td align="right" nowrap>SenderEmail:</td>
							<td align="left" colspan="3" nowrap>
								<asp:TextBox ID="txtSenderEmail" runat="server" width="389px">xtest1_1199718490_biz@hotmail.com</asp:TextBox></td>
						</tr><tr>
							<td align="right" nowrap>FeesPayer:</td>
							<td align="left" nowrap>
								<asp:DropDownList ID="combFeesPayer" runat="server" align="left" 
            Width="250px">
									<asp:ListItem Selected="True" Value="0">NotSet</asp:ListItem>
									<asp:ListItem Value="1">Sender</asp:ListItem>
									<asp:ListItem Value="2">PrimaryRecipient</asp:ListItem>
									<asp:ListItem Value="3">EachRecipient</asp:ListItem>
									<asp:ListItem Value="4">SecondaryOnly</asp:ListItem>
								</asp:DropDownList>
								<td align="left" colspan="2">Currency:
								<asp:TextBox ID="txtCurrency" runat="server" width="40px">USD</asp:TextBox>
								</td>
								</td>
						</tr><tr>
							<td align="right" height="31" nowrap>Memo:</td>
							<td align="left" colspan="3">
								<asp:TextBox ID="txtMemo" runat="server" Height="65px" 
            TextMode="MultiLine" Width="389px">Simple payment example.</asp:TextBox></td>
						</tr>
						<tr>
                <th>Recipients</th>
                <th>E-Mail</th>
                <th>Amout</th>
                <th>Phone#</th>
						</tr><tr><td></td><td><asp:TextBox ID="txtRecipientemail1" runat="server" 
              value="nsoft_1277741956_biz@hotmail.com" Width="241px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientamount1" runat="server" size="10" value="5.0" 
                Width="76px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientphone1" runat="server" size="10" Width="76px" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <asp:TextBox ID="txtRecipientemail2" runat="server" Width="241px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientamount2" runat="server" Width="76px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientphone2" runat="server" Width="76px" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <asp:TextBox ID="txtRecipientemail3" runat="server" Width="241px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientamount3" runat="server" Width="76px" />
            </td>
            <td>
              <asp:TextBox ID="txtRecipientphone3" runat="server" Width="76px" />
            </td>
          </tr>
          </TD>
          </TR>
					<TR><TD align="right" colspan="4"><asp:Button ID="btCreatePayment" 
            runat="server" onclick="btCreatePayment_Click" Text="CreatePayment" />
          <asp:Button ID="btPay" runat="server" onclick="btPay_Click" Text="Pay" 
            Width="85px" />
          </TD></TR>
					<TR></TR>
				</TABLE>
			<asp:Panel id="pnlResults" runat="server" Width="605px" Visible="False" Height="235px">&nbsp; 
<asp:Literal id="Literal1" runat="server"></asp:Literal></asp:Panel>
			</asp:Panel>
			</center>
		</form>
	</body>
</html>
