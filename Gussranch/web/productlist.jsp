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
        <!-- pignose css -->
        <link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


        <!-- //pignose css -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
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


        <div class="men-wear">
            <div class="container">
                <h3><span>Our </span>Products</h3>
                <div class="single-pro">
                    <div class="row">
                        <%  
                            String sql="";
                            if(request.getParameter("cid")!=null)
                            {
                                int cid=Integer.parseInt(request.getParameter("cid"));
                                sql="SELECT *FROM tblproducts where catid="+cid;
                            }
                            else if(request.getParameter("sid")!=null)
                            {
                                int sid=Integer.parseInt(request.getParameter("sid"));
                                sql="SELECT *FROM tblproducts where subcatid="+sid;
                            }
                             else 
                            {
                                
                                sql="SELECT *FROM tblproducts";
                            }
                                   
                           
                            ResultSet pro = microvision.DataUtility.executeDQL(sql); 
                            while (pro.next()) {
                        %>

                        <div class="col-md-3 product-men">
                            <div class="men-pro-item simpleCart_shelfItem">
                                <div class="men-thumb-item">

                                    <img src="product-image/<% out.print(pro.getString("img1")); %>" alt="" class="pro-image-front">
                                    <img src="product-image/<% out.print(pro.getString("img1")); %>" alt="" class="pro-image-back">
                                    <div class="men-cart-pro">
                                        <div class="inner-men-cart-pro">
                                            <a href="productdetails.jsp?pid=<% out.print(pro.getString("id")); %>" class="link-product-add-cart">Quick View</a>
                                        </div>
                                    </div>
                                    <span class="product-new-top">New</span>				
                                </div>
                                <div class="item-info-product ">
                                    <h4><a href="productdetails.jsp?pid=<% out.print(pro.getString("id")); %>"> <% out.print(pro.getString("name")); %></a></h4>
                                    <div class="info-product-price">
                                        <span class="item_price"> &#8377; <% out.print(pro.getString("sellingprice")); %> </span>
                                        <del>  &#8377; <% out.print(pro.getString("mrp")); %></del>
                                    </div>
                                    <a href="#" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
                                </div>
                            </div>
                        </div>
                                   

                        <%
                            }


                        %>
                         
                    </div>




                    <div class="clearfix"></div>
                </div>
               
            </div>
        </div>	


        <%@include file="footer.jsp" %>

    </body>
</html>
