import 'package:flutter/material.dart';
import 'package:lawas_sumbawa/model/book_model.dart';
import 'package:lawas_sumbawa/widget/book_widget.dart';

class Nyorong extends StatefulWidget {
  @override
  _NyorongState createState() => _NyorongState();
}

class _NyorongState extends State<Nyorong> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nyorong.length,
              itemBuilder: (context, index) {
                BookModel model = nyorong[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      child: Image.asset(model.image),
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
                itemCount: nyorong.length,
                itemBuilder: (context, index) {
                  BookModel model = nyorong[index];
                  return BookWidget(model);
                }),
          ))
        ],
      ),
    );
  }
}
