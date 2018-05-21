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
                <img src="images/9780060555665.jpg">
                <div class="carousel-caption">
                    <h1 class="display-2">Get Books</h1>
                    <%--<h3></h3>--%>
                    <%--<button type="button" class="btn btn-outline-light btn-lg">VIEW DEMO</button>--%>
                    <button type="button" class="btn btn-primary btn-lg">Add to Cart</button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/9780062377210.jpg">
                <div class="carousel-caption">
                    <h1 class="display-2">Get Books</h1>
                    <button type="button" class="btn btn-primary btn-lg">Add to Cart</button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/9780399588174.jpg">
                <div class="carousel-caption">
                    <h1 class="display-2">Get Books</h1>
                    <button type="button" class="btn btn-primary btn-lg">Add to Cart</button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/9781911015222.jpg">
                <div class="carousel-caption">
                    <h1 class="display-2">Get Books</h1>
                    <button type="button" class="btn btn-primary btn-lg">Add to Cart</button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/9780425285176.jpg">
                <div class="carousel-caption">
                    <h1 class="display-2">Get Books</h1>
                    <button type="button" class="btn btn-primary btn-lg">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Jumbotron -->    
    <div class="container-fluid">
        <div class="row jumbotron jumbotron-default">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
                 <h2 class="display-5 text-center">PROMOTIONAL ITEMS</h2>              
            </div>            
        </div>
    </div>

    <!-- Promotional Cards -->
    <div class="container-fluid padding">
        <div class="row text-center padding">
		<div class="col-xs-12 col-sm-6 col-md-3">    
                <div class="card">
                    <img class="card-img-top" src="images/9780744017311.jpg">
                    <div class="card-body">
                        <h4 class="card-title">The Art of Personas 5</h4>
                        <p class="card-text">Persona 5 isn’t just a fantastic video game, it’s an absolute feast for the senses, with a strong, confident art style that runs from its character design all the way through to its menus.</p>                       
                        <h5 class="orig-price">Original Price: 39.99</h5>
                        <h5 class="promo-price">Discounted Price: 31.99</h5>
                        </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3">            
                <div class="card">
                    <img class="card-img-top" src="images/9781593276034.jpg">
                    <div class="card-body">
                        <h4 class="card-title">Python Crash Course</h4>
                        <p class="card-text">Python Crash Course is a fast-paced, thorough introduction to Python that will have you writing programs, solving problems, and making things that work in no time.</p>
                        <h5 class="orig-price">Original Price: 39.95</h5>
                        <h5 class="promo-price">Discounted Price: 31.96</h5>    
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="card">
                    <img class="card-img-top" src="images/9780984782857.jpg">
                    <div class="card-body">
                        <h4 class="card-title">Cracking the Coding Interview: 189 Programming Questions and Solutions</h4>
                        <p class="card-text">This is a deeply technical book and focuses on the software engineering skills to ace your interview. The book includes 189 programming interview questions and answers, as well as other advice.</p>
                        <h5 class="orig-price">Original Price: 26.79</h5>
                        <h5 class="promo-price">Discounted Price: 21.43</h5>        
                        </div>
                </div>
            </div>

             <div class="col-sm-12 col-md-3">         
                <div class="card">
                    <img class="card-img-top" src="images/9780262035613.jpg">
                    <div class="card-body">
                        <h4 class="card-title">Deep Learning</h4>
                        <p class="card-text">The hierarchy of concepts allows the computer to learn complicated concepts by building them out of simpler ones; a graph of these hierarchies would be many layers deep. This book introduces a broad range of topics in deep learning.</p>
                        <h5 class="orig-price">Original Price: 80.00</h5>
                        <h5 class="promo-price">Discounted Price: 64.00</h5>  
                        </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row padding">
        <div class="col-10"></div>
        <div class="col-1">
            <a href="#" class="btn btn-primary">View More</a>
        </div>
    </div>

</asp:Content>
