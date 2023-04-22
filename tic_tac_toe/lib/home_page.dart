import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Player Name",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                    controller: player1Controller,
                    style: const TextStyle(color: Colors.white),
                    decoration:const  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white10,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.red,
                        )),
                        hintText: "Player1 Name",
                        hintStyle: TextStyle(color: Colors.white),

                        ),
                        validator: (value) {
                          if (value ==null ||value.isEmpty) {
                            return"Please enter player 1 name";

                            
                          }
                          return null;
                        },)
                        ,),
                         SizedBox(height: 5),
            Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                    controller: player2Controller,
                    style: TextStyle(color: Colors.white),
                    decoration:  const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.red,
                        )),
                        hintText: "Player2 Name",
                        hintStyle: TextStyle(color: Colors.white),

                        ),
                        validator: (value) {
                          if (value ==null ||value.isEmpty) {
                            return"Please enter player 2 name";

                            
                          }
                          return null;
                        },)
                        ,),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(context, MaterialPageRoute
                              (builder: (context)=>GameScreen(

                              Player1:player1Controller.text,
                              Player2:player2Controller.text,),
                              ));

                              
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            padding:const  EdgeInsetsDirectional.symmetric(vertical: 17,horizontal:20 ),
                            child: const Text("Start Game",style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,

                            ),),
                          ),
                        )
          ],
        ),
      ),
    );
  }
}
