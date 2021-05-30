import 'package:flutter/material.dart';

class CupernitoWidget extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        // TODO: implement createState
        return new _CupernitoWidget();
    }
}

class _CupernitoWidget extends State<CupernitoWidget> {
     @override
     Widget build(BuildContext context) {

          // verify plateform where is it
          // if

          return Scaffold(
               appBar: AppBar(
                  title: Text(
                     'Cupertino Widget'
                  ),
                  centerTitle: true,
               ),
               body: Container(
                    child: Center(

                    ),
               ),
          );
     }
}