import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/keys_manager.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 0.4.sw,
      isLoading: isLoading,
      onPressed: () async {
        setState(() {
          isLoading = true;
        });

        await FirebaseAuthService.signOut();
        CacheHelper.removeData(key: KeysManager.isLoggedIn);

        setState(() {
          isLoading = false;
        });

        Navigator.pushNamedAndRemoveUntil(
          context,
          PageName.loginScreen,
          (route) => false,
        );
      },
      text: context.tr.logout,
    );
  }
}
