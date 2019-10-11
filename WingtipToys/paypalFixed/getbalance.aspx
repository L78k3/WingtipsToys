<%@ Page language="c#" Inherits="nsoftware.Demos.getbalanceDemo" CodeFile="getbalance.aspx.cs" ValidateRequest="false"%>
<%@ Register assembly="nsoftware.InPayPalWeb" namespace="nsoftware.InPayPal" tagprefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>PayPal ASP.NET - GetBalance Demo</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<link href="stylesheet.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<h1>PayPal &nbsp;ASP.NET Edition - Demo Pages</h1>
			<h2>PayPalRequest</h2>
			<p/>This demo shows how to use the&nbsp; <strong>PayPalRequest</strong> component to 
				build a request to get the balance of a PayPal account.
				<HR SIZE="1">
				<BR>
			<P>
        <cc1:Paypalrequest ID="paypalrequest1" runat="server">
        </cc1:Paypalrequest>
      </P>
			<asp:Panel id="pnlMain" runat="server" Width="605px" Height="120px">
				<TABLE id="Table4" cellSpacing="0" cellPadding="5" border="0">
					<TR>
						<TD align="right">API Username: </TD>
						<TD vAlign="center">
							<asp:textbox id="txtUsername" runat="server" Width="314px" Font-Size="8pt" Font-Names="Verdana">xtest1_1199718490_biz_api1.hotmail.com</asp:textbox></TD>
					</TR>
					<TR>
						<TD align="right" style="height: 21px">API Password: </TD>
						<TD style="height: 21px">
							<asp:textbox id="txtPassword" runat="server" Width="316px" Font-Size="8pt" Font-Names="Verdana">1199718508</asp:textbox></TD>
					</TR>
					<TR>
						<TD align="right">API Signature: </TD>
						<TD>
							<asp:textbox id="txtSignature" runat="server" Width="317px" Font-Size="8pt" Font-Names="Verdana">ArZVhsgMt2Xnh-0gEb7CLza-WEc8Anplrd01chp0nKBXOTWQFcUxhPZX</asp:textbox></TD>
					</TR>
					<TR>
						<TD colSpan="2">
<P align="center">
                        <asp:button id="bGetBalance" runat="server" text="Get Balance" onclick="bGetBalance_Click"></asp:button></P>
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
