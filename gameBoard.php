
<?php
    
        if(!isset($_REQUEST['player']) || !isset($_REQUEST['gameID'])){
            header('Location: index.php');
        }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel='stylesheet' href='css/board.css'>

    <title>Document</title>
</head>
<body>
    <h1>BATTLESHIP</h1>
    <?php
        echo "<div id='gameHeader'>";
            $gameID = $_REQUEST['gameID'];
            echo "<h4 id='gameID' gameID='$gameID'>Game ID: $gameID</h4>";
            echo "<h4 id='currentTurn' style='text-decoration: underline;'></h4>";
            echo "<h4 id='showPlayerID'></h4>";
        echo "</div>";
    ?>
    <div class='boardContainer'>
        <div class='grid' id='enemyBoard'>
            <?php
                for($i = 0; $i < 100; $i++){
                    $row = intval($i / 10) + 1;
                    $col = ($i % 10) + 1;
                    echo "<span class='tile redSquare' row='$row' col='$col'></span>";
                }
            ?>
        </div>
        <?php 
            $playerID = $_REQUEST['player'];
            $gameID = $_REQUEST['gameID'];
            $_SESSION['player'] = $playerID;
            $_SESSION['gameID'] = $gameID;
            echo "<div class='grid' id='playerBoard' playerID='$playerID' gameID='$gameID'>
            
            </div>";
        ?>
    </div>
    <div class='shipList' id='shipList'>
        
    </div>
    <a id='homeButton'>Return to Home</a>
</body>

<script src='scripts/shipPlacement.js' type='module'></script>
<script src='scripts/turnHandler.js' type='module'></script>


</html>