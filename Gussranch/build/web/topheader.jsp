<%@page import="java.sql.ResultSet"%>
<!-- header -->
<div class="header">
    <div class="container">
        <ul>
            <li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Free and Fast Delivery</li>
            <li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Free shipping On all orders</li>
            <li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                
                <%
                    if (session.getAttribute("login") != null) 
                    {
                            String user = session.getAttribute("login").toString();
                             %>
                                <a href="userdashboard.jsp"><%= user%></a>
                            <%
                    } 
                    else 
                    {
                        %>
                            <a href="register.jsp">Login</a>
                        <%
                    }
                %>
                
               
            
            </li>
        </ul>
    </div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
    <div class="container">
        <div class="col-md-3 header-left">
            <h1><a href="index.html"><img src="images/logo.jpeg"></a></h1>
        </div>
        <div class="col-md-6 header-middle">
            <form>
                <div class="search">
                    <input type="search" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                this.value = 'Search';
                            }" required="">
                </div>
                <div class="section_room">
                    <select id="country" onchange="change_country(this.value)" class="frm-field required">
                        <option value="null">All categories</option>
                        <option value="null">Electronics</option>     
                        <option value="AX">kids Wear</option>
                        <option value="AX">Men's Wear</option>
                        <option value="AX">Women's Wear</option>
                        <option value="AX">Watches</option>
                    </select>
                </div>
                <div class="sear-sub">
                    <input type="submit" value=" ">
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="col-md-3 header-right footer-bottom">
            <ul>
                <li><a href="#" class="use1" data-toggle="modal" data-target="#myModal4"><span>Login</span></a>

                </li>
                <li><a class="fb" href="#"></a></li>
                <li><a class="twi" href="#"></a></li>
                <li><a class="insta" href="#"></a></li>
                <li><a class="you" href="#"></a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //header-bot -->
<!-- banner -->
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">

                        <%@include file="menubar.jsp" %>

                    </div>
                </div>
            </nav>	
        </div>
        <div class="top_nav_right">
            <div class="cart box_1">
                <a href="checkout.jsp">
                    <h3> <div class="total">
                            <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                            <span class="simpleCart_total"> &#8377;
                                <%      
                                    try
                                    {
                                    if (session.getAttribute("cart") != null) 
                                    {
                                        String sessionid = session.getAttribute("cart").toString();
                                        ResultSet ptotal = microvision.DataUtility.executeDQL("SELECT SUM(total)FROM tblshopingcart WHERE sessionid='" + sessionid + "'");

                                        if (ptotal.next())
                                        {

                                            out.print(ptotal.getString(1));
                                        }

                                %>
                            </span> 
                            <br>
                            (<span id="simpleCart_quantity" class="simpleCart_quantity">
                                <%             ResultSet pcount = microvision.DataUtility.executeDQL("SELECT count(total)FROM tblshopingcart WHERE sessionid='" + sessionid + "'");

                                    if (pcount.next()) {

                                        out.print(pcount.getString(1));
                                    }
                                %>

                            </span> items)
                            <%
                                }
}
catch(Exception ex)
{

}
                            %>


                        </div>

                    </h3>
                </a>



            </div>	
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //banner-top -->