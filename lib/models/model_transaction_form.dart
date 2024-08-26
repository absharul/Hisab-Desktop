import 'package:hisab/database/app_database.dart';
import 'package:hisab/utils/enums.dart';

class ModelTransactionForm {
  String? fromEntity;
  String? toEntity;

  Category? fromCategory;
  Category? toCategory;

  SubCategory? fromSubCategory;
  SubCategory? toSubCategory;

  dynamic fromUser;
  dynamic toUser;

  EnumPaymentMethod? paymentMethod;
  EnumBankAccount? fromBankAccountOption;
  EnumBankAccount? toBankAccountOption;

  String? fromAccountNumber;
  String? toAccountNumber;

  String? fromIfscCode;
  String? toIfscCode;

  String? fromAccountHolderName;
  String? toAccountHolderName;

  String? fromBankName;
  String? toBankName;

  int? fromBankAccountId;
  int? toBankAccountId;
  double? totalAmount;
  String? chequeNumber;
  String? remarks;

  ModelTransactionForm({
    this.fromEntity,
    this.toEntity,
    this.fromCategory,
    this.toCategory,
    this.fromSubCategory,
    this.toSubCategory,
    this.fromUser,
    this.toUser,
    this.paymentMethod,
    this.fromBankAccountOption,
    this.toBankAccountOption,
    this.fromAccountNumber,
    this.toAccountNumber,
    this.fromIfscCode,
    this.toIfscCode,
    this.fromAccountHolderName,
    this.toAccountHolderName,
    this.fromBankName,
    this.toBankName,
    this.fromBankAccountId,
    this.toBankAccountId,
    this.totalAmount,
    this.chequeNumber,
    this.remarks,
  });
}
