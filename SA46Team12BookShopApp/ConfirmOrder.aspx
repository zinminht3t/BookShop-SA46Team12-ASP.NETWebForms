<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="SA46Team12BookShopApp.Members.ConfirmOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <h1 class="text-center"><i class="fa fa-book text-primary"></i> My Orders</h1>
        <hr />
    </div>

    <div class="row">
        <div class="col-12" id="BookOrders">

            <asp:Panel ID="ShowAlert" runat="server">
                <div class="alert alert-success fade show" role="alert">
                    <strong class="text-center">Your order is successful!</strong>
                </div>
            </asp:Panel>
            <asp:Panel ID="ShowOrders" runat="server">
                <table class="table table-light">
                    <tr>
                        <th class="hidden-xs">Order ID</th>
                        <th>Order Date</th>
                        <th>Book Title</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Net Price</th>
                    </tr>

                    <asp:ListView ID="lstOrders" runat="server" DataSourceID="SQLDataSourceConfirmOrder" GroupPlaceholderID="groupPlaceHolder1"
                        ItemPlaceholderID="itemPlaceHolder1">
                        <GroupTemplate>
                            <tr>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>' /></td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("OrderDate", "{0:dd/MM/yyyy}") %>' /></td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Title") %>' /></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("UnitPrice") %>' /></td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Qty") %>' /></td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("NetPrice") %>' /></td>
                        </ItemTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource ID="SQLDataSourceConfirmOrder" runat="server" ConnectionString="<%$ 
                        ConnectionStrings:BooksDB %>" 
                        SelectCommand="SELECT * FROM Book INNER JOIN OrderDetail ON Book.BookID = OrderDetail.BookID INNER JOIN OrderHeader ON OrderDetail.OrderID = OrderHeader.OrderID WHERE OrderHeader.UserID = 'Blah' Order by OrderHeader.OrderDate DESC"></asp:SqlDataSource>

                </table>
            </asp:Panel>

            <asp:Panel ID="HideOrders" runat="server" Visible="False">
                <p class="NoOrder text-center" style="font-size:3em; color:#bbbbbb">There is no order history for you at this moment. Go shop some books!</p>

                <a href="Products.aspx" class="btn btn-warning" style="margin-left: 40px;"><i class="fa fa-arrow-left"></i>&nbsp;Browse Books</a>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
