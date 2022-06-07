import 'package:flutter/material.dart';

class all extends StatefulWidget {
  const all({Key? key}) : super(key: key);

  @override
  State<all> createState() => _allState();
}

class _allState extends State<all> {
  List<model> lst = [
    model(
      image: "image/lat.jpg",
      flat: ' ⦿ Flat 15-25% OFF ',
      pro: " ⦿ PRO ",
      rate: ' 4.5 ★ ',
      top: ' ★ Top Rated  ',
      title: 'La Tavern gril',
      subtitle: 'Japanese, Korean',
    ),
    model(
      image: "image/chi.jpg",
      flat: ' ⦿ FLAT 15-20% OFF ',
      pro: '',
      rate: ' 3.5 ★ ',
      top: ' 💗 Frequently Ordered  ',
      title: 'Asian Food Haus',
      subtitle: 'Asian, Chinese',
    ),
    model(
      image: "image/pizza.jpg",
      flat: ' ⦿ FLAT 10-25% OFF ',
      pro: ' ⦿ PRO',
      rate: ' 4.5 ★ ',
      top: ' ★ Top Rated  ',
      title: 'Pizza',
      subtitle: 'Asian Italian',
    ),
    model(
      image: "image/pasta.jpg",
      flat: ' ⦿ FLAT 5-7% OFF ',
      pro: " ",
      rate: ' 4.0 ★ ',
      top: ' 💗 Frequently Ordered  ',
      title: 'Cuisine Pasta',
      subtitle: 'Asian Italian',
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                children: [
                  Text("  Order Again",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 20,
                        child: Text("see all",
                            style: TextStyle(
                                fontSize: 15, color: Colors.pink[600]))),
                  ),
                ],
              ),
            ),
            Container(
              height: 180,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 1),
                                            child: Text(
                                              ' PRO ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  backgroundColor:
                                                      Colors.red[900]),
                                            )),
                                        margin: EdgeInsets.all(10),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage('image/dosa.jpg'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 70,
                                    width: 90,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Dosa',
                                            style: TextStyle(fontSize: 18)),
                                        Text('20 mins',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey)),
                                        Text('25% off',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('image/Sandwich.jpg'),
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 70,
                                  width: 90,
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Sandwich',
                                          style: TextStyle(fontSize: 18),
                                          overflow: TextOverflow.ellipsis),
                                      Text('20 mins',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey)),
                                      Text('15% off',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('image/vadapav.jpg'),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 70,
                                    width: 90,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Vadapav',
                                            style: TextStyle(fontSize: 18)),
                                        Text('30 mins',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey)),
                                        Text('30% off',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      child: Container(
                                          margin:
                                              EdgeInsets.only(top: 10, left: 1),
                                          child: Text(
                                            ' PRO ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                backgroundColor:
                                                    Colors.red[900]),
                                          )),
                                      margin: EdgeInsets.all(10),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('image/burger.jpg'),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 70,
                                  width: 90,
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Burger',
                                          style: TextStyle(fontSize: 18)),
                                      Text('10 mins',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey)),
                                      Text('25% off',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('image/rice.jpg'),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 70,
                                    width: 90,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Rice',
                                            style: TextStyle(fontSize: 18)),
                                        Text('5 mins',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey)),
                                        Text('10% off',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('image/samosa.jpg'),
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 70,
                                  width: 90,
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Samosa',
                                          style: TextStyle(fontSize: 18),
                                          overflow: TextOverflow.ellipsis),
                                      Text('25 mins',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey)),
                                      Text('35% off',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[100],
                            // image: DecorationImage(
                            //   image: AssetImage(
                            //     'image/saved.jpg',
                            //   ),
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 70,
                          child: Icon(Icons.save_outlined)
                          // color: Colors.white,
                          ),
                      Column(
                        children: [
                          Text('Saved \n Places',
                              style: TextStyle(color: Colors.grey[700]),
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                          image: DecorationImage(
                            image: AssetImage(
                              'image/pro.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 70,
                        // color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text('PRO \n Partners',
                              style: TextStyle(color: Colors.grey[700]),
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('image/offer.jpg'),
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 70,
                        // color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text('Great \n Offers',
                              style: TextStyle(color: Colors.grey[700]),
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(
                              'image/star.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 70,
                        // color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text('Top \n Rated',
                              style: TextStyle(color: Colors.grey[700]),
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                          image: DecorationImage(
                            image: AssetImage(
                              'image/diamond.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 70,
                        // color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text(
                            'Premium \nPics',
                            style: TextStyle(color: Colors.grey[700]),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('image/chicken.jpg'))),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '''  Based on what you like''',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          ' Chicken Dumplings',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    //width: 120,
                    margin: EdgeInsets.only(right: 10),
                    child: Text('see all',
                        style: TextStyle(
                          color: Colors.pink,
                        )),
                  )
                ],
              ),
            ),

            GridView.builder(
                itemCount: lst.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 243,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 5, top: 10, bottom: 5, right: 5),
                    alignment: Alignment.center,
                    // height: size.height * 0.25,
                    // width: size.width * 0.06,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: size.height * 0.20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(lst[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.elliptical(5, 5),
                                                bottomRight:
                                                    Radius.elliptical(5, 5)),
                                            color: Colors.white),
                                        child: Text(lst[index].top,
                                            style: TextStyle(
                                              color: Colors.orange[800],
                                              // backgroundColor: Colors.white
                                            )),
                                      ),
                                    ),
                                    Container(
                                      // width: size.width * 0.35,
                                      margin:
                                          EdgeInsets.only(right: 60, top: 65),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.elliptical(5, 5),
                                            bottomRight:
                                                Radius.elliptical(5, 5)),
                                      ),
                                      child: Text(
                                        lst[index].flat,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, right: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: lst[index].pro != ''
                                                  ? Colors.red[400]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight: Radius
                                                          .elliptical(5, 5),
                                                      bottomRight:
                                                          Radius.elliptical(
                                                              5, 5)),
                                            ),
                                            child: Text(
                                              lst[index].pro,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: size.width * 0.05,
                                            decoration: BoxDecoration(
                                              color: Colors.green[500],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              lst[index].rate,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 3, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lst[index].title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                lst[index].subtitle,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Stack(children: [
            //           Container(
            //             margin: EdgeInsets.only(top: 10, left: 10, right: 5),
            //             height: 200,
            //             width: 190,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: AssetImage('image/lat.jpg'))),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.black12,
            //               ),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     height: 25,
            //                     margin: EdgeInsets.only(top: 10, right: 70),
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Text(' ★ Top Rated   ',
            //                         style: TextStyle(
            //                           color: Colors.orange[800],
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     margin: EdgeInsets.only(
            //                       top: 90,
            //                       right: 50,
            //                     ),
            //                     decoration: BoxDecoration(
            //                         color: Colors.blue,
            //                         borderRadius: BorderRadius.only(
            //                             bottomRight: Radius.elliptical(5, 5),
            //                             topRight: Radius.elliptical(5, 5))),
            //                     child: Text('  ⦿ Flat 15-20% OFF     ',
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 10,
            //                           //   right: 120,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.red[400],
            //                             borderRadius: BorderRadius.only(
            //                                 bottomRight:
            //                                     Radius.elliptical(5, 5),
            //                                 topRight: Radius.elliptical(5, 5))),
            //                         child: Text('  ⦿ PRO  ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                       Spacer(),
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 10,
            //                           right: 10,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.green[500],
            //                             borderRadius: BorderRadius.circular(5)),
            //                         child: Text(' 4.5★ ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ]),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Le Tavern Gril',
            //                   style: TextStyle(
            //                       fontSize: 20, fontWeight: FontWeight.bold)),
            //               Text('Japanese,Korean',
            //                   style:
            //                       TextStyle(fontSize: 15, color: Colors.grey)),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Spacer(flex: 1),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Stack(children: [
            //           Container(
            //             margin: EdgeInsets.only(top: 10, left: 5, right: 10),
            //             height: 200,
            //             width: 190,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: AssetImage('image/chi.jpg'))),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.black12,
            //               ),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     alignment: Alignment.center,
            //                     height: 25,
            //                     margin: EdgeInsets.only(
            //                         top: 10, right: 10, left: 10),
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Text(' 💗 Frequently Ordered   ',
            //                         style: TextStyle(
            //                           color: Colors.pink[500],
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Stack(children: [
            //                     Container(
            //                       height: 25,
            //                       margin: EdgeInsets.only(
            //                         top: 110,
            //                         right: 65,
            //                       ),
            //                       decoration: BoxDecoration(
            //                           color: Colors.blue,
            //                           borderRadius: BorderRadius.only(
            //                               bottomRight: Radius.elliptical(5, 5),
            //                               topRight: Radius.elliptical(5, 5))),
            //                       child: Text('  ⦿  Flat 15-20% OFF  ',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             //backgroundColor: Colors.white
            //                           )),
            //                     ),
            //                     Container(
            //                       height: 25,
            //                       margin: EdgeInsets.only(
            //                         top: 120,
            //                         left: 130,
            //                       ),
            //                       decoration: BoxDecoration(
            //                           color: Colors.green[500],
            //                           borderRadius: BorderRadius.circular(5)),
            //                       child: Text(' 3.5★ ',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             //backgroundColor: Colors.white
            //                           )),
            //                     ),
            //                   ]),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ]),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Asian Food Haus',
            //                   style: TextStyle(
            //                       fontSize: 20, fontWeight: FontWeight.bold)),
            //               Text('Asian,Chinese',
            //                   style:
            //                       TextStyle(fontSize: 15, color: Colors.grey)),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Stack(children: [
            //           Container(
            //             margin: EdgeInsets.only(top: 10, left: 10, right: 5),
            //             height: 200,
            //             width: 190,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: AssetImage('image/pizza.jpg'))),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.black12,
            //               ),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     height: 25,
            //                     margin: EdgeInsets.only(top: 10, right: 70),
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Text(' ★ Top Rated   ',
            //                         style: TextStyle(
            //                           color: Colors.orange[800],
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     margin: EdgeInsets.only(
            //                       top: 90,
            //                       right: 50,
            //                     ),
            //                     decoration: BoxDecoration(
            //                         color: Colors.blue,
            //                         borderRadius: BorderRadius.only(
            //                             bottomRight: Radius.elliptical(5, 5),
            //                             topRight: Radius.elliptical(5, 5))),
            //                     child: Text('  ⦿ Flat 15-20% OFF     ',
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 10,
            //                           //   right: 120,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.red[400],
            //                             borderRadius: BorderRadius.only(
            //                                 bottomRight:
            //                                     Radius.elliptical(5, 5),
            //                                 topRight: Radius.elliptical(5, 5))),
            //                         child: Text('  ⦿ PRO  ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                       Spacer(),
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 10,
            //                           right: 10,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.green[500],
            //                             borderRadius: BorderRadius.circular(5)),
            //                         child: Text(' 4.5★ ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ]),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Pizza',
            //                   style: TextStyle(
            //                       fontSize: 20, fontWeight: FontWeight.bold)),
            //               Text('Asian,Italian',
            //                   style:
            //                       TextStyle(fontSize: 15, color: Colors.grey)),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Spacer(flex: 1),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Stack(children: [
            //           Container(
            //             margin: EdgeInsets.only(top: 10, left: 5, right: 10),
            //             height: 200,
            //             width: 190,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: AssetImage('image/pasta.jpg'))),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.black12,
            //               ),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     alignment: Alignment.center,
            //                     height: 25,
            //                     margin: EdgeInsets.only(
            //                         top: 10, right: 10, left: 10),
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Text(' 💗 Frequently Ordered   ',
            //                         style: TextStyle(
            //                           color: Colors.pink[500],
            //                           //backgroundColor: Colors.white
            //                         )),
            //                   ),
            //                   Stack(
            //                     children: [
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 110,
            //                           right: 65,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.blue,
            //                             borderRadius: BorderRadius.only(
            //                                 bottomRight:
            //                                     Radius.elliptical(5, 5),
            //                                 topRight: Radius.elliptical(5, 5))),
            //                         child: Text('  ⦿  Flat 15-20% OFF  ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                       Container(
            //                         height: 25,
            //                         margin: EdgeInsets.only(
            //                           top: 125,
            //                           left: 130,
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: Colors.green[500],
            //                             borderRadius: BorderRadius.circular(5)),
            //                         child: Text(' 4.0★ ',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               //backgroundColor: Colors.white
            //                             )),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ]),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('cuisine Pasta',
            //                   style: TextStyle(
            //                       fontSize: 20, fontWeight: FontWeight.bold)),
            //               Text('Asian,Italian',
            //                   style:
            //                       TextStyle(fontSize: 15, color: Colors.grey)),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class model {
  final String image;
  final String flat;
  final String rate;
  final String pro;
  final String top;
  final String title;
  final String subtitle;

  model({
    required this.image,
    required this.flat,
    required this.rate,
    required this.pro,
    required this.top,
    required this.title,
    required this.subtitle,
  });
}
