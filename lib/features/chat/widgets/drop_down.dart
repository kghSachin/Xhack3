// import 'package:flutter/material.dart';
// import 'package:frontend/features/chat/services/api_service.dart';
// import 'package:frontend/features/chat/widgets/text_widget.dart';

// import '../constants.dart';

// class ModelDropDownWidget extends StatefulWidget {
//   const ModelDropDownWidget({super.key});

//   @override
//   State<ModelDropDownWidget> createState() => _ModelDropDownWidgetState();
// }

// class _ModelDropDownWidgetState extends State<ModelDropDownWidget> {
//   String currentModel = "text-davinci-003";
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         }
//         return snapshot.data == null || snapshot.data!.isEmpty
//             ? const SizedBox.shrink()
//             : FittedBox(
//                 child: DropdownButton(
//                   dropdownColor: scaffoldBackgroundColor,
//                   iconEnabledColor: Colors.white,
//                   items: List<DropdownMenuItem<String>>.generate(
//                     snapshot.data!.length,
//                     (index) => DropdownMenuItem(
//                       value: snapshot.data![index].id,
//                       child: TextWidget(label: snapshot.data![index].id),
//                     ),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   value: currentModel,
//                   onChanged: (value) {
//                     currentModel = value.toString();
//                   },
//                 ),
//               );
//       },
//       future: ApiServices.getModels(null),
//     );
//   }
// }
