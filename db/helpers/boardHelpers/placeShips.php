<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');

    $points = $_REQUEST['points']; //0 - row; 1 - col; 2 - len; 3 - shipID;
    $gameID = $_REQUEST['gameID'];
    $playerID = $_REQUEST['playerID'];

    
    foreach($points as $p){
        placeShips($p[0], $p[1], $p[3], $gameID, $playerID);
    }
    

?>