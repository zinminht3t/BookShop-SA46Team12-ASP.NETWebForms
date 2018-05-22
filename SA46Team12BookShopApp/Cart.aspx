<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SA46Team12BookShopApp.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div id="mainContainer" class="container">
        <div class="container">

            <%--jumboton--%>
            <div class="jumbotronKit">
                <h1 class="text-center"><i class="fas fa-cart-arrow-down"></i>&nbsp;Cart</h1>
                <hr />
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <%--gridview--%>
                    <asp:GridView ID="cartGridview" runat="server" CssClass="Grid" AutoGenerateColumns="False" GridLines="None"
                        EmptyDataText="No records has been added." Width="100%" CellPadding="5">

                        <HeaderStyle HorizontalAlign="Center" BackColor="#3D7169" ForeColor="#FFFFFF" />
                        <AlternatingRowStyle BackColor="#F8F8F8" />

                        <Columns>

                            <%--<asp:TemplateField HeaderText="List">
                            <ItemTemplate>
                                <asp:Label ID="lblList" runat="server" Text="0" />
                            </ItemTemplate>
                            <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:TemplateField>--%>    <%--list column (to delete)--%>

                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-Width="120">
                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--title column--%>

                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="120">
                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--price column--%>

                            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" ItemStyle-Width="120">
                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--discount column--%>

                            <asp:TemplateField HeaderText="Qty">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" OnClick="MyButtonClick">
                                    <i class="fa fa-minus-square"></i></asp:LinkButton>                                   
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info" OnClick="MyButtonClick2">
                                    <i class="fa fa-plus-square"></i></asp:LinkButton>   
                                    <%--<button class="btn btn-info"><i class="fas fa-plus-square"></i></button>--%>
                                </ItemTemplate>
                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <%--qty column--%>

                            <asp:TemplateField HeaderText="Subtotal">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubtotal" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <%--subtotal column--%>
                        </Columns>
                    </asp:GridView>

                    <br />
                    <%--buttons--%>
                    <div class="container">
                        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="Checkout" CssClass="btn btn-primary" Style="float: right;" />
                        <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" OnClick="Products" CssClass="btn btn-warning" Style="float: left;" />
                    </div>
                    <br />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
