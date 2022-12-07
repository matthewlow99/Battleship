<?php
    set_include_path($_SERVER['DOCUMENT_ROOT']);
    include('db/database_connect.php');
    
    $playerID = $_REQUEST['playerID'];
    $gameID = $_REQUEST['gameID'];
    $opponentPlayerID = $playerID == 1 ? 0 : 1;

    $ships = returnPlayerShips($playerID, $gameID);
    $moves = getMoves($gameID, $opponentPlayerID);
    // print_r($ships);
    $out = "";
    $letters = "ABCDEFGHIJ";

    for($i = 0; $i < 100; $i++){
        $row = intval($i / 10) + 1;
        $col = intval(($i % 10) + 1);
        $letter = $letters[$col - 1];

        $sq = "<span class='tile blueSquare' row='$row' col='$col'>$letter$row</span>";
        foreach($ships as $ship){
            if($ship[1] == ($row) && $ship[2] == ($col)){
                $sq = "<span class='tile blueSquare ship' row='$row' col='$col' ship='$ship[6]'>$letter$row</span>";
            }
        }
        foreach($moves as $move){
            if($move[2] == $row && $move[3] == $col){
                $class = "miss";
                if($move[5] == 'Hit'){
                    $class = 'hit';
                }
                else if($move[5] == 'Sink'){
                    $class = 'sink';
                }
                $sq = "<span class='tile blueSquare $class' row='$row' col='$col' state='$move[5]'>$letter$row</span>";
            }
        }
        $out.= $sq;
    }
    echo $out;

?>