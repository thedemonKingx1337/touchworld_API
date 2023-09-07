import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_001/detailspage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sqfdatabase.dart';

class RepoTile extends StatelessWidget {
  final List<Map<String, dynamic>> userData;

  RepoTile(this.userData);

  void NavDetailsPage(BuildContext context, index) {
    Navigator.of(context).pushNamed(DetailsPage.detailsProduct, arguments: {
      "name": userData[index]["name"].toString(),
      "brand": userData[index]["brand"].toString(),
      "image": userData[index]["image"].toString(),
      "price": userData[index]["price"].toString(),
      "description": userData[index]["description"].toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userData.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => NavDetailsPage(context, index),
                  child: Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, top: 2, bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[200],
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              height: 100,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      userData[index]["image"]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8, bottom: 5),
                                  child: Text(
                                    userData[index]["name"].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Description: ${userData[index]["description"].toString()}',
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, right: 2, bottom: 5),
                                      child: Icon(
                                        FontAwesomeIcons.dollarSign,
                                        color: Colors.green[500],
                                        size: 15,
                                      ),
                                    ),
                                    Text(userData[index]["price"].toString())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () async {
                          final id = await SQLHelper.AddNewUser(
                            userData[index]["name"],
                            userData[index]["description"],
                            userData[index]["price"].toString(),
                            userData[index]["brand"],
                          );

                          if (id != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to favorites')),
                            );
                          }
                        },
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.redAccent,
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
