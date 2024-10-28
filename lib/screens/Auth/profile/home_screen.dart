import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:austism/screens/Auth/profile/austism_detail.dart';
import 'package:austism/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(text: "Home Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom app bar

              30.h.verticalSpace, // Increased space for cleaner design

              // Child image with shadow for better appearance
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Appassets.child1,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              30.h.verticalSpace,

              // Informative text with better spacing, padding, and design
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Understanding Autism Spectrum Disorder",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: kprimaryColor,
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      "Autism Spectrum Disorder (ASD) is a neurodevelopmental condition affecting communication, social interaction, and behavior. People with autism experience the world differently, often struggling with sensory processing and routines.",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      "While there's no single cause, early intervention and support can significantly improve quality of life.",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              30.h.verticalSpace,

              // Second image with shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Appassets.austism1,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              30.h.verticalSpace,

              // Custom button with animation
              GestureDetector(
                onTap: () {
                  Get.to(() => AustismDetail());
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 0.70.sw,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: kprimaryColor.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "CLICK HERE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              30.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}

class PlanetCard {
  final String title;
  final String image;

  PlanetCard({required this.title, required this.image});
}

class SpaceHomeScreen extends StatelessWidget {
  SpaceHomeScreen({Key? key}) : super(key: key);
  final planetCards = [
    PlanetCard(
        title: "Neptune",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet1.png?alt=media&token=b275a4f8-1abb-4e69-b218-b796cf144352"),
    PlanetCard(
        title: "Venus",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet2.png?alt=media&token=6dc4d3f4-09d8-47fc-8639-b19eba6e3ed5"),
    PlanetCard(
        title: "Orbit",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet3.png?alt=media&token=497fbf32-30c7-4ce5-ae0a-c387d517aa1a"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const IntroCard(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 335,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: planetCards.length,
                        itemBuilder: (context, index) {
                          return PlanetCardWidget2(
                              planetCard: planetCards[index]);
                        }),
                  ),
                  InformationCard(
                    planetCard: PlanetCard(
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fsolar.png?alt=media&token=50992182-d228-484a-b6a7-ffab59023027",
                        title: "Solar System"),
                  ),
                  InformationCard(
                    planetCard: PlanetCard(
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet3.png?alt=media&token=497fbf32-30c7-4ce5-ae0a-c387d517aa1a",
                        title: "Mercury"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blueAccent, Colors.purple[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchInput(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.white.withOpacity(.25)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff4338CA),
          ),
          filled: true,
          fillColor: Colors.blue[50],
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}

class IntroCard extends StatelessWidget {
  const IntroCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
      height: 190,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[800]!.withOpacity(.15),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const RadialGradient(
            colors: [Color(0xff0E5C9E), Color(0xff031965)],
            focal: Alignment.topCenter,
            radius: .85,
          )),
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Let's Explore",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          height: 1.25,
                          fontFamily: "BigBottom",
                          fontWeight: FontWeight.bold)),
                  Text("Travel the galaxy",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.75),
                        fontSize: 14,
                      )),
                ],
              ),
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fbox-1.png?alt=media&token=4b0259b3-8bc3-4ab7-9157-a61baacd3846",
                width: 50,
              )
            ],
          ),
          const SizedBox(height: 15.0),
          SearchInput(
            textController: TextEditingController(),
            hintText: "Search",
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}

class PlanetCardWidget2 extends StatelessWidget {
  final PlanetCard planetCard;

  const PlanetCardWidget2({required this.planetCard, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 700),
                pageBuilder: (_, __, ___) => PlanetHero(
                      planetCard: planetCard,
                    ))),
        child: Container(
          margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          width: 250,
          height: 290,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  offset: const Offset(0, 10),
                  blurRadius: 0,
                  spreadRadius: 0,
                )
              ],
              gradient: const RadialGradient(
                colors: [Color(0xff0E5C9E), Color(0xff031965)],
                focal: Alignment.topCenter,
                radius: .85,
              )),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(.3),
                        offset: const Offset(0, 5),
                        blurRadius: 25,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Hero(
                    tag: planetCard.image,
                    child: Image.network(
                      planetCard.image,
                      width: 170,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(planetCard.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "BigBottom",
                                fontSize: 22)),
                        Text("About planet",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.45),
                                fontSize: 14)),
                      ],
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          gradient: const LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 30,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  final PlanetCard planetCard;
  const InformationCard({required this.planetCard, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
      height: 155,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const RadialGradient(
            colors: [Color(0xff0E5C9E), Color(0xff031965)],
            focal: Alignment.topCenter,
            radius: 1.25,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            planetCard.image,
            width: 50,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      planetCard.title,
                      style: const TextStyle(
                          fontFamily: "BigBottom",
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  """Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas vel sint commodi!""",
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.75), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlanetHero extends StatefulWidget {
  final PlanetCard planetCard;
  const PlanetHero({required this.planetCard, Key? key}) : super(key: key);

  @override
  State<PlanetHero> createState() => _PlanetHeroState();
}

class _PlanetHeroState extends State<PlanetHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 49.0),
                    child: PlanetCardWidget(
                      planetCard: PlanetCard(
                          title: "Venus", image: widget.planetCard.image),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 25.0, left: 0.0, right: 0.0),
                    height: 255,
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 10),
                            blurRadius: 0,
                            spreadRadius: 0,
                          )
                        ],
                        gradient: const RadialGradient(
                          colors: [Color(0xff0E5C9E), Color(0xff031965)],
                          focal: Alignment.topCenter,
                          radius: .85,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Neptune Travel",
                              style: TextStyle(
                                  fontFamily: "BigBottom",
                                  color: Colors.white,
                                  fontSize: 26),
                            ),
                            Container(
                              width: 75,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                gradient: const LinearGradient(
                                    colors: [Colors.yellow, Colors.orange],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: const Center(
                                  child: Text(
                                "More",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudi conseqr voluptatum laborum numquam blanditiis harum quisquam eius sed odit!""",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.75),
                              fontSize: 14),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.blue[50],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xff031965),
                                    radius: 25,
                                    child: Icon(
                                      Icons.directions,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Neptune - Earth"),
                                      Text(
                                        "2.76 billion mi",
                                        style: TextStyle(
                                          color: Color(0xff031965),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanetCardWidget extends StatefulWidget {
  final PlanetCard planetCard;

  const PlanetCardWidget({required this.planetCard, Key? key})
      : super(key: key);

  @override
  State<PlanetCardWidget> createState() => _PlanetCardWidgetState();
}

class _PlanetCardWidgetState extends State<PlanetCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 515,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70.0, left: 0.0, right: 0.0),
            width: 400,
            height: 470,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 10),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
                gradient: const RadialGradient(
                  colors: [Color(0xff0E5C9E), Color(0xff031965)],
                  focal: Alignment.topCenter,
                  radius: .85,
                )),
          ),
          Container(
            width: 370,
            height: 265,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.5),
                gradient: LinearGradient(colors: [
                  Colors.indigo[700]!,
                  Colors.blue,
                  Colors.purple[300]!
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text("Neptune",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            height: 1.25,
                            fontFamily: "BigBottom",
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(
                        Icons.notification_add_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 285,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(.3),
                        offset: const Offset(0, 5),
                        blurRadius: 25,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Hero(
                    tag: widget.planetCard.image,
                    child: Image.network(
                      widget.planetCard.image,
                      width: 250,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Solar systems",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet1.png?alt=media&token=b275a4f8-1abb-4e69-b218-b796cf144352",
                      width: 63,
                    ),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet2.png?alt=media&token=6dc4d3f4-09d8-47fc-8639-b19eba6e3ed5",
                      width: 63,
                    ),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fplanet3.png?alt=media&token=497fbf32-30c7-4ce5-ae0a-c387d517aa1a",
                      width: 63,
                    ),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Planets%2Fsolar.png?alt=media&token=50992182-d228-484a-b6a7-ffab59023027",
                      width: 63,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
