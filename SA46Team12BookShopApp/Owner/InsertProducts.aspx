<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="InsertProducts.aspx.cs" Inherits="SA46Team12BookShopApp.Owner.InsertProducts" %>

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
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
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
                            <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" OnClick="btnBack_Click" CausesValidation="False" Text="Back To Search" TabIndex="4" EnableClientScript="false" />
                        </div>
                        <div class="auto-style1">
                        </div>
                        <div class="auto-style1">
                        </div>
                        <div class="col-md-2 col-sm-12">
                        </div>
                        <div class="col-md-3 col-sm-12">
                        </div>
                    </div>
                    <br />
                    <div>
                        <asp:GridView ID="gvInsertBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID"
                            AllowSorting="True" HorizontalAlign="Center" ShowHeaderWhenEmpty="true"
                             CellPadding="5" CssClass="gridtable table table-striped"
                            GridLines="Horizontal" ShowFooter="True" OnRowCancelingEdit="gbInsertBooks_RowCancelingEdit" OnRowEditing="gbInsertBooks_RowEditing" OnRowUpdating="gbInsertBooks_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBookID" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblBookID" runat="server" Text=""></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="fuBookImg" runat="server" />
                                        <br />
                                        <br />
                                        <br />  
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fuBookImg" ErrorMessage="File Not Uploaded!"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" ItemStyle-Width="100">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbTitle" CssClass="formcon" TabIndex="7" runat="server" />
                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbTitle" runat="server" ErrorMessage="Title must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genre">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlCategoryFilter" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="CategoryID" CssClass="form-control">
                                        </asp:DropDownList>                                        
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Author">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbAuthor" CssClass="formcon" TabIndex="7" runat="server" />
                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbAuthor" runat="server" ErrorMessage="Author must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ISBN">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbISBN" CssClass="formcon" TabIndex="7" runat="server" type="number" />
                                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[0-9]{13}$" ControlToValidate="tbISBN" ErrorMessage="Incorrect format. ISBN is 13 numeric digits"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbISBN" runat="server" ErrorMessage="ISBN must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:Button ID="btnInsert" CssClass="btn btn-outline-warning btn-sm btnedit" Text="Create New Product ID" runat="server" CommandName="Edit" ToolTip="Insert" Width="200px" Height="30px"/>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbQty" TabIndex="5" CssClass="formcon" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbQty" runat="server" ErrorMessage="Qty should not consist of decimal, alphabets or less than 0" ValidationExpression="^[0-9]{0,}$"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbQty" runat="server" ErrorMessage="Quantity must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit Price">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbPrice" CssClass="formcon" TabIndex="6" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="tbPrice" runat="server" ErrorMessage="Price should not consist of more than 2dp, alphabets or less than 0 " ValidationExpression="^\d+(\.\d\d)?$"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbPrice" runat="server" ErrorMessage="Price must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Discount(%)">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbDiscP" CssClass="formcon" TabIndex="7" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="tbDiscP" runat="server" ErrorMessage="Discount should not consist of more than 2dp, alphabets & must be between 0-100%" ValidationExpression="^0*(100\.00|[0-9]?[0-9]\.[0-9]{2})$"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbDiscP" runat="server" ErrorMessage="Discount must not be empty"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Discount Desc">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbDiscDesc" CssClass="formcon" TabIndex="7" runat="server" />
                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbDiscDesc" runat="server" ErrorMessage="Description must not be empty "></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="btnUpdate" CssClass="btn btn-outline-info btn-sm btnSave" Text="Save" runat="server" CommandName="Update" Width="60px" Height="30px" />
                                        <br />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-outline-danger btn-sm" Text="Cancel" runat="server" CommandName="Cancel" Width="60px" Height="30px" CausesValidation="False" EnableClientScript="false" />
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
                    <asp:Label ID="lblSuccess" runat="server" CssClass="alert alert-success" Visible="False" />
                    <br />
                    
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" SelectCommand="SELECT [Name], [CategoryID] FROM [Category]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
