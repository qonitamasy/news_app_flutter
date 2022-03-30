
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/articles.dart';
import 'package:news_app_flutter/service/data_service.dart';
import 'package:news_app_flutter/utils/utils.dart';

import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar:  AppBar(
        leading: Container (
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C5603AQE01nSH7JQImA/profile-displayphoto-shrink_800_800/0/1617547764581?e=1652313600&v=beta&t=02ylcCNN_V2WyjWX9HRJRE9zuxyIVLhi26Er3ZKkwCg',
              ))
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text ('Good Morning', style: titleArticle.copyWith(
          fontSize: 20
        ),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.bookmark, color: Colors.blue,)
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
            ? NewsPage(snapshot.data as List<Article>)
        //news page ()
              :const Center(child: CircularProgressIndicator())
      ),
    );
    return Container();
  }
}
