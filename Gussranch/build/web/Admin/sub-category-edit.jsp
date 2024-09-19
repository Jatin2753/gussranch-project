<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Sub Category Edit </title>
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
                        <h2 class="title1">Sub Category Edit</h2>
                        <div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
                            <div class="form-title">
                                <h4>Sub Category Edit</h4>
                            </div>
                            <div class="form-body">

                                <%
                                    if (request.getParameter("subcatedit") != null) {
                                        String subcateditid = request.getParameter("subcatedit");
                                        ResultSet rs = microvision.DataUtility.executeDQL("SELECT tblcategory.categoryname,tblSubCategory.* FROM tblsubcategory INNER JOIN tblcategory ON  tblcategory.id=tblSubCategory.catid WHERE tblSubCategory.id=" + subcateditid);

                                        if (rs.next()) {

                                %>

                                <form method="post"  action="sub-category-edit.jsp">
                                    <div class="form-group col-lg-12">
                                        <label>Category Name</label>
                                        <select name="catname" class="form-control">
                                            <option>Choose Category Name</option>

                                            <%                                                                ResultSet rsc = microvision.DataUtility.executeDQL("SELECT *FROM tblcategory ORDER BY categoryname");

                                                while (rsc.next()) {
                                                    if (rs.getString(6).equals(rsc.getString(1))) {
                                            %>
                                            <option selected="true" value="<% out.print(rsc.getString(1)); %>"><% out.print(rsc.getString(2)); %></option>

                                            <%
                                            } else {
                                            %>
                                            <option  value="<% out.print(rsc.getString(1)); %>"><% out.print(rsc.getString(2)); %></option>

                                            <%
                                                    }

                                                }


                                            %>

                                        </select>

                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Sub Category Name</label>
                                        <input type="text" name="subcatname" value="<% out.print(rs.getString(3)); %>" required="" class="form-control" placeholder="Sub Category Name" />
                                        <input type="hidden" name="subcatid" value="<% out.print(rs.getString(2)); %>" required="" class="form-control"  />
                                    </div>
                                    <div class="form-group  col-lg-6">
                                        <label>Sub Category Order</label>
                                        <input type="text" name="subcatorder" required="" value="<% out.print(rs.getString(5)); %>" class="form-control" placeholder="Sub Category Order" />
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Sub  Category Description</label>
                                        <input type="text" name="subcatdesc" required="" value="<% out.print(rs.getString(4)); %>" class="form-control" placeholder="Sub Category Name" />
                                    </div>

                                    <div class="form-group col-lg-12">
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </div>

                                </form>

                                <%

                                        }
                                    }

                                %>








                                <div class="form-group col-lg-12 ">
                                    <%                                        if (request.getParameter("subcatid") != null) {
                                            String subcatid = request.getParameter("subcatid");
                                            String catid = request.getParameter("catname");

                                            String subcatname = request.getParameter("subcatname");
                                            String subcatorder = request.getParameter("subcatorder");
                                            String subcatdesc = request.getParameter("subcatdesc");

                                            String sql = "update tblsubcategory set subcatname='" + subcatname + "',subcatdesc='" + subcatdesc + "',subcatorder=" + subcatorder + ",catid=" + catid + " where id=" + subcatid;
                                            int r = microvision.DataUtility.executeDML(sql);
                                            if (r > 0) {
                                                out.print("<span class='alert alert-success'>Data Process Successfully!!</span>");
                                            } else {
                                                out.print("<span class='alert alert-danger'>Data could not Process !!</span>");
                                            }
                                        }

                                        if (request.getParameter("subcatdel") != null) {

                                            String subcatid = request.getParameter("subcatdel");

                                            String sql = "delete from tblsubcategory where id=" + subcatid;
                                            int r = microvision.DataUtility.executeDML(sql);
                                            if (r > 0) {
                                                out.print("<span class='alert alert-success'>Data Process Successfully!!</span>");
                                            } else {
                                                out.print("<span class='alert alert-danger'>Data could not Process !!</span>");
                                            }
                                        }


                                    %>


                                </div>


                                <div class="form-group col-lg-12 ">
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Category Name</th>
                                            <th>Sub Category Name</th>
                                            <th>Category Description</th>

                                            <th>Date On</th>
                                            <th>Action</th>
                                        </tr>

                                        <%                                            ResultSet rs1 = microvision.DataUtility.executeDQL("SELECT tblcategory.categoryname,tblSubCategory.* FROM tblsubcategory INNER JOIN tblcategory ON  tblcategory.id=tblSubCategory.catid ORDER BY tblcategory.categoryname DESC");

                                            while (rs1.next()) {
                                        %>
                                        <tr>
                                            <td><% out.print(rs1.getString(1)); %></td>
                                            <td><% out.print(rs1.getString(3)); %></td>
                                            <td><% out.print(rs1.getString(4)); %></td>

                                            <td><% out.print(rs1.getString(7)); %></td>
                                            <td>
                                                <a href="sub-category-edit.jsp?subcatedit=<% out.print(rs1.getString(2)); %>" class="btn btn-warning" >Edit</a>
                                                <a href="sub-category-edit.jsp?subcatdel=<% out.print(rs1.getString(2)); %>"  class="btn btn-danger">Delete</a>

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