import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:shop/models/product.dart';

class PreviewScreen extends StatefulWidget {
  static const String routeName = '/preview';

  final Product product;

  const PreviewScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelViewer(
        src: widget.product.urlModel.toString(),
        ar: true,
        autoRotate: true,
        cameraControls: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
