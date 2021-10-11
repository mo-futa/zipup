import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/screens/cart_screen.dart';
import 'package:local_print/screens/expl_coll_screen.dart';

class ClothInspectPage extends StatelessWidget {
  const ClothInspectPage({Key? key}) : super(key: key);
  static const String route = 'cloth-inspect-page';

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
            onPressed: () => Navigator.of(context).pop(),
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
              Image.asset(
                'assets/african.jpg',
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'save',
                  //     style: TextStyle(
                  //         color: Colors.black.withOpacity(0.5), fontSize: 18),
                  //   ),
                  // ),
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
            ],
          ),
        ),
      ),
    );
  }
}
