<?php
ob_start();
session_start();

if (!isset($_SESSION['user'])) {
	header("Location: index.php");
}

include "data.php";
include_once 'dbconnect.php';

//new object for query
$mysqli = new mysqli(DBHOST, DBUSER, DBPASS, DBNAME);

//check connection
if ($mysqli->connect_errno) {
	echo "Failed to connect to MySQL: " . $mysqli->connect_error;
}

//SQL statement
$sqlStatement = "SELECT * ";
$sqlStatement .= "FROM cars";

//do the query
$result = $mysqli->query($sqlStatement);

//check the result
if (!$result) {
	$outputDisplay .= "<p>MySQL No: " . $mysqli->errno . "</p>";
	$outputDisplay .= "<p>MySQL Error: " . $mysqli->error . "</p>";
	$outputDisplay .= "<p>SQL Statement: " . $sql_statement . "</p>";
	$outputDisplay .= "<p>MySQL Affected Rows: " . $mysqli->affected_rows . "</p>";
} else {
	$rows = $result->fetch_all(MYSQLI_ASSOC);
}

$sqlStatement = "select * from locations;";

$result = $mysqli->query($sqlStatement);

if (!$result) {
	$outputDisplay .= "<p>MySQL No: " . $mysqli->errno . "</p>";
	$outputDisplay .= "<p>MySQL Error: " . $mysqli->error . "</p>";
	$outputDisplay .= "<p>SQL Statement: " . $sql_statement . "</p>";
	$outputDisplay .= "<p>MySQL Affected Rows: " . $mysqli->affected_rows . "</p>";
} else {
	$locations = $result->fetch_all(MYSQLI_ASSOC);
}

?>
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
                <a class="navbar-brand" href="index.php">Cool wheels</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="fleet.php">Our fleet<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="reservation.php">Make reservation</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contacts</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.php?logout">Log out</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main>
            <h1>Fill the form to book a car</h1>
            <div class="row">
                <div class="col-8 col-md-offset-2">
                    <form method="post" action="reservation_done.php" autocomplete="off">
                        <select class="custom-select" name="car_id">
                            <option selected>Select your car</option>
                            <?php
foreach ($rows as $car => $features) {
	?>
                                <option value="" style="color: black">
                                    <?php echo $features["car_id"]; ?>
                                </option>
                                <?php
}
?>
                        </select>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Birth date</label>
                            <input name="birth_date" id="datepicker1">
                            <!--id="datepicker-->
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Driving license number</label>
                            <input class="form-control" name="driving_licence_num">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Driving license date</label>
                            <input name="driving_licence_date" id="datepicker2">
                        </div>
                        <select class="custom-select" name="fk_start_location">
                            <option selected>Start location</option>
                            <?php
                            $i = 1;
                            foreach ($fleet as $car => $features) {
	                       ?>
                                <option value="<?php echo $i++ ?>">
                                    <?php echo $car ?>
                                </option>
                                <?php
}?>
                        </select>
                        <select class="custom-select" name="fk_finish_location">
                            <option selected>Finish location</option>
                            <?php

                $i = 1;
                foreach ($fleet as $car => $features) {
	               ?>
                                <option value="<?php echo $i++ ?>">
                                    <?php echo $car ?>
                                </option>
                                <?php
}
?>
                        </select>
                        <select class="custom-select" name="location_id">
						<option selected>Select your starting location</option>
						<?php
                        foreach ($locations as $location => $features) {
	                    ?>
					<option value=""><?php echo $features["location_id"]; ?></option>
					<?php
}
?>
					</select>

                        <div class="form-group">
                            <label for="exampleFormControlInput1">Finish date</label>
                            <input name="finish_date" id="datepicker4">
                            <!--id="datepicker-->
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-block btn-primary" name="btn-reserve">Reserve a car</button>
                        </div>
                        <!--<div class="form-group">
				<label for="exampleFormControlTextarea1">Example textarea</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>-->
                    </form>
                </div>
            </div>
        </main>
        <script>
        $('#datepicker1').datepicker();
        </script>
        <script>
        $('#datepicker2').datepicker();
        </script>
        <script>
        $('#datepicker3').datepicker();
        </script>
        <script>
        $('#datepicker4').datepicker();
        </script>
    </body>

    </html>