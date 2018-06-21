<?php
include("data.php");
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cr09_ivan_zykov_carrental";

$con = mysqli_connect($servername, $username, $password, $dbname);

if (!$con) {
	die("Connection failed: " . mysqli_connect_error());
} else {
	//echo "Connected successfully";
}

$sql = "SELECT cars.car_id, car_brands.name AS 'Brand', car_models.name AS 'Model', cars.car_year, cars.color, car_models.transmission, car_models.clima, cars.price_day
				FROM cars
				INNER JOIN car_models
					ON cars.fk_car_model_id = car_models.car_model_id
				INNER JOIN car_brands
					ON car_models.fk_car_brand_id = car_brands.car_brand_id";

$result = mysqli_query($con, $sql);

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
	
	
	<div class="container">
		<div class="row">
		<?php
		//var_dump($row = mysqli_fetch_assoc($result));
		while ($row = mysqli_fetch_assoc($result)) { ?>
				<div class="card float-left center-block p-4 col-sm-12 col-md-6" style="width: 18rem;">
			  <!--<img class="card-img-top" src=".../100px180/" alt="Card image cap">-->
			  <!--<img class="card-img-top"src="<?php echo $features['img'] ?>">-->
				  <div class="card-body">
				    <h5 class="card-title"><?php echo $row['Brand']. " " . $row['Model'] ?></h5>
				    <ul class="list-unstyled">
				    	<li><em>Brand: </em><?php echo $row['Brand'] ?></li>
				    	<li><em>Model: </em><?php echo $row['Model'] ?></li>
				    	<li><em>Color: </em><?php echo $row['color'] ?></li>
				    	<li><em>Air conditioner: </em><?php echo $row['clima'] ?></li>
				    	<li><em>Transmission: </em><?php echo $row['transmission'] ?></li>
				    	<li><em>Price: </em><?php echo $row['price_day'] ?></li>
				    </ul>
				  </div>
				</div>
				<?php
		}

		?>
		</div>
	</div>

	</main>
</body>
</html>