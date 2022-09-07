import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_promina/core/style/color/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _customController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  ScrollController? _controller = ScrollController();
  double _offset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          //Scroll bar
          Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height.h,
              width: 5,
              margin: EdgeInsets.only(
                  right: 15, left: MediaQuery.of(context).size.width - 20.0),
              decoration: BoxDecoration(color: Colors.black),
              child: Container(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  child: Container(
                    height: 40.0,
                    width: 5,
                    margin: EdgeInsets.only(top: _offset),
                    decoration: BoxDecoration(
                        color: Colors.white, //Change Color here
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  ),
                  onVerticalDragUpdate: (dragUpdate) {
                    _controller!.position
                        .moveTo(dragUpdate.globalPosition.dy * 3.5);

                    setState(() {
                      if (dragUpdate.globalPosition.dy >= 0) {
                        _offset = dragUpdate.globalPosition.dy;
                      }
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}

// class CustomDemo extends StatelessWidget {
//   final ScrollController controller = ScrollController();
//   // ScrollController _rrectController = ScrollController();

//   CustomDemo({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   body: scrollbar(
//     //     thumbVisibility: true,
//     //     trackVisibility: true,
//     //     thumbColor: Colors.black,
//     //     trackColor: Colors.red,
//     //     trackBorderColor: Colors.red,
//     //     crossAxisMargin: 50,
//     //     trackRadius: Radius.circular(50),
//     //     thickness: 10,
//     //     // Child can also be SingleChildScrollView, GridView, etc.
//     //     child: ListView.builder(
//     //       itemCount: 20,
//     //       itemBuilder: (context, index) {
//     //         return ListTile(
//     //           title: Text('Index $index'),
//     //         );
//     //       },
//     //     ),
//     //   ),
//     // );
//     // return Center(
//     //   child: DraggableScrollbar.rrect(
//     //     controller: _rrectController,
//     //     backgroundColor: Colors.black,
//     //     padding: EdgeInsets.only(right: 20),
//     //     alwaysVisibleScrollThumb: true,
//     //     child: ListView.builder(
//     //       controller: _rrectController,
//     //       itemCount: 100,
//     //       itemExtent: 100.0,
//     //       itemBuilder: (context, index) {
//     //         return Container(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Material(
//     //             elevation: 4.0,
//     //             borderRadius: BorderRadius.circular(4.0),
//     //             color: Colors.green[index % 9 * 100],
//     //             child: Center(
//     //               child: Text(index.toString()),
//     //             ),
//     //           ),
//     //         );
//     //       },
//     //     ),
//     //   ),
//     // );
//     return DraggableScrollbar(
//       controller: controller,
//       heightScrollThumb: 20,
//       backgroundColor: Colors.white,
//       padding: EdgeInsets.all(50),
//       alwaysVisibleScrollThumb: true,
//       scrollThumbBuilder:
//           (backgroundColor, thumbAnimation, labelAnimation, height,
//               {labelText, labelConstraints}) {
//         return Stack(
//           children: [
//             Center(
//               child: Container(
//                 color: Colors.grey,
//                 height: double.infinity,
//                 width: 50,
//               ),
//             ),
//             Center(
//               child: Container(
//                 color: Colors.white,
//                 height: height,
//                 width: 50,
//                 constraints: labelConstraints,
//               ),
//             ),
//           ],
//         );
//         //  Container(
//         //   height: double.infinity,
//         //   child: Card(
//         //     color: Colors.black,
//         //     child: Container(
//         //       height: 50,
//         //       color: Colors.white,
//         //     ),
//         //   ),
//         // );
//         //  Container(
//         //   height: height,
//         //   width: 2.0,
//         //   color: backgroundColor,
//         //   child: Container(
//         //     color: AppColors.primaryColor,
//         //     height: height,
//         //     width: 10,
//         //   ),
//         // );
//       },
//       child: ListView.builder(
//         controller: controller,
//         itemCount: 1000,
//         itemExtent: 100.0,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.all(8.0),
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(4.0),
//               color: Colors.cyan[index % 9 * 100],
//               child: Center(
//                 child: Text(index.toString()),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
