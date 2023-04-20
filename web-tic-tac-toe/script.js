console.log("welcome to Tic Tac Toe")
let music = new Audio("music.mp3")
let turn_m = new Audio("ting.mp3")
let gameover = new Audio("gameover.mp3")

let turn = "X"
let isgameover = false;

const changeTurn = ()=>{
    return turn === "X"? "O":"X"
}

const checkwin = ()=>{
    let boxtext = document.getElementsByClassName('boxtext');
    let wins =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],
    ]
    wins.forEach(e =>{
        if((boxtext[e[0]].innerHTML === boxtext[e[1]].innerHTML) && (boxtext[e[2]].innerHTML === boxtext[e[1]].innerHTML) && (boxtext[e[0]].innerHTML !== "")){
            document.querySelector('.info').innerHTML = boxtext[e[0]].innerHTML + " won"
            isgameover = true
            document.querySelector('.imgbox').getElementsByTagName('img')[0].style.width = "200px";
        }
    })
}

let boxes = document.getElementsByClassName("box");
Array.from(boxes).forEach(element =>{
    let boxtext = element.querySelector('.boxtext');
    element.addEventListener('click',()=>{
        if(boxtext.innerHTML===''){
            boxtext.innerHTML = turn;
            turn = changeTurn();
            turn_m.play();
            checkwin();
            if (!isgameover) {
                document.getElementsByClassName("info")[0].innerHTML= "Turn for " + turn;
            }
        }
    })
})


reset.addEventListener('click', ()=>{
    let boxtexts = document.querySelectorAll('.boxtext');
    Array.from(boxtexts).forEach(element => {
        element.innerHTML = ""
    });
    turn = "X";
    isgameover = false
    // document.querySelector(".line").style.width = "0vw";
    document.getElementsByClassName("info")[0].innerHTML  = "Turn for " + turn;
    document.querySelector('.imgbox').getElementsByTagName('img')[0].style.width = "0px"
})
