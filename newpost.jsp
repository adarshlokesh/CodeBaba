<%-- 
    Document   : newposy
    Created on : Nov 5, 2016, 7:59:40 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modal.GetDetails"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
         <!-- Bootstrap core CSS -->
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
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" ></script>
    <!-- for rotating card-->
<script type="text/javascript">
function validatePost(){
       
	document.getElementById("titleerror").innerHTML="";
	document.getElementById("descriptionerror").innerHTML="";
        document.getElementById("programerror").innerHTML="";
     
	var title = document.forms["newpost"]["Title"].value;
        var desp = document.forms["newpost"]["Description"].value;
        var prog = document.forms["newpost"]["Program"].value;
       
	if(title===null || title===""){		
		document.getElementById("titleerror").innerHTML="Title Required";
		
		return false;
	}
        if(desp===null || desp===""){		
		document.getElementById("descriptionerror").innerHTML="Description Required";
		
		return false;
	}
        if(prog===null || prog===""){		
		document.getElementById("programerror").innerHTML="Program Required";
		
		return false;
	}
        
}

</script> 
    <style type="text/css">
        
     
    </style>
        
        
    </head>
    
    
    
    <body>
          <header>

           <%
            HttpSession ses=request.getSession();
            int uid=Integer.parseInt(ses.getAttribute("uid").toString());
             String profilePic=GetDetails.getImage(uid);
            %>
            
    <!--Navbar--> 
  <nav class="navbar navbar-dark warning-color-dark">

            <!-- Collapse button-->
            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx23"><i class="fa fa-bars"></i></button>

            <div class="container">

                <!--Collapse content-->
                <div class="collapse navbar-toggleable-xs" id="collapseEx23">
                    <!--Navbar Brand-->

                    <!--Links-->
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light" href="#home"><strong><h2>Post the code..!!!</h2></strong> <span class="sr-only">(current)</span></a>
                        </li>
                       
                    </ul>
                    <!--/Links-->

                    <!--Links-->
                    <ul class="nav navbar-nav nav-flex-icons">
                        <li class="nav-item ">
                            <!--<a class="nav-link waves-effect waves-light" href="#">1 <i class="fa fa-envelope fa-3x"></i> </a>-->
                        </li>
                        <li class="nav-item avatar active dropdown" style="background: transparent;">
                            <a class="nav-link  waves-effect waves-light"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <img src="css/css/<%=profilePic %>" class="img-fluid img-circle " style="width:50px;height: 50px;">
                            </a>
                            <div class="dropdown-menu dropdown-warning" aria-labelledby="dropdownMenu1" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <a class="dropdown-item waves-effect waves-light" href="#">Action</a>
                                <a class="dropdown-item waves-effect waves-light" href="#">Another action</a>
                                <a class="dropdown-item waves-effect waves-light" href="#">Something else here</a>
                            </div>
                        </li>

                    </ul>
                    <!--Links-->
                </div>
                <!--/.Collapse content-->

            </div>

        </nav>
    <!--/.Navbar-->

</header>
        <br>
        <br>
        <br>
        
        <main>
            <div class="">
            <div class="row">
                
                
                <div class="col-md-2">
                    
                </div>
                 <div class="col-md-8">
                    <form name="newpost" action="profile" method="post"> 
                        <input type="hidden" name="fromwhere" value="newpost">
<div class="md-form">
    <i class="fa fa-tags prefix"></i>
    <input type="text" id="form2" class="form-control" name="Title">
    <label for="form2">Title</label>
     <div id="titleerror" style="color: red"></div>
</div>
                     
                     <br>             
<div class="md-form">
    <i class="fa fa-hand-o-right prefix"></i>
    <input type="text" id="form2" class="form-control" name="Description">
    <label for="form2">Description</label>
     <div id="descriptionerror" style="color: red"></div>
</div> 
                     <br>
                     
                     <div >
                    <div class="md-form" >
    <i class="fa fa-file-text prefix"></i>
    <textarea type="text" id="form8" class="md-textarea" name="Program" style="height: 300px;"></textarea>
    <label for="form8">Program</label>
     <div id="programerror" style="color: red"></div>
</div>
                     </div>
                     
                     <div style="float: right;">
                         <button type="submit" class="btn btn-deep-purple" onclick="return validatePost()">Post</button>
                     </div>
                     </form>
                </div>
                 <div class="col-md-2">
                    
                </div>
                
            </div>
                
                
                
            </div>
        </main>
        
        
          <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
        
    </body>
</html>
