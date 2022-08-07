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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => info(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      '$imageurl',
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 12,
                ),
                Positioned(
                  top: 180,
                  left: 10,
                  child: Text(
                    '$source',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'RobotoSlab',
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Text(
                    "$headline",
                    maxLines: 7,
                    style: ktextstyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Positioned(
                  top: 180,
                  left: 100,
                  child: Text(
                    '$time',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'RobotoSlab',
                        fontSize: 14,
                        color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*GestureDetector(
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

                  height: 350,
                  width: 350,
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
    );*/
