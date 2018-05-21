<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SA46Team12BookShopApp.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    &nbsp;
<asp:Label ID="lblCategoryFilter" runat="server" Text="Category:"></asp:Label>
<asp:DropDownList ID="ddlCategoryFilter" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="CategoryID">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" SelectCommand="SELECT [Name], [CategoryID] FROM [Category]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblPriceSort" runat="server" Text="Price:"></asp:Label>
<asp:DropDownList ID="ddlPriceSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPriceSort_SelectedIndexChanged">
    <asp:ListItem Value="0">Lowest - Highest</asp:ListItem>
    <asp:ListItem Value="1">Highest - Lowest</asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblSearchBooks" runat="server" Text="Search:"></asp:Label>
<asp:TextBox ID="txtSearchBooks" runat="server"></asp:TextBox>
&nbsp;<asp:ListView ID="lvProductsList" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
        
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                Author:
                <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                ISBN:
                <image src="images/<%# Eval("ISBN") %>.jpg" width="75" height="100"></image>
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price ASC">
    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price DESC">
    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>
    
</asp:Content>
