<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');

    
    $gameID = $_REQUEST['gameID'];
    $playerID = $_REQUEST['playerID'];

    $out = "";
    if(loadGameID($gameID, $playerID) == 0){
        $out.= "<h1>Place your Ships</h1>
                <ul>
                    <li len='2' id='ship1' class='shipSelector' placed='false'>Length 2</li>
                    <li len='3' id='ship2' class='shipSelector' placed='false'>Length 3</li>
                    <li len='3' id='ship3' class='shipSelector' placed='false'>Length 3</li>
                    <li len='5' id='ship4' class='shipSelector' placed='false'>Length 5</li>
                    <li len='6' id='ship5' class='shipSelector' placed='false'>Length 6</li>
                    <button id='submitShips'>Submit Ships</button>
                </ul>";
    }
    echo $out;

?>