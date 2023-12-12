// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lawas_sumbawa/controller/lawas_controller.dart';
import 'package:lawas_sumbawa/model/lawas_model.dart';
import 'package:lawas_sumbawa/pages/details_page.dart';


class Nyorong extends StatefulWidget {
  @override
  _NyorongState createState() => _NyorongState();
}

class _NyorongState extends State<Nyorong> {
  final LawasController _lawasController = LawasController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _lawasController.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<LawasModel> lawasData = snapshot.data as List<LawasModel>;
          return Container(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lawasData.length,
                    itemBuilder: (context, index) {
                      LawasModel model = lawasData[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            child: Image.network(
                                'https://lombokfuntransport.com/lawas_backoffice/${model.image}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lawas",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: lawasData.length,
                      itemBuilder: (context, index) {
                       LawasModel model = lawasData[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(model.id),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    child: Image.network(
                                      'https://lombokfuntransport.com/lawas_backoffice/${model.image}',
                                      width: 70,
                                    ),),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          model.mainTitle,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Zadwi',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Views ${model.hitCount}"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
