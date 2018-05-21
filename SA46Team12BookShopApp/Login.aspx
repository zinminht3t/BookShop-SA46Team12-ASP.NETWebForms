<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SA46Team12BookShopApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

<!-- Two Column Section -->
<div class="container-fluid padding">
	<div class="row padding">
		<div class="col-lg-6">
			 <asp:Login ID="Login2" runat="server">
                   
                 <LayoutTemplate>
                      <form class="form-login">
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                         
                                            <tr>
                                                <td align="left" colspan="2"><h3>Login</h3></td>
                                                
                                            </tr>
                                      
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <div class="checkbox"></div>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text=" &nbsp;Remember me"></asp:Checkbox>
                                </td>
                                </div>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" class="btn btn-lg btn-primary btn-block" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                          </td>
                          </tr>
                          </table>
                          </form>
                    </LayoutTemplate>
                    
                </asp:Login>


		</div>
		<div class="col-lg-6">
			 <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="left" colspan="2"><h3>Sign Up</h3></td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
		</div>
	</div>
</div>

</asp:Content>