import 'package:flutter/material.dart';

import '../../utils/categories.dart';

class cardscreen extends StatefulWidget {
  const cardscreen({super.key});

  @override
  State<cardscreen> createState() => _cardscreenState();
}

class _cardscreenState extends State<cardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Icon(Icons.arrow_back_sharp)),
        title: Text(
          'My card',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      cardlist.length,
                      (index) => cart(
                          name: cardlist[index]['name'],
                          prize: cardlist[index]['price'],
                          img: cardlist[index]['img'],
                          index: index))),
            ),
          ),
          Center(
            child: Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Prodect Amount :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                            letterSpacing: 1.5,
                            wordSpacing: 2),
                      ),
                      Text(
                        '\$ $count',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.5,
                            wordSpacing: 2),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Delivery price :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                            letterSpacing: 1.5,
                            wordSpacing: 2),
                      ),
                      Text(
                        '\$ 0.0',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.5,
                            wordSpacing: 2),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 82.0),
                        child: Text(
                          'Amount :',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              wordSpacing: 2),
                        ),
                      ),
                      Text(
                        '\$ $count',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.5,
                            wordSpacing: 2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Center(
                        child: Text('checkout',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cart({String? img, String? name, int? prize, int? index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(img!),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 18.0),
                        child: Text(
                          name!,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 145.0),
                  child: Text(
                    '\$ $prize',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          cardlist.removeAt(index!);
                          count = 0;
                          for (int i = 0; i < cardlist.length; i++) {
                            count += (cardlist[i]['price'] *
                                cardlist[i]['quantity']);
                          }
                        });
                      },
                      icon: Icon(Icons.delete_outline)),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    count = 0;
                                    for (int i = 0; i < cardlist.length; i++) {
                                      if(cardlist[i]['quantity']>0)
                                      {
                                        count += (cardlist[i]['price'] *
                                            cardlist[i]['quantity']);
                                      }
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 15,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('${cardlist[index!]['quantity']}'),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    count = 0;
                                    for (int i = 0; i < cardlist.length; i++) {
                                      count += (cardlist[i]['price'] *
                                          cardlist[i]['quantity']);
                                    }
                                    cardlist[index]['quantity']++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 15,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

double count = 0;
