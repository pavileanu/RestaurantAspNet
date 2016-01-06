<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ID_SPECIFIC], [DENUMIRE] FROM [SPECIFIC]"></asp:SqlDataSource>
    <table ID="Table1" runat="server">
    <tr>
          <td>
              <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label>
          </td>   
          <td>
              <asp:TextBox ID="TB_NUME" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_NUME" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
          </td>
    </tr>
    <tr>
       <td>
           <asp:Label ID="Label2" runat="server" Text="Locatie"></asp:Label>
       </td>
       <td>
           <asp:TextBox ID="TB_LOCATIE" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_LOCATIE" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
       </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Rating"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TB_RATING" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_RATING" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="TB_RATING" ErrorMessage="RangeValidator" 
                EnableTheming="False" MaximumValue="5" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Specific"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDL_SPECIFIC" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="DENUMIRE" 
                DataValueField="ID_SPECIFIC">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDL_SPECIFIC" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
       <td>
           <asp:Label ID="Label5" runat="server" Text="Data Deschiderii"></asp:Label>
       </td>
       <td>
           <asp:TextBox ID="TB_DATA_DESCHIDERII" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_DATA_DESCHIDERII" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
           <asp:CompareValidator ID="CompareValidator1" runat="server" 
               ControlToValidate="TB_DATA_DESCHIDERII" ErrorMessage="CompareValidator" 
               Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
       </td>
    </tr>
    <tr>
       <td>
           <asp:Button ID="Button1" runat="server" Text="Update" onclick="Update" />
       </td>
    </tr>
    </table>
    <asp:Literal ID="Raspuns" runat="server"></asp:Literal>
</asp:Content>

