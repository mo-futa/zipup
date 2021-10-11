import 'package:flutter/material.dart';
import 'package:local_print/main.dart';
import 'package:local_print/screens/orders_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String route = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Screen',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Clear',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
        toolbarHeight: 60,
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
      backgroundColor: Color.lerp(Colors.orange, Colors.white, 0.9),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 80, bottom: 8, left: 8, right: 8),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.lerp(Colors.orange, Colors.white, 0.9),
                      boxShadow: [BoxShadow()]),
                  height: 200,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.lerp(firstColor, Colors.white, 0.3),
                            // RandomColor().randomColor(
                            //     colorHue: ColorHue.pink,
                            //     colorSaturation: ColorSaturation.lowSaturation,
                            //     colorBrightness: ColorBrightness.light),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: Image.asset(
                          'assets/place_holder.png',
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'price: Ghc 45.00',
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 20,
                            ),
                          ),
                          // Text(
                          //   'cloth price: Ghc 45.00',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     // fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   'bag price: Ghc 45.00',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     // fontSize: 20,
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'delivery time: 4days',
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 20,
                            ),
                          ),
                          // Expanded(child: SizedBox()),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'quantity: 3',
                                style: TextStyle(color: Colors.black
                                    // fontSize: 20,
                                    ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.keyboard_arrow_up),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.keyboard_arrow_down),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Color.lerp(Color(0xFF3A6073), Colors.black, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: Ghc 45.00',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black.withOpacity(0.5))),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('pay up motherfucker'),
                            content: Text('credit card'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Navigator.of(context).pop();
                                  },
                                  child: Text('no')),
                              TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .popAndPushNamed(OrdersScreen.route),
                                  child: Text('pay'))
                            ],
                          ),
                        );
                        // Scaffold.of(context)
                        //     .showBottomSheet((context) => BottomSheet(
                        //           onClosing: () {},
                        //           builder: (context) => Container(
                        //             height:200,
                        //             alignment: Alignment.center,
                        //             child: Text(
                        //                 'make payment,add card credit card bla bla'),
                        //           ),
                        //         ));
                      },
                      child: Text('Pay'),
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
