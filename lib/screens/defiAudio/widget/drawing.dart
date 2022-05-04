import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';

class Dessin extends StatefulWidget {
  const Dessin({Key? key, required this.bgPath, this.bgFile, required this.gKey}) : super(key: key);
  final String bgPath;
  final File? bgFile;
  final GlobalKey<ImagePainterState> gKey;

  @override
  _DessinState createState() => _DessinState();
}

class _DessinState extends State<Dessin> {
  @override
  Widget build(BuildContext context) {
    return (widget.bgFile == null)?
      ImagePainter.asset(
        widget.bgPath,
        key: widget.gKey,
        scalable: true,
        initialStrokeWidth: 2,
        //textDelegate: DutchTextDelegate(),
        initialColor: Colors.green,
        initialPaintMode: PaintMode.freeStyle,
      )
        :
      ImagePainter.file(
          widget.bgFile!,
        key: widget.gKey,
        scalable: true,
        initialStrokeWidth: 2,
        //textDelegate: DutchTextDelegate(),
        initialColor: Colors.green,
        initialPaintMode: PaintMode.freeStyle,
      );
  }
}