// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import 'account.dart';
// import 'history.dart';
// import 'home.dart';

// class BottomViews extends StatefulWidget {
//   const BottomViews({super.key});

//   @override
//   State<BottomViews> createState() => _BottomViewsState();
// }

// class _BottomViewsState extends State<BottomViews> {
//   int _currentIndex = 0;
//   static const _myPage = HomePage();
//   // if (1 < 2){}
//   List<Widget> _children = [HomePage(), HistoryPage(), AccountPage()];
//   void _onItemTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _children.elementAt(_currentIndex),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           items: [
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Beranda",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.history_edu),
//               label: "Riwayat",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.account_box),
//               label: "Akun",
//             ),
//           ],
//           onTap: _onItemTap,
//         ));
//   }
// }
