<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SA46Team12BookShopApp.Products" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

<link rel="stylesheet" type="text/css" href="product-page.css" />

<div class="container">
    <div class="row search">
            <div class="col-xs-12 col-sm-6 col-sm-4 col-md-3 search">
                <div id="custom-search-input">
                    <div class="input-group">
                <asp:DropDownList ID="ddlCategoryFilter" AutoPostBack="true" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="Name" 
                            DataValueField="CategoryID" class="form-control input-lg" OnSelectedIndexChanged="ddlFilters_SelectedIndexChanged" 
                            AppendDataBoundItems="true">
                    <asp:ListItem Value="0">All</asp:ListItem>
                    <asp:ListItem Value="sales">Sales</asp:ListItem>
                </asp:DropDownList>
                        </div>
                    </div>
            </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" 
                    SelectCommand="SELECT [Name], [CategoryID] FROM [Category]">
                </asp:SqlDataSource>
                <div class="col-xs-12 col-sm-6 col-sm-4 col-md-3 search">
                    <div id="custom-search-input">
                    <div class="input-group">
                            <asp:DropDownList ID="ddlPriceSort" runat="server" AutoPostBack="true" class="form-control input-lg" 
                                OnSelectedIndexChanged="ddlFilters_SelectedIndexChanged">
                                <asp:ListItem Value="0">Lowest - Highest</asp:ListItem>
                                <asp:ListItem Value="1">Highest - Lowest</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>
                   </div>   
           <div class="col-xs-12 col-sm-6 col-sm-4 col-md-3 search">
                <div id="custom-search-input">
                    <div class="input-group">
                        <asp:TextBox ID="txtSearchBooks" class="form-control input-lg" placeholder="Search" runat="server"></asp:TextBox>                
                    </div>
                </div>
           </div>
                <div class="col-xs-12 col-sm-6 col-sm-4 col-md-3 search">
                        <asp:Button ID="btnSearchBooks" runat="server" class="btn btn-primary searchbtn"
                                     OnClick="btnSearchBooks_Click" Text="Search" />
                 </div>
        </div>         
</div>


<asp:Literal ID="PopupBox" runat="server"></asp:Literal>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"/>--%>
<asp:ListView ID="lvProductsList" runat="server" DataSourceID="SqlDataSource5" GroupPlaceholderID="groupPlaceHolder1"
    ItemPlaceholderID="itemPlaceHolder1" OnItemCommand="ProductsListView_OnItemCommand" OnItemDataBound="lvProductsList_ItemDataBound">
         <GroupTemplate>
            <div class="col-xs-12 col-sm-6 col-sm-4 col-md-3">
                <div class="col-item">  
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </div>
            </div>
        </GroupTemplate>

        <ItemTemplate>
                <div class="post-img-content">
                    <image src="images/<%# Eval("ISBN") %>.jpg" class="img-responsive"></image>
                    <span class="post-title">
                    <b><asp:Label ID="lblSalesTag" runat="server" Text='<%# ProcessMyDataItem(Eval("DiscountPercent")) %>' /></b>
                    </span>
                </div>
            <div class="info">
		        <div class="row">          
			        <div class="price col-md-12">
                        <h5>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </h5>
                        Author:<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                    </div>
                    <div class ="col-md-12" style="margin-top: auto; margin-bottom:auto">
                     <%--   <h5 class="price price-text-color">
                            &#36<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        </h5>--%>
                         <h5 class="price price-text-color">
                            <asp:Label ID="Label1" runat="server" Text='<%# ProcessProductDiscount(Eval("DiscountPercent"), Eval("Price")) %>' />
                        </h5>
                    </div>
                    <div class ="col-md-12">
                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>--%>
                                <asp:Button ID="Button1" runat="server" Text="Add to Cart" class="btn btn-primary" CommandName="SelectedItem"
                                 CommandArgument='<%# Eval("BookID") %>' />
                              <%--</ContentTemplate>--%>
                        <%--</asp:UpdatePanel>--%>
                    </div>
                  </div>
             </div>  
        </ItemTemplate>

        <LayoutTemplate>
            <link rel="stylesheet" type="text/css" href="product-page.css" />
            <div class="container-fluid" id="groupContainer" runat="server" >
                <div class="row" id="groupPlaceholder" runat="server">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                 </div>
             </div>
             <div class="container-fluid" id="Div1" runat="server" >
                <div class="row" id="Div2" runat="server">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <div style="align-content:center">
                            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="lvProductsList" PageSize="8" class="btn-group pager-buttons">
                            <Fields>
                                <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                             </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                    <div class="col-md-4"></div>
                </div>
             </div>
        </LayoutTemplate>
    <EmptyItemTemplate>
        <h5 class="price price-text-color">No Products to Show</h5>
    </EmptyItemTemplate>
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

<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Discount.DiscountPercent IS NOT NULL ORDER BY Book.Price DESC">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString %>" SelectCommand="SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID WHERE Discount.DiscountPercent IS NOT NULL ORDER BY Book.Price ASC">
</asp:SqlDataSource>
</asp:Content>
