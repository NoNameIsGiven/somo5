import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Electronic extends StatelessWidget {
  Electronic({super.key});
  List clrlist = [

    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 2, 133, 255),
          Color.fromARGB(255, 7, 33, 89),
          Colors.black,
          Colors.blue,
          Colors.blueAccent
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 176, 154, 146),
          Color.fromARGB(255, 78, 68, 68),
          Colors.black,
          Colors.grey,
          Colors.blueGrey
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 133, 2, 255),
          Color.fromARGB(255, 53, 2, 63),
          Colors.black,
          Colors.purple,
          Colors.deepPurple
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 60, 58, 203),
          Color.fromARGB(255, 27, 38, 83),
          Colors.black,
          Colors.indigo,
          Colors.indigoAccent
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 2, 15, 255),
          Color.fromARGB(255, 15, 4, 86),
          Colors.black,
          Colors.lightBlueAccent,
          Colors.lightBlue
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 62, 186, 220),
          Color.fromARGB(255, 11, 116, 126),
          Colors.black,
          Colors.cyan,
          Colors.cyanAccent
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 255, 138, 4),
          Color.fromARGB(255, 134, 65, 4),
          Colors.black,
          Color.fromARGB(255, 129, 59, 5),
          Color.fromARGB(255, 135, 94, 5)
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 255, 234, 0),
          Color.fromARGB(255, 121, 129, 12),
          Colors.black,
          Color.fromARGB(255, 129, 139, 41),
          Color.fromARGB(255, 116, 122, 51)
        ],
      ),
    },
    {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 244, 12, 144),
          Color.fromARGB(255, 150, 15, 111),
          Colors.black,
          Color.fromARGB(255, 113, 9, 79),
          Color.fromARGB(255, 45, 4, 37)
        ],
      ),
    },
   {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 182, 6, 236),
          Color.fromARGB(255, 118, 41, 138),
          Colors.black,
          Color.fromARGB(255, 64, 8, 75),
          Color.fromARGB(255, 119, 5, 123)
        ],
      ),
    },
     {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 2, 255, 36),
          Color.fromARGB(255, 7, 89, 63),
          Colors.black,
          Colors.green,
          Colors.greenAccent
        ],
      ),
    },
        {
      "color": const RadialGradient(
        radius: 3.0,
        center: Alignment.center,
        colors: [
          Color.fromARGB(255, 247, 49, 4),
          Color.fromARGB(255, 119, 5, 5),
          Colors.black,
          Colors.red,
          Colors.redAccent
        ],
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              'Electronic Drum',
              style: TextStyle(
               // color: Colors.white,
               fontWeight: FontWeight.bold
              ),
            ),
           
          ],
        ),
        backgroundColor: Colors.deepPurple[300],
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  GridView.builder(
        itemCount: clrlist.length,
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.0),
        itemBuilder: (context, index) => SizedBox(
          child: MaterialButton(
            onPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource("DubstepClub${index + 1}.wav"));
                },
            splashColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                // color: clrlist[index]["color"],
                  gradient: clrlist[index]['color'],
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
