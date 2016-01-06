<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        oncreateduser="CreateUserWizard1_CreatedUser" 
        oncontinuebuttonclick="Continue" onfinishbuttonclick="Finish">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:WizardStep runat="server" Title="Profile">

<table ID="Table2" runat="server"> 

 <tr>
   <td> 
      <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label>
   </td>
   <td>
      <asp:TextBox ID="TB_Nume" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Nume" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
   </td>
 </tr>

 <tr>
   <td>
     <asp:Label ID="Label2" runat="server" Text="Prenume"></asp:Label>
   </td>
   <td>
     <asp:TextBox ID="TB_Prenume" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Prenume"  ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
   </td>
 </tr>

 <tr>
   <td>
       <asp:Label ID="Label3" runat="server" Text="Data nasterii"></asp:Label>
   </td>
   <td>
       <asp:TextBox ID="TB_Data_nasterii" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Data_nasterii" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
       <asp:CompareValidator ID="CompareValidator2" runat="server" 
               ControlToValidate="TB_Data_nasterii" ErrorMessage="CompareValidator" 
               Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
   </td>
 </tr>

 <tr>
   <td>
       <asp:Label ID="Label4" runat="server" Text="Sex"></asp:Label>
   </td>
   <td>
       <asp:RadioButtonList ID="RBL_Sex" runat="server">
           <asp:ListItem Value="1">Masculin</asp:ListItem>
           <asp:ListItem Value="2">Feminin</asp:ListItem>
       </asp:RadioButtonList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RBL_Sex" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
   </td>
</tr>

<tr>
   <td>
       <asp:Label ID="Label5" runat="server" Text="Oras"></asp:Label>
   </td>
   <td>
       <asp:TextBox ID="TB_Oras" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Oras" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
   </td>
</tr>
</table>
            </asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>

</asp:Content>

