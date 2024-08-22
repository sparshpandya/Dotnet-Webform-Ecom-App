<%@ Page Language="C#" Title="Checkout Page" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="StyleSavvy_FinalProject.Checkout" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container mt-5">
        <h1 class="text-center">Checkout</h1>
        <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <asp:Label runat="server" ID="msg" Font-Size="Larger" CssClass="text-success"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" ValidationGroup="vgCheckout" Display="Dynamic" />

                <div class="form-group">
                    <asp:Label ID="lblFullName" runat="server" AssociatedControlID="txtFullName" CssClass="control-label">Full Name</asp:Label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvFullName" Display="Dynamic" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="control-label">Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvEmail" Display="Dynamic" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                    <asp:RegularExpressionValidator ID="revEmail" Display="Dynamic" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" CssClass="control-label">Address</asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvAddress" Display="Dynamic" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCity" runat="server" AssociatedControlID="txtCity" CssClass="control-label">City</asp:Label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter your city" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblState" runat="server" AssociatedControlID="txtState" CssClass="control-label">State</asp:Label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter your state" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvState" Display="Dynamic" runat="server" ControlToValidate="txtState" ErrorMessage="State is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblZip" runat="server" AssociatedControlID="txtZip" CssClass="control-label">Zip Code</asp:Label>
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" placeholder="Enter your zip code" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvZip" Display="Dynamic" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip Code is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                    <asp:RegularExpressionValidator ID="revZip" Display="Dynamic" runat="server" ControlToValidate="txtZip" ErrorMessage="Invalid Zip Code format" ValidationExpression="^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCreditCard" runat="server" AssociatedControlID="txtCreditCard" CssClass="control-label">Credit Card Number</asp:Label>
                    <asp:TextBox ID="txtCreditCard" runat="server" CssClass="form-control" placeholder="Enter your credit card number" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvCreditCard" Display="Dynamic" runat="server" ControlToValidate="txtCreditCard" ErrorMessage="Credit Card Number is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                    <asp:RegularExpressionValidator ID="revCreditCard" Display="Dynamic" runat="server" ControlToValidate="txtCreditCard" ErrorMessage="Invalid Credit Card Number format" ValidationExpression="^\d{16}$" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblExpirationDate" runat="server" AssociatedControlID="txtExpirationDate" CssClass="control-label">Expiration Date</asp:Label>
                    <asp:TextBox ID="txtExpirationDate" runat="server" CssClass="form-control" placeholder="MM/YY" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvExpirationDate" Display="Dynamic" runat="server" ControlToValidate="txtExpirationDate" ErrorMessage="Expiration Date is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                    <asp:RegularExpressionValidator ID="revExpirationDate" Display="Dynamic" runat="server" ControlToValidate="txtExpirationDate" ErrorMessage="Invalid Expiration Date format" ValidationExpression="^(0[1-9]|1[0-2])\/?([0-9]{2})$" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCVV" runat="server" AssociatedControlID="txtCVV" CssClass="control-label">CVV</asp:Label>
                    <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" placeholder="CVV" ValidationGroup="vgCheckout" />
                    <asp:RequiredFieldValidator ID="rfvCVV" Display="Dynamic" runat="server" ControlToValidate="txtCVV" ErrorMessage="CVV is required" CssClass="text-danger" ValidationGroup="vgCheckout" />
                    <asp:RegularExpressionValidator ID="revCVV" Display="Dynamic" runat="server" ControlToValidate="txtCVV" ErrorMessage="Invalid CVV format" ValidationExpression="^\d{3,4}$" CssClass="text-danger" ValidationGroup="vgCheckout" />
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" PostBackUrl="Cart" CssClass="btn btn-danger" />
                    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" PostBackUrl="Products" CssClass="btn btn-info" />
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit Order" CssClass="btn btn-success" ValidationGroup="vgCheckout" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
