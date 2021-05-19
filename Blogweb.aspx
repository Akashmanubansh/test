<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Blogweb.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Vendor/dist/css/AdminLTE.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper"></div>
    <div class="content">
        <div class="row">

            <div class="col-md-3" style="margin-left:34px">
                <div class="box box-primary" style="background: #a1cae4">
                    <div class="box-header with-border">
                        <h3 class="box-title">Blog List</h3>
                    </div>

                    <asp:Repeater ID="listrepate" runat="server">
                        <ItemTemplate>
                            <div class="box-body">
                                <strong><i class="fa fa-book margin-r-5"></i>
                                    <asp:LinkButton ID="hylink" runat="server" CommandName='<%# Eval("trackid")%>' Text='<%# Eval("blogtitle") %>' OnCommand="hylink_Command"></asp:LinkButton></strong>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
            <div class="col-md-8">
                <div class="nav-tabs-custom">
                    <div class="tab-content">
                        <div class="tab-pane active" id="timeline">

                            <asp:Repeater ID="repateblogfull" runat="server">
                                <ItemTemplate>
                                    <ul class="timeline timeline-inverse">
                                        <li class="time-label">
                                            <span class="bg-red"><%# Eval("AddedOn") %>
                                            </span>
                                        </li>
                                        <li>
                                            <i class="fa fa-envelope bg-blue"></i>
                                            <div class="timeline-item">
                                                <h3 class="timeline-header">Name:<a href="#"><asp:Label ID="lblnamr" runat="server" Text='<%# Eval("NAMEOFBLOG") %>'></asp:Label></a> Email:
                                                    <asp:Label ID="bloemailid" runat="server" Text='<%# Eval("BLOGEREMAILID") %>'></asp:Label></h3>
                                                <div class="timeline-body" style="text-align: justify">
                                                    <asp:Label ID="lbl" runat="server" Text='<%# Eval("blogDescription") %>'></asp:Label>
                                                </div>
                                                <%--  <div class="timeline-footer">
                                                    <a class="btn btn-primary btn-xs">Read more</a>
                                                </div>--%>
                                            </div>
                                        </li>
                                        <li>
                                            <i class="fa fa-camera bg-purple"></i>
                                            <div class="timeline-item">
                                                <div class="timeline-body">
                                                    <asp:Image ID="imgb" runat="server" ImageUrl='<%# Bind("blogimage","/Writereaddata/Blog/{0}") %>' Style="width: 400px; height: 400px;" class="margin" />
                                                </div>
                                            </div>
                                        </li>


                                        <li>
                                            <%-- <i class="fa fa-clock-o bg-gray"></i>
                                            <i class="fa fa-facebook"></i>--%>
                                           
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>




</asp:Content>

