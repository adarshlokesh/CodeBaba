<%-- 
    Document   : index
    Created on : Nov 3, 2016, 5:47:27 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
           <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">

    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href=".css/material.min.css">
<script src=".css/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
 <script type="text/javascript">
function validateLogin(){
	document.getElementById("usererror").innerHTML="";
	document.getElementById("passworderror").innerHTML="";
	var username = document.forms["loginpage"]["username"].value;
	var password = document.forms["loginpage"]["password"].value;
	if(username===null || username===""){		
		document.getElementById("usererror").innerHTML="Username Required";
		
		return false;
	}
	if(password===null || password===""){
		document.getElementById("passworderror").innerHTML="Password Required";
		return false;
	}
	
}
function validateRegister(){
	document.getElementById("nameerror").innerHTML="";
	document.getElementById("emailerror").innerHTML="";
        document.getElementById("phoneerror").innerHTML="";
        document.getElementById("passworderror").innerHTML="";
        document.getElementById("confirmerror").innerHTML="";
        
	var name = document.forms["registerpage"]["name"].value;
        var email = document.forms["registerpage"]["email"].value;
        var phone = document.forms["registerpage"]["phone"].value;
        var pass = document.forms["registerpage"]["pass"].value;
	var confirm = document.forms["registerpage"]["confirm"].value;
	if(name===null || name===""){		
		document.getElementById("nameerror").innerHTML="Name Required";
		
		return false;
	}
        if(email===null || email===""){		
		document.getElementById("emailerror").innerHTML="Email Required";
		
		return false;
	}
        if(phone===null || phone===""){		
		document.getElementById("phoneerror").innerHTML="PhoneNo Required";
		
		return false;
	}
        if(pass===null || pass===""){		
		document.getElementById("passworderror").innerHTML="Password Required";
		
		return false;
	}
	if(confirm===null || confirm===""){
		document.getElementById("confirmerror").innerHTML="Confirm Password required";
		return false;
	}
        if(confirm===null || confirm===""||confirm!==pass){
		document.getElementById("confirmerror").innerHTML="Password dont match";
		return false;
	}
	
}
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
<% session.invalidate();%>
</script>
    </head>
    <body>
        
        <div class="view" style="background: url('./background.jpg')no-repeat center center fixed;overflow-y: auto;">    
<header>

    <!--Navbar-->
    <nav class="navbar navbar-light blue-gradient">

        <!-- Collapse button-->
        <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx2">
            <i class="fa fa-bars"></i>
        </button>

        <div class="container">
            <br>
            <a class="navbar-brand" href="#"><strong style="font-size:40px;color: white">Code Baba</strong></a>
            <!--Collapse content-->
            <div class="collapse navbar-toggleable-xs" id="collapseEx2">
                <!--Navbar Brand-->
                
                
                <!--Search form-->
                <form class="form-inline">
                    <input class="form-control" type="text" placeholder="find pages">
                </form>
            </div>
            <!--/.Collapse content-->

        </div>
        
        
    </nav>
    <!--/.Navbar-->

</header>
        <br>

        <main>
            
            <div class="row">
                <div class="col-md-4"> </div> 
                 <div class="col-md-3"> </div>  
                <div class="col-md-4"> 
                    <!--Card-->
                    <div class="card">
                        
                         <div class="card-block">

        <!--Header-->
        <div class="form-header white">
            <h3 style="text-align: center;font-size: 40px"><i class="fa fa-lock"></i> Login:</h3>
        </div>
                         </div>
                        <hr>
            <!--Card image-->
                        
    <!--/.Card image-->

                        <!-- LOGIN form-->
                         <div class="card-block">
               
                
                <form name="loginpage" action="mainDecision" method="post">
                    <input type="hidden" name="fromwhere" value="login">
<div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="username">
            
             <label for="form2">Username</label>
            <div id="usererror" style="color: red"></div>
        </div>
                    <!--Password validation-->
<div class="md-form">
    <i class="fa fa-lock prefix"></i>
    <input type="password" id="form10" class="form-control validate" name="password">
    <label for="form10" data-error="wrong" data-success="right">Type your password</label>
    <div id="passworderror" style="color: red"></div>
    
   <div id="passwordcheck" style="color: red">${check}</div>
   
</div> 
                     <div class="text-xs-center">
            <button type="submit" class="btn btn-primary" onclick="return validateLogin()">login</button>
            
        </div>
                </form>
                
                
                         </div>
    <div class="modal-footer">
        <div class="options">
            <p>Not a member? <a href="#" data-toggle="modal" data-target="#myModal">Sign Up</a></p>
            <p>Forgot <a href="#">Password?</a></p>
        </div>
    </div>
                        
                        
                        
    <!--/.Register input form-->
    <!-- Modal -->
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
            <h3 style="text-align: center;font-size: 40px"><i class="fa fa-lock"></i> Register:</h3>
        </div>
            </div>
            <!--Body-->
           <form name="registerpage" action="mainDecision" method="post">
                <input type="hidden" name="fromwhere" value="register">
            <div class="modal-body">
                
                    <div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="name">
            <label for="form2">Name</label>
            <div id="nameerror" style="color: red"></div>
        </div>
<div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="email">
            <label for="form2">Your email</label>
            <div id="emailerror" style="color: red"></div>
        </div>
                    <div class="md-form">
            <i class="fa fa-envelope prefix"></i>
            <input class="form-control" type="text" id="form2" name="phone">
            <label for="form2">Phone</label>
            <div id="phoneerror" style="color: red"></div>
        </div>
                    <!--Password validation-->
<div class="md-form">
    <i class="fa fa-lock prefix"></i>
    <input type="password" id="form10" class="form-control validate" name="pass">
    <label for="form10" >Type your password</label>
    <div id="passworderror" style="color: red"></div>
</div> 
                    <div class="md-form">
    <i class="fa fa-lock prefix"></i>
    <input type="password" id="form10" class="form-control validate" name="confirm">
    <label for="form10" >Confirm password</label>
    <div id="confirmerror" style="color: red"></div>
</div> 
                
               
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                <button type="submit" class="btn btn-primary" onclick="return validateRegister()">Sign Up!!..</button>
            </div>
             </form>
        </div>
        <!--/.Content-->
    </div>
</div>
    
    
    
    
    
    
    

                    </div>
<!--/.Card-->
                </div> 
            </div>
            
        </main>

        <footer>
            
        </footer>

        
         <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
        </div>
    </body>
</html>

