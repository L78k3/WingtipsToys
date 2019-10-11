<%@ Page language="c#" Inherits="nsoftware.Demos.transactiondetailsDemo" CodeFile="transactiondetails.aspx.cs" ValidateRequest="false"%>

<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>PayPal ASP.NET - Transaction Details</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="stylesheet.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<H1>PayPal &nbsp;ASP.NET Edition - Demo Pages</H1>
			<H2>Transaction Details</H2>
			<P/>The <STRONG>TransactionDetails</STRONG> component will retrieve the details of 
				any transaction in the merchant's PayPal account.&nbsp; Simply fill in your 
				PayPal <EM>username</EM> and <EM>password</EM>, and the <EM>TransactionId</EM> field 
				and press the <EM>"Submit Request"</EM> button to download all data related to 
				that Id. This demo uses a test URL, so unless you alter the URL, you will not 
				be charged for anything here. 
				<HR SIZE="1">
			<P>
                <cc1:Transactiondetails ID="transactiondetails1" runat="server">
                </cc1:Transactiondetails>
      </P>
			<TABLE id="Table1" style="WIDTH: 664px; HEIGHT: 112px" cellSpacing="0" cellPadding="0"
				border="0">
				<TR>
					<TD style="WIDTH: 247px; HEIGHT: 10px" align="right">Username:</TD>
					<TD style="HEIGHT: 10px" vAlign="middle"><asp:textbox id="txtUsername" runat="server" Width="240px" Font-Names="Verdana" Font-Size="8pt">xtest1_1199718490_biz_api1.hotmail.com</asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 247px; HEIGHT: 20px" align="right">Password:</TD>
					<TD style="HEIGHT: 20px" vAlign="middle"><asp:textbox id="txtPassword" runat="server" Width="240px" Font-Names="Verdana" Font-Size="8pt" Wrap="False" ForeColor="Black">1199718508</asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 247px; HEIGHT: 1px" align="right">API Signature:</TD>
					<TD style="HEIGHT: 1px" vAlign="middle"><asp:textbox id="txtSignature" runat="server" Width="240px" Font-Names="Verdana" Font-Size="8pt">ArZVhsgMt2Xnh-0gEb7CLza-WEc8Anplrd01chp0nKBXOTWQFcUxhPZX</asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 247px; HEIGHT: 2px" align="right">Transaction Id:</TD>
					<TD style="HEIGHT: 2px" vAlign="middle"><asp:textbox id="txtTransToGet" runat="server" Width="240px" Font-Names="Verdana" Font-Size="8pt"
							ForeColor="Black">00T97508725253716</asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 247px; HEIGHT: 2px" align="right"></TD>
					<TD style="HEIGHT: 2px" vAlign="middle">
						<P>&nbsp;</P>
						<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:button id="btnSubmit" runat="server" Width="160px" Font-Size="8pt" Text="Submit Request"
								Font-Bold="True" onclick="btnSubmit_Click"></asp:button></P>
					</TD>
				</TR>
			</TABLE>
			<P>&nbsp;</P>
			<P>&nbsp;</P>
			<P>
				<TABLE id="Table4" style="WIDTH: 803px; HEIGHT: 291px" borderColor="#990000" cellSpacing="2"
					cellPadding="2" width="803" bgColor="beige" border="1" runat="server">
					<tr>
						<td style="WIDTH: 214px; HEIGHT: 4px" align="center">
							<DIV align="left">
								<DIV style="DISPLAY: inline; WIDTH: 133px; HEIGHT: 4px" align="center">
									<P><FONT color="#000099"><FONT color="#000099" size="1"><STRONG><U>PAYER&nbsp;INFORMATION:</U></STRONG></FONT></FONT></P>
								</DIV>
							</DIV>
						</td>
						<td style="WIDTH: 263px; HEIGHT: 4px">
							<DIV align="left">
								<DIV style="DISPLAY: inline; WIDTH: 133px; HEIGHT: 8px" align="center">
									<P><FONT color="#000099"><FONT color="#000099" size="1"><STRONG><U>PAYMENT&nbsp;INFORMATION:</U></STRONG></FONT></FONT></P>
								</DIV>
							</DIV>
						</td>
						<td style="HEIGHT: 4px">
							<DIV align="left">
								<DIV style="DISPLAY: inline; WIDTH: 128px; HEIGHT: 8px">
									<P><FONT color="#000099"><FONT color="#000099" size="1"><STRONG><U>RECIPIENT&nbsp;INFORMATION:</U></STRONG></FONT></FONT></P>
								</DIV>
							</DIV>
						</td>
					</tr>
					<TR>
						<TD style="WIDTH: 214px">
							<TABLE id="Table2" style="WIDTH: 240px; HEIGHT: 189px" cellSpacing="0" cellPadding="0"
								width="240" border="0">
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Email Address:</TD>
									<TD><asp:textbox id="txtPayerEmail" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Payer Status:</TD>
									<TD><asp:textbox id="txtPayerStatus" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Payer&nbsp;Id:</TD>
									<TD><asp:textbox id="txtPayerId" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Name</TD>
									<TD><asp:textbox id="txtPayerName" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Address 1:</TD>
									<TD><asp:textbox id="txtPayerAddress1" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Address 2:</TD>
									<TD><asp:textbox id="txtPayerAddress2" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">City:</TD>
									<TD><asp:textbox id="txtPayerCity" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">State/Prov:</TD>
									<TD><asp:textbox id="txtPayerState" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Zipcode:</TD>
									<TD><asp:textbox id="txtPayerZipCode" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Country:</TD>
									<TD><asp:textbox id="txtPayerCountry" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px" vAlign="middle" align="right">Address Status:</TD>
									<TD><asp:textbox id="txtAddressStatus" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
							</TABLE>
						</TD>
						<TD style="WIDTH: 263px">
							<TABLE id="Table3" style="WIDTH: 248px; HEIGHT: 237px" cellSpacing="0" cellPadding="0"
								width="248" border="0">
								<TR>
									<TD style="WIDTH: 122px" align="right">Transaction Id:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtTransactionId" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Payment Date:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtPaymentDate" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Trans Type:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtTransactionType" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Payment Type:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtPaymentType" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Payment Status:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtPaymentStatus" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Pending Reason:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtPendingReason" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Reason Code:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtReasonCode" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px; HEIGHT: 22px" align="right">Gross Amount:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtGrossAmount" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Fee Amount:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtFeeAmount" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Total Sales Tax:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtSalesTax" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 122px" align="right">Invoice Id:</TD>
									<TD style="WIDTH: 45px"><asp:textbox id="txtInvoiceId" runat="server" Width="142px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
							</TABLE>
						</TD>
						<TD>
							<TABLE id="Table5" style="WIDTH: 282px; HEIGHT: 63px" cellSpacing="0" cellPadding="0" width="282"
								border="0">
								<TR>
									<TD style="WIDTH: 135px; HEIGHT: 18px" align="right">Email Address:</TD>
									<TD style="HEIGHT: 18px"><asp:textbox id="txtRecipientEmail" runat="server" Width="185px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px; HEIGHT: 19px" align="right">Bus. Email:</TD>
									<TD style="HEIGHT: 19px"><asp:textbox id="txtRecipientBusiness" runat="server" Width="186px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 135px; HEIGHT: 1px" align="right">Recipient Id:</TD>
									<TD style="HEIGHT: 1px"><asp:textbox id="txtRecipientId" runat="server" Width="185px" Font-Names="Verdana" Font-Size="8pt"></asp:textbox></TD>
								</TR>
							</TABLE>
							<P>&nbsp;</P>
							<DIV style="DISPLAY: inline; WIDTH: 128px; HEIGHT: 8px">
								<P><FONT color="#000099" size="1"><STRONG><U>ITEM INFORMATION:</U></STRONG></FONT></P>
							</DIV>
							<P><asp:table id="tblList" runat="server" Width="385px" ForeColor="Navy" GridLines="Both" CellPadding="1"
									BackColor="WhiteSmoke" BorderWidth="1px" CellSpacing="1" BorderStyle="Solid" BorderColor="Silver"
									Height="4px">
									<asp:TableRow BorderColor="Gray" ForeColor="Black" ID="TableHeader" BackColor="#E0E0E0" Font-Size="Smaller">
										<asp:TableCell Text="Quantity" ID="Qty"></asp:TableCell>
										<asp:TableCell Text="Item Name" ID="ItmNm"></asp:TableCell>
										<asp:TableCell Text="Item Number" ID="ItmNmb"></asp:TableCell>
										<asp:TableCell Text="Sales Tax" ID="SalesTx"></asp:TableCell>
										<asp:TableCell Text="Options" ID="Opt"></asp:TableCell>
									</asp:TableRow>
								</asp:table></P>
						</TD>
					</TR>
				</TABLE>
			</P>
			<HR SIZE="1">
			<br>
		</form>
	</body>
</HTML>
