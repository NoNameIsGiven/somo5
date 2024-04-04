import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:somo5/screen/drumkit.dart';
import 'package:somo5/screen/electronic.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
         builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        //title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  String groupValue = "English";
  List cont = [
    {
      "txt":
          "The drum is a member of the percussion group of musical instruments. In the Hornbostel-Sachs classification system, it is a membranophone. Drums consist of at least one membrane, called a drumhead or drum skin, that is stretched over a shell and struck, either directly with the player's hands, or with a percussion mallet, to produce sound. Drums are the world's oldest and most ubiquitous musical instruments, and the basic design has remained virtually unchanged for thousands of years."
    },
    {
      "txt":
          "Electronic drums are a modern electronic musical instrument, primarily designed to serve as an alternative to an acoustic drum kit. Electronic drums consist of an electronic sound module which produces the synthesized or sampled percussion sounds and a set of pads, usually constructed in a shape to resemble drums and cymbals, which are equipped with electronic sensors to send an electronic signal to the sound module which outputs a sound."
    },
    {"txt": ""},
    {"txt": ""},
    {"txt": ""},
    {"txt": ""},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Center(
              child: Text(
                'Muse Pad',
                style: TextStyle(
                    fontFamily: "greatvibes",
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple[300],
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.deepPurple[200],
        child: ListView(
          children: [
             DrawerHeader(
              child:Image.asset('assets/logo5.png')),
            ListTile(
              leading:const Icon(Icons.language),
              title:const Text('Language'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'Language',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "English",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!;
                                  
                                    });
                                  }),
                              const Text('English'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading:const Icon(Icons.star),
              title: const Text('Rate'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'Rate My App',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingBar.builder(
                            minRating: 1,
                            itemBuilder: (context, i) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value) {},
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge),
                            onPressed: () {
                              EasyLoading.show(status: 'Loading...');
                              EasyLoading.showSuccess('Thank You for your time!');
                              Navigator.of(context).pop();
                              EasyLoading.dismiss();
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title:const Text('Dark Mode'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Dark Mode'),
                              Switch(
                                value: AdaptiveTheme.of(context).mode.isDark,
                                onChanged: (value) {
                                  if (value) {
                                    AdaptiveTheme.of(context).setDark();
                                  } else {
                                    AdaptiveTheme.of(context).setLight();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'About',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info,size: 20,),
                              SizedBox(width: 5,),
                              Text('1.0.1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      )),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              CarouselSlider(
                items: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: const DecorationImage(
                            image: AssetImage("assets/drum.png"), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Drumkit(),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: const DecorationImage(
                            image: AssetImage("assets/cal.png"), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Electronic(),
                          ));
                    },
                  ),
                ],
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: 300.0,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 5.0,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        currentindex = index;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedSmoothIndicator(
                activeIndex: currentindex,
                count: 2,
                curve: Curves.easeInOut,
                effect:const  WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepPurple,
                  radius: 10,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    cont[currentindex]["txt"],
                    textAlign: TextAlign.justify,
                    trimCollapsedText: " Show More ",
                    trimExpandedText: " Show Less ",
                    moreStyle: const TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    lessStyle: const TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
