<%-- 
    Document   : profile
    Created on : Nov 11, 2016, 8:23:58 PM
    Author     : Raghu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="modal.CommentDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modal.GetDetails"%>
<%@page import="modal.CardDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <link href="js/jquery-2.2.3.min.js" rel="stylesheet">
    <link href="js/bootstrap.min.js" rel="stylesheet">
    <link href="js/mdb.min.js" rel="stylesheet">
    <link rel="stylesheet" href="css/material.css">
<script type="text/javascript" src="js/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
   
       <style>
    
.container1 {
    width: 100%;
    height: 850px;
    position: relative;
    
    -webkit-perspective: 800px;
    -moz-perspective: 800px;
    -o-perspective: 800px;
    perspective: 800px;
}
.cardrotate1 {
    width: 100%;
    height: 100%;
   
    -webkit-transition: -webkit-transform 1s;
    -moz-transition: -moz-transform 1s;
    -o-transition: -o-transform 1s;
    transition: transform 1s;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    transform-style: preserve-3d;
    -webkit-transform-origin: 50% 50%;
}
.cardrotate1 div {
    display: block;
    height: 100%;
    width: 100%;
    line-height: 260px;
   
    position: absolute;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    backface-visibility: hidden;
}
.cardrotate1 .front1 {
  backface-visibility: hidden;
}
.cardrotate1 .back1 {
    backface-visibility: hidden;
    -webkit-backface-visibility: hidden;
    -webkit-transform: rotateY( 180deg );
    -moz-transform: rotateY( 180deg );
    -o-transform: rotateY( 180deg );
    transform: rotateY( 180deg );
    
    
}
.cardrotate1.flipped {
    
    -webkit-transform: rotateY( 180deg );
    -moz-transform: rotateY( 180deg );
    -o-transform: rotateY( 180deg );
    transform: rotateY( 180deg );
}





        </style>
       
          <script type="text/javascript">
            
    
         function flip() {
             
    $('.cardrotate1').toggleClass('flipped');
    
}


        </script>
        <script type="text/javascript">
            function a(id){
          var element = document.getElementById(id);
           var count=element.getAttribute("data-badge");
           
           count=parseInt(count)+1;
           
           element.setAttribute("data-badge",count);
         
  }
        </script>
        
    </head>
    <body class="view">
    <header>
<%
            HttpSession ses=request.getSession(true);
            int uidPic=Integer.parseInt(ses.getAttribute("uid").toString());
             String profilePic=GetDetails.getImage(uidPic);
            %>
  
    <!-- Top row, always visible -->
    <nav class="navbar navbar-dark  warning-color-dark navbar-fixed-top">

            <!-- Collapse button-->
            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx23"><i class="fa fa-bars"></i></button>

            <div class="container">

                <!--Collapse content-->
                <div class="collapse navbar-toggleable-xs" id="collapseEx23">
                    <!--Navbar Brand-->

                    <!--Links-->
                    <ul class="nav navbar-nav">
                        <li class="nav-item" style="margin-top: 15px;margin-right: 5px;">
                            <a class="" href="#" style="font-size: 30px; border: 2px solid white;"><b>Profile</b> </a>
                        </li>
                         <li class="nav-item" style="margin-top: 15px;">
                            <a class="" href="/codebaba_main1/mainPage.jsp" style="font-size: 20px;">Home </a>
                        </li>
                        
                       
                        
                    </ul>
                    <!--/Links-->

                    <!--Links-->
                    <ul class="nav navbar-nav nav-flex-icons">
                       
                        <li class="nav-item avatar active dropdown" style="background: transparent;">
                            <a class="nav-link  waves-effect waves-light"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <img src="css/css/<%=profilePic %>" class="img-fluid img-circle" style="width:50px;height: 50px;">
                            </a>
                            <div class="dropdown-menu dropdown-warning" aria-labelledby="dropdownMenu1" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                               
                                <form action="mainDecision" method="post" id="lagout">
                                    <input type="hidden" name="fromwhere" value="lagout">
                                    <a class="dropdown-item waves-effect waves-light" href="#" onclick="document.getElementById('lagout').submit();" style="margin-right:  40px;">Logout</a>
                                </form>
                            </div>
                        </li>

                    </ul>
                    <!--Links-->
                </div>
                <!--/.Collapse content-->

            </div>

        </nav>
    <!-- Bottom row, not visible on scroll -->
    
  
 
  

   </header>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
   
    
       <div class="view" style=" overflow-y: auto;"> 
          
       
       
       
        <%
           
            int uid=Integer.parseInt(ses.getAttribute("uid").toString());
            ArrayList<CardDetails> posts=GetDetails.getProfilePost(uid);
            ResultSet aboutDetails=GetDetails.getAboutUser(uid);
            
 %>
<!--Section: Author box-->
<section class="">

    <!--Author box-->
    
        
        <div class="row">
            <div class="col-md-2">
                
            </div>
            <div class="col-md-8">
            <div class="card">
                <div class="card-block z-depth-3">
            <!--Name-->
            <h3 class="h3-responsive text-xs-center">About Me</h3>
            <hr>

            <!--Avatar-->
            <div class="col-xs-12 col-sm-2">
                <img src="css/css/<%=profilePic %>" class="img-fluidz-depth-2">
            </div>

            <!--Author Data-->
            <div class=" col-xs-12 col-sm-10">

                <p><strong><%=aboutDetails.getObject("name") %></strong></p>

                <div class="personal-sm">
                    <a class="email-ic"><i class="fa fa-home"> </i></a>
                    <a class="fb-ic"><i class="fa fa-facebook"> </i></a>
                    <a class="tw-ic"><i class="fa fa-twitter"> </i></a>
                    <a class="gplus-ic"><i class="fa fa-google-plus"> </i></a>
                    <a class="li-ic"><i class="fa fa-linkedin"> </i></a>
                    <a class="email-ic"><i class="fa fa-envelope-o"> </i></a>
                </div>

                <p><%=aboutDetails.getObject("about") %></p>
                <p class="hidden-md-down">Email :<%=aboutDetails.getObject("email") %></p>
                <a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square fa-2x " style="float: right;" aria-hidden="true"></i></a>
                
            </div>

                
        </div>
            </div>
            </div>
             <div class="col-md-2">
                
            </div>
        </div>
    </section>
    </div>
                
                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                </button>
                <div class="form-header white">
            <h3 style="text-align: center;font-size: 40px"><i class="fa fa-hourglass-2" aria-hidden="true"></i></i> Edit About:</h3>
        </div>
            </div>
            <!--Body-->
            <form action="profile" method="post">
                <input type="hidden" name="fromwhere" value="editabout">
            <div class="modal-body">
                
                    <div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="name" value='<%=aboutDetails.getObject("name") %>'>
            <label for="form2">Name</label>
        </div>
<div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="email" value='<%=aboutDetails.getObject("email") %>'>
            <label for="form2">Your email</label>
        </div>
                 
                    <div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            
            <textarea type="text" id="form8" class="md-textarea"  name="about" ><%=aboutDetails.getObject("about") %></textarea>
            <label for="form2">About you</label>
        </div>
                    <!--Password validation-->

           
                
               
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary" >Done.</button>
            </div>
             </form>
        </div>
        <!--/.Content-->
    </div>
</div>
    <!--/.Author box-->

<%
 //ArrayList<CardDetails> posts=(ArrayList<CardDetails>)request.getAttribute("result");
 
            for(int i=0;i<posts.size();i++)
            {
              CardDetails c=posts.get(posts.size()-i-1);
              
               ArrayList<CommentDetails> comment=c.getComment();
        %>
    <div class="row">
        <div class="col-md-2"> 
                    
                </div>
        <div class="col-sm-8"> 
                    
               
           
         <div class="container1">
        <div class="cardrotate1">
            
            <div class="face1 front1">
                
                <div class="card z-depth-3">
                    
                    <div class="col-xs-12 col-sm-2">
                <img src="css/css/<%=c.getPic() %>" class="img-fluid z-depth-5" style="width: 50px; height: 50px;margin-top: 8px;">
            </div>
                    <div style="margin-left: 80px;">
                        <p style="text-align: left;font-size: 30px;margin-top: 10px;color: white;padding-bottom: 0;margin-bottom: 5px;"><%=c.getUname() %><p style="text-align: start;margin-top: 0;color: white">
                            <%=c.getAbout() %></p>
        
        </div>
    <h3 class="card-header primary-color white-text" style="margin-top: 0;height: 80px;"></h3>
    
    
     <div class="card-block">
        
        <h4 class="card-title" style="margin-top: 0"><%=c.getTitle() %></h4>
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
        <p class="card-text"><%=c.getDescription() %></p>
         <div style="height:40%; width:90%; overflow:scroll;overflow-x:hidden;overflow-y:scroll;">
             <pre><p> 
    <%=c.getProgram()%>  </p></pre>
        </div>
        
        <section style="margin-top: 55%;">
         
       
            
             <div style="width: 90%;">
                  <div class="section-heading" style="text-align: left;margin-top: 2%;">
            
            <h6 >
                <from name="like">
                    <input type="hidden" name="pid" value="<%=c.getPid() %>" >
                        <a onclick="a(<%=c.getPid() %>)"><i class="fa fa-thumbs-up fa-lg" style="width: 15%;" ><span class="mdl-badge" data-badge="<%=c.getLikes() %>" toogle="0" id="<%=c.getPid() %>"></span></i></a>
                </from>    
                    
                    
                    <a onclick="flip()">Comments <i class="fa fa-comments" aria-hidden="true"></i><span class="mdl-badge" data-badge="<%= comment.size() %>"></span></a></h6>
           
    
        </div>
            <form action="comment" method="post">
               
                <div class="md-form" style="margin-top: 10%;" >
                <i class="fa fa-envelope prefix"></i>
                 
                 <!--<input type="text" id="form2" class="form-control" value="comment here" name="commentfield" >-->
                 <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Comment Here" name="commentfield">
                 <input type="hidden" name="pid" value="<%=c.getPid() %>" >
                 <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="float: right;" id="<%=c.getPid() %>" >Comment</button>
                 <!--<label for="form1" class="">Example label</label>-->
                 
                
               
    
</div>
                 
            
            </form>
        </div>
           
        </section>
        
        
       
    </div>
        
   <br>
   <br>
   <br>
    
</div>
                 </div> 
             <div class="face1 back1"> 
                <div class="card">
                    
                    <h3 class="card-header primary-color white-text" style="margin-top: 0;margin-bottom: 0;color: white" onclick="flip()"><a><i class="fa fa-mail-reply prefix"></i></a>Comments</h3>
                    
    <div class="card-block" >
       
        <div class="row">
            <!--Image column-->
            
           <section>

               
               
               <div class="comments-list" style="height: 70%;width: 95%;verflow: scroll;overflow-x: hidden;">
               <%
                  
                   CommentDetails cmt;
                   for(int j=0;j<comment.size();j++)
                   {
                       cmt=comment.get(comment.size()-j-1);
                       
                     for(int k=0;k<1&&j>0;k++)
                     {
                   %>
    <!--Main wrapper-->
    <p style="height:130px;"></p>
    
        
   
    <% } %>
    
        
        <!--First row-->
        <div class="row" style="margin-left: 5%;height: 20%;width: 98%;">
            <!--Image column-->
            <div class="col-sm-2 col-xs-12">
                <img src="css/css/<%=cmt.getImage() %>" class="img-fluid img-circle z-depth-5" style="width: 50px; height: 50px;margin-top: 8px;">
            </div>
            <!--/.Image column-->

            <!--Content column-->
            <div class="col-sm-10 col-xs-12">
                <a><h3 class="user-name" style="margin-left: 60px;margin-top: 0; width: fit-content;height: fit-content;"><%=cmt.getName() %> <span style="font-size: 20px;margin-left: 200px;" onclick="flip()"><%=cmt.getDate() %></span> </h3></a>

                

                <p class="comment-text"><span style="margin-left: 50px;"></span>
                
                    <%=cmt.getComment() %>
                </p>
                <hr>
                
            </div>
            
            <!--/.Content column-->

        </div>
        <!--/.First row-->
        
        
         <!--First row-->
     <%
        }
        %>
         
    </div>
   
        
           </section>
            
        </div>
        
    </div>
    
    
    <!--here-->
    
    
    
   <br>
    
</div>
             </div>
           
        </div>
        </div>

            
            
             </div>
        <div class="col-md-2"> 
                    
                </div>
        </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    
        
        <%
            }
        %>
 
<!--/Section: Author box-->

       
       <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    </body>
</html>
