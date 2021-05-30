import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbase/basics_widget/cupernito-widget.dart';
import 'package:flutterbase/basics_widget/scrollable-widget.dart';

class InterractifWidget extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _InterractifWidget();
  }
}

class _InterractifWidget extends State {

  // ---------------------------------------------------- Input ---------------------------------------------------- //

  String changed;
  String submitted;
  String email;
  String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();                        // key for form

  // --------------------------------------------------- CheckBox ---------------------------------------------------- //
  Map check = {
      'Carotes': true,                                                                // coched is value =true
       'Bananas': false,
       'Yaourt': false,
       'Pain': false,
  };

  List<Widget> checkList() {
       List<Widget> listCheckboxes = [];                                             // initialise it else you can be an error
       List<Widget> boxChecked = [];
       check.forEach((key, value) {                                    // browser my table check
            Row row = new Row(
                mainAxisAlignment: MainAxisAlignment.center,            // center row
                children: [
                    new Text(key, style: new TextStyle(color: (value) ? Colors.green: Colors.red),),  // key => 'carottes','pain'...
                    new Checkbox(
                        value: (value),                                                // this take a default value if true, the case is checked else not
                        onChanged: (bool b) {
                             setState(() {
                                  check[key] = b;                                      // check[key] == boolean on check
                                   // print(check[key]);
                                   // if(check[key]){
                                   //      // boxChecked.add(value)
                                   //      print(check);
                                   // }
                             });
                        },
                        checkColor: Colors.black,                                      // color checker
                        fillColor: MaterialStateProperty.all<Color>(Colors.cyan),      // background case after check
                        // tristate: false,
                        // mouseCursor: MouseCursor.defer
                        // activeColor: Color.lerp(Colors.red, Colors.amber, 2.3),
                        // autofocus: true,
                        overlayColor: MaterialStateProperty.all<Color>(Colors.white),  // color over after action
                        // splashRadius: 22.1,
                        materialTapTargetSize: MaterialTapTargetSize.padded,           // put some padding between
                    ),
                ],
            );
            listCheckboxes.add(row);                                                  // add each row
       });
       return listCheckboxes ;
  }

  // ---------------------------------------------------- Radio ---------------------------------------------------- //

  int itemSelected;

  List <Widget> radio() {
     List<Widget> thisradios = [];
     for(int x = 0; x < 4; x++) {
         Row row = new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 new Text('Choix numéro ${x+1}'),
                 new Radio(
                     value: x,
                     groupValue: itemSelected,
                     onChanged: (int i) {
                        setState(() {
                            itemSelected = i;
                        });
                     },
                     // toggleable: false,
                     activeColor: Colors.red,                                        // color check
                     fillColor: MaterialStateProperty.all(Colors.black45),  // color button radio
                     overlayColor: MaterialStateProperty.all<Color>(Colors.white),
                 )
            ],
         );
         thisradios.add(row);
     }
      return thisradios;
  }

  // ------------------------------------------------- Switch && Slider ---------------------------------------------- //

  bool interrupteur = true;
  double sliderDouble = 00;

  // ------------------------------------------------ Date and Hour Picker --------------------------------------------//

  DateTime date;
  TimeOfDay time;

  Future<Null> chooseDate() async {
      DateTime choice = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),             // initialise date now
          initialDatePickerMode: DatePickerMode.year,  // forr begin select year
          firstDate: new DateTime(1983),               // limit begin date
          lastDate: new DateTime(2045),                // delimit last date
      );
      if( choice != null) {
          setState(() {
              date = choice;
          });
      }
  }

  Future<Null> showTime() async {
      TimeOfDay heure = await showTimePicker(
          context: context,
          initialTime: new TimeOfDay.now(),
          // initialEntryMode: TimePickerEntryMode.input,
      );
      if(heure != null) {
            setState(() {
                 time = heure;
            });
      }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // ios input number work with that
    return new GestureDetector(
        onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text(
              interrupteur ? 'Interractif Widget' : 'Interrupteur on work',
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.cyan],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    tileMode: TileMode.clamp
                )
            ),
            child: Center(
                child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                       // -------------------------------------- Input Form -------------------------------------------//

                       //  TextField(
                       //      // when we use input number, we must keep that ios modal by defining gestualDetector
                       //      keyboardType: TextInputType.number,  // allow to define type input
                       //      onChanged: (String string) {
                       //          setState(() {
                       //            changed = string;
                       //          });
                       //      },
                       //      onSubmitted: (String string) {
                       //          setState(() {
                       //            submitted = string;
                       //          });
                       //      },
                       //      decoration: InputDecoration(
                       //          labelText: 'Entrez votre numéro',
                       //          prefixIcon: Icon(Icons.call), // for doing an icon start
                       //      ),
                       // ),
                       // Text(changed ?? ''),  // if exist put value else nothing
                       // Text(submitted ?? ''),

                        // TextFormField(
                        //     decoration: new InputDecoration(
                        //         labelText: "Enter Email",
                        //         fillColor: Colors.red,
                        //         border: new OutlineInputBorder(                     // do border input
                        //             borderRadius: new BorderRadius.circular(25.0),
                        //             borderSide: new BorderSide(
                        //                 color: Colors.white,
                        //                 style: BorderStyle.solid,
                        //                 width: 22.0
                        //             ),
                        //         ),
                        //       //fillColor: Colors.green
                        //         labelStyle: TextStyle(  // style the labelText
                        //             color: Colors.black,
                        //             fontSize: 18.0,
                        //         ),
                        //     ),
                        //     keyboardType: TextInputType.emailAddress,
                        //     style: new TextStyle(       // style contaent value on putting on input
                        //         fontFamily: "Poppins",
                        //         fontSize: 18.0,
                        //         color: Colors.white
                        //     ),
                        // ),

                        // Validate form
                        // Form(
                        //   key: _formKey,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //         TextFormField(
                        //             keyboardType: TextInputType.emailAddress,
                        //             decoration: const InputDecoration(
                        //                 hintText: 'Enter your email',
                        //             ),
                        //             validator: (String value) {
                        //                 if (value == null || value.isEmpty) {
                        //                   return 'Please enter some text';
                        //                 }
                        //                 return null;
                        //             },
                        //             onChanged: (String string) {
                        //                setState(() {
                        //                    email = string;
                        //                });
                        //             },
                        //             onTap: () {
                        //                 print(email);
                        //             },
                        //         ),
                        //         TextFormField(
                        //             keyboardType: TextInputType.number,
                        //             decoration: const InputDecoration(
                        //                 hintText: 'Enter your password',
                        //             ),
                        //             validator: (String value) {
                        //                 if (value == null || value.isEmpty) {
                        //                     return 'Password is required';
                        //                 }
                        //                 return null;
                        //             },
                        //             onChanged: (String string) {
                        //                 setState(() {
                        //                   password = string;
                        //                 });
                        //             },
                        //         ),
                        //         Padding(
                        //             padding: const EdgeInsets.symmetric(vertical: 16.0),
                        //             child: ElevatedButton(
                        //                 onPressed: () {
                        //                     // Validate will return true if the form is valid, or false if
                        //                     // the form is invalid.
                        //                     if (_formKey.currentState.validate()) {
                        //                          print('email: ' + email + '  ' + 'password: ' + password);
                        //                     }
                        //                 },
                        //                 child: const Text('Submit'),
                        //             ),
                        //         ),
                        //
                        //
                        //     ],
                        //   ),
                        // ),

                   // ],

                     // ------------------------------------------ End Input Form ----------------------------------//




                    // ---------------------------------------- CheckBox ---------------------------------------------//

                     // children: checkList(),      // call function checkbox -> [] = not needed because data is already on table

                    // --------------------------------------- End CheckBox -----------------------------------------//




                    // ------------------------------------------- Radio --------------------------------------------//

                    // children: radio(),

                    // ------------------------------------------ End Radio -----------------------------------------//




                    // -------------------------------------------- Switch ------------------------------------------//

                    children: [
                       Text('Aimez vous Flutter ?'),
                       Switch(value: interrupteur,
                           onChanged: (bool b) {
                              setState(() {
                                  interrupteur = b;
                              });
                           },
                           inactiveTrackColor: Colors.deepPurple,   // inactive color
                           activeColor: Colors.indigoAccent,        // active color
                        ),
                        Text('Slider demonstration'),
                        Slider(
                            value: sliderDouble,
                            min: 0.0,
                            max: 10.0,
                            onChanged: (double d) {
                                 setState(() {
                                   sliderDouble = d;
                                 });
                            },
                            inactiveColor: Colors.black87,
                            activeColor: Colors.pinkAccent,
                            divisions: 5,                         // slider stop 5 times
                            label: 'This is the slider',          // display where we navigate slider
                        ),



                      // ------------------------------------------ End Switch ----------------------------------------//




                      // -------------------------------------- Date And Hour Picker ----------------------------------//

                        TextButton(
                            onPressed: chooseDate,
                            child: Text(
                                (date == null) ? 'Appuyer moi' : date.toString(),
                            ),
                            style: ButtonStyle(
                                 backgroundColor: MaterialStateProperty.all(Colors.amber),
                            ),
                        ),

                        TextButton(
                          onPressed: showTime,
                          child: Text(
                            (date == null) ? 'Appuyer moi' : time.toString(),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 66),
                            child: ElevatedButton(
                                onPressed: () => {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                         return new CupernitoWidget();
                                    })),
                                },
                                child: Text(
                                    'Cupernito Widget',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic
                                    ),
                                ),
                                style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                   padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                                   elevation: MaterialStateProperty.all(22),
                                ),

                            ),
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 66),
                            child: ElevatedButton(
                                onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                          return new ScrollableWidget();
                                    }));
                                },
                                child: Text(
                                  'Scrollables Listes et Grilles',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.brown),
                                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                                    elevation: MaterialStateProperty.all(22),
                                ),
                            ),
                        ),

                      // ------------------------------------- End Date And Hour Picker -----------------------------//
                    ],


                ),
            ),
          ),
        ),
    );
  }

}