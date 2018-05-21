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
<<<<<<< HEAD
    <asp:Button ID="btnSearchBooks" runat="server" Text="Search" OnClick="btnSearchBooks_Click" />

&nbsp;<asp:ListView ID="lvProductsList" runat="server" DataSourceID="SqlDataSource5" GroupItemCount="3">
        
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
=======
&nbsp;
    <asp:ListView ID="lvProductsList" runat="server" DataSourceID="SqlDataSource1"
         GroupPlaceholderID="groupPlaceHolder1"
         ItemPlaceholderID="itemPlaceHolder1">
>>>>>>> b711f3fb16a551400e41a89cb97c1b8388677efb
        <GroupTemplate>
                <div class="col-sm-4" id="ProductsRow" runat=server>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </div>
        </GroupTemplate>       
        <ItemTemplate>
                <image src="images/<%# Eval("ISBN") %>.jpg"></image>
                <br />
                Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                Author:
                <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
                Category:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
<<<<<<< HEAD
                ISBN:
                <image src="images/<%# Eval("ISBN") %>.jpg" width="75" height="100"></image>
                <br />
                Discount:
                <asp:Label ID="DiscountPercentLabel" runat="server" Text='<%# ProcessMyDataItem(Eval("DiscountPercent")) %>' />
                <br />
            </td>
=======
>>>>>>> b711f3fb16a551400e41a89cb97c1b8388677efb
        </ItemTemplate>

        <LayoutTemplate>
            <div class="container-fluid" id="groupContainer" runat="server" >
                <div class="row" id="groupPlaceholder" runat="server">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                 </div>
             </div>
        </LayoutTemplate> 
</asp:ListView>
<<<<<<< HEAD
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price ASC">
=======

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price ASC">
>>>>>>> b711f3fb16a551400e41a89cb97c1b8388677efb
    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price DESC">
    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>
<<<<<<< HEAD

<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID ORDER BY Book.Price DESC">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID ORDER BY Book.Price ASC">
</asp:SqlDataSource>
=======
>>>>>>> b711f3fb16a551400e41a89cb97c1b8388677efb
    
</asp:Content>
