import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Widgetdart extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
       return new _Widgetdart();
    }
}

class _Widgetdart extends State<Widgetdart> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // To fix overflowing row problem => for adapting in different screen (very ingenius)
    double largeur = MediaQuery.of(context).size.width; // get largeur cntext

    return new Scaffold(
        appBar: AppBar(
             title:  Text(
                'More Widgets Flutter',
             ),
            backgroundColor: Colors.blueGrey,
        ),
        body: Container(  // for can define padding and margin container in the all page
            padding: EdgeInsets.all(12),  // padding all side
            child:  Center(   // center all body horizontally
                child: Column( // take care vertical page (same property like row)
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // position of children's elements
                      children: [
                          Text( // Widget Text
                            'le widget text est très important et ç a nous permet d\'écrire du contenu dans nos pages',
                            textAlign: TextAlign.center, // for define position text
                            style: TextStyle(
                                color: Colors.brown[500],  // color text (text choose degre color we want)
                                fontSize: 20.0, // define size text
                                fontStyle: FontStyle.italic, // define style text
                                letterSpacing: 1.5, // spacement letter
                                backgroundColor: Colors.white, // color background
                                decorationStyle: TextDecorationStyle.wavy,
                            ),
                            maxLines: 2, // define max line
                            overflow: TextOverflow.clip,
                          ),
                          Card(  // card
                              elevation: 5.0,
                              color: Colors.blueGrey,
                              child: Container (  // do container for define with and height of container
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 2,
                                  color: Colors.blue,
                                  // child: Image.network(   // do a image on card (so nice) => image from network
                                  //    'https://images.unsplash.com/photo-1622070888550-71c712e737bd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
                                  //    fit: BoxFit.cover, // for precise apparence element
                                  // ),
                                  child: Image.asset(   // do a image on card (so nice) => image from network
                                      'images/beautycrach.jpg',
                                      fit: BoxFit.fill, // for precise apparence element
                                  ),
                              ),
                          ),
                          Container(  // Use Row enter
                              height: largeur / 5 ,  //largeur is equal to width container define behove
                              color: Colors.grey[800],
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Row(  // Use Row
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    Container(
                                        height: MediaQuery.of(context).size.height /10,
                                        width: largeur / 8,  // get contain width divided it by number element(6). But we use a margin so divided it 8 it's normally work
                                        color: Colors.brown,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height /10,
                                      width: largeur / 8,
                                      color: Colors.yellow,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height /10,
                                      width: largeur / 8,
                                      color: Colors.redAccent,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height /10,
                                      width: largeur / 8,
                                      color: Colors.blue,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height /10,
                                      width: largeur / 8,
                                      color: Colors.pinkAccent,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height /10,
                                      width: largeur / 8,
                                      color: Colors.white,
                                    ),
                                ],
                              ),
                          ),
                          Container( // Icon down
                              height: largeur / 5 ,  //largeur is equal to width container define behove
                              color: Colors.grey[800],
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                       Icon(  // Icon
                                          Icons.thumb_up_alt_rounded,  // type icon
                                          size: largeur / 10 ,  // size icon
                                          color: Colors.white,  // color icon
                                       ),
                                  ],
                              ),
                          ),

// ------------------------------------------------- Button Flutter ----------------------------------------------------- //

                      // sites to visit for more information
                      //  https://www.kindacode.com/article/working-with-elevatedbutton-in-flutter/
                      //  https://flutteragency.com/create-buttons-with-different-styles-in-flutter/
                      // https://devstory.net/12865/flutter-tabbar
                      // https://codesinsider.com/flutter-elevatedbutton-example/

                          Container( // Icon down
                              height: largeur / 6 ,  //largeur is equal to width container define behove
                              color: Colors.white,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                      TextButton( // replace flatButton
                                          child: Text(
                                              'TextButton',
                                              style: TextStyle(
                                                  color: Colors.white,
                                              ),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                              overlayColor: MaterialStateProperty.all<Color>(Colors.white)
                                          ),
                                      ),
                                      ElevatedButton( // replace RaisedButton
                                          child: Text(
                                              'ElevatedButton',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                fontSize: 18.0
                                              ),
                                          ),

                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.red),          // background button
                                              padding: MaterialStateProperty.all(EdgeInsets.all(5)),           // padding padding
                                              elevation: MaterialStateProperty.all<double>(10),                // elevation button
                                              minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),     // size width and height
                                              shadowColor: MaterialStateProperty.all<Color>(Colors.redAccent), // color shadow
                                              // shape: MaterialStateProperty.all<CircleBorder>(               // for doing circle button
                                              //     CircleBorder()
                                              // ),
                                              textStyle: MaterialStateProperty.all(
                                                  TextStyle(
                                                      fontSize: 15,
                                                      fontStyle: FontStyle.italic,
                                                      fontFamily: "alex",
                                                  ),
                                              )   // font size for button
                                          ),
                                     ),
                                  ],
                              ),
                          ),
                          Container( // Icon down
                              height: largeur / 6 ,  //largeur is equal to width container define behove
                              color: Colors.white,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                      OutlinedButton(
                                          onPressed: null,
                                          child: Text(
                                              'Text button'
                                          ),
                                      ),
                                      ElevatedButton.icon(
                                          onPressed: () {},
                                          label: Text('ElevationButtonIcon'),
                                          icon: Icon(Icons.add),
                                      )
                                  ],
                              ),
                          ),
                    ],
                ),
            ),
        ),

    );
  }

}