import 'package:flutter/material.dart';

class Inicial_view extends StatelessWidget {
  const Inicial_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
         home:Scaffold(
          body: Stack(
    children: [
      // Fondo con imagen
      SizedBox.expand(
        child: Image.asset(
          'assets/fondo.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      // Capa oscura encima para mejor contraste
      Container(
        color: Colors.black.withOpacity(0.5),
      ),
      // Contenido
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido',
    
             
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),                Text(
              
    
              ' a CineApp',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 28),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 206, 57), // Amarillo
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Ruta a Success
              },
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ],
          ),
        )
        );
  }
}
