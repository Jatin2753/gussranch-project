<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>User  All </title>
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
                        <h2 class="title1">User  All</h2>
                        <div class="form-group col-lg-12 ">
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Name</th>
                                            <th>E-Mail</th>
                                             <th>Mobile</th>
                                            <th>Address</th>
                                            <th>City-Pin</th>
                                            <th>Landmark</th>
                                            <th>Date On</th>
                                            <th>Action</th>
                                        </tr>

                                        <%
                                           ResultSet rs= microvision.DataUtility.executeDQL("SELECT  *FROM tbluser ORDER BY NAME");
                                           
                                           while(rs.next())
                                           {
                                               %>
                                               <tr>
                                                   <td><% out.print(rs.getString("name")); %></td>
                                                    <td><% out.print(rs.getString("email")); %></td>
                                                    <td><% out.print(rs.getString("mobile")); %></td>
                                                    <td><% out.print(rs.getString("fulladdress")); %></td>
                                                    <td><% out.print(rs.getString("city")); %> - <% out.print(rs.getString("pin")); %></td>
                                                    
                                                    <td><% out.print(rs.getString("landmark")); %></td>
                                                    <td><% out.print(rs.getString("dateon")); %></td>
                                                    <td>
                                                        <a href="category-edit.jsp?catedit=<% out.print(rs.getString(1)); %>" class="btn btn-info" ><i class="fa fa-eye"></i> View </a>
                                                        <a href="category-edit.jsp?catedit=<% out.print(rs.getString(1)); %>" class="btn btn-warning" ><i class="fa fa-pencil"></i> Edit </a>
                                                       
                                                        
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