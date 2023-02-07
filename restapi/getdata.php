<?php
$db = mysqli_connect('localhost','root','','userdata');
$queryResult=$db->query("SELECT * FROM users");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$data[]=$fetchData;
}

echo json_encode($data);

?>
