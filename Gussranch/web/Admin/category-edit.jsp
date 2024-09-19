<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Glance Design Dashboard an Admin Panel Category Flat Bootstrap Responsive Website Template | Forms :: w3layouts</title>
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
                        <h2 class="title1">Category</h2>
                        <div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
                            <div class="form-title">
                                <h4>Category Edit:</h4>
                            </div>
                            <div class="form-body">
                                <div class="form-group col-lg-12">
                                        <%
                                        if(request.getParameter("catdel")!=null)
                                        {
                                            String catdel=request.getParameter("catdel");
                                          
                                            
                                            String sql="delete from tblcategory where id="+catdel;
                                            int r=microvision.DataUtility.executeDML(sql);
                                            if(r>0)
                                            {
                                                out.print("<span class='alert alert-success'>Data Process Successfully!!</span>");
                                            }
                                            else
                                            {
                                                out.print("<span class='alert alert-danger'>Data could not Process !!</span>");
                                            }
                                        }
                                        

                                          if(request.getParameter("cid")!=null)
                                        {
                                            String cid=request.getParameter("cid");
                                             String catname=request.getParameter("catname");
                                            String catorder=request.getParameter("catorder");
                                            String catdesc=request.getParameter("catdesc");
                                            
                                          
                                           
                                            String sql="update tblcategory set categoryname='"+catname+"',catdescription='"+catdesc+"',categoryorder='"+catorder+"'    where id="+cid;
                                           
                                            int r=microvision.DataUtility.executeDML(sql);
                                            if(r>0)
                                            {
                                                out.print("<span class='alert alert-success'>Data Process Successfully!!</span>");
                                            }
                                            else
                                            {
                                                out.print("<span class='alert alert-danger'>Data could not Process !!</span>");
                                            }
                                        }
                                          
                                    
                                    %>
                                    </div>
                                
                                    <%
                                    if (request.getParameter("catedit") != null) {
                                        String cid=request.getParameter("catedit");
                                        ResultSet rs= microvision.DataUtility.executeDQL("SELECT *FROM tblcategory where id="+cid);
                                           
                                           if(rs.next())
                                           {
                                               %>
                                              
                                               <form method="post"  action="category-edit.jsp">
                                        <div class="form-group col-lg-6">
                                            <label>Category Name</label>
                                            <input type="text" name="catname" value="<% out.print(rs.getString(2)); %>" required="" class="form-control" placeholder="Category Name" />
                                            <input type="hidden" name="cid" value="<% out.print(rs.getString(1)); %>"  />
                                        </div>
                                        <div class="form-group  col-lg-6">
                                            <label>Category Order</label>
                                            <input type="text" name="catorder" value="<% out.print(rs.getString(4)); %>" required="" class="form-control" placeholder="Category Order" />
                                        </div>
                                        <div class="form-group col-lg-12">
                                            <label>Category Description</label>
                                            <input type="text" name="catdesc" value="<% out.print(rs.getString(3)); %>" required="" class="form-control" placeholder="Category Name" />
                                        </div>

                                        <div class="form-group col-lg-12">
                                            <button type="submit" class="btn btn-default">Update Now</button>
                                        </div>

                                    </form>
                                               <%
                                           }
                                           
                                    %>
                                    
                                    <%
                                                }
                                    
                                    %> 
                                    
                               

                                <div class="form-group col-lg-12 ">
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Category Name</th>
                                            <th>Category Description</th>
                                            <th>Order No</th>
                                            <th>Date On</th>
                                            <th>Action</th>
                                        </tr>

                                        <%
                                           ResultSet rs= microvision.DataUtility.executeDQL("SELECT *FROM tblcategory ORDER BY categoryorder");
                                           
                                           while(rs.next())
                                           {
                                               %>
                                               <tr>
                                                   <td><% out.print(rs.getString(2)); %></td>
                                                    <td><% out.print(rs.getString(3)); %></td>
                                                    <td><% out.print(rs.getString(4)); %></td>
                                                    <td><% out.print(rs.getString(5)); %></td>
                                                    <td>
                                                        <a href="category-edit.jsp?catedit=<% out.print(rs.getString(1)); %>" class="btn btn-warning" >Edit</a>
                                                        <a href="category-edit.jsp?catdel=<% out.print(rs.getString(1)); %>"  class="btn btn-danger">Delete</a>
                                                        
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
                </div>
            </div>
            <!--footer-->
            <%@include file="footer.jsp" %>