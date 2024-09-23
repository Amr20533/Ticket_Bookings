import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';
import 'package:ticket_booking_app/layout/auth/verify_code_screen.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/models/auth/forgot_password_model.dart';
import 'package:ticket_booking_app/providers/auth/forgot_password_notifier.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Animation<Offset> _buttonAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );


    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _buttonAnimation = Tween<Offset>(
      begin: const Offset(-1.0, -1.0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingsAppBar(context, title: ""),
      body: Consumer<ForgotPasswordNotifier>(
        builder: (context, forgotPassword, _){
          return Container(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 15), horizontal: AppLayout.getWidth(context, 22)),
            child: Form(
              key: forgotPassword.formKey,
              child:ListView(children: [
                Text(
                    AppLocalizations.of(context).translate('forgot-pass'),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'DMSerif', fontSize: 26)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 4)),
                  child: Text(AppLocalizations.of(context).translate('send-code'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14,fontWeight: FontWeight.w400),),
                ),
                SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                    child: CustomInputField(
                      controller: forgotPassword.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('mail')}';
                        }
                        return null;
                      },
                      label: AppLocalizations.of(context).translate('mail'),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _buttonAnimation,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppLayout.getHeight(context, 22)),
                    child: CustomButton(
                      onPressed: (){
                        _sendCode(context,forgotPassword: forgotPassword);
                      },
                      width: AppLayout.getScreenWidth(context),
                      height: AppLayout.getHeight(context, 60),
                      fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                      title: AppLocalizations.of(context).translate('continue'),

                    ),
                  ),
                ),

              ]),
            ),
          );
        },
      ),
    );
  }
  void _sendCode(BuildContext context, {required ForgotPasswordNotifier forgotPassword}) {
    ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel(
        email: forgotPassword.emailController.text,
    );
    if (forgotPassword.formKey.currentState!.validate()) {

      try {
        forgotPassword.userForgotPassword(forgotPasswordModel);
        forgotPassword.resetEmail = forgotPassword.emailController.text;
        Navigator.of(context).push(customPageTransition(widget: const VerifyCodeScreen()));
        forgotPassword.emailController.clear();

      }catch (e) {
        debugPrint('Error during forgot password request: $e');
      }

    }else{
      debugPrint('Could not send Code to your Email!!!');
    }
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
