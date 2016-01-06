<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:Panel ID="Panel1" runat="server">

     Doriti sa stergeti
 
     <asp:Label ID="Label1" runat="server" ></asp:Label>

     din

     <asp:Label ID="Label2" runat="server" ></asp:Label>

     ?
     <br />
     <asp:Button ID="Button1" runat="server" Text="DA" onclick="Delete1" />
     <asp:Button ID="Button2" runat="server" Text="NU" onclick="Button2_Click" />

     </asp:Panel>
     
 <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
</asp:Content>

