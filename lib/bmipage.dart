import 'package:flutter/material.dart';
import 'package:health_cheacker/resultpage.dart';
import 'package:health_cheacker/theame.dart';



class BmiPage extends StatefulWidget {

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {


  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  ageIncrement(){
    setState(() {
     age++; 
    });
  }

  ageDecrement(){
    setState(() {
     age--; 
    });
  }

  weightIncrement(){
    setState(() {
     weight++; 
    });
  }

  weightDecrement(){
    setState(() {
     weight--; 
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Container(
        color:secondary,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Health_checker ",style: headlines,),
              elevation: 0,
              backgroundColor: Colors.transparent,
              
            ),

            Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Flexible(
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4twVkzgC41SgrGyqciLNnF2rmV8yaa68pSQ&usqp=CAU",
                      height: 150,

                      width: 150,),
                    ),
                       SizedBox(
                           height: 20.0,
                        ),
                       Text('Male',style: headlines)
                     ],
                      ),

                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[

                        Flexible(
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzaV0N4NmuPrXMew3lDEKHX8WnGuULf5jEFw&usqp=CAU",
                          height: 150,
                          fit: BoxFit.cover,
                          width: 150,),
                        ),
                        SizedBox(
                           height: 20.0,
                        ),
                        Text('FEMALE',style: headlines,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            Expanded(

                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                
                        Text('HEIGHT',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$height", style: boldNumber),
                        ),
                        Expanded(
                          child: Slider(
                            value: height.toDouble(),
                            min: minHeight,
                            max: maxHeight,
                            activeColor: Colors.orangeAccent,
                            inactiveColor: Colors.black,
                            onChanged: ( double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '$newValue.round()';
                            }
                    ),
                        )
                      ],
                    ),
                  ),
            ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Expanded(

                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:primary
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    
                        Text('WEIGHT',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$weight", style: boldNumber),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: weightDecrement,
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.red
                                ),
                                child: Center(
                                  child: Text("-", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            ),

                             Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue
                              ),
                              child: InkWell(
                                  onTap: weightIncrement,
                                  child: Center(
                                    child: Text("+", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    
                        Text('AGE',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$age",style: boldNumber),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: ageDecrement,
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.red
                                ),
                                child: Center(
                                  child: Text("-", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            ),

                             Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue
                              ),
                              child: InkWell(
                                  onTap: ageIncrement,
                                  child: Center(
                                    child: Text("+", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),

            
            
             Column(
               children: [
                 InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
                      child: Container(
                      color: Colors.red,
                      margin: EdgeInsets.only(top: 10.0),
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Center(
                        child: Text('CALCULATE Index', style: primaryButtonStyle),
                        ),
                   ),
                 ),

               ],
             ),
          

            ],
        ),
  
      
    );
  }
}
