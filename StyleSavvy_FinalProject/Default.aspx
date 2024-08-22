<%@ Page Language="C#" Title="Home Page" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Default.aspx.cs" Inherits="StyleSavvy_FinalProject.Default" %>

<asp:Content ContentPlaceHolderID="main" runat="server">
    <div class="container mt-5">
        <div class="jumbotron text-center">
            <h1 class="display-4">Welcome to StyleSavvy</h1>
            <p class="lead">Your one-stop shop for the latest in fashion.</p>
            <hr class="my-4">
            <p>Explore our collection and find your style today.</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
            <asp:LinkButton ID="btnShopNow" runat="server" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Products.aspx">Shop Now</asp:LinkButton>
        </div>

        <div class="row text-center">
            <asp:Repeater ID="rptCategories" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-md-3">
                        <div class="card">
                            <asp:Image ID="imgCategory" runat="server" ImageUrl='<%# "Images/" + Eval("image_url") %>' class="card-img-top" alt='<%# Eval("name") %>' />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("name") %></h5>
                                <asp:LinkButton ID="lnkCategory" OnClick="shopBtn_Click" CommandArgument='<%# Eval("id") %>' runat="server" CssClass="btn btn-primary">Shop <%# Eval("name") %></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
