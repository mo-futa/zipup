import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/screens/cart_screen.dart';
import 'package:local_print/screens/expl_coll_screen.dart';
import 'package:local_print/main.dart';
import 'package:random_color/random_color.dart';

class ItemInspectPage extends StatelessWidget {
  const ItemInspectPage({Key? key}) : super(key: key);
  static const String route = 'item-inspect-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'item inspect page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color.lerp(Colors.orange, Colors.white, 0.92),
      body: Padding(
        padding: EdgeInsets.only(top: 70, bottom: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/place_holder.png',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'save',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt,
                            color: Colors.black.withOpacity(0.5),
                            size: 20,
                          ),
                          Text(
                            '145',
                            style: TextStyle(fontSize: 10),
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
                            color: Colors.black.withOpacity(0.5),
                            size: 20,
                          ),
                          Text(
                            '145',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black.withOpacity(0.5))),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(CartScreen.route),
                    child: Text(
                      'buy',
                      style:
                          GoogleFonts.lora(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'price: Ghc43.33',
                style: GoogleFonts.adamina(
                    color: Colors.black.withOpacity(0.5), fontSize: 20),
              ),
             SizedBox(
                height: 20,
              ),
              Text(
                'Proudly Ghanaian Kente',
                style: GoogleFonts.lora(
                    color: Colors.black.withOpacity(0.5), fontSize: 20),
              ),
             SizedBox(
                height: 10,
              ),
              Text(
                'always good for a rainy day.always good for a rainy day.always good for a rainy day.always good for a rainy day.always good for a rainy day.always good for a rainy dayalways good for a rainy dayalways good for a rainy dayalways good for a rainy dayalways good for a rainy day',
                style: GoogleFonts.poiretOne(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/african.jpg',
                ),
              ),
              // Expanded(
              //     child: Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(15),
              //       ),
              //       color: Color.lerp(firstColor, Colors.black, 0.5)
              //       // RandomColor().randomColor(
              //       //     colorHue: ColorHue.red,
              //       //     colorBrightness: ColorBrightness.dark),
              //       ),
              //   child: Container(
              //     // width: double.infinity,
              //     padding: EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(15),
              //       ),
              //       border: Border.all(color: Colors.white),
              //       // border: Border(
              //       //   top: BorderSide(
              //       //     color: Colors.white,
              //       //   ),
              //       //   left: BorderSide(
              //       //     color: Colors.white,
              //       //   ),
              //       //   right: BorderSide(
              //       //     color: Colors.white,
              //       //   ),
              //       // )
              //     ),

              //     child: Column(
              //       children: [
              // Text(
              //   'price: Ghc43.33',
              //   style: GoogleFonts.adamina(
              //       color: Colors.white, fontSize: 20),
              // ),
              // Text(
              //   'Proudly Ghanaian Kente',
              //   style:
              //       GoogleFonts.lora(color: Colors.white, fontSize: 20),
              // ),
              // Text(
              //   'always good for a rainy day',
              //   style: GoogleFonts.poiretOne(
              //       color: Colors.white, fontSize: 16),
              // ),
              // SizedBox(
              //   height: 100,
              //   child: Image.asset(
              //     'assets/african.jpg',
              //   ),
              // ),
              // Expanded(child: SizedBox()),
              // ElevatedButton(
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateColor.resolveWith(
              //           (states) => Colors.black.withOpacity(0.5))),
              //   onPressed: () =>
              //       Navigator.of(context).pushNamed(CartScreen.route),
              //   child: Text(
              //     'buy',
              //     style:
              //         GoogleFonts.lora(color: Colors.white, fontSize: 20),
              //   ),
              // )
              //       ],
              //     ),
              //   ),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
