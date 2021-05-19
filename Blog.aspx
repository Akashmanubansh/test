<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="MKSCGROUP_Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../bower_components/select2/dist/js/select2.full.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <h1>Website Blog 
        </h1>
        <ol class="breadcrumb">
            <li><a href="AdminHome.aspx"><i class="fa fa-dashboard"></i>Dashboard</a></li>
            <li><a href="Blog.aspx">Blog</a></li>
        </ol>
    </section>
    <div class="right_col" role="main">
        <div class="">
            <div class="content">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <%--<h3 class="box-title">Select2</h3>--%>
                        <div class="box-tools pull-right">
                            
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Blog Title:</label>
                                    <asp:TextBox ID="txtblog" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Image:</label>
                                    <asp:FileUpload ID="fempimage" runat="server" CssClass="form-control"></asp:FileUpload>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Blog Name:</label>
                                    <asp:TextBox ID="txtblogername" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Blog Email id:</label>
                                    <asp:TextBox ID="txtemailid" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Blog Description:</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:Button ID="btnsave" runat="server" Text="Save" Style="margin-top: 25px" CssClass=" btn btn-danger" OnClick="btnsave_Click1" />
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView ID="grvblog" runat="server" OnRowCommand="grvblog_RowCommand" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="grvblog_PageIndexChanging" CssClass="table  table-responsive" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name of bloger" ItemStyle-HorizontalAlign="Justify">
                                            <ItemTemplate>
                                                <asp:Label ID="lblname" runat="server" Text='<%#Eval("NAMEOFBLOG")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Bloger Email id" ItemStyle-HorizontalAlign="Justify">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBLOGEREMAILID" runat="server" Text='<%#Eval("BLOGEREMAILID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Blog Title" ItemStyle-HorizontalAlign="Justify">
                                            <ItemTemplate>
                                                <asp:Label ID="lblblog" runat="server" Text='<%#Eval("blogtitle")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Blog Description" ItemStyle-HorizontalAlign="Justify">
                                            <ItemTemplate>
                                                <asp:Label ID="lblblogDescription" runat="server" Text='<%#Eval("blogDescription")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Blog Description">
                                            <ItemTemplate>
                                                <%--  <asp:Image ID="img" runat="server"  ImageUrl='<%# Eval("blogimage") %>' Width="100px" Height="100Px"/>--%>
                                                <asp:Image ID="imgb" runat="server" ImageUrl='<%# Bind("blogimage","/Writereaddata/Blog/{0}") %>' Style="width: 100px; height: 100px;" CssClass="embed-responsive-item" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:Button ID="lbledit" runat="server" Text="Edit" CommandName="Edit123" CommandArgument='<%#Eval("trackid")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:Button ID="lbldelete" runat="server" Text="Delete" CommandName="Delete123" CommandArgument='<%#Eval("trackid")%>' OnClientClick="if (!confirm('Are you sure you want to Delete? ')) return false;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

