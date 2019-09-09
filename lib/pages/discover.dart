/**
 *
 * DiscoverPage
 *
 */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Film {
  final String url;
  final String title;
  final int study;

  Film(this.url, this.title, this.study);
}

List<Film> films = [
  new Film(
      'https://images.pexels.com/photos/2866073/pexels-photo-2866073.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=245&w=182',
      '电影质感滤镜',
      345),
  new Film(
      'https://images.pexels.com/photos/2729421/pexels-photo-2729421.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=245&w=182',
      '复古镜头语言',
      234),
  new Film(
      'https://images.pexels.com/photos/2704048/pexels-photo-2704048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=245&w=182',
      '如何拿捏尺度',
      67),
  new Film(
      'https://images.pexels.com/photos/2872404/pexels-photo-2872404.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=245&w=182',
      '热舞镜头',
      248),
];

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var backgroundColor = Color.fromRGBO(58, 83, 155, 1);
    var body2TextColor = theme.primaryTextTheme.body2.color.withAlpha(0xB2);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TabBar(
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.transparent,
                          labelStyle: TextStyle(fontWeight: FontWeight.w500),
                          unselectedLabelStyle:
                              TextStyle(fontWeight: FontWeight.w300),
                          tabs: [
                            Tab(
                              text: '推荐',
                            ),
                            Tab(
                              text: 'Vlog',
                            ),
                            Tab(
                              text: '抖音热门',
                            ),
                            Tab(
                              text: '拍摄基础',
                            ),
                            Tab(
                              text: '很长很长的内容',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.apps,
                          ),
                          color: body2TextColor,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.insert_comment,
                          ),
                          color: body2TextColor,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                key: PageStorageKey('discover'),
                children: [
                  Container(
                    color: backgroundColor,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Color.fromRGBO(44, 65, 128, 1),
                          padding: EdgeInsets.all(2),
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '''今日
推荐''',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: theme.primaryTextTheme.title.color,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                height: 25,
                                child: VerticalDivider(
                                    thickness: 0.8, color: Colors.white),
                              ),
                              Text(
                                DateFormat("MM.dd").format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 24,
                                  color: theme.primaryTextTheme.title.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 2),
                          child: Text(
                            '胶片画质',
                            style: theme.primaryTextTheme.title.merge(
                              TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Film Quality',
                          style: TextStyle(
                            fontSize: 19,
                            color: body2TextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          height: 300,
                          padding: EdgeInsets.only(top: 36),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: films
                                .map(
                                  (film) => Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            film.url,
                                            fit: BoxFit.cover,
                                            width: 182 / 2,
                                            height: 245 / 2,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 6,
                                          ),
                                          child: Text(
                                            film.title,
                                            style: TextStyle(
                                              color: theme
                                                  .primaryTextTheme.title.color,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${film.study}万人学习",
                                          style: TextStyle(
                                            color: body2TextColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text('Welcome to DiscoverPage'),
              Text('Welcome to DiscoverPage'),
              Text('Welcome to DiscoverPage'),
              Text('Welcome to DiscoverPage'),
            ],
          )),
    );
  }
}
