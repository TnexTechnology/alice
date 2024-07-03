import 'package:alice/model/alice_menu_item.dart';
import 'package:alice/helper/alice_alert_helper.dart';
import 'package:alice/model/alice_sort_option.dart';
import 'package:alice/ui/page/alice_call_details_screen.dart';
import 'package:alice/core/alice_core.dart';
import 'package:alice/model/alice_http_call.dart';
import 'package:alice/utils/alice_constants.dart';
import 'package:alice/ui/widget/alice_call_list_item_widget.dart';
import 'package:flutter/material.dart';

import '../../alice.dart';
import 'alice_stats_screen.dart';

class AliceListLogScreen extends StatefulWidget {
  final AliceCore _aliceCore;

  const AliceListLogScreen(this._aliceCore);

  @override
  _AliceListLogScreenState createState() => _AliceListLogScreenState();
}

class _AliceListLogScreenState extends State<AliceListLogScreen> {
  AliceCore get aliceCore => widget._aliceCore;
  _AliceListLogScreenState() {
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
      widget._aliceCore.directionality ?? Directionality.of(context),
      child: Theme(
        data: ThemeData(
          brightness: widget._aliceCore.brightness,
          colorScheme: ColorScheme.light(secondary: AliceConstants.lightRed),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Log Notification"),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Text(logNotify),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildEmptyWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AliceConstants.orange,
            ),
            const SizedBox(height: 6),
            const Text(
              "There are no calls to show",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "• Check if you send any http request",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "• Check your Alice configuration",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "• Check search filters",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
