<%@ Page Title="GetBooks" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SA46Team12BookShopApp.Default" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Image Slider -->
    <%--<script src="Style/js/carousel.js"></script>--%>
    <div class="container-fluid" style="align-content: center; padding-left:100px;">
    <div id="slides" class="carousel slide" data-ride="carousel" data-interval="3000">
        <ul class="carousel-indicators">
            <li data-target="#slides" data-slide-to="0" class="active"></li>
            <li data-target="#slides" data-slide-to="1"></li>
            <li data-target="#slides" data-slide-to="2"></li>
            <li data-target="#slides" data-slide-to="3"></li>
            <li data-target="#slides" data-slide-to="4"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active responsive">
                <img src="Style/images/bornACrimeCover.png">
                <div class="carousel-caption">
                    <h2 style="font-size:4vw; font-family:'Tangerine', serif;">"If you laugh with somebody, then you know you share something."</h2>   
                    <h2 style="font-size:2vw; font-family:'Tangerine', serif; text-align:right;">~ The Daily Show</h2>
                </div>
            </div>
            <div class="carousel-item responsive">
                <img src="Style/images/everybodyLiesCover.png">
                <div class="carousel-caption">
                    <h2 style="font-size:4vw; font-family:'Tangerine', serif;">"It's a basic truth of the human condition that everybody lies. The only variable is about what."</h2>   
                    <h2 style="font-size:2vw; font-family:'Tangerine', serif; text-align:right;">~ Dr. Gregory House, M.D. </h2>                  
                </div>
            </div>
            <div class="carousel-item responsive">
                <img src="Style/images/overwatchCover.png">
                <div class="carousel-caption">
                    <h2 style="font-size:5vw; font-family:'Tangerine', serif;">"Cheers, luv! The calvary's here!"</h2>   
                    <h2 style="font-size:2vw; font-family:'Tangerine', serif; text-align:right;">~ Lena Oxton</h2>                      
                </div>
            </div>
            <div class="carousel-item responsive">
                <img src="Style/images/personaCover.png">
                <div class="carousel-caption">
                    <h2 style="font-size:5vw; font-family:'Tangerine', serif;">"Steal Back Your Future!"</h2>   
                    <h2 style="font-size:2vw; font-family:'Tangerine', serif; text-align:right;">~ Atlus</h2>                      
                </div>
            </div>
            <div class="carousel-item responsive">
                <img src="Style/images/zeldaCover.png">
                <div class="carousel-caption">
                    <h2 style="font-size:3vw; font-family:'Tangerine', serif;">" It's quite a vast world isn't it? You can even reach those mountains in the distance, if you walk far enough. We couldn't create such a wide world like this in the past."</h2>   
                    <h2 style="font-size:2vw; font-family:'Tangerine', serif; text-align:right;">~ Eiji Aonuma</h2>                     
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Jumbotron -->
   <%-- <div class="container-fluid" style="width:100%;">
        
    </div>--%>
    <div class="row jumbotron jumbotron-default">
        <div class="container-fluid" style="width:100%;">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-12 col-xl-12">            
                <h1 class="text-center promo">PROMOTIONAL ITEMS</h1>
            </div>
        </div>
    </div>


    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"
        ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
        <GroupTemplate>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="col-item">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </div>
            </div>
        </GroupTemplate>

        <ItemTemplate>


            <link href="style/css/style.css" rel="stylesheet">
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
                    </div>
                    <div class="price col-md-12">
                        Category:<asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </div>
                    <div class="price col-md-12">
                        Author:<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                    </div>
                    <p>
                        <div class="col-md-6">

                            <h5 class="price-text-color"><strike>Original Price: &#36<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></strike></>
                            </h5>
                        </div>

                        <div class="col-md-6">

                            <h5 class="disctprice-text-color"> Discounted Price: &#36<asp:Label ID="DiscountedPriceLabel" runat="server" Text='<%# ProcessMyDiscountedDataItem(Eval("DiscountPercent"), Eval("Price")) %>' />
                            </h5>
                        </div>


                    </p>

                    <div class ="col-md-12">
                        <asp:Button ID="Button1" class="btn btn-lg btn-primary btn-block" runat="server" Text="Add to Cart" CommandName="SelectedItem"
                             CommandArgument='<%# Eval("BookID") %>' />
                    </div>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString3 %>" SelectCommand="SELECT * FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID WHERE Discount.DiscountID IS NOT NULL and book.Stock &gt; 0"></asp:SqlDataSource>

</asp:Content>
