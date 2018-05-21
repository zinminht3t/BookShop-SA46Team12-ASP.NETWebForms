<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SA46Team12BookShopApp.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <h1 class="text-center"><i class="fa fa-cart-plus text-primary"></i>Checkout</h1>
        <hr />
    </div>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="row">
                <div class="col-6">
                    <h4>
                        <i class="fa fa-book text-warning"></i>
                        Books Cart
                    <asp:Label ID="lblBooks" runat="server" Text="0" CssClass="float-right text-primary"></asp:Label>
                    </h4>
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

                    <h4>
                        <i class="text-warning fa fa-user"></i>
                        Personal Details</h4>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name" ToolTip="Enter your name" ValidateRequestMode="Enabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtName" ForeColor="Red"
                            ErrorMessage="RequiredFieldValidator">Name is required</asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtEmail" ForeColor="Red"
                            ErrorMessage="RequiredFieldValidator">Email is required</asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtAddress" ForeColor="Red"
                            ErrorMessage="RequiredFieldValidator">Address is required</asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Postal Code" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtPostCode" ForeColor="Red"
                            ErrorMessage="RequiredFieldValidator">Postal is required</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server"
                            ErrorMessage="RangeValidator" ControlToValidate="txtPostCode"
                            ForeColor="Red" Type="Integer"
                            MaximumValue="7" MinimumValue="6">Postal Code should be 6 letters.</asp:RangeValidator>
                    </div>


                    <button runat="server" id="btnPay" onserverclick="btnPay_Click" class="float-right btn btn-primary" title="Pay and Order">
                        <i class="fa fa-credit-card"></i> Pay and Order</button>


                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <a href="../Cart.aspx" class="btn btn-warning">
                        <i class="fa fa-arrow-left"></i>
                        Edit Orders
                    </a>

                </div>

                <div class="col-8">
                </div>
                <div class="col-2">
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>


</asp:Content>
