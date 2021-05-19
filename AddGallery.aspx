<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddGallery.aspx.cs" Inherits="AddGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="scp" runat="server"></asp:ScriptManager>
    <section class="content-header">
        <h1>Gallery
        </h1>
        <ol class="breadcrumb">
            <li><a href="AdminHome.aspx"><i class="fa fa-dashboard"></i>DashBoard</a></li>
            <li><a href="AddGallery.aspx">Gallery</a></li>
        </ol>
    </section>
    <div class="right_col" role="main">
        <div class="">

            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-danger">
                            <div role="form">
                                <div class="box-body">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="myfontlb">Title:</label>
                                            <asp:TextBox ID="txttitle" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Gallery Image:  </label>
                                            <asp:FileUpload ID="fpsilder" runat="server" CssClass="form-control"></asp:FileUpload>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsave_Click" />
                                </div>

                                <div class="row">
                                    <div class="col-lg-10 col-md-10 col-sm-10">
                                        <asp:GridView ID="gvslider" runat="server" OnRowCommand="gvslider_RowCommand" AutoGenerateColumns="False"
                                            CssClass="table  table-responsive table-bordered" OnRowDataBound="gvslider_RowDataBound" OnPageIndexChanging="gvslider_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Title">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("GalleryImage") %>' Width="100px" Height="100Px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btndelete" runat="server" Text="Lock" CssClass="btn btn-danger" CommandName='<%# Eval("Status") %>' CommandArgument='<%# Eval("Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btndel" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="Del" CommandArgument='<%# Eval("Id") %>' OnClientClick="if (!confirm('Are you sure you want to Delete? ')) return false;" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



