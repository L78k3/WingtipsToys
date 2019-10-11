<%@ Page language="c#" Inherits="nsoftware.Demos.expresscheckoutDemo" CodeFile="expresscheckout.aspx.cs" ValidateRequest="false"%>

<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>PayPal ASP.NET - ExpressCheckout</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="stylesheet.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<H1>PayPal &nbsp;ASP.NET Edition - Demo Pages</H1>
			<H2>ExpressCheckout</H2>
			<P/>This demo shows how to use the&nbsp;<STRONG>ExpressCheckout</STRONG> component 
				to allow customers to quickly provide payment through PayPal.&nbsp;&nbsp;Simply 
				fill in your PayPal API username, password, and API certificate below,&nbsp;and 
				then press <EM>Submit</EM>.&nbsp; This demo uses a test URL, so unless you 
				alter the URL, you will not be charged for anything here.
				<HR>
				<asp:Panel id="pnlCart" runat="server" Width="748px" Height="166px">
					<TABLE id="Table4" cellSpacing="2" cellPadding="5" border="0">
						<TR>
							<TH noWrap colSpan="2">
								API Information:
							</TH>
						<TR>
							<TD align="left">
								<P><FONT color="#ff0000">IMPORTANT</FONT>:&nbsp; In order to use this sample with 
									the PayPal sandbox you must first login to PayPal Developer Central at
									<asp:HyperLink id="HyperLink1" runat="server" NavigateUrl="https://developer.paypal.com">https://developer.paypal.com</asp:HyperLink>.&nbsp; 
									In addition, you you'll need to have at least&nbsp;two sandbox test account 
									configured.&nbsp; One of these sandbox test accounts must be a business 
									account.&nbsp; This will be your API account.&nbsp; Your API username, 
									password, and signature must be provided as inputs to the ExpressCheckout 
									component in Page_Load function of this demo.&nbsp; The other sandbox test 
									account(s) can be used as the test payer.</P>
							</TD>
						</TR>
						<TR>
							<TD colSpan="2">
								<P>
								<TABLE id="Table2" style="WIDTH: 642px; HEIGHT: 149px" width="642">
									<TR>
										<TD width="304">
											<TABLE id="Table1" cellSpacing="2" cellPadding="5">
												<TR>
													<TH noWrap colSpan="2">
														Transaction Information
													</TH>
												<TR>
													<TD noWrap align="right">Amount:</TD>
													<TD>
														<asp:textbox id="txtOrderTotal" runat="server" width="144px">12.88</asp:textbox></TD>
												</TR>
												<TR>
													<TD noWrap align="right">Description:
													</TD>
													<TD>
														<asp:textbox id="txtOrderDescription" runat="server" width="117px">Fake Sale</asp:textbox></TD>
												</TR>
											</TABLE>
										</TD>
										<TD>
											<TABLE id="Table3" style="WIDTH: 316px; HEIGHT: 63px" cellSpacing="2" cellPadding="5">
												<TR>
													<TH noWrap colSpan="2">
														<P>Payer&nbsp;Information<BR>
															<FONT size="1">(payer must be a test account&nbsp;in your Developer Central 
																sandbox)</FONT></P>
													</TH>
												<TR>
													<TD noWrap align="right">Email Address:</TD>
													<TD>
														<asp:textbox id="txtEmail" runat="server" width="181px">payeremail@yoursandbox.net</asp:textbox></TD>
												</TR>
											</TABLE>
											<P align="center">
												<asp:button id="bCharge" runat="server" text="Submit" onclick="bCharge_Click"></asp:button></P>
											<P align="center">&nbsp;</P>
										</TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</asp:Panel>
				<BR>
			<P>
        &nbsp;</P>
			<P>
        <cc1:Expresscheckout ID="expresscheckout1" runat="server">
        </cc1:Expresscheckout>
      </P>
			<P/>
				<asp:Panel id="pnlComplete" runat="server" Width="640px" Visible="False" Height="166px">
					<P>&nbsp;Thank you for purchasing,
						<asp:Label id="lblPayerName" runat="server" Width="425px"></asp:Label></P>
					<P>&nbsp;An email confirmation has been sent to
						<asp:Label id="lblPayerEmail" runat="server" Width="42px">Label</asp:Label>&nbsp;for 
						your records.</P>
					<TABLE id="Table5" cellSpacing="2" cellPadding="5">
						<TR>
							<TH noWrap colSpan="2">
								Transaction Information
							</TH>
						<TR>
							<TD noWrap align="right">Date:
							</TD>
							<TD>
								<asp:Label id="lblDate" runat="server" Width="188px">Label</asp:Label></TD>
						</TR>
						<TR>
							<TD noWrap align="right">Amount:</TD>
							<TD>
								<asp:Label id="lblGrossAmount" runat="server" Width="188px">Label</asp:Label></TD>
						</TR>
						<TR>
							<TD noWrap align="right">Fee:</TD>
							<TD>
								<asp:Label id="lblFee" runat="server" Width="188px">Label</asp:Label></TD>
						</TR>
					</TABLE>
				</asp:Panel>
				<asp:Panel id="pnlCancel" runat="server" Width="640px" Visible="False" Height="166px">&nbsp; 
<TABLE id="Table6" cellSpacing="2" cellPadding="5">
						<TR>
							<TH noWrap colSpan="2">
								Transaction Cancelled!&nbsp;</TH>
						<TR>
							<TD noWrap align="right"><A href="ExpressCheckout.aspx">Click here to checkout</A>.&nbsp;</TD>
						</TR>
					</TABLE></asp:Panel>
			<P></P>
			<P>
				<asp:Panel id="pnlError" runat="server" Width="643px" Visible="False" Height="194px">
					<TABLE id="Table7" style="WIDTH: 641px; HEIGHT: 40px" cellSpacing="2" cellPadding="5">
						<TR>
							<TH noWrap colSpan="2">
								An error occured while processing your transaction:</TH>
						<TR>
							<TD noWrap align="left">
								<asp:Label id="lblError" runat="server" Width="618px">Label</asp:Label></TD>
						</TR>
					</TABLE>
				</asp:Panel></P>
				<HR SIZE="1">
			<P></P>
		</form>
	</body>
</HTML>
