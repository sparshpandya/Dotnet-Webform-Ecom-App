<%@ Page Language="C#" MasterPageFile="~/Site1.Master" Title="Order Confirmation" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="StyleSavvy_FinalProject.Confirmation" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container mt-5">
        <div class="text-center">
            <h2>Thank you,
                <asp:Literal ID="litFullName" runat="server"></asp:Literal>! Order placed.</h2>
            <h3 class="mt-4">Order Details:</h3>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <p><strong>Full Name:</strong>
                            <asp:Literal ID="litFullNameDetail" runat="server"></asp:Literal></p>
                        <p><strong>Email:</strong>
                            <asp:Literal ID="litEmail" runat="server"></asp:Literal></p>
                        <p><strong>Address:</strong>
                            <asp:Literal ID="litAddress" runat="server"></asp:Literal></p>
                        <p><strong>City:</strong>
                            <asp:Literal ID="litCity" runat="server"></asp:Literal></p>
                        <p><strong>State:</strong>
                            <asp:Literal ID="litState" runat="server"></asp:Literal></p>
                        <p><strong>Zip:</strong>
                            <asp:Literal ID="litZip" runat="server"></asp:Literal></p>
                        <p><strong>Credit Card:</strong>
                            <asp:Literal ID="litCreditCard" runat="server"></asp:Literal></p>
                        <p><strong>Expiration Date:</strong>
                            <asp:Literal ID="litExpirationDate" runat="server"></asp:Literal></p>
                        <p><strong>CVV:</strong>
                            <asp:Literal ID="litCVV" runat="server"></asp:Literal></p>
                        <div class="text-center mt-4">
                            <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btn btn-primary" PostBackUrl="Products" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
