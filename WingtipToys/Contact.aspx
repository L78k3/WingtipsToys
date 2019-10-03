<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WingtipToys.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>To Contact us, Please find our details at the bottom.</h3>
    <address>
        ABC Limited<br />
        Covenrty, CV6 4GL, 56-60 Rookery Lane<br />
        <abbr title="Phone">P:</abbr>
        024 76447654
    </address>

    <address>
        <strong>Support:</strong>   <a href="ABClimitedSupport@gmail.com">ABClimitedSupport@gmail.com</a><br />
        <strong>Office:</strong> <a href="ABCLimitedTeam@gmail.com">ABCLimitedTeam@gmail.com</a>
    </address>
</asp:Content>
