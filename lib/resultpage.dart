import 'package:flutter/material.dart';
import 'package:health_cheacker/theame.dart';


import 'hextoint.dart';
import 'info.dart';



class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({required this.height,required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
    
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(this.height,this.weight),
    );
  }
}


class Result extends StatefulWidget {

 final int height;
 final int weight;

  Result(this.height,this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[

        Expanded(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width *0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text('Y o u r B M I',style: TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.w400,fontSize: 15.0,letterSpacing: 1.1,decoration:TextDecoration.none,))),
               Text(headline,style:TextStyle(letterSpacing: 2.0,fontSize: 15, color: HexColor("d3d3d3"),decoration:TextDecoration.none)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${bmiResult(this.widget.height, this.widget.weight)}', style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold,fontSize: 80.0,letterSpacing: 0.1,decoration:TextDecoration.none)),
                ),
                Column(
                  children: <Widget>[
                    Text('Normal BMI range:',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 30.0,letterSpacing: 0.1,decoration:TextDecoration.none),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40.0,letterSpacing: 0.1,decoration:TextDecoration.none),),
                ),
                  ],
                ),
                

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Expanded(child: Text('$comment', style: TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold,fontSize: 20.0,letterSpacing: 0.1,decoration:TextDecoration.none),)),
                )
              ],
            ),
          ),        
        ),

        InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(decoration: BoxDecoration(color: Colors.cyan),
              //|  color: primaryButtonColor,
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.08,
                child: Center(
                  child: Text('RECALCULATE AND TAKE SUGGESTION', style: TextStyle( fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 1,wordSpacing: 2, color: secondaryButtonColor,decoration:TextDecoration.none),),
                  ),
             ),
           ),InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())),
          child: Container(
            color:Colors.deepPurpleAccent,
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.08,
            child: Center(
              child: Text('Suggestion', style: primaryButtonStyle),
            ),
          ),
        ),


      ],
    );
  }
}
var comment = '';
var headline = '';
bmiResult(h,w){
  
  
  double bmi = (w/(h*h))*10000;

  if(bmi<18.5){
    
    comment = "You are under Weight";
    headline = "UNDERWEIGHT TAKE SUGGGESTION";
  }else if(bmi >= 18.5 && bmi <25){
    comment = "You are at a healthy weight.";
    headline = "NORMAL";
  }else if(bmi > 25 && bmi <= 29.99){
    comment = "You are at overweight.";
    headline = "OVERWEIGHT GO GYM";
  }else{
    comment = "You are obese.";
    headline = "OBESE TAKE SUGGESTION";
  }

  return bmi.round();
}
