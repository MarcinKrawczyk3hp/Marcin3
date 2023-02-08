<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
    <label for="uploadFile" id="uploadFileInput">
        Wybierz Plik do wgrania na serwer:<br>
    </label><br>
        <input type="file" name="uploadedFile" id="uploadedFileInput"><br>
        <input type="submit" value="Wyślij Plik" name="submit"><br>
    </form>

<?php
//Sprawdź czy został wysłany formularz
if(isset($_POST['submit']))
{
    //echo "<pre>";
    //var_dump($_FILES);
    $targetDir = "img/";
    $sourceFileName = $_FILES['uploadedFile']['name'];
    $tempURL = $_FILES['uploadedFile']['tmp_name'];
    $targetURL = $targetDir . $sourceFileName;
    move_uploaded_file($tempURL, $targetURL);
}
?>
</body>
</html>