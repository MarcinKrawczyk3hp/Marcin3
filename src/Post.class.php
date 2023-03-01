<?php
class Post {
    private int $id;
    private string $FileName;
    private string $TimeStamp;

    function __construct(int $i, string $f, string $t) {
        $this->id = $i;
        $this->FileName = $f;
        $this->TimeStamp = $t;
    }

    static function getLast() : Post {
        global $db;
        $query = $db->prepare("SELECT * FROM post ORDER BY TimeStamp DESC LIMIT 1");
        $query->execute();
        $result = $query->get_result();
        $row = $result->fetch_assoc();
        $p = new Post($row['id'], $row['FileName'], $row['TimeStamp']);
        return $p; 
    }

    static function upload(string $tempFileName) {
        $targetDir = "img/";
        $imgInfo = getimagesize($tempFileName);
        if(!is_array($imgInfo)) {
            die("BŁĄD: Przekazany plik nie jest obrazem!");
        }
        $randomNumber = rand(10000, 99999) . hrtime(true);
        $hash = hash("sha256", $randomNumber);
        $newFileName = $targetDir . $hash . ".webp";
        if(file_exists($newFileName)) {
            die("BŁĄD: Podany plik już istnieje!");
        }
        $imageString = file_get_contents($tempFileName);
        $gdImage = @imagecreatefromstring($imageString);
        imagewebp($gdImage, $newFileName);

        global $db;
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)");
        $dbTimeStamp = date("Y-m-d H:i:s");
        $query->bind_param("ss", $dbTimeStamp, $newFileName);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");

    }
}

?>