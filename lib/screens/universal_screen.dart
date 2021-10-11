import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/screens/cart_screen.dart';
import 'package:local_print/screens/customize_screen.dart';
import 'package:local_print/main.dart';
import 'package:local_print/profile_button.dart';
import 'package:local_print/providers/item_provider.dart';
import 'package:local_print/widgets/cart_button.dart';
import 'package:local_print/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:simple_animations/simple_animations.dart';

import 'expl_coll_screen.dart';
import 'item_inspect_screen.dart';

class UniversalScreen extends StatefulWidget {
  //this is the main screen where u can see things that arent restricccted to
  // const UniversalScreen({Key? key}) : super(key: key);
  static const String route = 'univeresal-screen';

  @override
  _UniversalScreenState createState() => _UniversalScreenState();
}

class _UniversalScreenState extends State<UniversalScreen> {
  // bool expand = true;
  bool _isCollapsed = false;

  Future<bool> _onWillPop() {
    if (!_isCollapsed) {
      print(_isCollapsed);
      setState(() {
        _isCollapsed = !_isCollapsed;
        // Navigator.of(context).pop(false);
      });
      return Future.value(false);
    } else {
      // Navigator.of(context).pop(true);
      print('objecthh');
      return Future.value(true);
    }
    // return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop
      ,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [ProfileButton(), CartButton()],
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ),
        ),
        drawer: MainDrawer(),
        extendBodyBehindAppBar: true,
        backgroundColor: Color.lerp(Colors.orange, Colors.white, 0.9),
        body: InkWell(
          onTap: () => setState(() => _isCollapsed = !_isCollapsed),
          child: Container(
            padding: EdgeInsets.only(top: 70),
            color: RandomColor(1)
                .randomColor(colorHue: ColorHue.red)
                .withOpacity(0.1),
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              children: [
                CategoryDispalyAnimation(isCollapsed: _isCollapsed),
                SizedBox(
                  height: 50,
                ),
                CategoryDispalyAnimation(isCollapsed: _isCollapsed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryDispalyAnimation extends StatelessWidget {
  const CategoryDispalyAnimation({
    Key? key,
    required bool isCollapsed,
  })  : _isCollapsed = isCollapsed,
        super(key: key);

  final bool _isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomAnimation<Color?>(
          curve: Curves.easeIn,
          tween: ColorTween(
              begin: Colors.transparent,
              end:
                  firstColor), //Colors.red.tweenTo(Colors.blue), // define tween
          duration: Duration(milliseconds: 300),
          control: _isCollapsed
              ? CustomAnimationControl.play
              : CustomAnimationControl.playReverse,
          builder: (ctx, child, valueC) => CustomAnimation<double?>(
            curve: Curves.easeIn,
            tween: Tween<double>(
                begin: 1,
                end: 0.25), //Colors.red.tweenTo(Colors.blue), // define tween
            duration: Duration(milliseconds: 300),
            control: _isCollapsed
                ? CustomAnimationControl.play
                : CustomAnimationControl.playReverse,

            builder: (ctx, child, valueH) => Container(
                height: 410.0 * valueH!,
                decoration: BoxDecoration(
                  color: valueC,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        print('ffsicy');
                        Provider.of<ItemProvider>(context, listen: false)
                            .setItemType(ItemType.BAG);
                        Navigator.of(context).pushNamed(ExplCollScreen.route);
                      },
                      child: Center(
                        child: Collapsible(
                          collapsed: !_isCollapsed,
                          axis: CollapsibleAxis.vertical,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.backpack,
                                color: Colors.white,
                              ),
                              Text(
                                'BAGS',
                                style: GoogleFonts.scada(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.backpack,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Collapsible(
                        collapsed: _isCollapsed,
                        axis: CollapsibleAxis.vertical,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 300),
                        child: ListView(
                          padding: EdgeInsets.only(top: 0),
                          physics: NeverScrollableScrollPhysics(),
                          children: [CategoryDisplay()],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )

        //  CategoryDisplay(),
        );
  }
}

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ItemProvider>(context, listen: false)
            .setItemType(ItemType.BAG);
        Navigator.of(context).pushNamed(ExplCollScreen.route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: firstColor,//.  withOpacity(0.6),
            child: Text(
              'BAGS',
              style: GoogleFonts.scada(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            // padding: EdgeInsets.all(10),
            height: 350,
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
                return index != 4
                    ? InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ItemInspectPage.route),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                // Color(0xFF16222A),
                                // Color(0xFF3A6073),
                                RandomColor(index + 1).randomColor(
                                    colorHue: ColorHue.blue,
                                    // colorSaturation:
                                    //     ColorSaturation.lowSaturation,
                                    colorBrightness: ColorBrightness.dark),
                                // .withOpacity(0.5),
                                RandomColor(index + 1).randomColor(
                                    colorHue: ColorHue.blue,
                                    colorSaturation:
                                        ColorSaturation.lowSaturation,
                                    colorBrightness: ColorBrightness.light)
                                // .withOpacity(0.5)
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Stack(
                              children: [
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Proudly Ghanaian Kente',
                                              style: GoogleFonts.lora(
                                                  color: Colors.white,
                                                  fontSize:
                                                      index.isEven ? 16 : 20),
                                            ),
                                            Text(
                                              'always good for a rainy day',
                                              style: GoogleFonts.poiretOne(
                                                  color: Colors.white,
                                                  fontSize:
                                                      index.isEven ? 12 : 16),
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
                        ),
                      )
                    : InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(CustomizeScreen.route),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: RandomColor()
                                      .randomColor(colorHue: ColorHue.red),
                                  // onPressed: () {},
                                ),
                                Text('Build your own design')
                              ],
                            ),
                          ),
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
