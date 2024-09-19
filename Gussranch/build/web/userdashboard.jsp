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



        <!-- banner -->
        <div class="page-head">
            <div class="container">
                <h3>User Dashboard</h3>
            </div>
        </div>
        <!-- //banner -->
        <!-- single -->

        <div class="checkout">
            <div class="container">


                <h4 class="text-blue title-border bars">User Dashboard</h4>            
                <div class="horizontal-tab">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab" aria-expanded="true">Home</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab" aria-expanded="false">Profile</a></li>
                        <li class=""><a href="#tab3" data-toggle="tab" aria-expanded="false">My Orders</a></li>
                        <li ><a href="#tab4" data-toggle="tab" aria-expanded="false">Change Password</a></li>
                        <li class=""><a href="logout.jsp" >Logout</a></li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="tab1">
                            <div class="row">
                                <div class="col-md-12">

                                    <%   if (session.getAttribute("login") != null) {
                                            String userid = session.getAttribute("login").toString();

                                            ResultSet rs = microvision.DataUtility.executeDQL("SELECT  *FROM tbluser where email='" + userid + "'");

                                            while (rs.next()) {
                                    %>
                                    <table class="table table-bordered table-striped ">
                                        <tr>
                                            <td>Name</td>
                                            <td><% out.print(rs.getString("name")); %></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><% out.print(rs.getString("email")); %></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile</td>
                                            <td><% out.print(rs.getString("mobile")); %></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><% out.print(rs.getString("fulladdress")); %></td>
                                        </tr>

                                        <tr>
                                            <td>City</td>
                                            <td><% out.print(rs.getString("city")); %> </td>
                                        </tr>
                                        <tr>
                                            <td>Pin</td>
                                            <td><% out.print(rs.getString("pin")); %></td>
                                        </tr>
                                        <tr>
                                            <td>Landmark</td>
                                            <td><% out.print(rs.getString("landmark")); %></td>
                                        </tr>
                                        <tr>
                                            <td>Date On</td>
                                            <td><% out.print(rs.getString("dateon")); %></td>
                                        </tr>


                                    </table>


                                    <%
                                            }
                                        } else {
                                            response.sendRedirect("register.jsp");
                                        }


                                    %>



                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="modal-body modal-spa">
                                        <%   if (session.getAttribute("login") != null) {
                                                String userid = session.getAttribute("login").toString();

                                                ResultSet rs = microvision.DataUtility.executeDQL("SELECT  *FROM tbluser where email='" + userid + "'");

                                                if (rs.next()) {
                                        %>

                                        <form method="post" action="userdashboard.jsp">
                                            <div class="row"> 

                                                <div class="col-md-6">
                                                    <div class="login">
                                                        <div class="login-bottom">
                                                            <h3>Update Profile </h3>

                                                            <div class="sign-up">
                                                                <h4>Name :</h4>
                                                                <input type="text" value="<% out.print(rs.getString("name")); %>" name="name" required="">	
                                                            </div>
                                                            <div class="sign-up">
                                                                <h4>Email :</h4>
                                                                <input type="text" name="emailupdate" value="<% out.print(rs.getString("email")); %>"  required="">	
                                                            </div>

                                                            <div class="sign-up">
                                                                <h4>Mobile :</h4>
                                                                <input type="text" value="<% out.print(rs.getString("mobile")); %>" name="mobile" required="">	
                                                            </div>
                                                            <div class="sign-up">
                                                                <h4>Address :</h4>
                                                                <input type="text" value="<% out.print(rs.getString("fulladdress")); %>" name="address" required="">	
                                                            </div>



                                                        </div>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="login">
                                                        <div class="login-bottom">
                                                            <h3>&nbsp;</h3>

                                                            <div class="sign-up">
                                                                <h4>City :</h4>
                                                                <input type="text" value="<% out.print(rs.getString("city")); %>" name="city" required="">	
                                                            </div>
                                                            <div class="sign-up">
                                                                <h4>Pin :</h4>
                                                                <input type="text" name="pin" value="<% out.print(rs.getString("pin")); %>"  required="">	
                                                            </div>
                                                            <div class="sign-up">
                                                                <h4>Landmark :</h4>
                                                                <input type="text" name="landmark" value="<% out.print(rs.getString("landmark")); %>"  required="">

                                                            </div>

                                                            <div class="sign-up">
                                                                <input type="submit" value="Update NOW" >
                                                            </div>

                                                            <%
                                                                    }
                                                                }
                                                            %>




                                                        </div>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </form>


                                        <div class="sign-up">
                                            <%       if (request.getParameter("emailupdate") != null) {
                                                    String name = request.getParameter("name");
                                                    String email = request.getParameter("emailupdate");

                                                    String mobile = request.getParameter("mobile");
                                                    String address = request.getParameter("address");
                                                    String city = request.getParameter("city");
                                                    String pin = request.getParameter("pin");
                                                    String landmark = request.getParameter("landmark");

                                                    String sqlreg = "UPDATE  tbluser SET NAME='"+name+"',mobile='"+mobile+"',fulladdress='"+address+"',city='"+city+"',pin='"+pin+"',landmark='"+landmark+"' WHERE email='"+email+"';";

                                                    int r = microvision.DataUtility.executeDML(sqlreg);
                                                    if (r > 0) {
                                                        out.println("<script>alert('you have been updated successfully ')</script>");

                                                    } else {
                                                        out.println("<script>alert('you could not be updated Error')</script>");
                                                    }

                                                }


                                            %>   

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <div class="row">
                                <div class="col-md-12">
                                    
                                     <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Order No</th>
                                            <th>User</th>
                                             <th>Mobile</th>
                                            <th>Order Amount</th>
                                            <th>Order Status</th>
                                            <th>Payment Status</th>
                                            <th>Date On</th>
                                            <th>Action</th>
                                        </tr>

                                        <%
                                            if (session.getAttribute("login") != null) {
                                            String userid = session.getAttribute("login").toString();
                                           ResultSet rs= microvision.DataUtility.executeDQL("SELECT  *FROM tblorders INNER JOIN tbluser ON tblorders.userid=tbluser.id  WHERE email='"+userid+"' ORDER BY orderno DESC");
                                           
                                           while(rs.next())
                                           {
                                               %>
                                               <tr>
                                                   <td><% out.print(rs.getString("orderno")); %></td>
                                                    <td><% out.print(rs.getString("name")); %></td>
                                                    <td><% out.print(rs.getString("mobile")); %></td>
                                                    <td><% out.print(rs.getString("ordertotal")); %></td>
                                                    <td><% out.print(rs.getString("orderstatus")); %></td>
                                                    <td><% out.print(rs.getString("paymentstatus")); %></td>
                                                    <td><% out.print(rs.getString("dateon")); %></td>
                                                    <td>
                                                        <a href="user-order.jsp?orderid=<% out.print(rs.getString("tblorders.id")); %>" class="btn btn-info" ><i class="fa fa-eye"></i> View </a>
                                                       
                                                        
                                                    </td>
                                                </tr>
                                               <%
                                           }
}
                                            
                                        %>
                                        

                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane " id="tab4">
                            <div class="row">
                                <div class="col-md-12">
                                     <div class="modal-body modal-spa">
                                        

                                        <form method="post" action="userdashboard.jsp">
                                            <div class="row"> 

                                                <div class="col-md-12">
                                                    <div class="login">
                                                        <div class="login-bottom">
                                                            <h3>Change Password </h3>

                                                            <div class="sign-up">
                                                                <h4>Current Password :</h4>
                                                                <input type="text"  name="currentpass" required="">	
                                                            </div>
                                                            <div class="sign-up">
                                                                <h4>New Password :</h4>
                                                                <input type="text" name="newpass"   required="">	
                                                            </div>

                                                            <div class="sign-up">
                                                                <h4>Confirm Password :</h4>
                                                                <input type="text"  name="confirmpass" required="">	
                                                            </div>
                                                           <div class="sign-up">
                                                                <input type="submit" value="Update NOW" >
                                                            </div>


                                                        </div>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                               

                                            </div>
                                        </form>


                                        <div class="sign-up">
                                            <%       if (request.getParameter("currentpass") != null) {
                                                    String currentpass = request.getParameter("currentpass");
                                                    String newpass = request.getParameter("newpass");
                                                    String email = session.getAttribute("login").toString();
                                                    String confirmpass = request.getParameter("confirmpass");

                                                    if (newpass.equals(confirmpass)) {
                                                        ResultSet rsp = microvision.DataUtility.executeDQL("SELECT  *FROM tbluser where email='" + email + "'");

                                                        if (rsp.next()) {

                                                            String cpass = rsp.getString("password");
                                                            if (currentpass.equals(cpass)) {

                                                                String sqlreg = "UPDATE  tbluser SET password='" + confirmpass + "' WHERE email='" + email + "';";

                                                                int r = microvision.DataUtility.executeDML(sqlreg);
                                                                if (r > 0) {
                                                                    out.println("<script>alert('you have been updated successfully ')</script>");

                                                                } else {
                                                                    out.println("<script>alert('you could not be updated Error')</script>");
                                                                }
                                                            }
                                                            else
                                                            {
                                                                out.println("<script>alert('Current password doest match ')</script>");
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        out.println("<script>alert('Both Password Must be same')</script>");
                                                        
                                                    }

                                                }


                                            %>   

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>	







        <%@include file="footer.jsp" %>

    </body>
</html>
