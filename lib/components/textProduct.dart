import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

const t =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec purus nunc. Curabitur sed eros est. Quisque et enim vitae nisl ultricies ullamcorper in dictum arcu. Aliquam mauris justo, tempor a hendrerit non, iaculis sed mauris. Nulla facilisi. Integer varius lacus et scelerisque cursus. Orci varius natoque ';

Widget textProduct({text = t}) {
  return AutoSizeText(
    text,
    style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(.6)),
    maxFontSize: 25,
    textAlign: TextAlign.justify,
    minFontSize: 13,
  );
}
