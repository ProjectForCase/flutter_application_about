import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 126, 170, 235),
        ),
      ),
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,  
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontFamily: 'Playfair_Display',
                fontSize: 20,
                fontWeight: FontWeight.w500,
            )
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 170, 235),

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'About Me',
          style: TextStyle(
            fontFamily: 'Playfair_Display',
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        foregroundColor: const Color.fromARGB(255, 37, 105, 206),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            /// ===== 頭像區（Stack）=====
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 100, 150, 220),
                ),
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ===== 名字 =====
            const Text(
              '林維祥(ZOT)',
              style: TextStyle(
                fontFamily: 'Playfair_Display',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            /// ===== 副標題 =====
            const Text(
              'NTOU CS Student | 音ゲームプレイヤー',
              style: TextStyle(
                fontFamily: 'Playfair_Display',
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            /// ===== About Me =====
            buildCard(
              title: 'About Me',
              child: const Text(
                '21歲，是一名學生。',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.black87
                  ),
              ),
            ),

            /// ===== Skills =====
            buildCard(
              title: 'I\'ve learned (or learning)',
              child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                    SkillItem(icon: Icons.flutter_dash, text: 'Flutter', color: Colors.blue, textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w700)),
                    SkillItem(icon: Icons.code, text: 'Python', color: Colors.green, textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w700)),
                    SkillItem(icon: Icons.web, text: 'Web', color: Colors.purple, textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w700)),
                    SkillItem(icon: Icons.storage, text: 'Database', color: Colors.teal, textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),

            /// ===== Contact =====
            buildCard(
              title: 'Contact',
              child: Column(
                children: const [
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.red),
                      SizedBox(width: 10),
                      Text('1098eric@email.com'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('github.com/Zot012'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final TextStyle? textStyle;

  const SkillItem({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 5),
          Text(text,style: textStyle,),
          
        ],
      ),
    );
  }
}