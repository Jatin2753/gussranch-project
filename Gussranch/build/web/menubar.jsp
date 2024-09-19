
<%@page import="java.sql.ResultSet"%>
<ul class="nav navbar-nav menu__list">
    <li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>


    <%
        try
        {
        ResultSet mm = microvision.DataUtility.executeDQL("select *from tblcategory order by categoryorder");
        while (mm.next()) {

            int cid = mm.getInt(1);
            ResultSet misubcat = microvision.DataUtility.executeDQL("SELECT *FROM tblsubcategory WHERE catid=" + cid);
            if (misubcat.next()) {
    %>
    <li class="dropdown menu__item">
        <a href="productlist.jsp?cid=<%= mm.getString("id")%>" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" ><%= mm.getString("categoryname")%>  <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a class="btn btn-default" href="productlist.jsp?cid=<%= mm.getString("id")%>"><%= mm.getString("categoryname")%> </a></li>

            <%
                misubcat = microvision.DataUtility.executeDQL("SELECT *FROM tblsubcategory WHERE catid=" + cid);

                while (misubcat.next()) {
            %>
            <li><a href="productlist.jsp?sid=<%= misubcat.getInt(1)%>"> <%= misubcat.getString(2)%></a></li>

            <%
                }
                //rssubcat=null;
            %>


        </ul>
    </li>
    <%
    } else {
    %>
    <li class="menu__item"><a class="menu__link" href="productlist.jsp?cid=<%= misubcat.getInt(1)%>"><%= misubcat.getString(2)%></a></li>

    <%
            }

        }
mm.close();
}
catch(Exception ex)
{
    out.print(ex.getMessage());
}


    %>




    <li class=" menu__item"><a class="menu__link" href="contact-us.jsp">contact</a></li>
</ul>