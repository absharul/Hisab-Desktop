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
  // void getFromAllUsers({
  //   bool isFrom = true,
  // }) async {
  //   List<dynamic> list = [];
  //   switch (widget.form.fromEntity) {
  //     case "User":
  //       list = await database
  //           .getUsersByCategoryId(widget.form.fromSubCategory!.id);
  //       break;
  //     case "Firm":
  //       list = await database.getAllFirms();
  //       break;
  //     case "Site":
  //       list = await database.getAllSites();
  //       break;
  //     default:
  //       list = await database.getUsers();
  //   }
  //   setState(() {
  //     users = list;
  //   });
  // }
  void getFromAllUsers({
    bool isFrom = true,
  }) async {
    List<dynamic> list = [];

    // Ensure that category or subcategory are non-null before querying.
    if (widget.form.fromEntity == "User") {
      if (widget.form.fromSubCategory != null) {
        list = await database
            .getUsersByCategoryId(widget.form.fromSubCategory!.id);
      } else if (widget.form.fromCategory != null) {
        list =
            await database.getUsersByCategoryId(widget.form.fromCategory!.id);
      } else {
        // If no category/subcategory, get all users
        list = await database.getUsers();
      }
    } else if (widget.form.fromEntity == "Firm") {
      list = await database.getAllFirms();
    } else if (widget.form.fromEntity == "Site") {
      list = await database.getAllSites();
    }

    setState(() {
      users = list;
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

  void getAllBankAccounts(
      {required int userId, required String entityType}) async {
    listOfBanks = await database.getBankAccountByEntityId(userId, entityType);
    setState(() {});
  }

  void getAllCategories() async {
    final categoryList = await database.getCategory();
    setState(() {
      categories = categoryList;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.form.fromEntity == "Site") {
      getFromAllUsers(isFrom: true);
      widget.form.fromUser = widget.form.fromUser;
    }

    getAllCategories();
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
                value: widget.form.fromEntity,
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
                    widget.form.fromEntity = newValue;
                    widget.form.fromUser = null;
                    widget.form.fromCategory = null;
                    widget.form.fromSubCategory = null;
                  });

                  getFromAllUsers();
                },
              ),
              if (widget.form.fromEntity == "User")
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonFormField<Category>(
                    value: widget.form.fromCategory,
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
                        widget.form.fromUser = null;
                        widget.form.fromCategory = newValue;
                        widget.form.fromSubCategory = null;
                      });
                      getAllSubCategories(categoryId: newValue!.id);
                    },
                  ),
                ),
              if (widget.form.fromEntity == "User")
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonFormField<SubCategory>(
                    value: widget.form.fromSubCategory,
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
                        widget.form.fromSubCategory = newValue;
                        widget.form.fromUser = null;
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
                    return ListTile(
                      title: Text(item.name),
                    );
                  },
                ),
                items: users,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: widget.form.fromEntity,
                    hintText: "Select ${widget.form.fromEntity}",
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    widget.form.fromUser = value;
                    selectedBankAccount = null;
                  });
                  getAllBankAccounts(
                      userId: value.id, entityType: widget.form.fromEntity!);
                },
                dropdownBuilder: (widget.form.fromUser != null)
                    ? (ctx, value) {
                        return ListTile(
                          title: Text(value.name),
                        );
                      }
                    : null,
                selectedItem: widget.form.fromUser,
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
                        groupValue: widget.form.fromBankAccountOption,
                        onChanged: (EnumBankAccount? value) {
                          setState(() {
                            widget.form.fromBankAccountOption = value!;
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
                        groupValue: widget.form.fromBankAccountOption,
                        onChanged: (EnumBankAccount? value) {
                          setState(() {
                            widget.form.fromBankAccountOption = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ]),
              if (widget.form.paymentMethod == EnumPaymentMethod.cheque &&
                  widget.form.fromBankAccountOption == EnumBankAccount.addnew)
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
                        widget.form.fromAccountNumber = value;
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
                        widget.form.fromBankName = value;
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
                        widget.form.fromIfscCode = value;
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
                        widget.form.fromAccountHolderName = value;
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
              if (widget.form.paymentMethod == EnumPaymentMethod.cheque &&
                  widget.form.fromBankAccountOption ==
                      EnumBankAccount.chooseexisting)
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
                    widget.form.fromBankAccountId = newValue!.id;
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
