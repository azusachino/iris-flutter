import 'package:flutter/material.dart';
import 'package:iris/model/index.dart';
import 'package:iris/utils/date_util.dart';

// record列表展示子元素
class RecordListItem extends StatelessWidget {
  final Record record;
  final Function(Record) onTapped;

  RecordListItem({Key key, this.record, this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: .5),
          image: DecorationImage(
              image:
                  // 展示当前作品的Key Visual
                  AssetImage("imgs/background.jpg"),
              fit: BoxFit.cover)),
      padding: EdgeInsets.only(top: 50.0),
      child: InkWell(
        splashColor: Theme.of(context).splashColor.withAlpha(30),
        onTap: () => onTapped(record),
        child: Padding(
            padding: EdgeInsets.only(top: 0.0, bottom: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record.name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(.8))),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 12),
                      child: Row(
                        children: [
                          record.season == null
                              ? Text(record.episode)
                              : Row(children: [
                                  Text(
                                    record.season,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 2),
                                  Text(record.episode,
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 16),
                                  Text(formatTimestamp(record.timestamp),
                                      style: TextStyle(color: Colors.white)),
                                ]),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
