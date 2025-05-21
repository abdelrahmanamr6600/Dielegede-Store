import 'package:dielegende_store/core/shared/fun/LoginRequiredBottomSheet.dart';
import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:flutter/widgets.dart';

Future<void> handleAuthRequiredAsyncAction(
  BuildContext context,
  Future<void> Function() action,
) async {
  final token = await SecureStorageHelper.getToken();

  if (token == null || token.isEmpty) {
    showLoginRequiredBottomSheet(context);
  } else {
    await action();
  }
}
