import 'package:flutter/material.dart';

const Color PRIMARY_COLOR = Colors.blueAccent;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem>? children;
  final Function(int)? onChange;
  final int currentIndex;

  const CustomBottomNavigationBar(
      {super.key,
      this.backgroundColor = BACKGROUND_COLOR,
      this.itemColor = PRIMARY_COLOR,
      this.currentIndex = 0,
      @required this.children,
      this.onChange});

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    widget.onChange!(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children!.map((item) {
          var color = item.color;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children!.indexOf(item);

          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: color,
                onPressed: () {
                  _changeIndex(index);
                },
                icon: Icon(icon),
              ),
              Text(
                "$label",
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          );
          // return GestureDetector(
          //   onTap: () {
          //     _changeIndex(index);
          //   },
          //   child: AnimatedContainer(
          //     duration: const Duration(milliseconds: 200),
          //     width: widget.currentIndex == index
          //         ? MediaQuery.of(context).size.width /
          //                 widget.children!.length +
          //             0
          //         : 70,
          //     padding: const EdgeInsets.only(left: 32, right: 10),
          //     margin: const EdgeInsets.only(top: 10, bottom: 10),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color:
          //             widget.currentIndex == index ? color : Colors.transparent,
          //         borderRadius: BorderRadius.circular(10)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: <Widget>[
          //         Icon(
          //           icon,
          //           size: 26,
          //           color: widget.currentIndex == index
          //               ? Theme.of(context).primaryColor
          //               : color,
          //         ),
          //         widget.currentIndex == index
          //             ? Expanded(
          //                 flex: 2,
          //                 child: Text(
          //                   label!,
          //                   overflow: TextOverflow.ellipsis,
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                       color: Theme.of(context).primaryColor),
          //                 ),
          //               )
          //             : Container()
          //       ],
          //     ),
          //   ),
          // );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData? icon;
  final String? label;
  final Color? color;

  CustomBottomNavigationItem(
      {@required this.icon, @required this.label, this.color});
}
