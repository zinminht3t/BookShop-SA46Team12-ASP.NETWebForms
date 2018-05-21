<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SA46Team12BookShopApp.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-2"></div>
    <div class="col-8">
        <div class="row">
            <div class="col-6">
                <h4>Books</h4>
                <br />
                <asp:GridView ID="cartBooks" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Columns>
                </asp:GridView>

                <table class="table table-light">
                    <tr>
                        <td>Amount :</td>
                        <td>
                            <asp:Label ID="lblAmount" runat="server" Text="0" CssClass="text-primary float-right"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Discount :</td>
                        <td>
                            <asp:Label ID="lblDiscount" runat="server" Text="0" CssClass="text-danger float-right"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Total :</td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text="0" CssClass="text-primary float-right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-6">

                <h4>Personal Details</h4>
                <br />
                <div class="form-group">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" Rows="2" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Postal Code" TextMode="Number"></asp:TextBox>
                </div>


            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <a href="#" class="btn btn-warning">
                    <i class="fa fa-arrow-left"></i>
                    Edit Orders
                </a>

            </div>

            <div class="col-8">
            </div>
            <div class="col-2">
                <button runat="server" id="btnPay" onserverclick="btnPay_Click" class="btn btn-primary" title="Pay and Order">
                    <i class="fa fa-credit-card"></i> Pay and Order
                </button>

            </div>
        </div>
    </div>

    <div class="col-2"></div>


</asp:Content>
