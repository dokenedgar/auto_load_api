import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperLink extends StatelessWidget {
  const HyperLink(this._url, this._text);

  final String _url;
  final String _text;

  Future<void> _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        _text,
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: _launchURL,
    );
  }
}
