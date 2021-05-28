import 'package:flutter/material.dart';
import 'dart:async';

class PopInputWidget extends StatefulWidget {
   @override
   State<StatefulWidget> createState() {
       return new _PopInputWidget();
   }
}

// ctrl + alt + l => for locked my desktop

class _PopInputWidget extends State<PopInputWidget> {

    @override

    //  function snackbar => always recommended
    void callSnackbar () {   // it's banner display in the screen
          SnackBar snackBar = new SnackBar(
              content: new Text(
                  ' This is my snackar, so cool no ',
                    style: TextStyle(
                         fontSize: 17.0,
                         fontStyle: FontStyle.italic,
                         color: Colors.black
                    ),
                    textAlign: TextAlign.center,     // center this text
              ),
               duration: new Duration(seconds: 2),   // define duration appear snackbar
               backgroundColor: Colors.greenAccent,  // define background
               elevation: 12.3,                      // do elevation
               padding: EdgeInsets.only(left: 12),   // define padding
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
                     'Pop-up & Input'
                  ),
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
                           ],
                       ),
                  )
              ),
        );
    }
}