<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SA46Team12BookShopApp.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    &nbsp;
<asp:Label ID="lblCategoryFilter" runat="server" Text="Category:"></asp:Label>
<asp:DropDownList ID="ddlCategoryFilter" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="CategoryID" OnSelectedIndexChanged="ddlFilters_SelectedIndexChanged" AppendDataBoundItems="true">
        <asp:ListItem Value="0">All</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" SelectCommand="SELECT [Name], [CategoryID] FROM [Category]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblPriceSort" runat="server" Text="Price:"></asp:Label>
<asp:DropDownList ID="ddlPriceSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilters_SelectedIndexChanged">
    <asp:ListItem Value="0">Lowest - Highest</asp:ListItem>
    <asp:ListItem Value="1">Highest - Lowest</asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblSearchBooks" runat="server" Text="Search:"></asp:Label>
<asp:TextBox ID="txtSearchBooks" runat="server"></asp:TextBox>
<asp:Button ID="btnSearchBooks" runat="server" Text="Search" OnClick="btnSearchBooks_Click" />  
        
<asp:ListView ID="lvProductsList" runat="server" DataSourceID="SqlDataSource5" GroupPlaceholderID="groupPlaceHolder1"

    ItemPlaceholderID="itemPlaceHolder1" OnItemCommand="ProductsListView_OnItemCommand">
         <GroupTemplate>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="col-item">  
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </div>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <link rel="stylesheet" type="text/css" href="product-page.css" />
            <link rel="stylesheet" type="text/css" href="product-page.css" />
                <div class="post-img-content">
                <image src="images/<%# Eval("ISBN") %>.jpg" class="img-responsive"></image>
                <span class="post-title">
                    <b><asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' /></b>
                </span>
            </div>
            <div class="info">
		        <div class="row">          
			        <div class="price col-md-12">
                        <h5>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </h5>
                       </div>
                        <div class="price col-md-12" >
                        Author:<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                        </div>
                    <p>
                    <div class ="col-md-6">
                        
                       <h5 class="price-text-color">
                            &#36<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                       </h5>
                     </div>
                    <div class ="col-md-6">
                        <asp:Button ID="Button1" runat="server" Text="Add to Cart" class="btn btn-primary" CommandName="SelectedItem" 
                CommandArgument='<%# Eval("BookID") %>' />
                    </div></p>
                    </div>
                </div>
             Discount:
                <asp:Label ID="DiscountPercentLabel" runat="server" Text='<%# ProcessMyDataItem(Eval("DiscountPercent")) %>' />
                <br />           
        </ItemTemplate>

        <LayoutTemplate>
            <div class="container-fluid" id="groupContainer" runat="server" >
                <div class="row" id="groupPlaceholder" runat="server">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                 </div>
             </div>
        </LayoutTemplate> 
</asp:ListView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price ASC">

    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Book.CategoryID=@state_categoryID ORDER BY Book.Price DESC">
    <SelectParameters>
        <asp:Controlparameter Name="state_categoryID" ControlID="ddlCategoryFilter" PropertyName="SelectedValue"/>
    </SelectParameters>  
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID ORDER BY Book.Price DESC">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID ORDER BY Book.Price ASC">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="">
</asp:SqlDataSource>

</asp:Content>
