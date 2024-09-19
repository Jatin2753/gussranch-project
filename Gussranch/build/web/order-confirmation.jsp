<%@page import="java.util.Random"%>

<%! float rr = 0;%>
<%! int orderno = 0;%>


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
                <h3>Order Confirmation</h3>
            </div>
        </div>


        <div class="checkout">
            <div class="container">


                <%   try 
                {

                        if (request.getParameter("orderid") != null) 
                        {
                            String orderid = request.getParameter("orderid");
                            String sqlorder = "SELECT  *FROM tblorders INNER JOIN tbluser ON  tbluser.id=tblorders.userid WHERE tblorders.id=" + orderid;
                            ResultSet procorder = microvision.DataUtility.executeDQL(sqlorder);

                            if (procorder.next()) 
                            {

                               

                %>
                <table class="table table-bordered" id="printTable">
                    <tr>
                        <td colspan="2" style="background-color:#FDA30E;color:white;padding:10px 20px; "> <h1>Invoice</h1></td>
                    </tr>


                    <tr>
                        <td> 
                            <strong>Gussranch Pvt LTD</strong>
                            <address >
                                <p>Address : 1234k Avenue, 4th block, </p>
                                <p>Newyork City.</p>
                                <p>(800) 555-1234</p>
                            </address>

                        </td>
                        <td class="text-right"> 
                            <p> <h4>Order Status : <%= procorder.getString("orderstatus")%> </h4> </p>
                            <p>  <h4>Payment Status :  <%= procorder.getString("paymentstatus")%> </string></h4>
                            <p><h4>Payment Mode :   <%= procorder.getString("paymentmode")%> </string> </h4>





                        </td>
                    </tr>
                    <tr>
                        <td> 
                            <strong> Name : <%= procorder.getString("name")%> </strong>
                            <address >
                                <p>E-Mail : <%= procorder.getString("email")%> </p>
                                <p>Address : <%= procorder.getString("fulladdress")%></p>
                                <p>City : <%= procorder.getString("city")%> - Pin : <%= procorder.getString("pin")%></p>
                                <p>LandMark : <%= procorder.getString("landmark")%></p>
                                <p>Mobile No : <%= procorder.getString("mobile")%></p>  
                            </address>

                        </td>
                        <td class="text-right"> 
                            <p> <h4>Invoice : <%= procorder.getString("orderno")%> </h4> </p>
                            <p> <h4>Date : <%= procorder.getString("dateon")%> </h4> </p>
                            <p> <h4>Total Amount : <%= procorder.getString("ordertotal")%> </h4> </p>


                        </td>
                    </tr>

                    <tr>

                        <td colspan="2"> 

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

                                        String sql = "SELECT  *FROM tblorders INNER JOIN tblorderitem ON tblorders.id=tblorderitem.orderid  INNER JOIN tblproducts ON tblproducts.id=tblorderitem.pid WHERE tblorders.id=" + orderid;
                                        ResultSet proc = microvision.DataUtility.executeDQL(sql);

                                        while (proc.next()) {

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
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }

                                %>



                            </table>

                        </td>
                    </tr>

                    <tr>

                        <td colspan="2" > 

                            <div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
                                <h4>Grand Total</h4>

                                <ul>
                                    <li>Total <i >-</i>  <span>   &#8377; <%= procorder.getString("ordertotal")%></span></li>

                                    <li>Tax <i>-</i> <span>&#8377; <%= procorder.getString("tax")%></span></li>


                                    <li>Grand Total <i>-</i> <span>&#8377;<%= procorder.getString("ordertotal")%> </span></li>
                                </ul>
                            </div>
                            <div class="clearfix"> </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" > 


                            <h4>Gussranch PVT LTD</h4>
                            <p>Thanking Your for your valuable orders.</p>



                        </td>

                    </tr>


                </table>



                <%    }
                        }



                    String orderid = request.getParameter("orderid");
                    String sqlorder = "SELECT  *FROM tblorders INNER JOIN tbluser ON  tbluser.id=tblorders.userid WHERE tblorders.id=" + orderid;
                    ResultSet procorder = microvision.DataUtility.executeDQL(sqlorder);

                    if (procorder.next()) {

                       
                        StringBuilder sb = new StringBuilder();
                        sb.append("<table style='background-color:red;width:100%'>");
                        sb.append("<tr><td colspan='2'>Your Order details </td></tr>");

                        sb.append("<tr><td>Order No</td><td>" + procorder.getString("orderno") + "</td></tr>");

                        sb.append("<tr><td>Payment Mode</td><td>Cash On Delivery</td></tr>");
                        sb.append("<tr><td>Payment Status</td><td>No </td></tr>");
                        sb.append("<tr><td>Date of Order</td><td>" + procorder.getString("dateon") + "</td></tr>");

                        ResultSet myorderid = microvision.DataUtility.executeDQL("SELECT *FROM tblorders WHERE orderno=" + orderid);

                        int oid = 0;
                        if (myorderid.next()) {
                            oid = myorderid.getInt(1);
                        }

                        ResultSet orderitemlist = microvision.DataUtility.executeDQL("SELECT *FROM tblorderitem WHERE orderid=" + oid);

                        while (orderitemlist.next()) {
                            sb.append("<tr><td>Rate : </td><td>" + orderitemlist.getString(3) + " </td></tr>");
                            sb.append("<tr><td>Quantity : </td><td>" + orderitemlist.getString(4) + " </td></tr>");
                            sb.append("<tr><td>Total : </td><td>" + orderitemlist.getString(5) + " </td></tr>");
                        }
                        sb.append("<tr><td>Grand Total</td><td>" + procorder.getString("ordertotal") + "</td></tr>");
                        sb.append("</table>");

                        microvision.MailService.sendMail(procorder.getString("email"), "mailmyalert@gmail.com", "Your order confimation ", sb.toString());


}

                    } catch (Exception ex) {
                        out.print(ex.getMessage());
                    }

                %>

                <div class="row">
                    <div class="col-md-12">
                        <a href="#" onclick="printData()" class="btn btn-primary">Print Invoice </a>
                    </div>
                </div>



            </div>
        </div>	

        <script>
            function printData()
            {
                var divToPrint = document.getElementById("printTable");
                newWin = window.open("");
                newWin.document.write(divToPrint.outerHTML);
                newWin.print();
                newWin.close();
            }

        </script>
        <%@include file="footer.jsp" %>

    </body>
</html>
