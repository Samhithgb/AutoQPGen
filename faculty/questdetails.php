<!DOCTYPE html>
   <head>
    <meta charset="UTF-8">
    <title>Edit Questions</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="style.css">
    
  </head>
	  
	  
	    <div class="wrapper">
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand">Automatic QP Generator &nbsp   |  </a>
    
	
    </div>
	
	  <a class="navbar-brand" href='facultydash.php'>Edit Questions in Database</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php session_start();echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
		<br><br><br>
		<h1>Enter the details of the Question</h1>
		<br> 
		Leave the fields empty to get all the questions (Warning : Browser might crash if too many results)
		<form method="POST" action="results.php">
			<input id="uno" name="U_NO" type="number" placeholder="Unit Number" required>
			<input id="marks" name="marks" type="number" placeholder="Least Possible Marks for the question" required>
			
			<button id="sub" type="submit" name="save" id="login-button">Search</button><br><br>
			<button type="button" onClick="location.href='facultydash.php'">Go to dashboard</button>
		</form>
	</div>
	
	
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</html>