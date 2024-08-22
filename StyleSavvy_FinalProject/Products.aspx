
<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="StyleSavvy_FinalProject.Products" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container">
        <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" CssClass="form-control mb-3">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, name, description, price, image_url, category_id FROM products WHERE (category_id = @category_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="category_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# "Images/" + Eval("image_url") %>' CssClass="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("name") %></h5>
                                <p class="card-text"><%# Eval("description") %></p>
                                <p class="card-text"><strong>Price: </strong>$<%# Eval("price") %></p>
                                <asp:LinkButton ID="lnkCategory" OnClick="lnkCategory_Click" CommandArgument='<%# Eval("name") + " At $" + Eval("price") %>' runat="server" CssClass="btn btn-primary">Shop <%# Eval("name") %></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
