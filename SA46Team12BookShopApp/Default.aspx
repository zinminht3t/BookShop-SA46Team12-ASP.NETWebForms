<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SA46Team12BookShopApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Image Slider -->
    <div id="slides" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#slides" data-slide-to="0" class="active"></li>
            <li data-target="#slides" data-slide-to="1"></li>
            <li data-target="#slides" data-slide-to="2"></li>
            <li data-target="#slides" data-slide-to="3"></li>
            <li data-target="#slides" data-slide-to="4"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Style/images/bornACrimeCover.png">
                <div class="carousel-caption">
                    <h1 style="font-family:'Tangerine', serif;">Get Books</h1>                   
                </div>
            </div>
            <div class="carousel-item">
                <img src="Style/images/everybodyLiesCover.png">
                <div class="carousel-caption">
                    <h1>Get Books</h1>                   
                </div>
            </div>
            <div class="carousel-item">
                <img src="Style/images/overwatchCover.png">
                <div class="carousel-caption">
                    <h1>Get Books</h1>                  
                </div>
            </div>
            <div class="carousel-item">
                <img src="Style/images/personaCover.png">
                <div class="carousel-caption">
                    <h1>Get Books</h1>                  
                </div>
            </div>
            <div class="carousel-item">
                <img src="Style/images/zeldaCover.png">
                <div class="carousel-caption">
                    <h1>Get Books</h1>                  
                </div>
            </div>
        </div>
    </div>


    <!-- Jumbotron -->
    <div class="container-fluid">
        <div class="row jumbotron jumbotron-default">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-12">            
                <h2 class="display-5 text-center">PROMOTIONAL ITEMS</h2>
            </div>
        </div>
    </div>


    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"
        ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1">
        <GroupTemplate>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="col-item">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </div>
            </div>
        </GroupTemplate>

        <ItemTemplate>


             <link rel="stylesheet" type="text/css" href="product-page.css" />
          <%--  <link href="style/css/style.css" rel="stylesheet">--%>
            <div class="post-img-content">
                <image src="images/<%# Eval("ISBN") %>.jpg" class="img-responsive"></image>
                <span class="post-title">
                    <b>
                        <asp:Label ID="lblSalesTag" runat="server" Text='<%# ProcessMyDataItem(Eval("DiscountPercent")) %>' /></b>
                </span>
            </div>
            <div class="info">
                <div class="row">
                    <div class="price col-md-12">
                        <h5>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </h5>
                    </div>
                    <div class="price col-md-12">
                        Category:<asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </div>
                    <div class="price col-md-12">
                        Author:<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                    </div>
                    <p>
                        <div class="col-md-6">

                            <h5 class="price-text-color"><strike>Original Price: &#36<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></strike>
                            </h5>
                        </div>

                        <div class="col-md-6">

                            <h5 class="disctprice-text-color"> Discounted Price: &#36<asp:Label ID="DiscountedPriceLabel" runat="server" Text='<%# ProcessMyDiscountedDataItem(Eval("DiscountPercent"), Eval("Price")) %>' />
                            </h5>
                        </div>


                    </p>
                </div>
            </div>

        </ItemTemplate>
        <LayoutTemplate>

            <div class="container-fluid" id="groupContainer" runat="server">
                <div class="row" id="groupPlaceholder" runat="server">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                </div>
            </div>
        </LayoutTemplate>


    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString3 %>" SelectCommand="SELECT * FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID WHERE Discount.DiscountID IS NOT NULL"></asp:SqlDataSource>

</asp:Content>
