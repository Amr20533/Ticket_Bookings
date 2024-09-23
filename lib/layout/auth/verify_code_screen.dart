import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/auth/reset_password.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/providers/auth/forgot_password_notifier.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> with TickerProviderStateMixin{
  late List<AnimationController> _animationControllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationControllers = List<AnimationController>.generate(
      4,
          (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _slideAnimations = _animationControllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 1.0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();

    _fadeAnimations = _animationControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();

    _fadeInText();
    _startStaggeredAnimations();

  }

  void _fadeInText() {
    setState(() {
      _isVisible = true;
    });
  }

  Future<void> _startStaggeredAnimations() async {
    for (int i = 0; i < _animationControllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100)); // Stagger duration
      _animationControllers[i].forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingsAppBar(context, title: ""),
      body: Consumer<ForgotPasswordNotifier>(
        builder: (context, forgotPassword, _){
          return Container(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 15), horizontal: AppLayout.getWidth(context, 22)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _fadeAnimations[0],                 child: Text(
                      AppLocalizations.of(context).translate('otp-code'),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'DMSerif', fontSize: 26)),
                  ),
                  FadeTransition(
                    opacity: _fadeAnimations[1],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 4)),
                      child: Text('${AppLocalizations.of(context).translate('send-otp')} ${forgotPassword.resetEmail}', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14,fontWeight: FontWeight.w400),),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 18)),
                      child: OtpTextField(
                        // autoFocus: true,
                        fieldWidth: AppLayout.getWidth(context, 50.0),
                        borderRadius: BorderRadius.circular(10),
                        numberOfFields: 6,
                        borderColor: kBlackColor,
                        disabledBorderColor: kBlackColor,
                        borderWidth: 2,
                        focusedBorderColor: kPrimaryColor ,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          forgotPassword.verifyCode = code;
                        },
                        onSubmit: (String verificationCode) {

                        }, // end onSubmit
                      ),
                    ),
                  ),

                  SlideTransition(
                    position: _slideAnimations[3],
                    child: Padding(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(context, 22)),
                      child: CustomButton(
                        onPressed: (){
                          // _sendCode(context,forgotPassword: forgotPassword);
                            Navigator.of(context).push(customPageTransition(widget: const ResetPasswordScreen()));

                        },
                        width: AppLayout.getScreenWidth(context),
                        height: AppLayout.getHeight(context, 60),
                        fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                        title: AppLocalizations.of(context).translate('Verify'),

                      ),
                    ),
                  ),

            ]),
          );
        },
      ),
    );
  }
  void _verifyCode(BuildContext context, {required ForgotPasswordNotifier forgotPassword, required String verifyCode}) {
    if (verifyCode.isNotEmpty) {
      // forgotPassword.userForgotPassword(forgotPasswordModel).then((status) {
      //   if(status['status'] == 'success'){
      //     forgotPassword.resetEmail = forgotPassword.emailController.text;
      //     Navigator.of(context).push(customPageTransition(widget: const VerifyCodeScreen()));
      //     forgotPassword.emailController.clear();
      //
      //   }else{
      //     debugPrint('Could not send Code to your Email!!!');
      //   }
      // });

    }else{
      debugPrint('Could not send Code to your Email!!!');
    }
  }


  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
