<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Products Add </title>
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
                        <h2 class="title1">Products Add</h2>
                        <div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
                            <div class="form-title">
                                <h4>Products Add</h4>
                            </div>
                            <div class="form-body">


                                <form method="post"  action="product-add-submit.jsp" enctype="multipart/form-data"  >
                                    <div class="form-group col-lg-6">
                                        <label>Category Name</label>
                                        <select name="catid"  onchange="getSubCat(this.value)" class="form-control">
                                            <option>Choose Category Name</option>

                                            <%
                                                ResultSet rsc = microvision.DataUtility.executeDQL("SELECT *FROM tblcategory ORDER BY categoryname");

                                                while (rsc.next()) {
                                            %>
                                            <option selected="true" value="<% out.print(rsc.getString(1)); %>"><% out.print(rsc.getString(2)); %></option>

                                            <%
                                                }


                                            %>

                                        </select>
                                            <div id="dd1">
                                            </div>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Sub Category Name</label>
                                        <select name="subcatid" id="subcatidsel" class="form-control">
                                            
                                        </select>

                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Product Name</label>
                                        <input type="text" name="name"  required="" class="form-control" placeholder="Product Name" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Product Brands</label>
                                        <input type="text" name="brands"  required="" class="form-control" placeholder="Product Brands" />
                                    </div>
                                    <div class="form-group  col-lg-6">
                                        <label>MRP</label>
                                        <input type="text" name="mrp" required=""  class="form-control" placeholder="MRP" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Selling Price</label>
                                        <input type="text" name="sellingprice" required=""  class="form-control" placeholder="Selling Price" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Quantity</label>
                                        <input type="text" name="qty" required=""  class="form-control" placeholder="Quantity" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Color</label>
                                        <input type="text" name="color" required=""  class="form-control" placeholder="Color" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Size</label>
                                        <input type="text" name="size" required=""  class="form-control" placeholder="Size" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Material</label>
                                        <input type="text" name="material" required=""  class="form-control" placeholder="Material" />
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Product Description</label>
                                        <textarea name="desc" required=""  class="form-control" placeholder="Product Description">
                                            
                                        </textarea>

                                    </div>

                                    <div class="form-group col-lg-6">
                                        <label>Thumb Image</label>

                                        <input type="file" name="file1" required=""  class="form-control" placeholder="Thumb Image" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Front Image</label>

                                        <input type="file" name="file2" required=""  class="form-control" placeholder="Front Images" />
                                    </div>



                                    <div class="form-group col-lg-12">
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </div>

                                </form>

                               



                            </div>

                        </div>


                    </div>
                </div>
            </div>
            <!--footer-->
            <script>
            function getSubCat(id)
            {

                
                $.ajax({
                    type: "GET",
                    url: "getSubCatByCatId.jsp",
                    data: "catid=" + id,
                    success: function (data)
                    {
                        $("#subcatidsel").html(data);
                    },
                    error: function (data)
                    {
                        $("#subcatidsel").html(data);
                    }
                });
                
            }

        </script>
            <%@include file="footer.jsp" %>