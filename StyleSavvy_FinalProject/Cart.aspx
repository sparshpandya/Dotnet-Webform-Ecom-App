<%@ Page Language="C#" Title="Cart Page" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="StyleSavvy_FinalProject.Cart" %>

<asp:Content runat="server" ContentPlaceHolderID="main">

    <div class="container mt-5">
        <h1 class="text-center">Shopping Cart</h1>
        <asp:Label runat="server" ID="msg" Font-Size="Larger" CssClass="text-danger"></asp:Label>
        <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" Height="200px" Width="100%"></asp:ListBox>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-md-8 text-center">
                <asp:Button ID="btnEmpty" runat="server" OnClick="btnEmpty_Click" Text="Empty Cart" CssClass="btn btn-danger mx-2" />
                <asp:Button ID="btnRemove" OnClick="btnRemove_Click" runat="server" Text="Remove Item" CssClass="btn btn-warning mx-2" />
                <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn btn-secondary mx-2" PostBackUrl="~/Products.aspx" />
                <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" CssClass="btn btn-success mx-2" />
            </div>
        </div>
    </div>
</asp:Content>
