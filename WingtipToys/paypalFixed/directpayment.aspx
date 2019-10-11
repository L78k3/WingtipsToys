<%@ Page language="c#" Inherits="nsoftware.Demos.directpaymentDemo" CodeFile="directpayment.aspx.cs" ValidateRequest="false"%>

<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>PayPal ASP.NET - DirectPayment</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<link href="stylesheet.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<h1>PayPal nbsp;ASP.NET Edition - Demo Pages</h1>
			<h2>DirectPayment</h2>
			<p/>This demo shows how to use the&nbsp; <strong>DirectPayment</strong> component to 
				obtain payment through PayPal directly from a buyer's credit card.&nbsp; Simply 
				fill in your PayPal API username, password, and API certificate below,&nbsp;and 
				then press <EM>Submit</EM>.&nbsp; This demo uses a test URL, so unless you 
				alter the URL, you will not be charged for anything here.
				<HR SIZE="1">
				<BR>
			<P>
        <cc1:Directpayment ID="directpayment1" runat="server">
        </cc1:Directpayment>
      </P>
			<asp:Panel id="pnlMain" runat="server" Width="605px" Height="456px">
				<TABLE id="Table4" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD align="right">API Username:</TD>
						<TD vAlign="center">
							<asp:textbox id="txtUsername" runat="server" Width="314px" Font-Size="8pt" Font-Names="Verdana">xtest1_1199718490_biz_api1.hotmail.com</asp:textbox></TD>
					</TR>
					<TR>
						<TD align="right">API Password:</TD>
						<TD>
							<asp:textbox id="txtPassword" runat="server" Width="316px" Font-Size="8pt" Font-Names="Verdana">1199718508</asp:textbox></TD>
					</TR>
					<TR>
						<TD align="right">API Signature:</TD>
						<TD>
							<asp:textbox id="txtSignature" runat="server" Width="317px" Font-Size="8pt" Font-Names="Verdana">ArZVhsgMt2Xnh-0gEb7CLza-WEc8Anplrd01chp0nKBXOTWQFcUxhPZX</asp:textbox></TD>
					</TR>
					<TR>
						<TD colSpan="2">
							<P>&nbsp;</P>
							<TABLE id="Table2" width="90%">
								<TR>
									<TD width="304">
										<TABLE id="Table1" cellSpacing="2" cellPadding="5">
											<TR>
												<TH noWrap colSpan="2">
													Credit Card Information
												</TH>
											</TR>
											<TR>
												<TD noWrap align="right">Card Number:</TD>
												<TD>
													<asp:textbox id="txtCardNumber" runat="server" width="144px">4832419131427146</asp:textbox></TD>
											</TR>
											<TR>
												<TD noWrap align="right">Exp Date (MM/YY):
												</TD>
												<TD>
													<asp:dropdownlist id="ddlCardExpMonth" runat="server">
														<asp:ListItem Value="01" Selected="True">01</asp:ListItem>
														<asp:ListItem Value="02">02</asp:ListItem>
														<asp:ListItem Value="03">03</asp:ListItem>
														<asp:ListItem Value="04">04</asp:ListItem>
														<asp:ListItem Value="05">05</asp:ListItem>
														<asp:ListItem Value="06">06</asp:ListItem>
														<asp:ListItem Value="07">07</asp:ListItem>
														<asp:ListItem Value="08">08</asp:ListItem>
														<asp:ListItem Value="09">09</asp:ListItem>
														<asp:ListItem Value="10">10</asp:ListItem>
														<asp:ListItem Value="11">11</asp:ListItem>
														<asp:ListItem Value="12">12</asp:ListItem>
													</asp:dropdownlist>&nbsp;/&nbsp;
													<asp:dropdownlist id="ddlCardExpYear" runat="server">
														<asp:ListItem Value="2013">2013</asp:ListItem>
														<asp:ListItem Value="2014">2014</asp:ListItem>
														<asp:ListItem Value="2015">2015</asp:ListItem>
														<asp:ListItem Value="2016">2016</asp:ListItem>
														<asp:ListItem Value="2017">2017</asp:ListItem>
														<asp:ListItem Value="2018" Selected="True">2018</asp:ListItem>
														<asp:ListItem Value="2019">2019</asp:ListItem>
														<asp:ListItem Value="2020">2020</asp:ListItem>
														<asp:ListItem Value="2021">2021</asp:ListItem>
													</asp:dropdownlist></TD>
											</TR>
											<TR>
												<TD noWrap align="right" height="31">CVV2 Data:</TD>
												<TD height="31">
													<asp:textbox id="txtCardCVV2" runat="server" width="117px">123</asp:textbox></TD>
											</TR>
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
										<TABLE id="Table3" cellSpacing="2" cellPadding="5">
											<TR>
												<TH noWrap colSpan="2">
													Customer Information:
												</TH>
											<TR>
												<TD noWrap align="right">Name:</TD>
												<TD>
													<asp:textbox id="txtCustomerFirstName" runat="server" width="62px">John</asp:textbox>
													<asp:textbox id="txtCustomerLastName" runat="server" width="117px">Smith</asp:textbox></TD>
											</TR>
											<TR>
												<TD noWrap align="right">Address:</TD>
												<TD>
													<asp:textbox id="txtCustomerAddress" runat="server" width="181px">123 Nowhere Ln</asp:textbox></TD>
											</TR>
											<TR>
												<TD noWrap align="right">City / State:</TD>
												<TD>
													<asp:textbox id="txtCustomerCity" runat="server" width="142px">Beverly Hills</asp:textbox>
													<asp:textbox id="txtCustomerState" runat="server" width="39px">CA</asp:textbox></TD>
											</TR>
											<TR>
												<TD noWrap align="right">Zip:</TD>
												<TD>
													<asp:textbox id="txtCustomerZip" runat="server" width="182px">90210</asp:textbox></TD>
											</TR>
											<TR>
												<TD noWrap align="right">Phone:</TD>
												<TD>
													<asp:textbox id="txtCustomerPhone" runat="server" width="182px">800-555-5555</asp:textbox></TD>
											</TR>
										</TABLE>
										<P align="center">
											<asp:button id="bCharge" runat="server" text="Submit" onclick="bCharge_Click"></asp:button></P>
										<P align="center">
											<asp:Label id="lblWarning" runat="server" Font-Size="XX-Small" Visible="False" ForeColor="Red">Supply a Login/Password or use Authorize.Net</asp:Label></P>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</asp:Panel>
			<asp:Panel id="pnlResults" runat="server" Width="605px" Visible="False" Height="235px">&nbsp; 
<asp:Literal id="Literal1" runat="server"></asp:Literal></asp:Panel>
			<BR>
			<HR SIZE="1">
		</form>
	</body>
</html>
