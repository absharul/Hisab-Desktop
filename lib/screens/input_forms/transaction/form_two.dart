import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../database/app_database.dart';
import '../../../main.dart';
import '../../../models/model_transaction_form.dart';
import '../../../utils/enums.dart';

// ignore: must_be_immutable
class FormTwo extends StatefulWidget {
  ModelTransactionForm form;
  final GlobalKey formKey;

  FormTwo({super.key, required this.form, required this.formKey});

  @override
  State<FormTwo> createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  // Entity
  List<String> entityTypes = ["User", "Site", "Firm"];

  // User
  List<dynamic> users = [];

  // Category
  List<Category> categories = [];

  // SubCategory
  List<SubCategory> subCategories = [];

  // Bank
  List<BankAccount> listOfBanks = <BankAccount>[];
  BankAccount? selectedBankAccount;

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
    switch (widget.form.toEntity) {
      case "User":
        list =
            await database.getUsersByCategoryId(widget.form.toSubCategory!.id);
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

    setState(() {
      widget.form.toUser = null;
    });
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

  void getAllCategories() async {
    final categoryList = await database.getCategory();
    setState(() {
      categories = categoryList;
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
    getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: widget.form.toEntity,
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
                  widget.form.toEntity = newValue;
                  widget.form.toUser = null;
                  widget.form.toCategory = null;
                  widget.form.toSubCategory = null;
                });
                getFromAllUsers(isFrom: false);
              },
            ),
            if (widget.form.toEntity == "User")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField<Category>(
                  value: widget.form.toCategory,
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
                      widget.form.toUser = null;
                      widget.form.toCategory = newValue;
                      widget.form.toSubCategory = null;
                    });
                    getAllSubCategories(categoryId: newValue!.id);
                  },
                ),
              ),
            if (widget.form.toEntity == "User")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField<SubCategory>(
                  value: widget.form.toSubCategory,
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
                      widget.form.toSubCategory = newValue;
                      widget.form.toUser = null;
                    });
                    getFromAllUsers(isFrom: false);
                  },
                ),
              ),
            const SizedBox(height: 10),
            DropdownSearch<dynamic>(
              popupProps: PopupProps.menu(
                showSelectedItems: false,
                showSearchBox: true,
                itemBuilder: (context, dynamic item, bool isSelected) {
                  return ListTile(
                    title: Text(item.name),
                  );
                },
              ),
              items: users,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: widget.form.toEntity,
                  hintText: "Select ${widget.form.toEntity}",
                ),
              ),
              onChanged: (value) {
                setState(() {
                  widget.form.toUser = value;
                  selectedBankAccount = null;
                });
                getAllBankAccounts(
                    userId: value.id, entityType: widget.form.toEntity!);
              },
              dropdownBuilder: (widget.form.toUser != null)
                  ? (ctx, value) {
                      return ListTile(
                        title: Text(value.name),
                      );
                    }
                  : null,
              selectedItem: widget.form.toUser,
            ),
            const SizedBox(height: 10),
            if (widget.form.toCategory?.name != "Vendor" &&
                widget.form.paymentMethod == EnumPaymentMethod.cheque)
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Add Bank Account'),
                    leading: Radio(
                      value: EnumBankAccount.addnew,
                      groupValue: widget.form.toBankAccountOption,
                      onChanged: (EnumBankAccount? value) {
                        setState(() {
                          widget.form.toBankAccountOption = value!;
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
                      groupValue: widget.form.toBankAccountOption,
                      onChanged: (EnumBankAccount? value) {
                        setState(() {
                          widget.form.toBankAccountOption = value!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
            if (widget.form.toCategory?.name != "Vendor" &&
                widget.form.toBankAccountOption == EnumBankAccount.addnew &&
                widget.form.paymentMethod == EnumPaymentMethod.cheque)
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
                    onChanged: (value) {
                      widget.form.toAccountNumber = value;
                    },
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
                    onChanged: (value) {
                      widget.form.toBankName = value;
                    },
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
                    onChanged: (value) {
                      widget.form.toIfscCode = value;
                    },
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
                    onChanged: (value) {
                      widget.form.toAccountHolderName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the holder name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            if (widget.form.toBankAccountOption ==
                    EnumBankAccount.chooseexisting &&
                widget.form.paymentMethod == EnumPaymentMethod.cheque)
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
                  widget.form.toBankAccountId = newValue!.id;
                },
              ),
          ],
        ),
      ),
    );
  }
}
