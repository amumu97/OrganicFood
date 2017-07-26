<html lang="en">  
<head>  
  <title>Bootstrap Case</title>  
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
    
</head>  
<style>
body{background-color: #fff;}

.social-icon {
  list-style: none;
  padding: 0;
  margin: 0;
}

.social-icon li{
  display: inline-block;
  text-align: center;
}

.social-icon a {
  display: block;
  width: 44px;
  height: 44px;
  line-height: 44px;
  border-radius: 50%;
  margin-right: 5px;
}

.social-icon a {
  background: rgba(255, 255, 255, 0.85); /* social icon background color */
  color: #000; /* social icon color */
}

.social-icon a:hover {
  background: rgba(255, 255, 255, 0.25); /* social icon hover background color */
  color: #fff; /* social icon hover color */
}

.footer {
  position: absolute;
  bottom: 0;
  padding-top: 5px;
  width: 100%;
  height: 60px;
  background-color: #000;
}

</style>

<body>  

<a href="Welcome">click me</a> 


<!-- Navbar Code -->

<nav class="navbar navbar-inverse">  
  <div class="container-fluid">  
    <div class="navbar-header">  
      <a class="navbar-brand" href="#">The Warehouse</a>  
    </div>  
    <ul class="nav navbar-nav">  
      <li class="active"><a href="#">Home</a></li>  
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Register <span class="caret"></span></a>  
        <ul class="dropdown-menu">  
          <li><a href="login">Existing User</a></li>  
          <li><a href="register">New User</a></li>   
        </ul>  
      </li>  
      <li><a href="#">Contact Us</a></li>  
    </ul>  
  </div>  
</nav>  

<!-- End of Navbar Code -->
    
<div class="container">  
  <h3>This Is A Heading</h3>  
  <p>Just some random text to fill space.</p>  
</div>  

<!-- Footer Code -->

	<footer class="footer">
      <div class="container">
 	<ul class="social-icon animate pull-right">
                  <li><a href="#" title="facebook" target="_blank"><i class="fa fa-facebook"></i></a></li> 
                  <li><a href="#" title="twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="#" title="google plus" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                </ul>
                </div>
    </footer>

<!-- End of Footer Code -->


<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">  -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
</body>  
</html>  