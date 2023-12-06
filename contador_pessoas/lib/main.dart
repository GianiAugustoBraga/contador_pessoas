import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ); 
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {

    setState(() {
      count--;
    });
    
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 30; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/senai_passo_fundo_interno.jpg'),
            fit: BoxFit.cover,
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 26,
                color: isFull ? Colors.orange :  Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 32),
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 1000,
                color: Colors.white,
              ),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                    padding: const EdgeInsets.all(32),
                    fixedSize: const Size(115, 115),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.4) :Colors.white,
                    padding: const EdgeInsets.all(32),
                    fixedSize: const Size(115, 115),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: isFull ? null : increment,
                  child: Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
