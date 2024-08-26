import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisab/models/model_transaction_form.dart';
import 'package:hisab/utils/enums.dart';

// ignore: must_be_immutable
class FormThree extends StatefulWidget {
  ModelTransactionForm form;
  final GlobalKey formKey;

  FormThree({super.key, required this.form, required this.formKey});

  @override
  State<FormThree> createState() => _FormThreeState();
}

class _FormThreeState extends State<FormThree> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController chequeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly, // Allows only digits
            ],
            controller: amountController,
            decoration: const InputDecoration(
              hintText: 'Amount in Rs',
              labelText: 'Amount',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.form.totalAmount = double.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a amount';
              }
              return null;
            },
          ),
          if (widget.form.paymentMethod == EnumPaymentMethod.cheque)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: chequeController,
                decoration: const InputDecoration(
                  hintText: '876342524',
                  labelText: 'Cheque Number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  widget.form.chequeNumber = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ),
          const SizedBox(height: 10),
          TextFormField(
            controller: remarkController,
            decoration: const InputDecoration(
              hintText: 'eg. Good work!',
              labelText: 'Remarks',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.form.remarks = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
