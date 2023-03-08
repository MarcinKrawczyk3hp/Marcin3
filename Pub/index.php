<?php

require_once('./../src/config.php');

use Steampixel\Route;

Route::add('', function() {
    global $twig;
    $PostArray = Post::getPage();
    $twigData = array("PostArray" => $PostArray,
                "pageTitle" => "wgraj mema");
    $twig->display("index.html.twig", $twigData);
 
});
Route::add('/upload', function() {
    global $twig;
    $twig->display("upload.html.twig");
});


Route::add('/upload', function() {
    global $twig;
    if(isset($_POST['submit']))  {
        Post::upload($_FILES['uploadedFile']['tmp_name']);
    }
    header("Location: localhost/Marcin3/Pub");
}, 'post');

Route::run('/Marcin3/Pub');
//echo "test";
?>