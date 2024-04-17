import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Product_Details extends StatefulWidget {
  Map<String, dynamic> pIndex;
  Product_Details(this.pIndex);

  @override
  State<Product_Details> createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  final _ratingController = TextEditingController();

  // List<String> plist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    crouserinit();
  }

  late double _rating;
  void init() {
    // print("object ===========${widget.pIndex["images"]}");
    _rating = double.parse('${widget.pIndex['rating']}');
    // plist = "${widget.pIndex["images"]}" as List<String>;
    setState(() {});
  }

  void crouserinit() {
    print("lengh : ${(widget.pIndex['images'])}");

    String slist = " ${widget.pIndex['images']}";
    String one = slist.replaceAll("[", "");
    String two = one.replaceAll(" ", "");
    String three = two.replaceAll("]", "");
    imagesList = three.split(",");
    print("dgsd =${slist}");
    print("object  vcxbx  =${imagesList}");

    for (int i = 0; i < imagesList.length; i++) {
      print("\n ${imagesList[i]}");
    }
  }

  List<String> imagesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return MyApp();
              },
            ));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 12.0, right: 8, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: Colors.white),
              child: const Center(
                child: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: Colors.white),
              child: const Center(
                child: Icon(
                  CupertinoIcons.share,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                Center(
                  child: Center(
                      child: Image.network(
                    "${widget.pIndex['thumbnail']}",
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.maxFinite,
                  )),
                ),
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 4, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.pIndex['title']}",
                          style: GoogleFonts.aldrich(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 38,
                              width: 165,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Center(
                                child: GFRating(
                                  borderColor: Colors.yellow.shade700,
                                  color: Colors.green,
                                  size: 30,
                                  value: _rating,
                                  onChanged: (value) {
                                    setState(() {
                                      _rating = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 4),
                              child: Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                      "Up to ${widget.pIndex['discountPercentage']} %",
                                      style: GoogleFonts.nunito(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Brand : ${widget.pIndex['brand']}",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Category : ${widget.pIndex['category']}",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GFCarousel(
                            items: imagesList.map(
                              (url) {
                                return Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Image.network(url,
                                        fit: BoxFit.cover, width: 1000.0),
                                  ),
                                );
                              },
                            ).toList(),
                            onPageChanged: (index) {
                              setState(() {
                                index;
                              });
                            },
                          ),
                        ),
                        Text("Description :",
                            style: GoogleFonts.abyssinicaSil(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              letterSpacing: 1.0,
                            )),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${widget.pIndex['description']}",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 6, 0, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.pIndex['discountPercentage']}%",
                    style: GoogleFonts.nunito(
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "\$${widget.pIndex['price']}",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: GFButton(
                color: Colors.green,
                onPressed: () {},
                size: 60,
                child: const Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: Text(
                    "Add to Cart",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
