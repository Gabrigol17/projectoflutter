import 'package:flutter/material.dart';
class Failure extends StatelessWidget{
  const Failure({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children:[
          SizedBox.expand(
            child:Image.asset(
              'assets/fondo1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.report_gmailerrorred,
                        size: 50,
                        color: Color.fromARGB(255, 252, 206, 57)
                      ),
                      Text( 
                        '¡Ups! Algo salio mal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),

                      ),
                      Text( 
                        'No pudimos cargar la informacion.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],

                  )
                ),
              ],
            )
          ,)
        ]
      )
    );
  }
}