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
                <h3>Register</h3>
            </div>
        </div>
        <!-- //banner -->
        <!-- single -->

        <div class="checkout">
            <div class="container">

                <div class="modal-body modal-spa">
                    <div class="login-grids">
                        <div class="login">
                            <div class="login-bottom">
                                <h3>Sign up for free</h3>
                                <form method="post" action="register.jsp">
                                    <div class="sign-up">
                                        <h4>Name :</h4>
                                        <input type="text" value="Type here" name="name" required="">	
                                    </div>
                                    <div class="sign-up">
                                        <h4>Email :</h4>
                                        <input type="text" name="email" value="Type here"  required="">	
                                    </div>
                                    <div class="sign-up">
                                        <h4>Password :</h4>
                                        <input type="password" name="pass" value="Password"  required="">

                                    </div>
                                    <div class="sign-up">
                                        <h4>Mobile :</h4>
                                        <input type="text" value="Type here" name="mobile" required="">	
                                    </div>

                                    <div class="sign-up">
                                        <input type="submit" value="REGISTER NOW" >
                                    </div>

                                </form>
                                <div class="sign-up">
                                    <%                                             
                                           if (request.getParameter("name") != null) {
                                            String name = request.getParameter("name");
                                            String email = request.getParameter("email");
                                            String pass = request.getParameter("pass");
                                            String mobile = request.getParameter("mobile");

                                            String sqlreg = "INSERT INTO tbluser(NAME,email,PASSWORD,mobile,dateon)VALUES('" + name + "','" + email + "','" + pass + "','" + mobile + "',NOW());";

                                            int r = microvision.DataUtility.executeDML(sqlreg);
                                            if (r > 0) {
                                                out.println("<script>alert('you have been added successfully ')</script>");

                                            } else {
                                                out.println("<script>alert('you could not be added Error')</script>");
                                            }

                                        }

                                        if (request.getParameter("uname") != null) {
                                            String uname = request.getParameter("uname");
                                            String upass = request.getParameter("upass");

                                            String sqlreg = "SELECT  *FROM tbluser WHERE email='" + uname + "' AND PASSWORD='" + upass + "'";

                                            ResultSet r = microvision.DataUtility.executeDQL(sqlreg);
                                            if (r.next()) {

                                                session.setAttribute("login", uname);
                                                session.setAttribute("uid", r.getInt("id"));
                                                response.sendRedirect("userdashboard.jsp");

                                            } else {
                                                out.println("<script>alert('Invalid user name or password')</script>");

                                            }

                                        }

                                    %>   

                                </div>



                            </div>
                            <div class="login-right">
                                <h3>Sign in with your account</h3>
                                <form method="post" action="register.jsp">
                                    <div class="sign-in">
                                        <h4>Email :</h4>
                                        <input type="text" name="uname" placeholder="Your Email"  required="">	
                                    </div>
                                    <div class="sign-in">
                                        <h4>Password :</h4>
                                        <input type="password" name="upass" placeholder="Your Password" required="">
                                        <a href="#">Forgot password?</a>
                                    </div>

                                    <div class="sign-in">
                                        <input type="submit" value="SIGNIN" >
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                    </div>
                </div>
            </div>
        </div>	







        <%@include file="footer.jsp" %>

    </body>
</html>
