<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>


    <?php include ('connect.php');?>
    <?php 
     $ergebnis = "SELECT * FROM employee";

     $result = mysqli_query($db, $ergebnis);

         while($row = mysqli_fetch_assoc($result))
{
           printf("employee_ID %s employeeName %s hireDate %s <br>",
               $row["employee_id"], 
               $row["first_name"], 
               $row["second_name"]);
         }

    ?>
    
    </body>
</html>