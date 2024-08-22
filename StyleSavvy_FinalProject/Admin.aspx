<%@ Page Language="C#" Title="Admin Page" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Admin.aspx.cs" Inherits="StyleSavvy_FinalProject.Admin" %>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <div class="container mt-5">
        <h1 class="text-center">Admin Page</h1>
        <asp:Label runat="server" ID="litMessage" CssClass="text-danger" />

        <div class="form-group">
            <label for="ddlCategories">Select Category</label>
            <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" DataSourceID="sqlCategories" DataTextField="name" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged"></asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:DataList ID="dlProducts" runat="server" CssClass="list-group" DataSourceID="sqlProducts">
                <ItemTemplate>
                    <div class="list-group-item">
                        <h5 class="mb-1"><%# Eval("name") %></h5>
                        <p class="mb-1"><%# Eval("description") %></p>
                        <small>Price: $<%# Eval("price") %></small>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div class="form-group">
            <h2 class="text-center">Manage Categories</h2>
            <asp:GridView ID="gvCategories" runat="server" CssClass="table table-striped" DataSourceID="sqlCategoriesCRUD" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" AllowSorting="True" OnRowDeleting="gvCategories_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="name" HeaderText="Category Name" SortExpression="name" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlCategoriesCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM category"
                InsertCommand="INSERT INTO category (name) VALUES (@name)"
                UpdateCommand="UPDATE category SET name = @name WHERE id = @id"
                DeleteCommand="DELETE FROM category WHERE id = @id">
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>

        <div class="form-group">
            <h2 class="text-center">Add Category</h2>
            <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Category Name is required" CssClass="text-danger" ValidationGroup="vgAddCategory" Display="Dynamic" /><br />
            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-primary mt-2" OnClick="btnAddCategory_Click" ValidationGroup="vgAddCategory" />
        </div>

        <div class="row mt-5">
            <div class="col-md-6">
                <h2 class="text-center">Products</h2>
                <asp:GridView ID="gvProducts" runat="server" CssClass="table table-striped" DataSourceID="sqlProductsCRUD" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gvProducts_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-6">
                <h2 class="text-center">Product Details</h2>
                <asp:DetailsView ID="dvProductDetails" runat="server" CssClass="table table-striped" DataSourceID="sqlProductDetailsCRUD" AutoGenerateRows="False" DataKeyNames="id" DefaultMode="ReadOnly">
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="description" HeaderText="Description" />
                        <asp:BoundField DataField="price" HeaderText="Price" />
                        <asp:BoundField DataField="image_url" HeaderText="Image URL" />
                        <asp:BoundField DataField="category_id" HeaderText="Category ID" ReadOnly="True" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="sqlCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, name FROM category"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT name, description, price FROM products WHERE category_id = @category_id" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategories" Name="category_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlProductsCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, name, price FROM products" DeleteCommand="DELETE FROM products WHERE id = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlProductDetailsCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM products WHERE id = @id" UpdateCommand="UPDATE products SET name = @name, description = @description, price = @price, image_url = @image_url WHERE id = @id" InsertCommand="INSERT INTO products (name, description, price, image_url, category_id) VALUES (@name, @description, @price, @image_url, @category_id)" DeleteCommand="DELETE FROM products WHERE id = @id">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvProducts" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="image_url" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="image_url" Type="String" />
            <asp:Parameter Name="category_id" Type="Int32" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
