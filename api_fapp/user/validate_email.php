<?php
include '../connection.php';

$userEmail = $_POST['user_email'];

$sqlQuery = "SELECT * FROM users WHERE user_email='$userEmail'";

$resultofQuery = $connectNow->query($sqlQuery);

if($resultofQuery->num_rows > 0)
{
    echo json_encode(array("emailFound"=>true));
}
else{
    echo json_encode(array("emailFound"=>false));
}


?>