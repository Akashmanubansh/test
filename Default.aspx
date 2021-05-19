<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.flexslider-min.js"></script>
    <link href="css/abc.css" rel="stylesheet" />
    <link href="css/CrausolSkin.css" rel="stylesheet" />
    <script src="js/jquerycrausol.js"></script>
    <script src="js/jquery1.8.3.js"></script>
    <script defer src="js/jquery.flexslider-min.js"></script>
    <script src="js/custom.js"></script>

    <link rel="stylesheet" type="text/css" href="css/flexslider.css">


    <script type="text/javascript">
        $(function () {
            $('#mycarousel').jcarousel();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />

    <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10">
            <div class="mksc_group_img_slider">
                <div class="flexslider">
                    <ul id="mycarousel" class="slides">

                        <asp:Repeater ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <li style="height: 644px">
                                    <div class='item <%#Container.ItemIndex==0?"active":""%>'>
                                        <img src='<%# Eval("Sliderimage") %>' id="img" class="image" style="height: 642px;" />
                                        <div class="slider_matter text-center">
                                            <p>
                                                <asp:Label ID="lblCapEng" runat="server" Text='<%#Eval("title") %>' ForeColor="White"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>
                    <!-- slides -->
                </div>
                <!-- flexslider -->
            </div>
        </div>
        <div class="col-sm-1">
        </div>        
    </div>    

    <!-- content section 1 -->
    <section class="bg-banner dark-section services">
        <div class="container">
            <div class="section-title aos-init aos-animate" data-aos="fade-up">
                <h2>Our Promise</h2>
                <p>Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor ut labore et dolore magna aliqua.</p>
            </div>

            <div class="row">
                <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon"><i class="fa fa-money"></i></div>
                        <h4 class="title"><a href="">Fair Fees</a></h4>
                        <p class="description">At Cordatus Law Chambers we follow the standard practice to charge fees to the clients in a fair and reasonable manner.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                        <div class="icon"><i class="fa fa-percent"></i></div>
                        <h4 class="title"><a href="">Free Consultation</a></h4>
                        <p class="description">The paradigm practice at Cordatus Law Chambers is that we do not charge for consultation as we believe in taking fee from our clients only when we start working on the case post consultation.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                        <div class="icon"><i class="fa fa-gavel"></i></div>
                        <h4 class="title"><a href="">Quality Representation</a></h4>
                        <p class="description">Quality and precision of service is of utmost importance in the legal profession, whether it is documentation, presentation of case, arguing of case or any other legal work.</p>
                    </div>
                </div>

            </div>

        </div>

    </section>

    <!-- content section 2 -->
    <section id="features" class="features">
        <div class="container">
            <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                <div class="col-md-8">
                    <div class="section-title aos-init aos-animate" data-aos="fade-up">
                        <h2>Practice Areas</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor ut labore et dolore magna aliqua.</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 mt-4 mt-md-0">
                            <img class="box-img" src="images/Administrative-Hearings.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-sitemap" style="color: #ffbb2c;"></i>
                                <h3><a href="">Administrative Hearings</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4 mt-md-0">
                            <img class="box-img" src="images/Hit-run.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-car" style="color: #5578ff;"></i>
                                <h3><a href="">Auto Crash</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4 mt-md-0">
                            <img class="box-img" src="images/Drug-Crimes.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-stethoscope" style="color: #e80368;"></i>
                                <h3><a href="">Drug Crimes</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <img class="box-img" src="images/Fraud.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-frown-o" style="color: #e361ff;"></i>
                                <h3><a href="">Fraud</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <img class="box-img" src="images/contruction-disputes.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-building-o" style="color: #47aeff;"></i>
                                <h3><a href="">Property Disputes</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <img class="box-img" src="images/Personal-Injury.jpg" alt="" title="" />
                            <div class="icon-box">
                                <i class="fa fa-heartbeat" style="color: #ffa76e;"></i>
                                <h3><a href="">Personal Injury</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 post">
                    <img class="content-img" src="images/activity/law.jpg" alt="" title="" />
                </div>
            </div>
        </div>
    </section>

    <!-- content section 3 -->
    <section id="Activity" class="activity">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                        <div class="col-lg-6 col-md-6 mt-4 mt-md-0">
                            <div class="act">
                                <img class="box-img" src="images/Hit-run.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon ">
                                            <img src="images/icons/car-crash-icon.png" alt="Hit and Run">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Hit and Run </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 mt-4 mt-md-0">
                            <div class="act">
                                <img class="box-img" src="images/Intellectual-Library.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon">
                                            <img src="images/icons/icon-5-1.png" alt="Intellectual Property">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Intellectual Property </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 mt-4">
                            <div class="act">
                                <img class="box-img" src="images/Corporate.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon ">
                                            <img src="images/icons/icon-1-1.png" alt="Corporate">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Corporate </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 mt-4">
                            <div class="act">
                                <img class="box-img" src="images/contractual-disputes.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon ">
                                            <img src="images/icons/contracts.png" alt="Contractual Dispute">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Contractual Dispute </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 mt-4">
                            <div class="act">
                                <img class="box-img" src="images/Property.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon ">
                                            <img src="images/icons/Dispute_Resolution.png" alt="Dispute Resolution">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Dispute Resolution </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 mt-4">
                            <div class="act">
                                <img class="box-img" src="images/contruction-disputes.jpg" alt="" title="" />
                                <div class="icon-box">
                                    <div class="box-header">
                                        <div class="info-box-icon ">
                                            <img src="images/icons/icon-3-1.png" alt="Bank & Finance">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <h3 class="info-box-title">Bank & Finance </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2 class="section-title aos-init aos-animate" data-aos="fade-up">Activities</h2>
                    <p class="aos-init aos-animate" data-aos="fade-up">Cordatus Law Chambers is a mid size law firm providing comprehensive legal services across India. Firm’s principal office is located in New Delhi. </p>
                    <p class="aos-init aos-animate" data-aos="fade-up">Our practice areas cover the entire gamut of Corporate and Commercial laws. Due Diligence, Litigation and Arbitration is firm’s core practice area.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- content section 4 -->
    <%--<section>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="fb-box">
                        <h2>
                            <img src="images/icons/fb1.png" alt="FaceBook">&nbsp; Facebook</h2>
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FPower-Sector-Skill-Council-1287359617943428%2F&amp;tabs=timeline&amp;width=461&amp;height=500&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId"
                            scrolling="yes" frameborder="0" style="border: none; height: 495px; width: 100% !important; overflow: hidden; background: white; float: left;" allowtransparency="true"></iframe>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fb-box">
                        <h2>
                            <img src="images/icons/twi1.png" alt="Twitter">&nbsp; Twitter</h2>
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FPower-Sector-Skill-Council-1287359617943428%2F&amp;tabs=timeline&amp;width=461&amp;height=500&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId"
                            scrolling="yes" frameborder="0" style="border: none; height: 495px; width: 100% !important; overflow: hidden; background: white; float: left;" allowtransparency="true"></iframe>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fb-box">
                        <h2>
                            <img src="images/icons/Linkedin.png" alt="LinkedIn">&nbsp; LinkedIn</h2>
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FPower-Sector-Skill-Council-1287359617943428%2F&amp;tabs=timeline&amp;width=461&amp;height=500&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId"
                            scrolling="yes" frameborder="0" style="border: none; height: 495px; width: 100% !important; overflow: hidden; background: white; float: left;" allowtransparency="true"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
</asp:Content>

