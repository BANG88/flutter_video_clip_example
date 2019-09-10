/**
 *
 * DiscoverPage
 *
 */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_clip/widgets/carousel.dart';
import 'package:video_clip/widgets/vlog.dart';

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
      '人物镜头',
      248),
];

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var backgroundColor = Color.fromRGBO(58, 83, 155, 1);
    var body2TextColor = theme.primaryTextTheme.body2.color.withAlpha(0xB2);

    var actions = [
      {
        'icon': 'assets/icons/1.jpg',
        'title': '听书',
      },
      {
        'icon': 'assets/icons/2.jpg',
        'title': '漫画',
      },
      {
        'icon': 'assets/icons/3.jpg',
        'title': '视频',
      },
      {
        'icon': 'assets/icons/4.jpg',
        'title': '游戏',
      },
      {
        'icon': 'assets/icons/5.jpg',
        'title': '活动',
      },
    ];
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
                          Icons.add_comment,
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
            Container(
              color: backgroundColor,
              padding: EdgeInsets.only(
                top: 26,
              ),
              child: ListView(
                key: PageStorageKey('discover'),
                children: [
                  // film quality
                  Container(
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
                          height: 230,
                          padding: EdgeInsets.only(top: 36),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: films
                                .map(
                                  (film) => Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            film.url,
                                            fit: BoxFit.cover,
                                            width: 90,
                                            height: 120,
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
                                        RichText(
                                          text: TextSpan(
                                            text: "${film.study} ",
                                            style: TextStyle(
                                              color: Color(0xffefd0d3),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "万人学习",
                                                style: TextStyle(
                                                  color: body2TextColor,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
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
                  ),
                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(8.0),
                            topRight: const Radius.circular(8.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            top: 36,
                            left: 24,
                            right: 24,
                            bottom: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: actions
                                .map(
                                  (a) => InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          a['icon'],
                                          height: 27,
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6.0),
                                          child: Text(
                                            a['title'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        CarouselWidget(),
                        VlogWidget()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text('Welcome to DiscoverPage'),
            Text('Welcome to DiscoverPage'),
            Text('Welcome to DiscoverPage'),
            Text('Welcome to DiscoverPage'),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add',
          child: new Icon(Icons.camera_roll),
          elevation: 3.0,
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.video_library,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.picture_in_picture_alt,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(child: new Text('')),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.store,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
