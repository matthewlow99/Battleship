export {drawPlayerBoard};

var len = 0;
var xdir = 1;
var ydir = 0;
var shipID = "";
var points = [];

drawPlayerBoard();
setInterval(() => drawPlayerBoard(), 2000);





function generateShipList(){
    var gameID = $('#gameID').attr('gameID');
    var playerID = $('#playerBoard').attr('playerid');
    $.ajax({
        type:'GET',
        url:'db/helpers/boardHelpers/loadShipList.php',
        data:{
            gameID: gameID,
            playerID: playerID
        },
        success: function(res){
            console.log(res);
            if(res == ""){
                $("#shipList").css('display', 'none');
            }
            else{
                $("#shipList").html(res);

                var shipSelections = Array.from(document.querySelectorAll('.shipSelector'));
                shipSelections.forEach(e => {
                    e.addEventListener('click', function(){
                        len = (e.getAttribute('len'));
                        shipID = e.id;
                        $('.menuSelect').removeClass('menuSelect');
                        $(`#${shipID}`).addClass('menuSelect');
                    })
                });

                $("#submitShips").on('click', function(){
                    if(points.length == 19){
                        $.ajax({
                            type:'GET',
                            url:'db/helpers/boardHelpers/placeShips.php',
                            data:{
                                gameID: gameID,
                                playerID: playerID,
                                points: points
                            },
                            success: function(res){
                                $("#shipList").css('display', 'none');
                                points = [];
                                drawPlayerBoard();
                            }
                        })
                    }
                })
            }
        }
    })
} generateShipList();

function addShip(){

    if($('.select').length == len){
        Array.from(document.querySelectorAll('.select')).forEach(e => {
            var r = e.getAttribute('row');
            var c = e.getAttribute('col');

            points.push([Number(r), Number(c), len, shipID]);
            $(`#${shipID}`).remove();
        })
        shipID = "";
        len = 0;

    }    
}

function drawPlayerBoard(){
    var gameID = $('#gameID').attr('gameID');
    var playerID = $('#playerBoard').attr('playerid');
    $.ajax({
        type:"GET",
        url: "db/helpers/boardHelpers/drawPlayerBoard.php",
        data:{
            gameID: gameID,
            playerID: playerID
        },  
        success: function(res){
            $('#playerBoard').html(res);

            Array.from(document.querySelectorAll('.blueSquare')).forEach(e => {
                var r = Number(e.getAttribute('row'));
                var c = Number(e.getAttribute('col'));
                e.addEventListener('mouseenter', function(){
                    drawShipOnHover(r, c);
                    validateShipPlacement(r, c);
                })
                e.addEventListener('mouseleave', function(){
                    drawPlayerBoard();
                })
                e.addEventListener('click', function(){
                    console.log($(".select").length);
                    if(shipID != "" && ($(".invalidSelect").length == 0)){
                        $(`.select`).css('background-color', 'pink');
                        addShip();
                    }
                })
            });
            

            points.forEach(p => {
                $(`.blueSquare[row='${p[0]}'][col='${p[1]}']`).css('background-color', 'cyan');
            })
        }
    })
}
function selectSquareAtLocation(row, col){
    // let sq = document.querySelectorAll(`.blueSquare[row='${row}'][col='${col}']`);
    let sq = $(`.blueSquare[row='${row}'][col='${col}']`);
    return sq;
}
function drawShipOnHover(r, c){
    for(let i = 0; i < len; i++){
        let row = Number(r) - (i * ydir);
        let col = Number(c) + (i * xdir);
        
        $(`.blueSquare[row='${row}'][col='${col}']`).addClass('select');
    }
}
function toggleRotate(){
    var c = 0;
    $('body').on('keypress', function(e){
        c++;
        if(e.key == 'r'){

            setXY(c%4);
            drawPlayerBoard();
        }
    })
} toggleRotate();

function validateShipPlacement(r, c){
    for(i = 0; i < len; i++){
        let row = Number(r) - (i * ydir);
        let col = Number(c) + (i * xdir);
        
        
        points.forEach(p => {
            if(p[0] == row && p[1] == col){
                $('.select').addClass('invalidSelect');
                $('.select').removeClass('select');
                return false;
            }
        })

        if(row > 10 || row < 1 || col > 10 || col < 1){
            $('.select').addClass('invalidSelect');
            $('.select').removeClass('select');
            return false;
        }
        
    }
    return true;

}

function setXY(i){
    switch(i){
        case 0:
            xdir = 1;
            ydir = 0;
            break;
        case 1:
            xdir = 0;
            ydir = -1;
            break;
        case 2:
            xdir = -1;
            ydir = 0;
            break;
        case 3: 
            xdir = 0;
            ydir = 1;
            break;
        default:
            break;
    }
}

$("#homeButton").on('click', function(){
    location.href = './index.php'; 
})

    


