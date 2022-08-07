import 'package:flutter/material.dart';
import 'package:mi_card/constants/constants.dart';
import 'package:mi_card/model/model.dart';
import 'package:mi_card/newsdata/news.dart';
import 'package:mi_card/screens/content.dart';

class headlines extends StatefulWidget {
  @override
  State<headlines> createState() => _headlinesState();
}

bool loading = true;
List<ArticleModel> articles;

class _headlinesState extends State<headlines> {
  void initState() {
    super.initState();
    loading = true;
    givevalues();
  }

  void givevalues() async {
    News newsclass = News();
    await newsclass.getdata();
    articles = newsclass.news;

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff464646),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'HEADLINE',
            style: ktextstyle,
          ),
        ),
      ),
      body: loading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : Container(
              child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ReusableCard(
                      imageurl: articles[index].urltoimage,
                      headline: articles[index].headline,
                      source: articles[index].source,
                      time: articles[index].published,
                    );
                  }),
            ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  String imageurl;
  String headline;
  String source;
  DateTime time;

  ReusableCard({this.imageurl, this.headline, this.time, this.source});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => info()));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  '$imageurl',
                  height: 150,
                  width: 150,
                ),
              ),
              Text(
                "$headline",
                maxLines: 7,
                style: ktextstyle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$source',
                      style: ktextstyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '$time',
                      style: TextStyle(
                          fontFamily: 'RobotoSlab',
                          fontSize: 14,
                          color: Colors.white70),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
