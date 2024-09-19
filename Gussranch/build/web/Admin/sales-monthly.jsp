<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Sales Monthly </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />

        <!-- font-awesome icons CSS -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- //font-awesome icons CSS -->

        <!-- side nav css file -->
        <link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
        <!-- side nav css file -->

        <!-- js-->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/modernizr.custom.js"></script>

        <!--webfonts-->
        <link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
        <!--//webfonts--> 

        <!-- Metis Menu -->
        <script src="js/metisMenu.min.js"></script>
        <script src="js/custom.js"></script>
        <link href="css/custom.css" rel="stylesheet">
        <!--//Metis Menu -->

    </head> 
    <body class="cbp-spmenu-push">
        <div class="main-content">
            <div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                <!--left-fixed -navigation-->
                <%@include file="sidebar.jsp" %>
            </div>
            <!--left-fixed -navigation-->

            <!-- header-starts -->
            <%@include file="header.jsp" %>
            <!-- //header-ends -->
            <!-- main content start-->
            <div id="page-wrapper">
                <div class="main-page">
                    <div class="forms">
                        <h2 class="title1">Sales Current  Month</h2>
                        <div class="form-group col-lg-12 ">
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
                                           ResultSet rs= microvision.DataUtility.executeDQL("SELECT  *FROM tblorders INNER JOIN tbluser ON tblorders.userid=tbluser.id WHERE MONTH(tblorders.dateon) = MONTH(CURRENT_DATE()) AND YEAR(tblorders.dateon) = YEAR(CURRENT_DATE())");
                                           
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
                                                        <a href="category-edit.jsp?catedit=<% out.print(rs.getString(1)); %>" class="btn btn-info" ><i class="fa fa-eye"></i> View </a>
                                                       
                                                        
                                                    </td>
                                                </tr>
                                               <%
                                           }
                                           
                                            
                                        %>
                                        

                                    </table>

                                    
                                </div>

                    </div>
                </div>
            </div>
            <!--footer-->
            <%@include file="footer.jsp" %>