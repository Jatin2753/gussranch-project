<%@page import="com.oreilly.servlet.*"%>

<%
    
    String p = getServletContext().getRealPath("/") + "product-image";
    //String p = "E:\\Java-May-23\\Project-Work\\gussranch\\Gussranch\\web\\product-image";
    MultipartRequest mpr = new MultipartRequest(request, p, 20 * 1024 * 1024);
                                   if (mpr.getParameter("name") != null) {

                                            String name = mpr.getParameter("name");
                                            String brands = mpr.getParameter("brands");
                                            String mrp = mpr.getParameter("mrp");
                                            String sellingprice = mpr.getParameter("sellingprice");
                                            String qty = mpr.getParameter("qty");
                                            String color = mpr.getParameter("color");
                                            String size = mpr.getParameter("size");
                                            String material = mpr.getParameter("material");
                                            String desc = mpr.getParameter("desc");
                                            String catid = mpr.getParameter("catid");
                                            String subcatid = mpr.getParameter("subcatid");
                                            
                                            String file1 = mpr.getOriginalFileName("file1");
                                            String file2 = mpr.getOriginalFileName("file2");
                                             
                                            //out.print(catid+subcatid+name+brands+mrp+sellingprice+qty+color+desc+file1+file2);
                                            
                                            
                                            
                                           

                                            String sql = "INSERT INTO tblproducts(NAME,brands,mrp,sellingprice,qty,color,size,material,description,img1,img2,catid,subcatid,dateon)VALUES('" + name + "','" + brands + "','" + mrp + "','" + sellingprice + "'," + qty + ",'" + color + "','" + size + "','" + material + "','" + desc + "','" + file1 + "','" + file2 + "'," + catid + "," + subcatid + ",NOW());";
                                            int r = microvision.DataUtility.executeDML(sql);
                                            if (r > 0) {
                                                out.print("<span class='alert alert-success'>Data Process Successfully!!</span>");
                                            } else {
                                                out.print("<span class='alert alert-danger'>Data could not Process !!</span>");
                                            }

                                            
                                        }
                                           
    

%>

