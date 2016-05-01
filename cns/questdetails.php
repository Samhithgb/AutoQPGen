<!DOCTYPE html>
  <head>
    <meta charset="UTF-8">
    <title>Enter Details of the question to edit</title>
        
    
        <link rel="stylesheet" href="style.css">
    
  </head>

  <body>
	  
	  
	    <div class="wrapper">
	<div class="container">
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
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</html>