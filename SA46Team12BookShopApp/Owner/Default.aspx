<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SA46Team12BookShopApp.Owner.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Admin Page</title>
    <link href="../Style/css/cssOwner.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><asp:Label ID="lblTitle" runat="server" Text="Administrator Inventory Management"></asp:Label> </h1> 
            <br />
            <div class="mPanel">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:DropDownList ID="ddlCategoryFilter" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="CategoryID" OnSelectedIndexChanged="ddlCategoryFilter_SelectedIndexChanged" TabIndex="1">
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblSearch" runat="server" Text="Search: "></asp:Label>
                            <asp:TextBox ID="tbSearch" runat="server" AutoPostBack="true" TabIndex="2"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSubmit_Click" TabIndex="3" />
                            <asp:Button ID="btnViewAll" runat="server" OnClick="btnViewAll_Click" Text="View All" TabIndex="4" />
                        </asp:Panel>
                        <br />
                <div>
                    <asp:GridView ID="gvEditBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID"
                        OnRowEditing="gbEditBooks_RowEditing" Pagesize="5" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" 
                        EmptyDataText="No Records Found!" OnRowUpdating="gbEditBooks_RowUpdating" CellPadding="5" CssClass="mGrid" 
                        GridLines="Horizontal" ShowFooter="True" OnPageIndexChanging="gbEditBooks_PageIndexChanging" 
                        OnRowCancelingEdit="gbEditBooks_RowCancelingEdit">
                        <Columns>
                            <asp:TemplateField HeaderText="Book ID">
                                <ItemTemplate>
                                    <asp:Label id="lblBookID" Text='<%#Eval("BookID") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label id="lblBookID" Text='<%#Eval("BookID") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                    <ItemTemplate>
                                        <image src="/images/<%# Eval("ISBN") %>.jpg" width="90" height="120"></image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Title") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Text='<%#Eval("Title") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Genre">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Name") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Text='<%#Eval("Name") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Author">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Author") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Text='<%#Eval("Author") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IBSN">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("ISBN") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Text='<%#Eval("ISBN") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Stock") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Textbox ID="tbQty" TabIndex="5" Text='<%#Eval("Stock") %>' runat="server" Type="number"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price (Per Unit)">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Price") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Textbox ID="tbPrice" TabIndex="6" Text='<%#Eval("Price") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discount (%)">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("DiscountPercent") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Textbox ID="tbDiscP" TabIndex="7" Text='<%#Eval("DiscountPercent") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discounted Price">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Total") %>' runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Text='<%#Eval("Total") %>' runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" Text="◄" runat="server" CommandName="Edit" ToolTip="Edit" Width="40px" Height="20px"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnUpdate" Text="Save" runat="server" CommandName="Update" Width="60px" Height="30px" />
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" Width="60px" Height="30px" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#666666" ForeColor="Black" />
                        <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    </div>
                        <br />
                        <asp:Label ID="lblSuccess" Text="Save Success!" runat="server" ForeColor="White" BackColor="ForestGreen" Visible="False"/>
                        <br />
                        <asp:Label ID="lblError" Text="Error" runat="server" ForeColor="White" BackColor="#CC3300" Visible="False"/>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookshopConnectionString2 %>" SelectCommand="SELECT [Name], [CategoryID] FROM [Category]"></asp:SqlDataSource>
                    </div>
           </div>
    </form>
</body>
</html>
