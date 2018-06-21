<?php include("data.php");?>

<!doctype html>
<!DOCTYPE html>
<html>
<head>
	<title>Cool wheels</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">Cool wheels</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarText">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="fleet.php">Our fleet<span class="sr-only">(current)</span></a>
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
		<h1>Fill the form to book a car</h1>
		<div class="row">
		<div class="col-8 col-md-offset-2">
		<form>

			<select class="custom-select" name="car_id">
				<option selected>Select your car</option>
				<?php 
				$i = 1;
				foreach($fleet as $car => $features){
					?>
					<option value="<?php echo $i++ ?>"><?php echo $car?></option>
					<?php
				}	
				?>
			</select>

			<div class="form-group">
				<label for="exampleFormControlInput1">First name</label>
				<input type="text" class="form-control" name="first_name"><!--id="exampleFormControlInput1"-->
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">Last name</label>
				<input type="text" class="form-control" name="last_name">
			</div>

			<!--<div class="input-group date" data-provide="datepicker">
		    <input type="text" class="form-control">
		    <div class="input-group-addon">
		        <span class="glyphicon glyphicon-th"></span>
		    </div>
			</div>-->

			<div class="form-group">
				<label for="exampleFormControlInput1">Birth date</label>
				<input name="birth_date" id="datepicker1"> <!--id="datepicker-->
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">Driving license number</label>
				<input class="form-control" name="driving_licence_num">
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">Driving license date</label>
				<input name="driving_licence_date" id="datepicker2" >
			</div>

			<select class="custom-select" name="fk_start_location">
				<option selected>Start location</option>
				<?php 
				$i = 1;
				foreach($fleet as $car => $features){
					?>
					<option value="<?php echo $i++ ?>"><?php echo $car?></option>
					<?php
				}?>
			</select>

			<select class="custom-select" name="fk_finish_location">
				<option selected>Finish location</option>
				<?php 
				$i = 1;
				foreach($fleet as $car => $features){
					?>
					<option value="<?php echo $i++ ?>"><?php echo $car?></option>
					<?php
				}	
				?>
			</select>
			
			<div class="form-group">
				<label for="exampleFormControlInput1">Start date</label>
				<input name="start_date" id="datepicker3"> <!--id="datepicker-->
			</div>

			<div class="form-group">
				<label for="exampleFormControlInput1">Finish date</label>
				<input name="finish_date" id="datepicker4"> <!--id="datepicker-->
			</div>

			<!--<div class="form-group">
				<label for="exampleFormControlTextarea1">Example textarea</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>-->
		</form>
		</div>		
		
		</div>
	</main>
	<script> $('#datepicker1').datepicker();</script>
	<script> $('#datepicker2').datepicker();</script>
	<script> $('#datepicker3').datepicker();</script>
	<script> $('#datepicker4').datepicker();</script>
</body>
</html>