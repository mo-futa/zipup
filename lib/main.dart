import 'package:collapsible/collapsible.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/screens/cart_screen.dart';
import 'package:local_print/screens/cloth_inspect_screen.dart';
import 'package:local_print/screens/expl_coll_screen.dart';
import 'package:local_print/screens/login_screen.dart';
import 'package:local_print/screens/orders_screen.dart';
import 'package:local_print/screens/profile_screen.dart';
import 'package:local_print/providers/item_provider.dart';
import 'package:local_print/providers/user_provider.dart';
import 'package:local_print/screens/universal_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:transparent_image/transparent_image.dart';

import 'screens/customize_screen.dart';
import 'initial_fallbacks/internet_connectivity_layer.dart';
import 'screens/item_inspect_screen.dart';

import 'package:flutter/scheduler.dart';
import 'package:random_color/random_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color.lerp(Color(0xFF3A6073), Colors.black, 0.5),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

const firstColor = Color(0xFF3A6073);
const secondColor = Color(0xFF16222A);
const thirdColor = Color(0xFFecf0f1);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3A6073),
          accentColor: Color(0xFF16222A),
          buttonColor: Color(0xFFecf0f1),
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
          // primarySwatch: Colors.blue,
        ),
        // home: CartScreen(),
        // TestScreen(),

        routes: {
          '/': (context) => InternetConnectionRoot(),
          UniversalScreen.route: (ctx) => UniversalScreen(),
          LoginScreen.route: (ctx) => LoginScreen(),
          ExplCollScreen.route: (ctx) => ExplCollScreen(),
          ProfileScreen.route: (ctx) => ProfileScreen(),
          ItemInspectPage.route: (ctx) => ItemInspectPage(),
          CustomizeScreen.route: (ctx) => CustomizeScreen(),
          OrdersScreen.route: (ctx) => OrdersScreen(),
          CartScreen.route: (ctx) => CartScreen(),
          ClothInspectPage.route: (ctx) => ClothInspectPage(),
        },
      ),
    );
  }
}

class StaggerGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BAGS',
              // textAlign: TextAlign.start,
              style: GoogleFonts.scada(fontSize: 30),
            ),
            SizedBox(
              // padding: EdgeInsets.all(10),
              height: 300,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                scrollDirection: Axis.horizontal,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                itemCount: 7,
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 2.4);
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: RandomColor(index)
                                .randomColor(colorHue: ColorHue.red)
                                .withOpacity(0.5),

                            // FadeInImage.(
                            //   placeholder: kTransparentImage,
                            //   image: imageList[index],
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              index.isEven ? 80 : 120,
                              0,
                            ),
                            child: Transform.scale(
                              scale: index.isEven ? 1 : 2,
                              child: Image.asset(
                                'assets/place_holder.png',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Proudly Ghanaian Kente',
                                        style: GoogleFonts.lora(
                                            color: Colors.white,
                                            fontSize: index.isEven ? 16 : 20),
                                      ),
                                      Text(
                                        'always good for a rainy day',
                                        style: GoogleFonts.poiretOne(
                                            color: Colors.white,
                                            fontSize: index.isEven ? 12 : 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => setState(() => _isPlay = !_isPlay),
          child: CustomAnimation<double?>(
              tween: Tween<double>(
                  begin: 1,
                  end: 0.1), //Colors.red.tweenTo(Colors.blue), // define tween
              duration: Duration(milliseconds: 300),
              control: _isPlay
                  ? CustomAnimationControl.playReverse
                  : CustomAnimationControl.play, // define duration
              builder: (context, child, value) {
                return Container(
                  color: Colors.green, // use animated value
                  width: 100,
                  height: 100 * value!,
                  child: Collapsible(
                    collapsed: !_isPlay,
                    axis: CollapsibleAxis.vertical,
                    child: Column(
                      children: [
                        Text('deep'),
                        Text('deep'),
                        Text('deep'),
                        Text('deep'),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
