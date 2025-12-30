import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home : MainPage()
  ));
}


class MainPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [

          Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            color: Colors.blueAccent,
            
          child: Center(
            child: MaterialButton(
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage() ));

              },
              child: Text("START"),
              color:Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
            ),
          ),
            


          ),

          Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            color: Colors.redAccent,

             child: Center(
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> GamePage()));

              },
              child: Text("START"),
              color:Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
            ),
          ),
            

          ),
        ],
      ),
      

    );
  }
}

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

int playerAscore=0;
int playerBscore=0;



double bluecardheight=0;
double redcardheigth=0;

bool initialized=false;
  @override
  Widget build(BuildContext context) {

if (initialized==false){
  bluecardheight=MediaQuery.of(context).size.height/2;
  redcardheigth=MediaQuery.of(context).size.height/2;

  initialized=true;
}

    return Scaffold(

      body: Column(
        children: [
          MaterialButton(
            onPressed: (){
              

             setState(() {
                bluecardheight=bluecardheight+20;
                redcardheigth=redcardheigth-20;

                playerBscore=playerBscore+5;
             });

             double winningheight=MediaQuery.of(context).size.height-60;

             

             if(bluecardheight>winningheight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(playerBscore,"B")));
              
             }

            },
            padding: EdgeInsets.zero,
            child: Container(
              height: bluecardheight,
              width: double.infinity,
              color: Colors.blueAccent,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
            
              child: Row(
                children: [
                  
                  Expanded(child: Text("Player B",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  Text(playerBscore.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

           MaterialButton(

            onPressed: (){

             setState(() {
                redcardheigth=redcardheigth+20;
              bluecardheight=bluecardheight-20;
              playerAscore=playerAscore+5;

             });

             double screenheight=MediaQuery.of(context).size.height;
             double winningheight=MediaQuery.of(context).size.height-60;
             if(redcardheigth>winningheight){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(playerAscore,"A")));
             }
             

            },
            padding: EdgeInsets.zero,
             child: Container(
              height: redcardheigth,
              width: double.infinity,
              color: Colors.redAccent,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
             
             child: Row(
                children: [
                  
                  Expanded(child: Text("Player A",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  
                  Text(playerAscore.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
                       
             
                       ),
           )



        ],
      ),

      

    );

  }
}

class ResultScreen extends StatelessWidget{

  int score=0;
  String player="";

  ResultScreen(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player =="A" ? Colors.redAccent:Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            Text( player =="A" ? "PLAYER A WON !!" : "PLAYER B WON !!" ,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
            MaterialButton(onPressed: (){

             Navigator.pop(context);
             Navigator.pop(context);
        
        
            },
            color: Colors.white,
            child: Text("Restart Game"),
            )
          ],
        ),
      ),


    );
  }
}