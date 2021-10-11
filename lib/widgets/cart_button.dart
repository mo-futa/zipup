import 'package:flutter/material.dart';
import 'package:local_print/screens/cart_screen.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pushNamed(CartScreen.route),
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ));
  }
}
