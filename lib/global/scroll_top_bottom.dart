import 'package:flutter/material.dart';

late ScrollController scrollController;

class ScrollTopBottom extends StatefulWidget {
  const ScrollTopBottom({Key? key}) : super(key: key);
  @override
  State<ScrollTopBottom> createState() => _ScrollTopBottomState();
}

class _ScrollTopBottomState extends State<ScrollTopBottom>
    with SingleTickerProviderStateMixin {
  // final double _height = 100.0;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    //
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    //
    scrollController.addListener(() {
      debugPrint('_maxScroll = $_maxScroll');
      debugPrint('_maxPixels = $_maxPixels');
      if (_maxScroll == _maxPixels) {
        _iconData = Icons.arrow_circle_up_sharp;
        _animationController.forward();
        setState(() {});
      } else {
        _animationController.reverse();
        _iconData = Icons.vertical_align_bottom;
        setState(() {});
      }
    });
  }

  IconData _iconData = Icons.vertical_align_bottom;
  //
  double get _maxScroll => scrollController.position.maxScrollExtent;
  double get _maxPixels => scrollController.position.pixels;
  // //
  // void _animateToIndex() {
  //   scrollController.animateTo(
  //     _maxPixels == _maxScroll ? 0.0 : _maxScroll,
  //     duration: const Duration(seconds: 2),
  //     curve: Curves.easeInToLinear,
  //     // curve: Curves.fastOutSlowIn,
  //   );
  // }

  late AnimationController _animationController;
  //
  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.ellipsis_search,
      progress: _animationController,
      size: 50.0,
    );
  }
}
