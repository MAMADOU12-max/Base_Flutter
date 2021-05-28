import 'package:flutter/material.dart';
import 'basics_widget/widget.dart';

// first way to run general root app
// void main () => (runApp(new App());
// second way
void main () {
    // for running this widget app
     runApp(new MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return new  MaterialApp(
              title: 'Base Flutter\'s widgets ',
              theme: ThemeData(
                 primarySwatch: Colors.blueGrey,  // define theme application
              ),
              home: Home(), // for call scalford (widget for default route)
             debugShowCheckedModeBanner: false, // remove a banner
        );
    }
}

// statefull: if we are going to manage our state
class Home extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        // TODO: implement createState
        return new _Home();
    }
}

// _ => for reference that it is the class for state
class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return new Scaffold(
        backgroundColor: Colors.white30, // define background scaffold

   // ------------------------------------------------- - Appbar - ----------------------------------------------------------- //

        appBar: AppBar(  // App bar page home application
           title: Text(
              'Creative Dual',
               style: TextStyle(  // for styled text on the navbar
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 22.3
               ),
           ),
           backgroundColor: Colors.blueGrey,  // background Appbar
           centerTitle: true, // for center title
           // elevation: 12.0, // elevate Appbar
           shadowColor: Colors.red, // define color box shadow appbar
           leading: Icon(      //leading => element on position appbar's right
              Icons.account_circle_outlined,
           ),
           actions: [        // elements on position appbar's left
             Icon(  // for icon
                 Icons.check,
                 color: Colors.green, // color icon
                 size: 28.0,  // size icon
             ),
             IconButton(  // icon button cliquable
                 icon: Icon(
                   Icons.directions,
                   // color: Colors.redAccent,
                 ),
                onPressed: () => { // function called after click
                    // navigate on another page
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                        return new Widgetdart();
                    }))
                  // print('button icon clicqued');
                },
                hoverColor: Colors.blue,
                focusColor: Colors.yellow,
                highlightColor: Colors.brown, // color over after click
                splashColor: Colors.red, // color over after click min arround
                disabledColor: Colors.yellow,
                tooltip: 'icon button', // description of button, it's not visible
             ),
           ],
        ),

        body: Container(  // body application
             // color: Colors.white,  // for define background color body
             // height: 80.0,  width: 34.0 // bad way to define height or width => that's not adapt on different screen
             height: MediaQuery.of(context).size.height ,  // height body (best way)
             // width: MediaQuery.of(context).size.width / 1.5,
             // margin: EdgeInsets.all(12.3), // margin all side
             // margin: EdgeInsets.only(left: 12.0, right: 2, top: 12), // custom margin
             // padding: EdgeInsets.all(12.3), // margin all side
             // padding: EdgeInsets.only(left: 12.0, right: 2, top: 12), // custom margin
             // alignment: Alignment.centerLeft,  // define righly position of element
              decoration: new BoxDecoration(  // for decorate contain container
                  color: Colors.white,
                  gradient: new LinearGradient(    // grandient color (s beautiful)
                     // site for more about gradient => https://medium.com/jlouage/flutter-boxdecoration-cheat-sheet-72cedaa1ba20
                      colors: [Colors.red, Colors.cyan],   // two color gradient
                      begin: Alignment.centerRight,  // repartition color gradient
                      end: Alignment.centerLeft,
                      // end: new Alignment(-1.0, -1.0),
                      tileMode: TileMode.clamp
                  ),
              ),
              // child: new FlutterLogo(   // lofo flutter like child
              //    size: MediaQuery.of(context).size.width, // width max container size
              // ),

             child: Center(  // center element that's contain
                  // child: Container(
                  //     width: 50.0,
                  //     height: 52.0,
                  //     color: Colors.redAccent
                  // ),

                  child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(  // define a box
                          height: 250,
                          width: 250,
                          child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                       image: AssetImage(  // image from local application
                                           'images/beautycrach.jpg'
                                       ),
                                      // image: NetworkImage(  // image from network
                                      //     // 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png'
                                      //   'https://images.unsplash.com/photo-1622070888550-71c712e737bd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
                                      // ),
                                      fit: BoxFit.fill, // custom appearence image
                                  ),
                                  border: Border.all(
                                      // color: const Color(0xFF000000), // define color also
                                      color: Colors.white54,  // color
                                      width: 5.0,  // width of border
                                      style: BorderStyle.solid  //style border
                                  ), //Border.all
                                  /*** The BorderRadius widget  is here ***/
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(125), // define value radius
                                  ),
                              ),
                          ),
                      ),
                  ),
             ),
        ),
       floatingActionButton: FloatingActionButton(
           backgroundColor: Colors.red, // background color button
           splashColor: Colors.white,
           hoverColor: Colors.grey,
           onPressed: () => {
               Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                    return new Widgetdart();
               }))
           },
            elevation: 8.0,
            child: new Icon(
               Icons.add_circle_outline_outlined,
              size: 22.9,
            ),
            tooltip: 'Go next page',
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // for position the floatingActionButton
   );

  }

}

