import 'package:flutter/material.dart';
import 'txt.dart';

class GenerateListWithUnderLineAnimation<T> extends StatefulWidget {
  ///
  GenerateListWithUnderLineAnimation({
    Key? key,
    required this.lengthOfList,
    required this.selectedIndex,
    required this.list,
    required this.onItemSelected,
    this.height,
  }) : super(key: key);

  /// lenght of your list
  final int lengthOfList;
  final double? height;
  final List<T> list;
  final Function onItemSelected;

  /// this index
  int selectedIndex;

  ///
  @override
  State<GenerateListWithUnderLineAnimation> createState() =>
      _GenerateListWithUnderLineAnimationState();
}

class _GenerateListWithUnderLineAnimationState
    extends State<GenerateListWithUnderLineAnimation> {
  ///
  void onTap(int index) {
    widget.selectedIndex = index;
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 60.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.15),
      ),
      margin: const EdgeInsets.all(0.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.lengthOfList, (index) {
          return InkWell(
            onTap: () {
              onTap(index);
              widget.onItemSelected;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Txt(
                  widget.list[index],
                  isUseFontSizePrefs: false,
                  fontSize: 15.0,
                ),
                AnimatedContainer(
                  width: widget.selectedIndex == index ? 30.0 : 10.0,
                  height: 5.0,
                  duration: const Duration(milliseconds: 400),
                  color: Colors.black,
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
