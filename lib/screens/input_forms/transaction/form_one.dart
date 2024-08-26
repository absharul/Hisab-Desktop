import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/models/model_transaction_form.dart';
import '../../../main.dart';
import '../../../utils/enums.dart';

// ignore: must_be_immutable
class FormOne extends StatefulWidget {
  ModelTransactionForm form;
  final GlobalKey formKey;
  FormOne({super.key, required this.form, required this.formKey});

  @override
  State<FormOne> createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  // Entity
  List<String> entityTypes = ["User", "Site", "Firm"];
  String? entityType;

  // User
  dynamic selectedUser;
  List<dynamic> users = [];

  // Category
  Category? category;
  List<Category> categories = [];

  // SubCategory
  SubCategory? subCategory;
  List<SubCategory> subCategories = [];

  // Bank
  List<BankAccount> listOfBanks = <BankAccount>[];
  BankAccount? selectedBankAccount;
  int? selectedBankAccountId;
  EnumBankAccount bankAccountRadioOption = EnumBankAccount.chooseexisting;

  // Controllers
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();

  // QUERY
  void getFromAllUsers({
    bool isFrom = true,
  }) async {
    List<dynamic> list = [];
    switch (entityType) {
      case "User":
        list = await database.getUsersByCategoryId(subCategory!.id);
        break;
      case "Firm":
        list = await database.getAllFirms();
        break;
      case "Site":
        list = await database.getAllSites();
        break;
      default:
        list = await database.getUsers();
    }
    users = list;
  }

  void getAllSubCategories({
    required int categoryId,
  }) async {
    final subCategoryList =
        await database.getSubcategoryByCategoryId(categoryId);

    setState(() {
      subCategories = subCategoryList;
    });
  }

  void getAllBankAccounts(
      {required int userId, required String entityType}) async {
    listOfBanks = await database.getBankAccountByEntityId(userId, entityType);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.form.fromEntity == "Site") {
      entityType = "Site";
      getFromAllUsers(isFrom: true);
      selectedUser = widget.form.fromUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'From',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: entityType,
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
                  setState(() {
                    entityType = newValue;
                    selectedUser = null;
                    category = null;
                    subCategory = null;
                  });

                  getFromAllUsers();
                },
              ),
              if (entityType == "User")
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonFormField<Category>(
                    value: category,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: categories.map((Category value) {
                      return DropdownMenuItem<Category>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (Category? newValue) {
                      setState(() {
                        selectedUser = null;
                        category = newValue;
                        subCategory = null;
                      });
                      getAllSubCategories(categoryId: newValue!.id);
                    },
                  ),
                ),
              if (entityType == "User")
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonFormField<SubCategory>(
                    value: subCategory,
                    decoration: const InputDecoration(
                      labelText: 'Sub Category',
                      border: OutlineInputBorder(),
                    ),
                    items: subCategories.map((SubCategory value) {
                      return DropdownMenuItem<SubCategory>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (SubCategory? newValue) {
                      setState(() {
                        subCategory = newValue;
                        selectedUser = null;
                      });
                      getFromAllUsers();
                    },
                  ),
                ),
              const SizedBox(height: 10),
              DropdownSearch<dynamic>(
                popupProps: PopupProps.menu(
                  showSelectedItems: false,
                  showSearchBox: true,
                  itemBuilder: (context, dynamic item, bool isSelected) {
                    log("Dropdown: ${item}");
                    return ListTile(
                      title: Text(item.name),
                    );
                  },
                ),
                items: users,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: entityType,
                    hintText: "Select $entityType",
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    users = value;
                    selectedBankAccount = null;
                  });
                  getAllBankAccounts(userId: value.id, entityType: entityType!);
                },
                dropdownBuilder: (selectedUser != null)
                    ? (ctx, value) {
                        return ListTile(
                          title: Text(value.name),
                        );
                      }
                    : null,
                selectedItem: selectedUser,
              ),
              const SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Cash'),
                    leading: Radio(
                      value: EnumPaymentMethod.cash,
                      groupValue: widget.form.paymentMethod,
                      onChanged: (EnumPaymentMethod? value) {
                        setState(() {
                          widget.form.paymentMethod = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Cheque'),
                    leading: Radio(
                      value: EnumPaymentMethod.cheque,
                      groupValue: widget.form.paymentMethod,
                      onChanged: (EnumPaymentMethod? value) {
                        setState(() {
                          widget.form.paymentMethod = value!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              if (widget.form.paymentMethod == EnumPaymentMethod.cheque)
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              if (widget.form.paymentMethod == EnumPaymentMethod.cheque &&
                  bankAccountRadioOption == EnumBankAccount.addnew)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: accountNumberController,
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
                      controller: bankNameController,
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
                      controller: ifscController,
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
                      controller: holderNameController,
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
              if (widget.form.paymentMethod == EnumPaymentMethod.cheque &&
                  bankAccountRadioOption == EnumBankAccount.chooseexisting)
                DropdownButtonFormField<BankAccount>(
                  value: selectedBankAccount,
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
                    selectedBankAccount = newValue;
                    selectedBankAccountId = newValue!.id;
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
