// import 'package:flutter/material.dart';
// import 'package:hisab/utils/enums.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// void showTransactionInputDialog(BuildContext context) {
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController areaController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController chequeController = TextEditingController();
//   final TextEditingController accountNumberController = TextEditingController();
//   final TextEditingController bankNameController = TextEditingController();
//   final TextEditingController ifscController = TextEditingController();
//   final TextEditingController holderNameController = TextEditingController();

//   const List<String> entityOptions = <String>['Customer', 'Vendor', 'Partner'];
//   String? selectedEntityType;

//   EnumBankAccount bankAccountRadioOption = EnumBankAccount.chooseexisting;
//   const List<String> transactionTypes = <String>[
//     'Credit/Debit',
//     'Cash',
//     'Cheque'
//   ];
//   String? selectedTransactionType;

//   const List<String> listOfBanks = <String>['Axis', 'SBI', 'ICICI'];
//   String? selectedBankType;

//   final PageController pageController = PageController();
//   final formKeys = List.generate(3, (_) => GlobalKey<FormState>());

//   bool isAddingBank = false;

//   void handleNextPage(int currentPage) {
//     if (formKeys[currentPage].currentState!.validate()) {
//       if (currentPage < 2) {
//         pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       } else {
//         // Handle form submission on the last page
//         if (formKeys[2].currentState?.validate() ?? false) {
//           String date = dateController.text;
//           String area = areaController.text;
//           String price = priceController.text;
//           String description = descriptionController.text;
//           String chequeNo = chequeController.text;
//           String accountNumber = accountNumberController.text;
//           String bankName = bankNameController.text;
//           String ifsc = ifscController.text;
//           String holderName = holderNameController.text;

//           // Process the transaction details here
//           Navigator.of(context).pop();
//         }
//       }
//     }
//   }

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: SizedBox(
//           height: 400,
//           width: 300,
//           child: Column(
//             children: [
//               Expanded(
//                 child: PageView(
//                   controller: pageController,
//                   children: [
//                     // Page 1
//                     SingleChildScrollView(
//                       child: Form(
//                         key: formKeys[0],
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'From',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField<String>(
//                               value: selectedEntityType,
//                               decoration: const InputDecoration(
//                                 labelText: 'User',
//                                 border: OutlineInputBorder(),
//                               ),
//                               items: entityOptions.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 selectedEntityType = newValue;
//                               },
//                               validator: (String? value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please select the user';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField<String>(
//                               value: selectedEntityType,
//                               decoration: const InputDecoration(
//                                 labelText: 'Entity',
//                                 border: OutlineInputBorder(),
//                               ),
//                               items: entityOptions.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 selectedEntityType = newValue;
//                               },
//                               validator: (String? value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please select the entity type';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField<String>(
//                               value: selectedTransactionType,
//                               decoration: const InputDecoration(
//                                 labelText: 'Transaction Method',
//                                 border: OutlineInputBorder(),
//                               ),
//                               items: transactionTypes.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 selectedTransactionType = newValue;
//                               },
//                               validator: (String? value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please select the transaction method';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   //  Add radio button on for add bank acc or choose bank acc
//                                   ListTile(
//                                     title: const Text('Add Bank Account'),
//                                     leading: Radio(
//                                       value: EnumBankAccount.addnew,
//                                       groupValue: bankAccountRadioOption,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           _site = value;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   ListTile(
//                                     title: const Text(
//                                         'www.tutorialandexample.com'),
//                                     leading: Radio(
//                                       value: EnumBankAccount.chooseexisting,
//                                       groupValue: ,
//                                       onChanged: (BestTutorSite value) {
//                                         setState(() {
//                                           _site = value;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ]),
//                             if (isAddingBank)
//                               Column(
//                                 children: [
//                                   const SizedBox(height: 10),
//                                   TextFormField(
//                                     controller: accountNumberController,
//                                     decoration: const InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Account Number',
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter the account number';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 10),
//                                   TextFormField(
//                                     controller: bankNameController,
//                                     decoration: const InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Bank Name',
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter the bank name';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 10),
//                                   TextFormField(
//                                     controller: ifscController,
//                                     decoration: const InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       labelText: 'IFSC',
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter the IFSC code';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 10),
//                                   TextFormField(
//                                     controller: holderNameController,
//                                     decoration: const InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Holder Name',
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter the holder name';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Page 2
//                     Form(
//                       key: formKeys[1],
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'To',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 10),
//                           if (selectedTransactionType == 'Cheque')
//                             TextFormField(
//                               controller: chequeController,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 hintText: 'Cheque No.',
//                                 labelText: 'Cheque No. *',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter the cheque number';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: priceController,
//                             keyboardType: TextInputType.number,
//                             decoration: const InputDecoration(
//                               hintText: 'Amount',
//                               labelText: 'Amount *',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter an amount';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Page 3
//                     Form(
//                       key: formKeys[2],
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'To',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: descriptionController,
//                             decoration: const InputDecoration(
//                               hintText: 'Description',
//                               labelText: 'Description',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter a description';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SmoothPageIndicator(
//                 controller: pageController,
//                 count: 3,
//                 effect: const WormEffect(
//                   dotWidth: 10,
//                   dotHeight: 10,
//                   spacing: 16,
//                   activeDotColor: Colors.blue,
//                   dotColor: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('Next'),
//             onPressed: () {
//               int currentPage = pageController.page?.toInt() ?? 0;
//               handleNextPage(currentPage);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
