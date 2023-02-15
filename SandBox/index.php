<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="uploadedFileInput">
            Wybierz plik do wgrania na serwer:
        </label><br>
        <input type="file" name="uploadedFile" id="uploadedFileInput" required><br>
        <input type="submit" value="Wyślij plik" name="submit"><br>
    </form>

    <?php

    if(isset($_POST['submit'])) 
    {
        $targetDir = "img/";
        $fileName = $_FILES['uploadedFile']['name'];
        $tempFileUrl = $_FILES['uploadedFile']['tmp_name'];
        $imageInfo = @getimagesize($tempFileUrl);
        $sourceFileName = $_FILES['uploadedFile']['name'];
        $fileNameHash = hash("sha256", $sourceFileName) . hrtime(true)
        . ".webp";
        $newFileName = $fileNameHash;
    
        if(!is_array($imageInfo)){
            die("Nieprawidłowy format obrazu");
    }

        $imgString = file_get_contents($tempFileUrl);
        $gdImage = imagecreatefromstring($imgString);
     
        $targetExtension = pathinfo($fileName, PATHINFO_EXTENSION);
        $targetExtension = strtolower($targetExtension);
        $targetFileName = $fileName . hrtime(true);
        $targetFileName = hash("sha256", $targetFileName);


        $targetUrl = $targetDir . $fileName . "." . $targetExtension;
        if(file_exists($targetUrl))
            die("Plik o tej samej nazwie już istnieje!");
        $targetUrl = $targetDir . $targetFileName . ".webp";
        imagewebp($gdImage, $targetUrl);
        $db = new mysqli('localhost', 'root','', 'cms');
        $dbTimestamp = date('Y-m-d H:i:s');
        $q = "INSERT INTO post VALUES (NULL, ?, ?)";
        $query = $db->prepare($q);
        $filename = $targetFileName . ".webp";
        $query->bind_param('ss', $dbTimestamp, $filename);
        $result = $query->execute();
        if(!$result) {  
            die("Nie powiodło się!");
        } 
        echo "Plik został poprawnie załadowany";
    }
    ?>
</body>
</html>