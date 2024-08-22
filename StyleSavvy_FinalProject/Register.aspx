<%@ Page Language="C#" Title="Register Page" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StyleSavvy_FinalProject.Register" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container mt-5">
        <h1 class="text-center">Register</h1>
        <div class="row justify-content-center mt-4">
            <div class="col-md-6">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" Display="Dynamic" ValidationGroup="vgRegister" />

                <div class="form-group">
                    <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" CssClass="control-label">Username</asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="control-label">Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="control-label">Password</asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblFullName" runat="server" AssociatedControlID="txtFullName" CssClass="control-label">Full Name</asp:Label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" />
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" CssClass="control-label">Address</asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address" />
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber" CssClass="control-label">Phone Number</asp:Label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter your phone number" />
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                    <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid phone number format" ValidationExpression="^\d{10}$" CssClass="text-danger" Display="Dynamic" ValidationGroup="vgRegister" />
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" CssClass="btn btn-primary" ValidationGroup="vgRegister" />
                </div>
                <div class="form-group text-center">
                    <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="Login">Already have an account? Login here</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
