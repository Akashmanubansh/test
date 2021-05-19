<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <h1>Dashboard
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active"><a href="AdminHome.aspx">Dashboard </a></li>
        </ol>
    </section>
    <div class="content-header">
        <div class="row">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box" style="background-color: #008c7a">
                        <div class="inner" style="color: white">
                            <h3>
                                <asp:Label ID="lblGallery" runat="server" Text="0"></asp:Label></h3>
                            <p>Gallery</p>
                        </div>
                        <div class="icon" style="color: white">
                            <i class="glyphicon glyphicon-camera"></i>
                        </div>
                    </div>
                </div>
            </asp:LinkButton>
            <!-- ./col -->
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box" style="background-color: #00218c">
                        <div class="inner" style="color: white">
                            <h3>
                                <asp:Label ID="lblBlog" runat="server" Text="0"></asp:Label></h3>
                            <p>Blog</p>
                        </div>
                        <div class="icon" style="color: white">
                            <i class="glyphicon glyphicon-envelope"></i>
                        </div>
                    </div>
                </div>
            </asp:LinkButton>

            <!-- ./col -->
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box" style="background-color: #6b008c">
                        <div class="inner" style="color: white">
                            <h3>
                                <asp:Label ID="lblContact" runat="server" Text="0"></asp:Label></h3>
                            <p>ContactUS</p>
                        </div>
                        <div class="icon" style="color: white">
                            <i class="glyphicon glyphicon-user"></i>
                        </div>
                    </div>
                </div>
            </asp:LinkButton>
        </div>
    </div>
</asp:Content>

