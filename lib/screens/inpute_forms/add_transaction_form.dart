import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/enums.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController chequeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  final TextEditingController fromAccountNumberController =
      TextEditingController();
  final TextEditingController toAccountNumberController =
      TextEditingController();

  final TextEditingController fromBankNameController = TextEditingController();
  final TextEditingController toBankNameController = TextEditingController();

  final TextEditingController fromIfscController = TextEditingController();
  final TextEditingController toIfscController = TextEditingController();

  final TextEditingController fromHolderNameController =
      TextEditingController();
  final TextEditingController toHolderNameController = TextEditingController();

  final PageController pageController = PageController();
  final formKeys = List.generate(3, (_) => GlobalKey<FormState>());

  // USER DROPDOWN
  List<User> users = [];
  User? selectedFromUser, selectedToUser;

  // ENTITY TYPE DROPDOWN
  List<String> entityTypes = ["Customer", "Vendor", "ETC"];
  String? selectedFromEntityType, selectedToEntityType;

  // Bank Acc
  EnumBankAccount bankAccountRadioOption = EnumBankAccount.addnew;
  List<BankAccount> listOfBanks = <BankAccount>[];
  BankAccount? selectedFromBankAccount, selectedToBankAccount;

  // Transaction Type
  List<String> transactionTypes = <String>['Credit/Debit', 'Cash', 'Cheque'];
  String? selectedTransactionType;

  void handleNextPage(int currentPage) {
    if (formKeys[currentPage].currentState!.validate()) {
      if (currentPage < 2) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // Handle form submission on the last page
        if (formKeys[2].currentState?.validate() ?? false) {
          // Process the transaction details here
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    users = await database.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  // Page 1
                  Form(
                    key: formKeys[0],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'From',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<User>(
                          value: selectedFromUser,
                          decoration: const InputDecoration(
                            labelText: 'User',
                            border: OutlineInputBorder(),
                          ),
                          items: users.map((User value) {
                            return DropdownMenuItem<User>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (User? newValue) {
                            selectedFromUser = newValue;
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: selectedFromEntityType,
                          decoration: const InputDecoration(
                            labelText: 'Entity Type',
                            border: OutlineInputBorder(),
                          ),
                          items: entityTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedFromEntityType = newValue;
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: selectedTransactionType,
                          decoration: const InputDecoration(
                            labelText: 'Transaction Method',
                            border: OutlineInputBorder(),
                          ),
                          items: transactionTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedTransactionType = newValue;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select the transaction method';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //  Add radio button on for add bank acc or choose bank acc
                              Expanded(
                                child: ListTile(
                                  title: const Text('Add Bank Account'),
                                  leading: Radio(
                                    value: EnumBankAccount.addnew,
                                    groupValue: bankAccountRadioOption,
                                    onChanged: (EnumBankAccount? value) {
                                      setState(() {
                                        bankAccountRadioOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('Choose existing one'),
                                  leading: Radio(
                                    value: EnumBankAccount.chooseexisting,
                                    groupValue: bankAccountRadioOption,
                                    onChanged: (EnumBankAccount? value) {
                                      setState(() {
                                        bankAccountRadioOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                        if (bankAccountRadioOption == EnumBankAccount.addnew)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: fromAccountNumberController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Account Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the account number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: fromBankNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Bank Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the bank name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: fromIfscController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'IFSC',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the IFSC code';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: fromHolderNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Holder Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the holder name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        if (bankAccountRadioOption ==
                            EnumBankAccount.chooseexisting)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              DropdownButtonFormField<BankAccount>(
                                value: selectedFromBankAccount,
                                decoration: const InputDecoration(
                                  labelText: 'Select Bank Account',
                                  border: OutlineInputBorder(),
                                ),
                                items: listOfBanks.map((BankAccount value) {
                                  return DropdownMenuItem<BankAccount>(
                                    value: value,
                                    child: ListTile(
                                      title: Text(value.accountHolder),
                                      subtitle: Text(value.accountNumber),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (BankAccount? newValue) {
                                  selectedFromBankAccount = newValue;
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  // Page 2
                  Form(
                    key: formKeys[1],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'To',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<User>(
                          value: selectedToUser,
                          decoration: const InputDecoration(
                            labelText: 'User',
                            border: OutlineInputBorder(),
                          ),
                          items: users.map((User value) {
                            return DropdownMenuItem<User>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (User? newValue) {
                            selectedToUser = newValue;
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: selectedToEntityType,
                          decoration: const InputDecoration(
                            labelText: 'Entity Type',
                            border: OutlineInputBorder(),
                          ),
                          items: entityTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedToEntityType = newValue;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //  Add radio button on for add bank acc or choose bank acc
                              Expanded(
                                child: ListTile(
                                  title: const Text('Add Bank Account'),
                                  leading: Radio(
                                    value: EnumBankAccount.addnew,
                                    groupValue: bankAccountRadioOption,
                                    onChanged: (EnumBankAccount? value) {
                                      setState(() {
                                        bankAccountRadioOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('Choose existing one'),
                                  leading: Radio(
                                    value: EnumBankAccount.chooseexisting,
                                    groupValue: bankAccountRadioOption,
                                    onChanged: (EnumBankAccount? value) {
                                      setState(() {
                                        bankAccountRadioOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                        if (bankAccountRadioOption == EnumBankAccount.addnew)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: toAccountNumberController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Account Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the account number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: toBankNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Bank Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the bank name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: toIfscController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'IFSC',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the IFSC code';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: toHolderNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Holder Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the holder name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        if (bankAccountRadioOption ==
                            EnumBankAccount.chooseexisting)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              DropdownButtonFormField<BankAccount>(
                                value: selectedFromBankAccount,
                                decoration: const InputDecoration(
                                  labelText: 'Select Bank Account',
                                  border: OutlineInputBorder(),
                                ),
                                items: listOfBanks.map((BankAccount value) {
                                  return DropdownMenuItem<BankAccount>(
                                    value: value,
                                    child: ListTile(
                                      title: Text(value.accountHolder),
                                      subtitle: Text(value.accountNumber),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (BankAccount? newValue) {
                                  selectedFromBankAccount = newValue;
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  // Page 3
                  Form(
                    key: formKeys[2],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: chequeController,
                          decoration: const InputDecoration(
                            hintText: '876342524',
                            labelText: 'Cheque Number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: remarkController,
                          decoration: const InputDecoration(
                            hintText: 'eg. Good work!',
                            labelText: 'Remarks',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle next button press
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                    width: 10), // Add some spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    int currentPage = pageController.page?.toInt() ?? 0;
                    handleNextPage(currentPage);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                spacing: 16,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
