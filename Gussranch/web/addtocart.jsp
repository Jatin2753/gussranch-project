<%@page import="java.util.Random"%>
<%
    if (session.getAttribute("cart") == null) {
        session.setAttribute("cart", "ranch"+new Random().nextInt());

    }

    String pid = request.getParameter("pid");
    String rate = request.getParameter("rate");
    String qty = request.getParameter("qty");
    
    double total = Double.parseDouble(qty) * Double.parseDouble(rate);

    String sql = "INSERT INTO tblshopingcart (pid,rate,qty,total,sessionid,dateon)VALUES('" + pid + "','" + rate + "', '" + qty + "','" + total + "','" + session.getAttribute("cart").toString() + "',now())";

    int r = microvision.DataUtility.executeDML(sql);
    
    response.sendRedirect("productdetails.jsp?pid="+pid);
    

%>


