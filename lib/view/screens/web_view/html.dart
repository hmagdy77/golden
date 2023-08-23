// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// class HTMLtoWidget extends StatelessWidget {
//   final String htmlcode = """
//      <h1>H1 Title</h1>
//      <h2>H2 Title</h2>
//         <p>A paragraph with <strong>bold</strong> and <u>underline</u> text.</p>
//         <ol>
//           <li>List 1</li>
//           <li>List 2<ul>
//               <li>List 2.1 (nested)</li>
//               <li>List 2.2</li>
//              </ul>
//           </li>
//           <li>Three</li>
//         </ol>
//      <a href="https://www.hellohpc.cdom">Link to HelloHPC.com</a>
//      <img src='https://www.hellohpc.com/wp-content/uploads/2020/05/flutter.png'/>
//     """;

//   const HTMLtoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("HTML to Widget")),
//       body: Card(
//         child: HtmlWidget(
//           htmlcode,
//           baseUrl: Uri.parse("https://www.hellohpc.com"),
//           // onTapUrl: (url) {
//           //   return backWithOff(context);
//           // },
//         ),
//       ),
//     );
//   }
// }
