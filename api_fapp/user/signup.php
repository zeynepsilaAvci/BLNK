<?php
include '../connection.php';

//Post--Send/Save data to MySql db
//Get--retrieve/read dadta from mysql 

$userName = $_POST['user_name'];
$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "INSERT INTO users SET user_name = '$userName', user_email = '$userEmail', user_password = '$userPassword'";

$resultofQuery = $connectNow->query($sqlQuery);

if($resultofQuery)
{
    echo json_encode(array("succes"=>true));

}
else{
    echo json_encode(array("succes"=>false));

}
?>