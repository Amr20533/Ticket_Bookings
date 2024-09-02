import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/providers/auth/forgot_password_notifier.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with TickerProviderStateMixin{
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
                    opacity: _fadeAnimations[0],
                    child: Text(
                      AppLocalizations.of(context).translate('ent-pass'),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'DMSerif', fontSize: 26)),
                  ),
                  FadeTransition(
                    opacity: _fadeAnimations[0],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 12)),
                      child: Text(AppLocalizations.of(context).translate('ent-new-pass'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14,fontWeight: FontWeight.w400),),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[1],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: forgotPassword.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('password')}';
                          }
                          return null;
                        },
                        secure: forgotPassword.isPassword,
                        suffixIcon: IconButton(
                          onPressed: (){
                            forgotPassword.isPassword = !forgotPassword.isPassword;
                          },
                          icon: Icon(forgotPassword.isPassword ? FluentSystemIcons.ic_fluent_eye_show_regular : FluentSystemIcons.ic_fluent_eye_hide_regular),
                        ),
                        label: AppLocalizations.of(context).translate('password'),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: forgotPassword.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('password')}';
                          }
                          return null;
                        },
                        secure: forgotPassword.isConfirmPassword,
                        suffixIcon: IconButton(
                          onPressed: (){
                            forgotPassword.isConfirmPassword = !forgotPassword.isConfirmPassword;
                          },
                          icon: Icon(forgotPassword.isConfirmPassword ? FluentSystemIcons.ic_fluent_eye_show_regular : FluentSystemIcons.ic_fluent_eye_hide_regular),
                        ),
                        label: AppLocalizations.of(context).translate('conf-pass'),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: Padding(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(context, 22)),
                      child: CustomButton(
                        onPressed: (){
                          // _sendCode(context,forgotPassword: forgotPassword);
                          Navigator.of(context).pushReplacement(customPageTransition(widget: const LoginScreen()));

                        },
                        width: AppLayout.getScreenWidth(context),
                        height: AppLayout.getHeight(context, 60),
                        fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                        title: AppLocalizations.of(context).translate('verify'),

                      ),
                    ),
                  ),

                ]),
          );
        },
      ),
    );
  }
}
