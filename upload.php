<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
   echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.</br>";
}
$command = "/opt/texcount/texcount.pl $target_file" ;
echo "Run command: $command </br>" ;
echo "</br></br>";
$output = shell_exec($command) ;
echo "<pre>$output</pre>" ;
echo "</br></br>" ;
echo '<a href="./">Return To Upload Page</a>' ;
?>
