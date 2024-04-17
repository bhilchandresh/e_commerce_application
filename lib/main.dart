import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Product_Details.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var url = Uri.https('dummyjson.com', 'products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map m = jsonDecode(response.body);
    l = m['products'];
    print("map===========$m");
    print("l=================$l");
    setState(() {});
  }

  List l = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Discover",
            style: GoogleFonts.alatsi(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: 40,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
              ),
              child: const Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey.shade500,
                ),
                fillColor: Colors.lightBlueAccent.shade100.withOpacity(0.3),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 15),
            child: Container(
              height: 180,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Text(
                          "Clearence\nSales",
                          style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text("Up to 50%",
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "Assets/iphone_14-removebg-preview.png",
                    height: 300,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
              itemCount: l.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, CupertinoPageRoute(
                      builder: (context) {
                        return Product_Details(l[index]);
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 125,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                child: Image.network("${l[index]['thumbnail']}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                            child: Text(
                              style: GoogleFonts.numans(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${l[index]['title']}",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 3, 0, 0),
                            child: Text(
                              style: GoogleFonts.amethysta(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              "USD; ${l[index]['price']}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 51,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(CupertinoIcons.home, size: 30),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Home",
                      style: GoogleFonts.numans(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(CupertinoIcons.search, size: 30),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Search",
                    style: GoogleFonts.numans(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(CupertinoIcons.heart, size: 30),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Favorites",
                    style: GoogleFonts.numans(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(CupertinoIcons.profile_circled, size: 30),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Profile",
                    style: GoogleFonts.numans(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
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
