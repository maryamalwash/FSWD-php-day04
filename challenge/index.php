<?php
ob_start();
session_start();
require_once 'dbconnect.php';

if(isset($_SESSION['user'])!=""){
	/*unset($_SESSION['user']);
	session_unset();
	session_destroy();*/
	header('Location: home.php');
	exit;
}
$error = false;

if(isset($_POST['btn_login'])) {

$email = mysqli_real_escape_string($con, $_POST['email']);
$pass = mysqli_real_escape_string($con, $_POST['pass']);

 if(empty($email)){
  $error = true;
  $emailError = "Please enter your email address.";
 } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
  $error = true;
  $emailError = "Please enter valid email address.";
 }

 if(empty($pass)){
  $error = true;
  $passError = "Please enter your password.";
 }

// if there's no error, continue to login
 if (!$error) {
  
  //$password = hash('sha256', $pass); // password hashing

  $res=mysqli_query($con, "SELECT driver_id, first_name, last_name, pass FROM drivers WHERE email='$email'");
  $count=0;
  //var_dump(is_object($res));
  if(is_object($res)) {
	$count = mysqli_num_rows($res);
	
    if($count !=0){
	  $row=mysqli_fetch_array($res, MYSQLI_ASSOC);
	  var_dump($row);
   // if uname/pass correct it returns must be 1 row
  }
 }else {
 	echo "User with this e-mail were not found";
 }

  if( $count == 1 && $row['pass']==$pass ) {
   $_SESSION['user'] = $row['driver_id'];
   header("Location: home.php");
  } else {
   $errMSG = "Incorrect Credentials, Try again...";
  }
 
 }

}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Cool wheels</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="index.php">Cool wheels</a>

		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarText">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active"> <!-- active class indicates the current page-->
		        <a class="nav-link" href="fleet.php">Our fleet</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="register.php">Register</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="logout.php">Log out</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="reservation.php">Make reservation</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Contacts</a>
		      </li>
		    </ul>
		  </div>
		</nav>
	</header>
	<main>
		<div class="jumbotron">
			<h1 class="display-4">Welcome to</h1>
		  <h1>Cool wheels</h1> 
		  <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		</div>
		<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
			<div class="form-group">
				<label for="exampleFormControlInput1">Email:</label>
				<input name="email"> <!--id="datepicker-->
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">Password:</label>
				<input class="form-control" name="pass">
			</div>
			
			<button type="submit" class="btn btn-block btn-primary" name="btn_login">Login</button>
		</form>
	</main>
</body>
</html>