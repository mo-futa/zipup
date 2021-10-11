import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/screens/cart_screen.dart';
import 'package:local_print/screens/cloth_inspect_screen.dart';
import 'package:local_print/main.dart';
import 'package:local_print/providers/item_provider.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'item_inspect_screen.dart';

class CustomizeScreen extends StatefulWidget {
  static const String route = 'customize-page';

  @override
  _CustomizeScreenState createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  @override
  void initState() {
    final itemType =
        Provider.of<ItemProvider>(context, listen: false).getItemType;
    deriveItemType(itemType);
    super.initState();
  }

  List<Widget> slides = [];
  List<String> tabNames = [];

  void deriveItemType(ItemType itemType) {
    switch (itemType) {
      case ItemType.SHOE:
        slides = shoeSlides;
        tabNames = shoetabNames;
        break;
      case ItemType.HOODIE:
        slides = hoodieSlides;
        tabNames = hoodietabNames;
        break;
      default:
        slides = bagSlides;
        tabNames = bagtabNames;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, value, child) => DefaultTabController(
        length: tabNames.length,
        child: Scaffold(
          backgroundColor: Color.lerp(Colors.orange, Colors.white, 0.9),
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            // actions: [
            //   TextButton(
            //       onPressed: () => Navigator.of(context)
            //           .pop(), // .popAndPushNamed(ExplCollScreen.route),
            //       child: Text('Done'))
            // ],
            elevation: 0,
            title: Text(
              'Customize screen',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: tabNames
                  .map((e) => Text(
                        e,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ))
                  .toList(),
              indicator: DotIndicator(
                color: Colors.black,
                distanceFromCenter: 16,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TabBarView(children: slides),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  key: Key('preview-display'),
                  initialChildSize: 0.05,
                  minChildSize: 0.05,
                  maxChildSize: 0.7,
                  builder: (BuildContext c, s) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              //stops: [2.0,3.0],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor
                              ]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: SingleChildScrollView(
                        controller: s,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Column(children: [
                              Center(
                                child: Container(
                                  height: 8,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/place_holder.png',
                                fit: BoxFit.cover,
                              ),
                            ]),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pushNamed(CartScreen.route),
                                        child: Text(
                                          'Done',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    //  ClipOval(
                                    //   child: Material(
                                    //     color: Colors.white,
                                    //     child: InkWell(
                                    //       onTap: () {},
                                    //       splashColor:
                                    //           Theme.of(context).primaryColor,
                                    //       child: SizedBox(
                                    //         width: 36,
                                    //         height: 36,
                                    //         child: Icon(
                                    //           Icons.done,
                                    //           color: Theme.of(context)
                                    //               .primaryColor,
                                    //           //size: 30,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('word 21',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            )),
                                        SizedBox(height: 5),
                                        Text('word 34 ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              // fontWeight: FontWeight.bold
                                            )),
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
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Widget> shoeSlides = [
  Container(
    color: RandomColor().randomColor(),
  ),
  Container(
    color: RandomColor().randomColor(),
  ),
  Container(
    color: RandomColor().randomColor(),
  ),
];
final List<Widget> hoodieSlides = [
  Container(
    color: RandomColor().randomColor(),
  ),
  Container(
    color: RandomColor().randomColor(),
  ),
];
final List<Widget> bagSlides = [
  Container(
    padding: EdgeInsets.only(bottom: 40, top: 10, left: 10, right: 10),
    child: StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 10,
      mainAxisSpacing: 5,
      itemCount: 10,
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(1, index % 3 == 0 ? 1.2 : 2.4);
      },
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          onLongPress: () {
            Navigator.of(context).pushNamed(ClothInspectPage.route);
          },
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/african.jpg'),
                    fit: index.isEven ? BoxFit.cover : BoxFit.contain,
                    repeat: ImageRepeat.repeat),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Proudly Ghanaian Kente',
                                  style: GoogleFonts.lora(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: index.isEven ? 16 : 20),
                                ),
                                Text(
                                  'always good for a rainy day',
                                  style: GoogleFonts.poiretOne(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.thumb_up_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                '145',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.thumb_down_alt_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                '145',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                        ],
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
  Container(
    padding: EdgeInsets.only(bottom: 40),
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          print('yellow');
        },
        onLongPress: () =>
            Navigator.of(context).pushNamed(ItemInspectPage.route),
        child: Container(
          height: 300,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: firstColor,
              //  RandomColor()
              //     .randomColor(colorHue: ColorHue.orange)
              //     .withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Image.asset('assets/place_holder.png'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Proudly Ghanaian Kente',
                            style: GoogleFonts.lora(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            'always good for a rainy day',
                            style: GoogleFonts.poiretOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_up_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    '145',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    '145',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
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
      ),
    ),
  ),
];

final List<String> bagtabNames = ['cloth', 'bagDesign'];
final List<String> hoodietabNames = ['cloth', 'bagDesign'];
final List<String> shoetabNames = ['cloth', 'lace', 'color'];
