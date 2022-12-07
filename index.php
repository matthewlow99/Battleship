<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel='stylesheet' href='css/home.css'>
    </head>
    <body>
        <h1>Battleship</h1>
        <div>
            <form action="gameBoard.php" method="post">
                <input type='number' placeholder="Game ID" name='gameID' value='1'> <br>
                <label>Select Player</label><br>

                <select name='player'>
                    <option value='0'>Player 1</option>
                    <option value='1'>Player 2</option>
                </select>
                
                <input type='submit' value='Play' name="submit">

            </form>
        </div>
        
    </body>
</html>