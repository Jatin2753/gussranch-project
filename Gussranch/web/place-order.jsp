<%!
    double gtotal = 0, tax = 0, dis = 0;


%>
<!DOCTYPE html>
<html>
    <head>
        <title>Smart Shop  | Checkout </title>
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

        <div class="page-head">
            <div class="container">
                <h3>Check Out</h3>
            </div>
        </div>


        <div class="checkout">
            <div class="container">
                <h3>My Shopping Bag</h3>




                <div class="table-responsive checkout-right animated wow slideInUp" data-wow-delay=".5s">
                    <table class="timetable_sub">
                        <thead>
                            <tr>

                                <th>Product Name</th>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Rate</th>
                                <th>Total</th>
                            </tr>
                        </thead>

                        <%   
                             try {
                            
                            if (session.getAttribute("login") != null) {

                            } else {
                                response.sendRedirect("register.jsp");

                            }

                            if (session.getAttribute("cart") != null) {
                                String sessionid = session.getAttribute("cart").toString();
                                String sql = "SELECT tblshopingcart.id,tblshopingcart.qty,tblshopingcart.rate,tblshopingcart.sessionid,tblshopingcart.total,tblproducts.name,tblproducts.img1 FROM tblproducts INNER JOIN tblshopingcart ON tblproducts.id=tblshopingcart.pid WHERE sessionid='" + sessionid + "'";
                                ResultSet proc = microvision.DataUtility.executeDQL(sql);
                                gtotal = 0;
                                while (proc.next()) {
                                    gtotal += proc.getFloat("total");
                        %>
                        <tr class="rem1">

                            <td class="invert"><% out.print(proc.getString("name")); %> </td>
                            <td class="invert-image"><img style="height:120px;"  src="product-image/<% out.print(proc.getString("img1"));%>" alt=" " class="img-responsive"  /> </td>

                            <td class="invert">
                                <div class="quantity"> 
                                    <div class="quantity-select">                           
                                        <% out.print(proc.getString("qty"));  %>
                                    </div>



                                </div>
                            </td>
                            <td class="invert">&#8377; <% out.print(proc.getString("rate")); %> </td>
                            <td class="invert">

                                &#8377; <% out.print(proc.getString("total"));  %>


                            </td>
                        </tr>

                        <%

                                }
                            }
                            } catch (Exception ex) {
                                out.print(ex.getMessage());
                            }

                        %>




                        <!--quantity-->
                        <script>
                            $('.value-plus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
                                divUpd.text(newVal);
                            });

                            $('.value-minus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
                                if (newVal >= 1)
                                    divUpd.text(newVal);
                            });
                        </script>
                        <!--quantity-->
                    </table>
                </div>
                <div class="checkout-left">	
                    <form method="post" action="place-order.jsp">
                        <input type="radio" name="paymode" value="COD" checked="true" /> Cash on Delivery

                        <input type="radio" name="paymode" value="Online" /> Online 

                        <div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
                            <button type="submit" class="btn btn-primary">
                                Confirm  Order  <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                            </button>


                        </div>
                        <div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
                            <h4>Shopping basket</h4>
                            <ul>
                                <li>Total <i >-</i>  <span>   &#8377; <%=gtotal%></span></li>

                                <li>Tax <i>-</i> <span>&#8377; <%=tax%></span></li>


                                <li>Grand Total <i>-</i> <span>&#8377; <%=gtotal + tax%>  </span></li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>

                    </form>





                    <%

                         try {
                        if (request.getParameter("paymode") != null) {

                            String paymode = request.getParameter("paymode");
                            int orderno = 0;

                            ResultSet oid = microvision.DataUtility.executeDQL("SELECT MAX(orderno) FROM tblorders");
                            if (oid.next()) {

                                orderno = oid.getInt(1);

                                orderno++;
                            }
                            String userid = "";
                            if (session.getAttribute("uid") != null) {
                                userid = session.getAttribute("uid").toString();
                            }
                           
                            
                            String ord = "INSERT INTO tblorders(orderno,ordertotal,tax,userid,orderstatus,paymentstatus,paymentmode,dateon)VALUES('" + orderno + "','" + gtotal + "','" + tax + "','" + userid + "','success','success','" + paymode + "',now())";
                            int r = microvision.DataUtility.executeDML(ord);
                           

                            String sqlgetid = "SELECT id FROM tblorders WHERE orderno=" + orderno;
                            ResultSet ooid = microvision.DataUtility.executeDQL(sqlgetid);
                            //out.print(sqlgetid);
                            int newoid = 0;
                            if (ooid.next()) {
                                newoid = ooid.getInt("id");
                                //out.print("oridtobeins:"+newoid +"Orderno : "+orderno);
                            }
                            
                            String sessionid = session.getAttribute("cart").toString();
                            String sql = "SELECT tblshopingcart.pid,tblshopingcart.id,tblshopingcart.qty,tblshopingcart.rate,tblshopingcart.sessionid,tblshopingcart.total,tblproducts.name,tblproducts.img1 FROM tblproducts INNER JOIN tblshopingcart ON tblproducts.id=tblshopingcart.pid WHERE sessionid='" + sessionid + "'";
                             //out.print(sql);
                            ResultSet proc1 = microvision.DataUtility.executeDQL(sql);
                            String pins = "sssss";
                            while (proc1.next()) 
                            {
                               
                                
                                pins = "INSERT INTO tblorderitem (rate,qty,total,pid,orderid)VALUES('" + proc1.getFloat("rate") + "'," + proc1.getInt("qty") + ",'" + proc1.getFloat("total") + "'," + proc1.getInt("pid") + "," + newoid + " );";
                               
                                 //out.print(pins);
                                int rr = microvision.DataUtility.executeDML(pins);
                                //int rr = microvision.DataUtility.executeDML("INSERT INTO tblorderitem (rate,qty,total,pid,orderid)VALUES('" + rate + "'," + qty + ",'" + total + "'," + pid + "," + newoid + ");");
                                

                            }
                            session.removeAttribute("cart");
                            
                             out.print("you have been ordered successfully");
                             response.sendRedirect("order-confirmation.jsp?orderid="+newoid);
                             
                            
                            //out.print("finish");
                        }


} catch (Exception ex) {
                                out.print(ex.getMessage());
                            }

                    %>
                </div>
            </div>
        </div>	


        <%@include file="footer.jsp" %>

    </body>
</html>
