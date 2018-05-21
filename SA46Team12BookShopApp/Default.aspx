<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SA46Team12BookShopApp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- Image Slider -->
    <div id="slides" class="carousel slide" data-ride="carousel" data-interval="2000">
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
			<h3>First Web Page</h3>
			<button type="button" class="btn btn-outline-light btn-lg">VIEW DEMO</button>
			<button type="button" class="btn btn-primary btn=lg">Get Started</button>
		</div>
	</div>
	<div class="carousel-item">
		<img src="images/9780062377210.jpg">
	</div>
	<div class="carousel-item">
		<img src="images/9780062390851.jpg">
	</div>
	<div class="carousel-item">
		<img src="images/9780062498533.jpg">
	</div>
	<div class="carousel-item">
		<img src="images/9780262035613.jpg">
	</div>	
</div>
</div>
</asp:Content>
