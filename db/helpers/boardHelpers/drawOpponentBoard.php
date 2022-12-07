<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');
    
    $playerID = $_REQUEST['playerID'];
    $gameID = $_REQUEST['gameID'];
    $moves = getMoves($gameID, $playerID);
    
    $out = "";

    for($i = 0; $i < 100; $i++){
        $row = intval($i / 10) + 1;
        $col = intval(($i % 10) + 1);
        

        $sq = "<span class='tile redSquare' row='$row' col='$col' valid='true'></span>";
        foreach($moves as $move){
            if($move[2] == ($row) && $move[3] == ($col)){
                $sq = "<span class='tile redSquare' row='$row' col='$col' state='$move[5]' valid='false'></span>";
            }
        }
        $out.= $sq;
    }
    echo $out;

?>