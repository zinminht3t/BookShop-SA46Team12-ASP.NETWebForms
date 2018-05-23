<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SA46Team12BookShopApp.Owner.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>GetBooks - Admin Page</title>
    <link href="../Style/css/cssOwner.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/756b538f64.js"></script>
</head>
<body>


    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="default.aspx" id="imgLogo" style="font-size: 2.2em;">
            <img src="../style/images/getbooksv4.png" style="height: 7%; width: 7%;"/>
            GetBooks
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="default.aspx">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                     <a class="nav-link" href="#" runat="server" onserverclick="logout">Logout</a>
                </li>
            </ul>

        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-top: 70px;">
            <div class="row">
                <div class="col-md-12">
                    <br />
                    <br />
                    <h1 class="text-center"><i class="fa fa-cog text-info"></i>&nbsp;

                <asp:Label ID="lblTitle" runat="server" Text="Administrator Inventory Management"></asp:Label>
                    </h1>
                    <hr />
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3 col-sm-12">
                            <asp:DropDownList ID="ddlCategoryFilter" runat="server" AutoPostBack="true" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="CategoryID" OnSelectedIndexChanged="ddlCategoryFilter_SelectedIndexChanged" TabIndex="1" CssClass="form-control">
                                <asp:ListItem Value="0">All</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-1 col-sm-12">
                            <asp:Label ID="lblSearch" runat="server" Text="Search: "></asp:Label>
                        </div>
                        <div class="col-md-3 col-sm-12">
                            <asp:TextBox ID="tbSearch" CssClass="form-control float-right" runat="server" AutoPostBack="false" TabIndex="2"></asp:TextBox>
                        </div>
                        <div class="col-md-1 col-sm-12">
                            <asp:Button ID="btnSearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnSubmit_Click" AutoPostBack="false" TabIndex="3" />
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <asp:Button ID="btnViewAll" CssClass="btn btn-success" runat="server" OnClick="btnViewAll_Click" Text="View All" TabIndex="4" />
                        </div>
                    </div>
                    <br />
                    <div>
                        <asp:GridView ID="gvEditBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID"
                            OnRowEditing="gbEditBooks_RowEditing" PageSize="5" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center"
                            EmptyDataText="No Records Found!" OnRowUpdating="gbEditBooks_RowUpdating" CellPadding="5" CssClass="gridtable table table-striped"
                            GridLines="Horizontal" ShowFooter="True" OnPageIndexChanging="gbEditBooks_PageIndexChanging"
                            OnRowCancelingEdit="gbEditBooks_RowCancelingEdit">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBookID" Text='<%#Eval("BookID") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblBookID" Text='<%#Eval("BookID") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <image src="../images/<%# Eval("ISBN") %>.jpg" width="90"></image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" ItemStyle-Width="100">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Title") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label Text='<%#Eval("Title") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genre">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Name") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label Text='<%#Eval("Name") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Author">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Author") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label Text='<%#Eval("Author") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IBSN">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("ISBN") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label Text='<%#Eval("ISBN") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Stock") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbQty" TabIndex="5" CssClass="formcon" Text='<%#Eval("Stock") %>' runat="server" Type="number" min="0" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit Price">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Price") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbPrice" CssClass="formcon" TabIndex="6" Text='<%#Eval("Price") %>' runat="server" Type="number" Step=".01" min="0" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Discount(%)">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("DiscountPercent") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbDiscP" CssClass="formcon" TabIndex="7" Text='<%#Eval("DiscountPercent") %>' runat="server" Type="number" Step=".01" min="0" max="100" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Discount Desc">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("DiscountDesc") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbDiscDesc" CssClass="formcon" TabIndex="7" Text='<%#Eval("DiscountDesc") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Net Price">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("Total") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label Text='<%#Eval("Total") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" CssClass="btn btn-outline-warning btn-sm btnedit" Text="Edit" runat="server" CommandName="Edit" ToolTip="Edit"/>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="btnUpdate" CssClass="btn btn-outline-info btn-sm btnSave" Text="Save" runat="server" CommandName="Update" Width="60px" Height="30px" />
                                        <br />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-outline-danger btn-sm" Text="Cancel" runat="server" CommandName="Cancel" Width="60px" Height="30px" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#30a1b2" ForeColor="Black" />
                            <HeaderStyle BackColor="#30a1b2" Font-Bold="True" ForeColor="#eeeeee" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </div>
                    <br />
                    <asp:Label ID="lblSuccess" Text="Save Success!" runat="server" CssClass="alert alert-success" Visible="False" />
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" SelectCommand="SELECT [Name], [CategoryID] FROM [Category]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
