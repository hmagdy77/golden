<?php
include '../connect.php';
$title    =  filterRequest('title');            //1
$header   =  filterRequest('header');           //2
$content  =  filterRequest('content');          //3
$kind     =  filterRequest('kind');             //4
$start    =  filterRequest('start');            //5
$end      =  filterRequest('end');              //6
$image    =  imageUpload("image", "saved/");    //7
if($image !='fail'){
    $stmt = $con->prepare("INSERT INTO posts(`title`, `header`, `content`, `kind`, `start`, `end`,`image`)VALUES (?,?,?,?,?,?,?)");
    $stmt->execute(array($title, $header, $content, $kind, $start, $end, $image));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
    //sendGCM($title, $header, 'posts', '', '');
}else{
    echo json_encode(array('status' => 'fail'));
}
}else{
    echo json_encode(array('status' => $msgError));
}
?>