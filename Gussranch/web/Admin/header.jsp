<div class="sticky-header header-section ">
    <div class="header-left">

        <!--toggle button start-->
        <button id="showLeftPush"><i class="fa fa-bars"></i></button>
        <!--toggle button end-->

        <!--notification menu end -->
        <div class="clearfix"> </div>
    </div>
    <div class="header-right">




        <div class="profile_details">		
            <ul>
                <li class="dropdown profile_details_drop">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <div class="profile_img">	
                            <span class="prfil-img"><img src="images/2.jpg" alt=""> </span> 
                            <div class="user-name">
                                <%

                                    if (session.getAttribute("admin") != null) {
                                        String admin = session.getAttribute("admin").toString();
                                        out.print("<p>" + admin + "</p>");
                                    }
                                    else
                                    {
                                         response.sendRedirect("login.jsp");
                                    }

                                %>

                                <span>Administrator</span>
                            </div>
                            <i class="fa fa-angle-down lnr"></i>
                            <i class="fa fa-angle-up lnr"></i>
                            <div class="clearfix"></div>	
                        </div>	
                    </a>
                    <ul class="dropdown-menu drp-mnu">
                        <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
                        <li> <a href="#"><i class="fa fa-user"></i> My Account</a> </li>
                        <li> <a href="#"><i class="fa fa-suitcase"></i> Profile</a> </li> 
                        <li> <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="clearfix"> </div>				
    </div>
    <div class="clearfix"> </div>	
</div>