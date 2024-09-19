<!DOCTYPE html>
<html>
    <head>
        <title>Smart Shop  | Home </title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <!-- single -->
        <script src="js/imagezoom.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <!-- single -->
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <script src="js/jquery.easing.min.js"></script>


    </head>
    <body>
        <%@include file="topheader.jsp" %> 
        <!-- banner -->


        <%            String sql = "";
            if (request.getParameter("pid") != null) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                sql = "SELECT *FROM tblproducts where id=" + pid;
            }

            ResultSet rs1 = microvision.DataUtility.executeDQL(sql);

            while (rs1.next()) {
        %>


        <!-- banner -->
        <div class="page-head">
            <div class="container">
                <h3><% out.print(rs1.getString(2)); %></h3>
            </div>
        </div>
        <!-- //banner -->
        <!-- single -->
        <div class="single">
            <div class="container">



                <div class="col-md-6 single-right-left animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                            <!-- FlexSlider -->
                            <script>
                                // Can also be used with $(document).ready()
                                $(window).load(function () {
                                    $('.flexslider').flexslider({
                                        animation: "slide",
                                        controlNav: "thumbnails"
                                    });
                                });
                            </script>
                            <!-- //FlexSlider-->
                            <ul class="slides">
                                <li data-thumb="product-image/<% out.print(rs1.getString("img1")); %>">
                                    <div class="thumb-image"> <img src=<img src="product-image/<% out.print(rs1.getString("img1")); %>" data-imagezoom="true" class="img-responsive"> </div>
                                </li>
                                <li data-thumb="product-image/<% out.print(rs1.getString("img2")); %>">
                                    <div class="thumb-image"> <img src="product-image/<% out.print(rs1.getString("img2")); %>" data-imagezoom="true" class="img-responsive"> </div>
                                </li>	
                                <li data-thumb="product-image/<% out.print(rs1.getString("img1")); %>">
                                    <div class="thumb-image"> <img src="product-image/<% out.print(rs1.getString("img1")); %>" data-imagezoom="true" class="img-responsive"> </div>
                                </li>
                                <li data-thumb="product-image/<% out.print(rs1.getString("img2")); %>">
                                    <div class="thumb-image"> <img src="product-image/<% out.print(rs1.getString("img2")); %>" data-imagezoom="true" class="img-responsive"> </div>
                                </li>	
                            </ul>
                            <div class="clearfix"></div>
                        </div>	
                    </div>
                </div>
                <div class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
                    <h3><% out.print(rs1.getString(2)); %></h3>
                    <p><span class="item_price">&#8377; <% out.print(rs1.getString("sellingprice")); %></span> <del>-&#8377; <% out.print(rs1.getString("mrp")); %></del></p>
                    <div class="rating1">
                        <span class="starRating">
                            <input id="rating5" type="radio" name="rating" value="5">
                            <label for="rating5">5</label>
                            <input id="rating4" type="radio" name="rating" value="4">
                            <label for="rating4">4</label>
                            <input id="rating3" type="radio" name="rating" value="3" checked="">
                            <label for="rating3">3</label>
                            <input id="rating2" type="radio" name="rating" value="2">
                            <label for="rating2">2</label>
                            <input id="rating1" type="radio" name="rating" value="1">
                            <label for="rating1">1</label>
                        </span>
                    </div>
                    <div class="description">

                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>Brands</td><td><% out.print(rs1.getString("brands")); %></td>
                            </tr>
                            <tr>
                                <td>Size</td><td><% out.print(rs1.getString("size")); %></td>
                            </tr>
                            <tr>
                                <td>Color</td><td><% out.print(rs1.getString("color")); %></td>
                            </tr>
                            <tr>
                                <td>Meterial</td><td><% out.print(rs1.getString("material"));%></td>
                            </tr>


                        </table>


                    </div>

                    <form class="form-inline" method="post" action="addtocart.jsp">
                        <input type="hidden" name="rate" value="<%=rs1.getString("sellingprice")%>" />
                        <input type="hidden" name="pid" value="<%=rs1.getString("id")%>"/>

                        <div class="color-quality">

                            <div class="color-quality-right">
                                <h5>Quantity :</h5>
                                <input type="number" name="qty" value="<% out.print(rs1.getString("qty")); %>"  required="">

                            </div>
                        </div><br>
                        <div class="occasion-cart">

                            <button class="item_add hvr-outline-out button2" type="submit">Add to cart</button>

                        </div>
                    </form>

                </div>
                <div class="clearfix"> </div>

                <div class="bootstrap-tab animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Description</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
                                <h5>Product Brief Description</h5>
                                <p>
                                    <% out.print(rs1.getString("description")); %>

                                </p>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div>
        <!-- //single -->



        <%
            }


        %>




        <%@include file="footer.jsp" %>

    </body>
</html>
