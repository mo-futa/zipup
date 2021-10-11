import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:simple_animations/simple_animations.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const String route = 'orders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   TextButton(
        //       onPressed: () {},
        //       child: Text(
        //         'Clear',
        //         style: TextStyle(color: Colors.black, fontSize: 20),
        //       ))
        // ],
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {

            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            
            }, 
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => OrderItem(),
        ),
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  const OrderItem({
    Key? key,
  }) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

bool isExpanded = false;

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isExpanded = !isExpanded);
        Future.delayed(Duration(seconds: 30))
            .then((value) => setState(() => isExpanded = false));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow()],
        ),
        child: Column(
          children: [
            CustomAnimation<double?>(
              duration: Duration(milliseconds: 300),
              control: isExpanded
                  ? CustomAnimationControl.play
                  : CustomAnimationControl.playReverse,
              tween: Tween<double>(begin: 1, end: 100),
              builder: (context, child, value) => SizedBox(
                height: 220 * value! / 100,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => Row(
                    children: [
                      const OrderPageViewItem(),
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
                          SizedBox(height: 10),
                          Text(
                            'quantity: 3',
                            style: TextStyle(color: Colors.black
                                // fontSize: 20,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            OrderItemBar()
          ],
        ),
      ),
    );
  }
}

class OrderPageViewItem extends StatelessWidget {
  const OrderPageViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: RandomColor().randomColor(
              colorHue: ColorHue.pink,
              colorSaturation: ColorSaturation.lowSaturation,
              colorBrightness: ColorBrightness.light),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
      child: Image.asset(
        'assets/place_holder.png',
      ),
    );
  }
}

class OrderItemBar extends StatelessWidget {
  const OrderItemBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 121,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: RandomColor(1)
              .randomColor(colorHue: ColorHue.red)
              .withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'order id: x432v',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 20,
              ),
            ),
            Text(
              'total: Ghc 45.00',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 20,
              ),
            ),
            Text(
              'oder date: 24/12/2021',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 20,
              ),
            ),
            Text(
              'delivery date: 27/12/2021',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 20,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  thickness: 2,
                ),
                CircleAvatar(
                  radius: 2,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'processing',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'completed',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'on delivery',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
