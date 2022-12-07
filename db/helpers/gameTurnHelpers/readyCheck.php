<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');

    $gameID = $_REQUEST['gameID'];

    echo isGameReady($gameID);
?>