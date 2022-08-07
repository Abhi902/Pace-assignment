import 'package:flutter/material.dart';
import 'package:mi_card/constants/constants.dart';
import 'package:mi_card/model/model.dart';
import 'package:mi_card/newsdata/news.dart';
import 'package:mi_card/screens/content.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                      content: articles[index].content,
                      url: articles[index].url,
                    );
                  }),
            ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  String imageurl;
  String headline;
  String content;
  String source;
  String url;
  DateTime time;

  ReusableCard(
      {this.imageurl,
      this.headline,
      this.time,
      this.source,
      this.content,
      this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => info(
              blogurl: imageurl,
              source: this.source,
              content: this.content,
              published: this.time,
              headline: this.headline,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
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
                  child: CachedNetworkImage(
                    imageUrl: '$imageurl',
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
                top: 90,
                left: 20,
                right: 20,
                bottom: 30,
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
                left: 180,
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
    );
  }
}
