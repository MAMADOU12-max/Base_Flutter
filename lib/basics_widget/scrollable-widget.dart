import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollableWidget extends StatefulWidget {
  const ScrollableWidget({Key key}) : super(key: key);

  @override
  _ScrollableWidgetState createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {

  List<Activite> mesActivites = [
    new Activite("velo", Icons.bike_scooter),
    new Activite("Peinture", Icons.format_paint),
    new Activite("Golf", Icons.gamepad_outlined),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolade", Icons.build),
    new Activite("velo", Icons.bike_scooter),
    new Activite("Peinture", Icons.format_paint),
    new Activite("Golf", Icons.gamepad_outlined),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolade", Icons.build),
    new Activite("velo", Icons.bike_scooter),
    new Activite("Peinture", Icons.format_paint),
    new Activite("Golf", Icons.gamepad_outlined),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolade", Icons.build),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text(
                'Scrollables widget'
            ),
           centerTitle: true,
        ),
        body: Container(
              // child: SingleChildScrollView (                      // do it fo can scroll else we get error if container isatured
              //     scrollDirection: Axis.horizontal,              // for custom line scroll (don't forget to precise if is colum or row)
              //     child: Row(
              //        children: [
              //           Container(
              //              height: 100.0, color: Colors.redAccent,
              //              width: 70.0,
              //           ),
              //            Container(
              //              height: 100.0, color: Colors.green,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.yellow,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.black,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.lightGreenAccent,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.white,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.purple,
              //              width: 70.0,
              //            ),
              //            Container(
              //              height: 100.0, color: Colors.pink,
              //              width: 70.0,
              //            ),
              //        ],
              //     ),
              // ),

              // ---------------------------------------------- LIST Dismissible-------------------------------------------- //

              // child: ListView.builder(
              //     itemCount: mesActivites.length,     // call list
              //     itemBuilder: (context, i) {
              //     Activite activity = mesActivites[i] ;
              //     String key = activity.nom;
              //          return new Dismissible(     // for doing list dismissible
              //              key: new Key(key),
              //              child:   ListTile(
              //                  title: new Text('Activité ${mesActivites[i].nom}'),
              //                  trailing: new Icon(mesActivites[i].icone),                          // element flex left from title
              //                  leading: new Icon(mesActivites[i].icone),                           // element before title
              //                  subtitle: Text('subtitle'),
              //                  // tileColor: Colors.lightGreen,                                    // color list all
              //                  // isThreeLine: false,
              //                  horizontalTitleGap: 1.4,                                            // space between leading and title
              //                  minVerticalPadding: 2.3,                                            // padding top title
              //                  minLeadingWidth: 44.3,                                              // width contain leading
              //              ),
              //              background: new Container(
              //                  color: Colors.red,                                                 // color background dismissible
              //                  padding: EdgeInsets.only(right: 20.0),
              //                   child: Row(
              //                      mainAxisAlignment: MainAxisAlignment.end,
              //                      children: [
              //                          Container(
              //                              padding: EdgeInsets.only(right: 8.0) ,
              //                              child: Text(
              //                                 'delete',
              //                                  style: TextStyle(
              //                                      color: Colors.white,
              //                                      fontSize: 17.0,
              //                                      fontStyle: FontStyle.italic
              //                                  ),
              //                               ),
              //                          ),
              //                          Icon(
              //                             Icons.delete
              //                          ),
              //                      ],
              //                   ),
              //              ),
              //              onDismissed: (direction) {                                            // function for remove index after dismiss
              //                 setState(() {
              //                     print(activity.nom);
              //                     mesActivites.removeAt(i);
              //                 });
              //              },
              //          );
              //
              //      }
              // ),

              // Custom  Tile

          // child: liste(),  // call a widget defined

          // -------------------------------------------------- GridView ----------------------------------------------------- //

           child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),  // number by line
               itemCount: mesActivites.length,
               itemBuilder: (context, i) {
                   return new Container(
                      margin: EdgeInsets.all(8),
                      child: Card(
                          elevation: 10.0,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Text('Activité',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 15.0,
                                      ),
                                 ),
                                 Icon(
                                   mesActivites[i].icone,
                                   color: Colors.lightGreen,
                                   size: 35,
                                 ),
                                  Text(
                                    mesActivites[i].nom,
                                    style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 10.0,
                                    ),
                                  ),
                              ],
                          ),
                      ),
                   );
               },
           ),

        ),
    );
  }

  Widget liste () {                               // we can create a widget an call it in our code!
     return ListView.builder(
         itemCount: mesActivites.length,     // call list
         itemBuilder: (context, i) {
           Activite activity = mesActivites[i] ;
           String key = activity.nom;
           return new Dismissible(     // for doing list dismissible
             key: new Key(key),
             child: Container(
               padding: EdgeInsets.all(5.0),
               height: 135.0,
               child: Card(
                 elevation: 7.5,
                 child: InkWell(    // for permit element to be clickable and with his funnction
                   onTap: (() => print('tapped')),       // when we click
                   onLongPress: (() => print('c\'est long!!')),
                   child: Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Icon(activity.icone, color: Colors.teal, size: 75.0,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                               'Activité',
                               style: TextStyle(
                                 color: Colors.teal,
                                 fontSize: 20.0,
                               ),
                             ),
                             Text(
                               activity.nom,
                               style: TextStyle(
                                 color: Colors.teal[300],
                                 fontSize: 30.0,
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                   ),
                 ),

               ),
             ),
             background: new Container(
               color: Colors.red,                                                 // color background dismissible
               padding: EdgeInsets.only(right: 20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                     padding: EdgeInsets.only(right: 8.0) ,
                     child: Text(
                       'delete',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 17.0,
                           fontStyle: FontStyle.italic
                       ),
                     ),
                   ),
                   Icon(
                       Icons.delete
                   ),
                 ],
               ),
             ),
             onDismissed: (direction) {                                            // function for remove index after dismiss
               setState(() {
                 print(activity.nom);
                 mesActivites.removeAt(i);
               });
             },
           );
         }
     );
  }
}

class Activite {
   String nom;
   IconData icone;

   Activite(String nom, IconData icone) {
       this.nom = nom;
       this.icone = icone;
   }
}