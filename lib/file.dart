import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int  index=0;
  static TextStyle optstyle=TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> lst=[Text("Client  is waiting for you",
    style: optstyle,),
    Text("Immediator work to solve",
      style: optstyle,),
    Text(" मˈकैनिक् ‌is Ready to Go",style: optstyle,),
    Text("Seek Help",style: optstyle,)];
  void ontpp(int optinidex){
    setState((){ index=optinidex;});
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Puncture"),),
      body: Center(
        child: lst.elementAt(index),

      ),
      bottomNavigationBar: BottomNavigationBar(onTap: ontpp,


        unselectedItemColor: Colors.black45,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        enableFeedback: true,

        items: [BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home),


            label: 'Home',
            tooltip: 'Press'


        ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.search),
              label: 'Search'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user),
              label: 'User'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cartPlus),
              label: 'Sevices'),
        ],
        currentIndex: index,
        selectedItemColor: Colors.redAccent,
        backgroundColor: Colors.brown,),

    );
  }
}
