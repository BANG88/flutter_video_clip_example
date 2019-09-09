/**
 *
 * VlogWidget
 *
 */
import 'package:flutter/material.dart';

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
        children: <Widget>[
          Text(
            '制作专属于你的 Vlog',
            style: theme.primaryTextTheme.title.merge(
              TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
