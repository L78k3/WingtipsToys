<%@ Page language="c#" Inherits="nsoftware.Demos.masspayDemo" CodeFile="masspay.aspx.cs" ValidateRequest="false"%>

<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>PayPal ASP.NET - MassPay</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="stylesheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<H1>PayPal &nbsp;ASP.NET Edition - Demo Pages</H1>
			<H2>Mass Pay</H2>
			<P>This demo shows how to use the <STRONG>MassPay</STRONG> component to pay 
				multiple recipients all at once.&nbsp; Simply fill in your PayPal username and 
				account, add recipients and amounts to the list below, and then press <EM>Send</EM>.&nbsp; 
				This demo uses a test URL, so unless you alter the URL, you will not be charged 
				for anything here. </P>
			<HR SIZE="1">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
				<TR>
					<TD align="right">Username:</TD>
					<TD vAlign="middle"><asp:textbox id="txtUsername" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt">xtest1_1199718490_biz_api1.hotmail.com</asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right">Password:</TD>
					<TD><asp:textbox id="txtPassword" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt">1199718508</asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right">API Signature:</TD>
					<TD><asp:textbox id="txtSignature" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt">ArZVhsgMt2Xnh-0gEb7CLza-WEc8Anplrd01chp0nKBXOTWQFcUxhPZX</asp:textbox></TD>
				</TR>
				<TR>
					<TD colSpan="2">
              <cc1:Masspay ID="masspay1" runat="server">
              </cc1:Masspay>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" border="0" runat="server">
							<tr>
								<td style="HEIGHT: 14px" colSpan="2"><STRONG><FONT size="1">ADD NEW:</FONT></STRONG></td>
							</tr>
							<TR>
								<TD style="WIDTH: 157px" noWrap align="right"><FONT color="#000099">Recipient 
										Email:</FONT>
								</TD>
								<TD><asp:textbox id="txtEmail" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt"
										ForeColor="Navy"></asp:textbox>&nbsp;
									<asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" Font-Names="Arial" Font-Size="8pt" ControlToValidate="txtEmail"
										ErrorMessage="Email address is required."></asp:requiredfieldvalidator></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 157px" noWrap align="right"><FONT color="#000099">Amount to send:</FONT></TD>
								<TD><asp:textbox id="txtAmount" runat="server" Width="56px" Font-Names="Verdana" Font-Size="8pt"
										ForeColor="Navy"></asp:textbox>&nbsp;
									<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Width="152px" Font-Names="Arial" Font-Size="8pt"
										ControlToValidate="txtAmount" ErrorMessage="Amount to be sent is required."></asp:requiredfieldvalidator></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 157px" noWrap align="right"><FONT color="#000099">Currency code:</FONT></TD>
								<TD><asp:dropdownlist id="ddlCurrency" runat="server" Width="56px" Font-Size="8pt" ForeColor="Navy">
										<asp:ListItem Value="USD" Selected="True">USD</asp:ListItem>
										<asp:ListItem Value="CAD">CAD</asp:ListItem>
										<asp:ListItem Value="EUR">EUR</asp:ListItem>
										<asp:ListItem Value="GBP">GBP</asp:ListItem>
										<asp:ListItem Value="JPY">JPY</asp:ListItem>
									</asp:dropdownlist></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 157px" noWrap align="right"><FONT color="#000099">Unique Id:</FONT></TD>
								<TD style="WIDTH: 340px"><asp:textbox id="txtUniqueId" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt"
										ForeColor="Navy"></asp:textbox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 157px" noWrap align="right"><FONT color="#000099">Note:</FONT></TD>
								<TD><asp:textbox id="txtNote" runat="server" Width="200px" Font-Names="Verdana" Font-Size="8pt" ForeColor="Navy"></asp:textbox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 157px"><FONT color="#000099"></FONT></TD>
								<TD>
									<P><asp:button id="btnAdd" runat="server" Width="75px" Font-Size="8pt" Text="Add" onclick="btnAdd_Click"></asp:button>&nbsp;&nbsp;&nbsp;
										<asp:button id="btnCancel" runat="server" Width="75px" Font-Size="8pt" Text="Cancel" CausesValidation="False" onclick="btnCancel_Click"></asp:button></P>
									<P>&nbsp;</P>
									<P>&nbsp;</P>
								</TD>
							</TR>
						</TABLE>
						<P align="left"><asp:panel id="Panel2" runat="server" Width="536px" ForeColor="Maroon" Visible="False">
								<P>Enter recipient's <STRONG><FONT color="#990000">Unique id</FONT></STRONG> to 
									be <U>removed</U> from the list:
									<asp:TextBox id="txtUniqId" runat="server" Font-Names="Verdana" Font-Size="7pt" ForeColor="Maroon"></asp:TextBox>
									<asp:Button id="btnSubmit" runat="server" Width="64px" Font-Size="8pt" ForeColor="Maroon" Text="Submit" onclick="btnSubmit_Click"></asp:Button></P>
								<P>&nbsp;</P>
							</asp:panel>
						<P><asp:label id="Label1" runat="server" Font-Names="Verdana" Font-Size="7pt" ForeColor="Black"
								Height="20px" Font-Bold="True">SEND MONEY TO MULTIPLE RECIPIENTS:</asp:label></P>
						<asp:table id="tblList" runat="server" Width="512px" ForeColor="Navy" Height="2px" GridLines="Both"
							CellPadding="1" BackColor="WhiteSmoke" BorderWidth="1px" CellSpacing="1" BorderStyle="Solid"
							BorderColor="Silver">
							<asp:TableRow BorderColor="White" ForeColor="Navy" ID="TableHeader" BackColor="#E0E0E0" Font-Size="8pt"
								Font-Names="Verdana" Font-Bold="True">
								<asp:TableCell ForeColor="Navy" Text="Recipient Email"></asp:TableCell>
								<asp:TableCell Text="Amount"></asp:TableCell>
								<asp:TableCell Text="Currency"></asp:TableCell>
								<asp:TableCell Text="Unique Id"></asp:TableCell>
								<asp:TableCell Text="Note"></asp:TableCell>
							</asp:TableRow>
						</asp:table>
						<P align="center"><asp:label id="lblTrsmStatus" runat="server" Width="565px" Font-Names="Verdana" ForeColor="Maroon"
								Font-Bold="True"></asp:label></P>
						<P align="left"><asp:panel id="Panel1" runat="server" Width="520px">
<asp:button id="btnNew" runat="server" Width="75px" Font-Size="8pt" Text="Add New" onclick="btnNew_Click"></asp:button>&nbsp; 
<asp:button id="btnRemove" runat="server" Width="75px" Font-Size="8pt" Text="Remove" onclick="btnRemove_Click"></asp:button>&nbsp; 
<asp:button id="btnClear" runat="server" Width="75px" Font-Size="8pt" Text="Clear" onclick="btnClear_Click"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<asp:button id="btnSend" runat="server" Width="120px" Font-Size="8pt" Text="Send" Font-Bold="True" onclick="btnSend_Click"></asp:button></asp:panel></P>
					</TD>
				</TR>
			</TABLE>
			<BR>
			<HR SIZE="1">
		</form>
	</body>
</HTML>
