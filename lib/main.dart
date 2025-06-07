import 'package:flutter/material.dart';

import 'feature/home/presentation/views/loading.dart';

void main (){
runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Loading()
   );
  }

}

