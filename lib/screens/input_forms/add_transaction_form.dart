import 'dart:developer';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/enums.dart';

class AddTransactionForm extends StatefulWidget {
  final Site site;
  const AddTransactionForm({super.key, required this.site});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final TextEditingController amountController = TextEditingController();

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
  EnumBankAccount fromBankAccountRadioOption = EnumBankAccount.addnew,
      toBankAccountRadioOption = EnumBankAccount.addnew;
  List<BankAccount> listOfBanks = <BankAccount>[];
  BankAccount? selectedFromBankAccount, selectedToBankAccount;
  int? selectedFromBankAccountId, selectedToBankAccountId;

  // Transaction Type
  List<String> transactionTypes = <String>['Credit/Debit', 'Cash', 'Cheque'];
  String? selectedTransactionType;

  void handleNextPage(int currentPage) {
    if (formKeys[currentPage].currentState!.validate()) {
      if (currentPage < 2) {
        Future.wait([
          if (currentPage == 0 &&
              fromBankAccountRadioOption == EnumBankAccount.addnew)
            insertBankAccount(from: true),
          if (currentPage == 1 &&
              toBankAccountRadioOption == EnumBankAccount.addnew)
            insertBankAccount(from: false),
        ]).then((value) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }).onError((error, stackTrace) {
          showError(error.toString());
        });
      } else {
        // Handle form submission on the last page
        if (formKeys[2].currentState?.validate() ?? false) {
          handleSubmit();
        }
      }
    }
  }

  // Loaders

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllUsers();
    getAllBankAccounts();
  }

  // queries
  void getAllUsers() async {
    users = await database.getUsers();
    setState(() {});
  }

  void getAllBankAccounts() async {
    listOfBanks = await database.getBankAccounts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (isLoading)
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                                    Expanded(
                                      child: ListTile(
                                        title: const Text('Add Bank Account'),
                                        leading: Radio(
                                          value: EnumBankAccount.addnew,
                                          groupValue:
                                              fromBankAccountRadioOption,
                                          onChanged: (EnumBankAccount? value) {
                                            setState(() {
                                              fromBankAccountRadioOption =
                                                  value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title:
                                            const Text('Choose existing one'),
                                        leading: Radio(
                                          value: EnumBankAccount.chooseexisting,
                                          groupValue:
                                              fromBankAccountRadioOption,
                                          onChanged: (EnumBankAccount? value) {
                                            setState(() {
                                              fromBankAccountRadioOption =
                                                  value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                              if (fromBankAccountRadioOption ==
                                  EnumBankAccount.addnew)
                                Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: fromAccountNumberController,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Allows only digits
                                      ],
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
                              if (fromBankAccountRadioOption ==
                                  EnumBankAccount.chooseexisting)
                                DropdownButtonFormField<BankAccount>(
                                  value: selectedFromBankAccount,
                                  decoration: const InputDecoration(
                                    labelText: 'Select Bank Account',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: listOfBanks.map((BankAccount value) {
                                    return DropdownMenuItem<BankAccount>(
                                      value: value,
                                      child: Text(value.accountNumber),
                                    );
                                  }).toList(),
                                  onChanged: (BankAccount? newValue) {
                                    selectedFromBankAccount = newValue;
                                    selectedFromBankAccountId = newValue!.id;
                                  },
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
                                          groupValue: toBankAccountRadioOption,
                                          onChanged: (EnumBankAccount? value) {
                                            setState(() {
                                              toBankAccountRadioOption = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title:
                                            const Text('Choose existing one'),
                                        leading: Radio(
                                          value: EnumBankAccount.chooseexisting,
                                          groupValue: toBankAccountRadioOption,
                                          onChanged: (EnumBankAccount? value) {
                                            setState(() {
                                              toBankAccountRadioOption = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                              if (toBankAccountRadioOption ==
                                  EnumBankAccount.addnew)
                                Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Allows only digits
                                      ],
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
                              if (toBankAccountRadioOption ==
                                  EnumBankAccount.chooseexisting)
                                DropdownButtonFormField<BankAccount>(
                                  value: selectedToBankAccount,
                                  decoration: const InputDecoration(
                                    labelText: 'Select Bank Account',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: listOfBanks
                                      .where((element) =>
                                          element.id !=
                                          selectedFromBankAccountId)
                                      .map((BankAccount value) {
                                    return DropdownMenuItem<BankAccount>(
                                      value: value,
                                      child: Text(value.accountNumber),
                                    );
                                  }).toList(),
                                  onChanged: (BankAccount? newValue) {
                                    selectedToBankAccount = newValue;
                                    selectedToBankAccountId = newValue!.id;
                                  },
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
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allows only digits
                                ],
                                controller: amountController,
                                decoration: const InputDecoration(
                                  hintText: 'Amount in Rs',
                                  labelText: 'Amount',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a amount';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allows only digits
                                ],
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
                          int currentPage = pageController.page?.toInt() ?? 0;
                          if (currentPage > 0) {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            router.pop();
                          }
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

  // Mutations

  Future<void> insertBankAccount({bool from = true}) async {
    log("Inserting bank account");
    setState(() {
      isLoading = true;
    });
    try {
      final bankAccount = BankAccountsCompanion(
        accountHolder: drift.Value(
            from ? fromHolderNameController.text : toHolderNameController.text),
        accountNumber: drift.Value(from
            ? fromAccountNumberController.text
            : toAccountNumberController.text),
        bankName: drift.Value(
            from ? fromBankNameController.text : toBankNameController.text),
        ifsc:
            drift.Value(from ? fromIfscController.text : toIfscController.text),
      );
      int result = await database.insertBankAccountOne(bankAccount);
      if (from) {
        selectedFromBankAccountId = result;
      } else {
        selectedToBankAccountId = result;
      }
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // Handle the error, e.g., show a snackbar or dialog
      showError(error);
    }
  }

  Future<int> insertPaymentEntity({
    required int bankAccountId,
    required int entityId,
    required String entityType,
    required String paymentMethod,
  }) async {
    log("Inserting payment entity");

    try {
      final paymentEntity = EntityPaymentMethodsCompanion(
        bankAccountId: drift.Value(bankAccountId),
        entityId: drift.Value(entityId),
        entityType: drift.Value(entityType),
        paymentMethod: drift.Value(paymentMethod),
      );
      int result = await database.insertEntityPaymentMethod(paymentEntity);
      return result;
    } catch (error) {
      // Handle the error, e.g., log it or show a message
      showError(error);
      rethrow;
    }
  }

  Future<void> insertTransaction({
    required int fromEntityPaymentMethodId,
    required int toEntityPaymentMethodId,
  }) async {
    log("Inserting transaction");

    try {
      final transaction = TransactionsCompanion(
        amount: drift.Value(int.parse(amountController.text)),
        chequeNo: drift.Value(chequeController.text),
        remarks: drift.Value(remarkController.text),
        fromId: drift.Value(fromEntityPaymentMethodId),
        toId: drift.Value(toEntityPaymentMethodId),
        siteId: drift.Value(widget.site.id),
      );
      await database.insertTransaction(transaction);
    } catch (error) {
      // Handle the error, e.g., log it or show a message
      showError(error);
      rethrow;
    }
  }

  Future<void> handleSubmit() async {
    setState(() {
      isLoading = true;
    });
    try {
      log("Inserting the submit");
      int fromEntityPaymentMethodId = await insertPaymentEntity(
        bankAccountId: selectedFromBankAccountId!,
        entityId: selectedFromUser!.id,
        entityType: selectedFromEntityType!,
        paymentMethod: selectedTransactionType!,
      );

      int toEntityPaymentMethodId = await insertPaymentEntity(
        bankAccountId: selectedToBankAccountId!,
        entityId: selectedToUser!.id,
        entityType: selectedToEntityType!,
        paymentMethod: selectedTransactionType!,
      );

      await insertTransaction(
        fromEntityPaymentMethodId: fromEntityPaymentMethodId,
        toEntityPaymentMethodId: toEntityPaymentMethodId,
      );

      setState(() {
        isLoading = false;
      });
      router.pop();
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // Handle the error, e.g., show a snackbar or dialog
      showError(error);
    }
  }

  void showError(Object error) {
    log(error.toString());
    HFunction.showFlushBarError(context: context, message: error.toString());
  }
}
