import 'package:flutter/material.dart';

//void main() => runApp(new MaterialApp(home: new Text("Its Sumit here")));        for simple toolbar text
void main() => runApp(new MyApp());

// Two type to inherit class stateless or stateful widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Sumit Maurya",


      home: new HomePage(),   // all work will be done in class Homepage
      theme: new ThemeData(
        primarySwatch: Colors.green,    // means primary color
        brightness: Brightness.light,     // set the color theme for toolbar color
        accentColor: Colors.red
      ),



    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  @override
 void initState(){
   super.initState();
   _animationController=new AnimationController(vsync: this,
   duration: new Duration(milliseconds: 5000));
   _animation=new CurvedAnimation(parent: _animationController, curve: Curves.ease);
   _animation.addListener(()=>this.setState((){}));
   _animationController.forward();


  }




  String myText= "Hello worldd";

  void _changeText() {
    setState(() {
if(myText.startsWith("H")){

  myText="Welcome to Bangaluru";
}else{


  myText="Hello worldd";

}

    });
  }


  Widget _BodyWidget(){
//    return new Container(
//      padding: const EdgeInsets.all(8.0),     // const means from all angle up right bottom top margin
//      child: new Center(
//        child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(myText,style: new TextStyle(fontSize: 22.0),),
//// Normal button
////            new RaisedButton(
////                child: new Text("CHange text",style: new TextStyle(color: Colors.white),),
////              onPressed: _changeText,
////              color: Colors.orange,
////
////            )
//
//          // Floating action button
////            new FloatingActionButton(onPressed: _changeText,           // here button will come in center
////              child: new Icon(Icons.add),)
//
//          ],
//        ),
//
//
//      ) ,
//
//    );

    // We will replace container with stack in case of background image and above it widgets are formed

    return new Stack(
      fit: StackFit.expand,

      children: <Widget>[

      new Image(image: new AssetImage('assets/images/f1.png'),
      fit: BoxFit.cover,       // chose how u want background image to show in app
        color: Colors.black,
        colorBlendMode: BlendMode.darken,

     ),

        new Column(mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[new FlutterLogo(size: _animation.value*100,)],
        )

    ],);



  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(                 // Scafold is a container for defining ui attributes of applications
     backgroundColor: Colors.lightBlue,
        appBar: new AppBar(
       title: new Text("Home Page Flutter "),

     ),
       body: _BodyWidget(),
      // Declaring floating button inside build method will position the button on standard right bottom corner.
      floatingActionButton: new FloatingActionButton(onPressed: _changeText,
      child: new Icon(Icons.add),)
      ,

    );
  }


}


