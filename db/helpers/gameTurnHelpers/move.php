<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');

    $gameID = $_REQUEST['gameID'];
    $playerID = $_REQUEST['playerID'];

    $row = $_REQUEST['row'];
    $col = $_REQUEST['col'];


    echo move($row, $col, $playerID, $gameID);
?>