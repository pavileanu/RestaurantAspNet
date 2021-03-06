﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT RESTAURANT.ID_RESTAURANT, RESTAURANT.NUME, RESTAURANT.RATING, RESTAURANT.LOCATIE, RESTAURANT.DATA_DESCHIDERII, SPECIFIC.DENUMIRE FROM RESTAURANT INNER JOIN SPECIFIC ON RESTAURANT.ID_SPECIFIC = SPECIFIC.ID_SPECIFIC" 
            DeleteCommand="DELETE FROM [RESTAURANT] WHERE [ID_RESTAURANT] = @ID_RESTAURANT" 
            InsertCommand="INSERT INTO [RESTAURANT] ([NUME], [RATING], [LOCATIE], [DATA_DESCHIDERII]) VALUES (@NUME, @RATING, @LOCATIE, @DATA_DESCHIDERII)" 
            UpdateCommand="UPDATE [RESTAURANT] SET [NUME] = @NUME, [RATING] = @RATING, [LOCATIE] = @LOCATIE, [DATA_DESCHIDERII] = @DATA_DESCHIDERII WHERE [ID_RESTAURANT] = @ID_RESTAURANT">
            <DeleteParameters>
                <asp:Parameter Name="ID_RESTAURANT" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NUME" Type="String" />
                <asp:Parameter Name="RATING" Type="Int32" />
                <asp:Parameter Name="LOCATIE" Type="String" />
                <asp:Parameter DbType="Date" Name="DATA_DESCHIDERII" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NUME" Type="String" />
                <asp:Parameter Name="RATING" Type="Int32" />
                <asp:Parameter Name="LOCATIE" Type="String" />
                <asp:Parameter DbType="Date" Name="DATA_DESCHIDERII" />
                <asp:Parameter Name="ID_RESTAURANT" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:LoginView ID="LoginView1" runat="server">
  
        <AnonymousTemplate>
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID_RESTAURANT" 
            DataSourceID="SqlDataSource1" EnableModelValidation="False" 
             PageSize="2" AutoGenerateDeleteButton="True" 
            AutoGenerateEditButton="True">
            <Columns>
                
                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="RATING" HeaderText="RATING" 
                    SortExpression="RATING" />
                <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" 
                    SortExpression="LOCATIE" />
                <asp:BoundField DataField="DATA_DESCHIDERII" HeaderText="DATA_DESCHIDERII" 
                    SortExpression="DATA_DESCHIDERII" />
                <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" 
                    SortExpression="DENUMIRE" />
            </Columns>
        </asp:GridView>
        
        </AnonymousTemplate>

       
       
        <RoleGroups>

        <asp:RoleGroup Roles="Admin">

        <ContentTemplate>

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID_RESTAURANT" 
            DataSourceID="SqlDataSource1" EnableModelValidation="False" 
             PageSize="2" AutoGenerateDeleteButton="True" 
            AutoGenerateEditButton="True">
            <Columns>
                
                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="RATING" HeaderText="RATING" 
                    SortExpression="RATING" />
                <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" 
                    SortExpression="LOCATIE" />
                <asp:BoundField DataField="DATA_DESCHIDERII" HeaderText="DATA_DESCHIDERII" 
                    SortExpression="DATA_DESCHIDERII" />
                <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" 
                    SortExpression="DENUMIRE" />
                <asp:HyperLinkField DataNavigateUrlFields="id_restaurant" 
                    DataNavigateUrlFormatString="~/Edit.aspx?id={0}   " HeaderText="Edit" 
                    Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="ID_RESTAURANT" 
                    DataNavigateUrlFormatString="~/Delete.aspx?id={0}" HeaderText="Delete" 
                    Text="Delete" />
            </Columns>
        </asp:GridView>

        </ContentTemplate>

        </asp:RoleGroup>



        <asp:RoleGroup Roles="Member">

        <ContentTemplate>

        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID_RESTAURANT" 
            DataSourceID="SqlDataSource1" EnableModelValidation="False" 
             PageSize="2" AutoGenerateDeleteButton="True" 
            AutoGenerateEditButton="True">
            <Columns>
                
                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="RATING" HeaderText="RATING" 
                    SortExpression="RATING" />
                <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" 
                    SortExpression="LOCATIE" />
                <asp:BoundField DataField="DATA_DESCHIDERII" HeaderText="DATA_DESCHIDERII" 
                    SortExpression="DATA_DESCHIDERII" />
                <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" 
                    SortExpression="DENUMIRE" />
                <asp:HyperLinkField DataNavigateUrlFields="id_restaurant" 
                    DataNavigateUrlFormatString="~/Edit.aspx?id={0}   " HeaderText="Edit" 
                    Text="Edit" />
            </Columns>
        </asp:GridView>

        </ContentTemplate>

        </asp:RoleGroup>

        </RoleGroups>

        
        </asp:LoginView>

        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
            AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID_RESTAURANT" 
            DataSourceID="SqlDataSource1">
            <Fields>
                
                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="RATING" HeaderText="RATING" 
                    SortExpression="RATING" />
                <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" 
                    SortExpression="LOCATIE" />
                <asp:BoundField DataField="DATA_DESCHIDERII" HeaderText="DATA_DESCHIDERII" 
                    SortExpression="DATA_DESCHIDERII" />
                <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" 
                    SortExpression="DENUMIRE" />
            </Fields>
        </asp:DetailsView>



</asp:Content>


