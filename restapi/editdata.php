

<?php

$db = mysqli_connect('localhost','root','','userdata');
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
	
	$sql="UPDATE users SET password='".$password."', email='".$email."' WHERE username='".$username."'";
	$query = mysqli_query($db,$sql);
		if($query){
			echo json_encode("Success");
		}

	
	
?>