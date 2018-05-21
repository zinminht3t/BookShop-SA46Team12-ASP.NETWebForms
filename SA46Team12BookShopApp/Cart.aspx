<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SA46Team12BookShopApp.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />  
        <div id="mainContainer" class="container">  
        <div class="container">   
            <div class="jumbotron">
                <h3>Cart</h3>
            </div>
        <div class="row">  
        <div class="col-lg-12">  
                                
        <asp:GridView ID="cartGridview" runat="server" CssClass="Grid" AutoGenerateColumns="False" GridLines="None"
            EmptyDataText="No records has been added." ShowFooter="true" Width="100%" CellPadding="5">

            <HeaderStyle HorizontalAlign="Center" BackColor="#3D7169" ForeColor="#FFFFFF"/>
            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
            <AlternatingRowStyle BackColor="#F8F8F8" />

        <Columns>

        <%--<asp:TemplateField HeaderText="List">
            <ItemTemplate>
                <asp:Label ID="lblList" runat="server" Text="0" />
            </ItemTemplate>
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:TemplateField>--%>

        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-Width="120" >
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="120" >
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:BoundField DataField="ISBN" HeaderText="Discount" SortExpression="Price" ItemStyle-Width="120" >
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="Qty">
           <%-- <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
            </ItemTemplate>--%>
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Subtotal">
            <ItemStyle Width="120px" HorizontalAlign="Center" />
        </asp:TemplateField>

        </Columns>
        </asp:GridView>

        <div class ="container"> 
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="Checkout" class="btn btn-primary" style="float:right;" />
            <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" OnClick="Products" class="btn btn-warning" style="float:left;" />
        </div>
        <br />

<%--        <asp:TextBox ID="titleBox" runat="server" />
            <br />
            <asp:TextBox ID="priceBox" runat="server" />
            <br />
        --%>
      
        </div>  
        </div>  
        </div>  
        </div>  
   
</asp:Content>
