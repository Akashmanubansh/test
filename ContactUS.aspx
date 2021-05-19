<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ContactUS.aspx.cs" Inherits="ContactUS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="pl-143" class="panel-layout">
        <div id="pg-143-0" class="panel-grid panel-no-style">
            <div id="pgc-143-0-0" class="panel-grid-cell">
                <%-- <div id="panel-143-0-0-0" class="so-panel widget widget_media_image panel-first-child" data-index="0">
                    <img width="2560" height="1920" src="https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-scaled.jpg?time=1614859719" class="image wp-image-478  attachment-full size-full" alt="" loading="lazy" style="max-width: 100%; height: auto;" srcset="https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-scaled.jpg 2560w, https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-300x225.jpg 300w, https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-1024x768.jpg 1024w, https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-768x576.jpg 768w, https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-1536x1152.jpg 1536w, https://secureservercdn.net/160.153.137.14/s9m.f5a.myftpupload.com/wp-content/uploads/2020/05/about-us-2-2048x1536.jpg 2048w" sizes="(max-width: 2560px) 100vw, 2560px" />
                </div>--%>
                <div id="panel-143-0-0-1" class="so-panel widget widget_lawyer_zone_accordion" data-index="1">
                    <section id="lawyer_zone_accordion-14310001" class="at-widgets acme-accordions ">
                        <div class="container">
                            <div>
                                <h3>Contact us</h3>
                                <p>
                                    Get in touch and we'll get back to you as soon as we can.  We look forward to hearing from you!
                                </p>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-sm-6">
                                    <p>Contact Form</p>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Name</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Email</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Mobile</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10" TextMode="number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Message</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="7"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-12 text-center">
                                            <asp:Button ID="btnSubmit" runat="server" Text="submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>CORDATUS LAW CHAMBERS LLP</h3>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            Email : ckc@cordatuslegal.in   &nbsp; Phone : +919311577904                                                                                       
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3504.4123998600285!2d77.24463141440538!3d28.557376494230752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ce327f4e33717%3A0x6a2568e930457db1!2sCordatus%20Law%20Chambers!5e0!3m2!1sen!2sin!4v1618999447316!5m2!1sen!2sin" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
</asp:Content>


