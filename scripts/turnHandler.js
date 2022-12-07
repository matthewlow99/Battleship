import { drawPlayerBoard } from "./shipPlacement.js";

var gameID = $('#gameID').attr('gameID');
var playerID = $('#playerBoard').attr('playerid');
var opponentPlayerID = $('#playerBoard').attr('playerid') == 1 ? 0 : 1;

$("#showPlayerID").html("Player " + (Number(playerID)+1));


var ready = false;
function readyCheck(){
    if(ready == false){
        $.ajax({
            type:"POST",
            url:"db/helpers/gameTurnHelpers/readyCheck.php",
            data: {
                gameID: gameID
            },
            success: function(res){
                if(res == true){
                    $('body').css('background-color', 'grey');
                    ready = true;
                    turnChecker(gameID);
                    setInterval(() => {
                        
                        turnChecker(gameID);
                        drawPlayerBoard();
                    }, 3000);
                }
                else{
                    setTimeout(() => {
                        readyCheck();
                    }, 2000);
                }
            }
        })
    }
} readyCheck();

var currentTurn = 0;
function turnChecker(gameID){
    
        $.ajax({
            type:"POST",
            url:"db/helpers/gameTurnHelpers/getCurrentTurn.php",
            data: {
                gameID: gameID
            },
            success: function(res){
                currentTurn = res;
                if(currentTurn == playerID)
                            $("#currentTurn").html("It's your move");
                else
                    $("#currentTurn").html("It's your opponent's move");
            }
        })
}
function endTurn(){
    if(currentTurn == playerID){
        $.ajax({
            type:"POST",
            url:"db/helpers/gameTurnHelpers/endTurn.php",
            data: {
                gameID: gameID,
                newTurn: opponentPlayerID
            },
            success: function(res){
                currentTurn = opponentPlayerID;
            }
        })
    }
}

$('body').on('keypress', function(e){
    if(e.key == 'u'){
        endTurn();
    }
})

function drawMoveBoard(){
    var gameID = $('#gameID').attr('gameID');
    var playerID = $('#playerBoard').attr('playerid');

    $.ajax({
        type: "POST",
        url: "db/helpers/boardHelpers/drawOpponentBoard.php",
        data: {
            gameID: gameID,
            playerID: playerID
        },
        success: function(res){
            $('#enemyBoard').html(res);
            $(`[state=Hit]`).addClass('hit');
            $(`[state=Sink]`).addClass('sink');
            $(`[state=Miss]`).addClass('miss');
            attackMove();
        }
    })
} drawMoveBoard();

function attackMove(){
    $('[valid=true]').on('mouseenter', function(e){
        if(currentTurn == playerID && ready == true)
            $(this).addClass('redHover');
    })
    $('[valid=true]').on('mouseleave', function(){
        $(this).removeClass('redHover')
    })
    $('[valid=true]').on('click', function(){
        if(currentTurn == playerID && ready == true){
            var row = $(this).attr('row');
            var col = $(this).attr('col');
            $.ajax({
                type:"POST",
                url:"db/helpers/gameTurnHelpers/move.php",
                data: {
                    gameID: gameID,
                    playerID: playerID,
                    row: row,
                    col: col
                },
                success: function(res){
                    console.log(res);
                    drawMoveBoard();
                    endTurn();
                }
            })
        }
    })
}
    


