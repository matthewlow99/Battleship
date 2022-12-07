<?php
    session_start();
    
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "battleship";
    
    $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
    if($conn->connect_error){
        die("Connection Failed" . $conn->connect_error);
    }

    $_SESSION['db'] = $conn;

    //Helper functions
    function loadGameID($gameID, $playerID){    
        $sql = "SELECT * FROM games WHERE gameID='$gameID'";
        $result = $_SESSION['db']->query($sql); 

        if($result->num_rows == 0){
            $sql = "INSERT INTO games (gameID) VALUES ('$gameID')";
            $result = $_SESSION['db']->query($sql);
        
            return '0';
        }
        else{
            $row = $result->fetch_assoc();
            return $row['player'.$playerID];
        }
    }

    function placeShips($row, $col, $shipID, $gameID, $playerID){
        $sql = "INSERT INTO ships (shipID, row, col, gameID, playerID, sunk) VALUES ('$shipID', '$row', '$col', '$gameID', '$playerID', '0')";
        $_SESSION['db']->query($sql); 


        $sql_player = 'player'.$playerID;
        $sql = "UPDATE games SET $sql_player='1' WHERE gameID='$gameID'";
        $_SESSION['db']->query($sql); 
    }
    function returnPlayerShips($playerID, $gameID){
        $sql = "SELECT * FROM ships WHERE playerID = '$playerID' AND gameID='$gameID'";
        $result = $_SESSION['db']->query($sql); 
        return $result->fetch_all();
    }
    function isGameReady($gameID){
        $sql = "SELECT * FROM games WHERE gameID='$gameID'";
        $result = $_SESSION['db']->query($sql); 
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            if($row['player1'] == 1 && $row['player0'] == 1){
                return true;
            }
        }
        return false;
    }
    function getCurrentTurn($gameID){
        $sql = "SELECT * FROM games WHERE gameID='$gameID'";
        $result = $_SESSION['db']->query($sql); 
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            $currentTurn = $row['currentTurn'];
            return $currentTurn;
        }
        return null;
    }
    function endTurn($gameID, $newTurn){
        $sql = "UPDATE games SET currentTurn='$newTurn' WHERE gameID='$gameID'";
        $_SESSION['db']->query($sql); 
    }
    function move($row, $col, $playerID, $gameID){
        $state = "";

        $opponentPlayerID = ($playerID == 1 ? 0 : 1);
        $sql = "SELECT * FROM ships WHERE gameID='$gameID' AND playerID='$opponentPlayerID' AND row='$row' AND col='$col'";
        $result = $_SESSION['db']->query($sql);
        
        if($result->num_rows != 0){
            $row_assoc = $result->fetch_assoc();
            $shipID = $row_assoc['shipID'];
            $state = "Hit";

            $sql = "UPDATE ships SET hit='1' WHERE shipID='$shipID' AND playerID='$opponentPlayerID' AND row='$row' AND col='$col' AND gameID='$gameID'";
            $_SESSION['db']->query($sql);

            $sql = "SELECT * FROM ships WHERE playerID='$opponentPlayerID' AND shipID='$shipID' AND hit='0' AND gameID='$gameID'";
            $result = $_SESSION['db']->query($sql);
            if($result->num_rows == 0){
                $sql = "UPDATE ships SET sunk=1 WHERE playerID='$opponentPlayerID' AND shipID='$shipID'";
                $_SESSION['db']->query($sql);
                $state = "Sink";
                shipSink($playerID, $gameID, $shipID);
            }
            updateMovesTable($row, $col, $playerID, $gameID, $state, $shipID);
        }
        else{
            $state = "Miss";
            updateMovesTable($row, $col, $playerID, $gameID, $state);
        }
    }
    function updateMovesTable($row, $col, $playerID, $gameID, $state, $shipID=null){
        $sql = "INSERT INTO moves (gameID, row, col, player, result) VALUES ('$gameID','$row', '$col', '$playerID', '$state')";

        if($state == 'Hit'){
            $sql = "INSERT INTO moves (gameID, row, col, player, result, shipID) VALUES ('$gameID','$row', '$col', '$playerID', '$state', '$shipID')";
        }

        $_SESSION['db']->query($sql);
    }
    function shipSink($playerID, $gameID, $shipID){
        $sql = "UPDATE moves SET result='Sink' WHERE player='$playerID' AND shipID='$shipID' AND gameID='$gameID'";
        $_SESSION['db']->query($sql);
    }
    function getMoves($gameID, $playerID){
        $sql = "SELECT * FROM moves WHERE gameID='$gameID' and player='$playerID'";
        $result = $_SESSION['db']->query($sql);
        $moves = $result->fetch_all();
        return $moves;
    }
?>