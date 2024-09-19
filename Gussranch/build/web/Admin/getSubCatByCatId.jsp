<%@page import="java.sql.ResultSet"%>
<option value="">Choose Sub Category</option>
<%
    if (request.getParameter("catid") != null) {
        String catid = request.getParameter("catid");
        ResultSet rs = microvision.DataUtility.executeDQL("SELECT *FROM tblsubcategory WHERE catid=" + catid);
        
        while (rs.next()) {
          
            %>
                <option value="<% out.print(rs.getString(1)); %>"><% out.print(rs.getString(2)); %></option>
            <%
        }

        }


%>