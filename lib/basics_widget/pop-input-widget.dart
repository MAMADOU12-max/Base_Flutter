import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutterbase/basics_widget/interractif-widgets.dart';

class PopInputWidget extends StatefulWidget {
   @override
   State<StatefulWidget> createState() {
       return new _PopInputWidget();
   }
}

// ctrl + alt + l => for locked my desktop

class _PopInputWidget extends State<PopInputWidget> {

    @override

    //  --------- More Ingenus to do theses functions on the page statelesswidget and call him every want needed -------//

    // function snackbar => always recommended
    void callSnackbar () {   // it's banner display in the screen
          SnackBar snackBar = new SnackBar(
               content: new Text(
                    'This is my snackar, so cool no ',
                    style: TextStyle(
                         fontSize: 17.0,
                         fontStyle: FontStyle.italic,
                         color: Colors.black
                    ),
                    textAlign: TextAlign.center,     // center this text
               ),
               duration: new Duration(seconds: 5),   // define duration appear snackbar
               backgroundColor: Colors.greenAccent,  // define background
               elevation: 12.3,                      // do elevation
               padding: EdgeInsets.only(left: 12),   // define padding
               behavior: SnackBarBehavior.floating,  // define type appearence snackbar  => default (fixed)
               // width: 123.0,                      // define width snackbar
               action: SnackBarAction(               // element to display from snackbar and do an action
                    label: 'Undo',                   // define label
                    textColor: Colors.cyan,          // color label
                    onPressed: () {                  // action after click label (by default dismiss snackbar)
                       print('dismiss it');
                       // Navigator.pop(context);    // that's allow to go recent page
                    },
               ),
               // animation: Animation.,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar); // for display him in the scaffold
    }

    // Alert Flutter
    Future<Null> alert() async {  //function alert async future null
        return showDialog(
            context: context,
            barrierDismissible: false,  // say if we open or not when we click outside
            builder: (BuildContext context) {
                return new AlertDialog(
                     title: new Text('Ceci est una alerte', textScaleFactor: 1.5,), // title and content alert
                     content: new Text('L\'alerte est actuellement en phase de teste. Nous devons la personnaliser pour ça soit plus jolie '),
                     contentPadding: EdgeInsets.all(5.0),
                     actions: [
                         new TextButton(
                             onPressed: () {
                                print('Annuler!');
                                Navigator.pop(context); // for return in the page after click
                             },
                             child: new Text(
                                 'Annuler',
                                  style: TextStyle(
                                      backgroundColor: Colors.red,
                                  ),
                             ),

                         ),
                         new TextButton(
                             onPressed: () {
                               print('Valider!');
                               Navigator.pop(context); // for return in the page after click
                             },
                             child: new Text(
                                 'Valider',
                                 style: TextStyle(
                                      backgroundColor: Colors.green,
                                 ),
                             )
                         )
                     ],
                );
         });
    }

    // Dialog
    Future<Null> dialog(String title,String description) async {
       return showDialog(
           context: context,
           barrierDismissible: true,
           builder: (BuildContext context) {
              return SimpleDialog(
                  title: new Text(title, textScaleFactor: 1.4,),
                  contentPadding: EdgeInsets.all(10.0),
                  children: [
                     new Text(description),
                     new TextButton(
                         onPressed: () {
                            print('Appuyé');
                            Navigator.pop(context);
                         },
                         child: new Text(
                            'Ok'
                         )
                     )
                  ],
              );
           }
       );
    }

    Widget build(BuildContext context) {
        return new Scaffold(
              appBar: AppBar(
                  title: Text(
                     'Pop up'
                  ),
                 centerTitle: true,
              ),
              body: Container(
                  decoration: new BoxDecoration(  // for decorate contain container
                      gradient: new LinearGradient(    // grandient color (s beautiful)
                          colors: [Colors.red, Colors.cyan],   // two color gradient
                          begin: Alignment.centerRight,  // repartition color gradient
                          end: Alignment.centerLeft,
                          tileMode: TileMode.clamp
                      ),
                  ),
                  child: Center(
                       child: Column(
                           // mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                               Container(  // for direction button
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(12),
                                  child: ElevatedButton(
                                        // It's always recommended to screen a function for a snackbar, we must be out the scaffold widget
                                        onPressed: callSnackbar,
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                                        ),
                                        child: Text(
                                           'Display Snackbar'
                                        ),
                                   )
                               ),
                               Container(  // for direction button
                                   alignment: Alignment.centerLeft,
                                   padding: EdgeInsets.only(left: 12),
                                   child: ElevatedButton(
                                       // It's always recommended to screen a function for a snackbar, we must be out the scaffold widget
                                       onPressed: alert,
                                       style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                                       ),
                                       child: Text(
                                           'Display Alert'
                                       ),
                                   )
                               ),
                               Container(  // for direction button
                                   alignment: Alignment.centerRight,
                                   padding: EdgeInsets.all(12.0),
                                   child: ElevatedButton(
                                     // do function like this when we has a parameter
                                     onPressed: ( () => dialog('The first dialog', 'It\'s so cool when we learn coding really so cold ')),
                                     style: ButtonStyle(
                                       backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                                     ),
                                     child: Text(
                                         'Show dialog'
                                     ),
                                   )
                               ),
                              // Interractif Widget
                               Container(  // for direction button
                                   alignment: Alignment.center,
                                   padding: EdgeInsets.all(22.0),
                                   child: ElevatedButton(
                                     // do function like this when we has a parameter
                                     onPressed: ( () {
                                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                              return new InterractifWidget();
                                         }));
                                     }),
                                     style: ButtonStyle(
                                       backgroundColor: MaterialStateProperty.all(Colors.brown),
                                     ),
                                     child: Text(
                                         'Go Interractif Widget'
                                     ),
                                   )
                               ),
                           ],
                       ),
                  )
              ),
              bottomNavigationBar: BottomAppBar(
                  child: Container(
                      height: MediaQuery.of(context).size.width /6,
                      padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
                      color: Colors.blueGrey[500],
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                              InkWell(
                                  onTap: () => print('house'),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.house,
                                        size: 29.0,
                                        semanticLabel: 'House',
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Shop',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              InkWell(
                                onTap: () => print('explore'),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.explore,
                                      size: 29.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                        'Explore',
                                         style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic
                                         ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => print('search'),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        size: 29.0,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Search',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              InkWell(
                                  onTap: () => print('setting'),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        size: 29.0,
                                        semanticLabel: 'Setting',
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Setting',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
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