import 'dart:developer';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/models/model_transaction_form.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/screens/input_forms/transaction/form_one.dart';
import 'package:hisab/screens/input_forms/transaction/form_three.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/enums.dart';
import 'transaction/form_two.dart';

class AddTransactionForm extends StatefulWidget {
  final Site site;
  const AddTransactionForm({super.key, required this.site});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final PageController pageController = PageController();
  final formKeys = List.generate(3, (_) => GlobalKey<FormState>());
  ModelTransactionForm? transactionForm;

  @override
  void initState() {
    super.initState();
    transactionForm = ModelTransactionForm(
        paymentMethod: EnumPaymentMethod.cash,
        fromEntity: "Site",
        fromUser: widget.site);
  }

  void handleNextPage(int currentPage) {
    if (formKeys[currentPage].currentState!.validate()) {
      if (currentPage < 2) {
        Future.wait([
          if (currentPage == 0 &&
              transactionForm!.fromBankAccountOption ==
                  EnumBankAccount.addnew &&
              transactionForm!.paymentMethod == EnumPaymentMethod.cheque)
            insertBankAccount(from: true),
          if (currentPage == 1 &&
              transactionForm!.toBankAccountOption == EnumBankAccount.addnew &&
              transactionForm!.paymentMethod == EnumPaymentMethod.cheque)
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
                        FormOne(form: transactionForm!, formKey: formKeys[0]),
                        FormTwo(form: transactionForm!, formKey: formKeys[1]),
                        FormThree(form: transactionForm!, formKey: formKeys[2])
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
                      const SizedBox(width: 10),
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
    setState(() {
      isLoading = true;
    });
    try {
      final bankAccount = BankAccountsCompanion(
          accountHolder: drift.Value(from
              ? transactionForm!.fromAccountHolderName!
              : transactionForm!.toAccountHolderName!),
          accountNumber: drift.Value(from
              ? transactionForm!.fromAccountNumber!
              : transactionForm!.toAccountNumber!),
          bankName: drift.Value(from
              ? transactionForm!.fromBankName!
              : transactionForm!.toBankName!),
          ifsc: drift.Value(from
              ? transactionForm!.fromIfscCode!
              : transactionForm!.toIfscCode!),
          entityType: drift.Value(
              from ? transactionForm!.fromEntity! : transactionForm!.toEntity!),
          entityId: drift.Value(from
              ? transactionForm!.fromUser!.id
              : transactionForm!.toUser!.id));
      int result = await database.insertBankAccountOne(bankAccount);
      if (from) {
        transactionForm!.fromBankAccountId = result;
      } else {
        transactionForm!.toBankAccountId = result;
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
    required int? bankAccountId,
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
    try {
      final transaction = TransactionsCompanion(
        amount: drift.Value(transactionForm!.totalAmount!),
        chequeNo: drift.Value(transactionForm!.chequeNumber),
        remarks: drift.Value(transactionForm!.remarks!),
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
      int fromEntityPaymentMethodId = await insertPaymentEntity(
        bankAccountId: transactionForm!.fromBankAccountId,
        entityId: transactionForm!.fromUser.id,
        entityType: transactionForm!.fromEntity!,
        paymentMethod: transactionForm!.paymentMethod!.name,
      );

      int toEntityPaymentMethodId = await insertPaymentEntity(
        bankAccountId: transactionForm!.toBankAccountId,
        entityId: transactionForm!.toUser.id,
        entityType: transactionForm!.toEntity!,
        paymentMethod: transactionForm!.paymentMethod!.name,
      );

      await insertTransaction(
        fromEntityPaymentMethodId: fromEntityPaymentMethodId,
        toEntityPaymentMethodId: toEntityPaymentMethodId,
      );

      setState(() {
        isLoading = false;
      });
      router.pop();
    } catch (error, st) {
      setState(() {
        isLoading = false;
      });
      // Handle the error, e.g., show a snackbar or dialog
      log("st : ${st}");
      showError(error);
    }
  }

  void showError(Object error) {
    log(error.toString());
    HFunction.showFlushBarError(context: context, message: error.toString());
  }
}
