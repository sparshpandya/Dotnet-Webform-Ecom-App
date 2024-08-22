<%@ Page Language="C#" Title="Login Page" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StyleSavvy_FinalProject.Login" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h1 class="text-center">Login</h1>
                    </div>
                    <div class="card-body">
                        <asp:Label runat="server" ID="msg" Font-Size="Larger" CssClass="text-danger"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="validateInfo" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" />

                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="control-label">Email</asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                            <asp:RequiredFieldValidator ID="rfvEmail" Display="Dynamic" ValidationGroup="validateInfo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revEmail" Display="Dynamic" ValidationGroup="validateInfo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" CssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="control-label">Password</asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" />
                            <asp:RequiredFieldValidator ID="rfvPassword" Display="Dynamic" ValidationGroup="validateInfo" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <asp:Button ID="btnLogin" ValidationGroup="validateInfo" runat="server" OnClick="LoginBtn_Click" Text="Login" CssClass="btn btn-primary btn-block" />
                        </div>
                        <div class="form-group text-center">
                            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="Register">Don't have an account? Register here</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
