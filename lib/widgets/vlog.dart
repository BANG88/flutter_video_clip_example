/**
 *
 * VlogWidget
 *
 */
import 'package:flutter/material.dart';
import 'package:video_clip/pages/discover.dart';

class VlogWidget extends StatefulWidget {
  @override
  _VlogWidgetState createState() => _VlogWidgetState();
}

class _VlogWidgetState extends State<VlogWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '制作专属于你的 Vlog',
            style: theme.primaryTextTheme.title.merge(
              TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Text(
            '20个推荐',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: 36,
            ),
            children: films
                .map(
                  (film) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          film.url,
                          fit: BoxFit.cover,
                          width: 160,
                          height: 110,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                        ),
                        child: Text(
                          film.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "${film.study} 万人学习",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
