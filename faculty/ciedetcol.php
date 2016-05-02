


<html >
  <head>
    <meta charset="UTF-8">
    <title>Question Paper Generation</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <!-->    <link rel="stylesheet" href="style.css"><!-->
  </head>

  <body>
	
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
	
	  <a class="navbar-brand" href='selecteval.php'>Generate Question Paper &nbsp   |  &nbspCIE - Select Units</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#lo">Logged in As     <?php session_start();echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>

		
	    <form class="form" method="post" action="ciedetails.php">
	        Type "Y or y" against the unit number if that unit is included in the syllabus for the exam.
            <br><br>
           
            <br>
	    <input id="uid1" name="unit_1" type="text" placeholder="Unit 1" required>
      <label>
            <input id="uid2" name="unit_2" type="text" placeholder="Unit 2" required>
            </label>
            <input id="uid3" name="unit_3" type="text" placeholder="Unit 3" required>
          
            <input id="uid4" name="unit_4" type="text" placeholder="Unit 4" required>
           
            <input id="uid5" name="unit_5" type="text" placeholder=" Unit 5" required>
            <br>
            
            Theory Questions : Enter number of questions from each unit (Out of total 5). Enter 0 if unit is not included.<br><br>
            
             <input id="tuid1" name="tunit_1" type="number" placeholder="Unit 1" required>
           
            <input id="tuid2" name="tunit_2" type="number" placeholder=" Unit 2" required>
            
            <input id="tuid3" name="tunit_3" type="number" placeholder="Unit 3" required>
          
            <input id="tuid4" name="tunit_4" type="number" placeholder="Unit 4" required>
           
            <input id="tuid5" name="tunit_5" type="number" placeholder=" Unit 5" required>
         
            
            
            
	    <button type="submit" name= "save" id="sub">Proceed</button>
		</form>
	</div>
	
</div>



    
    
    
  </body>
</html>
