<%
     session.removeAttribute("login");
     session.removeAttribute("uid");
                            
                             
                             response.sendRedirect("index.jsp");
%>