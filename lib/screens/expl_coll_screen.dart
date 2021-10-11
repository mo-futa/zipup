import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_print/main.dart';
//if user chooses hoodies, display the hoodies
//if user is not signed in display pease sign in at collections page
import 'package:local_print/widgets/cart_button.dart';
import 'package:local_print/widgets/main_drawer.dart';

import 'customize_screen.dart';
import 'item_inspect_screen.dart';

class ExplCollScreen extends StatelessWidget {
  static const String route = 'expl-Coll';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.lerp(Colors.orange, Colors.white, 0.9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          title: Text(
            'expl-coll',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ),
          actions: [CartButton()],
          bottom: TabBar(tabs: [
            Text(
              'Explore',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Collection',
              style: TextStyle(color: Colors.black),
            )
          ]),
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBarView(children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return index != 4
                    ? InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ItemInspectPage.route),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      secondColor,
                                      firstColor,
                                    ]),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                                child: Transform.translate(
                                  offset: Offset(0, 1),
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        top: 5, left: 5, right: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(25)),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/place_holder.png',
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Proudly Ghanaian Kente',
                                                  style: GoogleFonts.lora(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  'always good for a rainy day',
                                                  style: GoogleFonts.poiretOne(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: firstColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(25))),
                                child: Transform.translate(
                                  offset: Offset(0, 0),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(
                                        top: 0, left: 5, right: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25)),
                                      border: Border.all(color: firstColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Icon(
                                          Icons.favorite,
                                          color: secondColor,
                                        ),
                                      
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.thumb_up_alt,
                                                  color: firstColor,size: 20,
                                                ),Text('145',style: TextStyle(fontSize: 10),)
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
                                                  color: firstColor,size: 20,
                                                ),Text('145',style: TextStyle(fontSize: 10),)
                                              ],
                                            ),
                                          
                                          ],
                                        ),
                                         Icon(
                                          Icons.shopping_cart,
                                          color: firstColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Advert space')],
                          ),
                        ),
                      );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return index != 4
                    ? InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ItemInspectPage.route),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      secondColor,
                                      firstColor,
                                    ]),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                                child: Transform.translate(
                                  offset: Offset(0, 1),
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        top: 5, left: 5, right: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(25)),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/place_holder.png',
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Proudly Ghanaian Kente',
                                                  style: GoogleFonts.lora(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  'always good for a rainy day',
                                                  style: GoogleFonts.poiretOne(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: firstColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(25))),
                                child: Transform.translate(
                                  offset: Offset(0, 0),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(
                                        top: 0, left: 5, right: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25)),
                                      border: Border.all(color: firstColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: secondColor,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: firstColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Advert space')],
                          ),
                        ),
                      );
              },
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(CustomizeScreen.route)),
      ),
    );
  }
}
