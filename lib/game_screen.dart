import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';

class GameScreen extends StatefulWidget {
  String Player1;
  String Player2;
  GameScreen({required this.Player1, required this.Player2});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late String _winner;
  late bool _gameover;
  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentPlayer = "X";
    _winner = "";
    _gameover = false;
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => " "));
      _currentPlayer = "X";
      _winner = "";
      _gameover = false;
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != ""|| _gameover) {
      return;
    }
    setState(() {
      _board[row][col] = _currentPlayer;
      if (_board[row][0] == _currentPlayer &&
          _board[row][1] == _currentPlayer &&
          _board[row][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameover = true;
      } else if (_board[0][col] == _currentPlayer &&
          _board[1][col] == _currentPlayer &&
          _board[2][col] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameover = true;
      } else if (_board[0][0] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameover = true;
      } else if (_board[0][2] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][0] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameover = true;
      }
      _currentPlayer = _currentPlayer == "X" ? "O" : "X";
      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameover = true;
        _winner = "It's a Tie";
      }
      if (_winner != "") {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            btnOkText: "Play again",
            title: _winner == "X"
                ? widget.Player1 + "Won!"
                : _winner == "O"
                    ? widget.Player2 + "Won!"
                    : "It's a Tie",
            btnOkOnPress: () {
              _resetGame();
            }
            )..show();
            
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 120,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Turn:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _currentPlayer == "X"
                          ? widget.Player1 + "($_currentPlayer)"
                          : widget.Player2 + "($_currentPlayer)",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _currentPlayer == "X"
                            ? Color(0xFFE25041)
                            : Color(0xff1CBD9E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF5F6884),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(5),
            child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () =>_makeMove(row, col),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1E3A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          _board[row][col],
                          style: TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: _board[row][col] == "X"
                                ? Color(0xFFFE25041)
                                : Color(0xFF1CBD9E),
                          ),
                        ),
                      ),
                    ),
                  
                  );
                }),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: _resetGame,

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),

                  child: Text("RESET GAME",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    
                  ),),
                ),
              ),
              Spacer(flex: 100,),
              InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute
                              (builder: (context)=>HomeScreen(),
                              ));
                              widget.Player1 ="";
                              widget.Player2 ="";

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),

                  child: Text("RESTART GAME",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    
                  ),),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
