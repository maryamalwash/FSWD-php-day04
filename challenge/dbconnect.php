<?php 

define('DBHOST', 'localhost');
define('DBUSER', 'root');
define('DBPASS', '');
define('DBNAME', 'cr09_ivan_zykov_carrental');

$con = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);

if(!$con) {
	die("Connection failed: " . mysqli_error());
} else {
	echo "Connection established!";
}

 ?>