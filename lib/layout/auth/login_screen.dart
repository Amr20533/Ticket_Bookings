import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';
import 'package:ticket_booking_app/layout/auth/forgot_password.dart';
import 'package:ticket_booking_app/layout/auth/register_screen.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_text_button.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/auth/login_model.dart';
import 'package:ticket_booking_app/providers/auth/login_notifier.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late AnimationController _buttonAnimationController;
  late AnimationController _textAnimationController;
  late Animation<Offset> _animation;
  late Animation<Offset> _buttonAnimation;
  late Animation<Offset> _textAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _textAnimationController = AnimationController(
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
      begin: const Offset(0, -1.0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
    _buttonAnimationController.forward();
    _textAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, login, _){
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: login.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: Text(AppLocalizations.of(context).translate('let-log'), style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.w600, fontFamily: 'DMSerif'),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 4)),
                      child: Text(AppLocalizations.of(context).translate('ent-info'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14,fontWeight: FontWeight.w400),),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 18)),
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            height: 1,
                            color: kGreyColor.withOpacity(0.4),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                            child: Text(AppLocalizations.of(context).translate('log-with')),
                          ),
                          Expanded(child: Container(
                            height: 1,
                            color: kGreyColor.withOpacity(0.4),
                          )),
                        ],
                      ),
                    ),
                    SlideTransition(
                      position: _animation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                        child: CustomInputField(
                          controller: login.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          label: AppLocalizations.of(context).translate('mail'),
                        ),
                      ),
                    ),
                    SlideTransition(
                        position: _animation,
                        child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                        child: CustomInputField(
                          controller: login.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          label: AppLocalizations.of(context).translate('password'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: SlideTransition(
                        position: _buttonAnimation,
                        child: CustomTextButton(
                          onPressed: (){
                            Navigator.of(context).push(customPageTransition(widget: const ForgotPasswordScreen()));
                          },
                          text: AppLocalizations.of(context).translate('forgot-pass'),),
                      ),
                    ),
                    SlideTransition(
                      position: _textAnimation,
                      child: CustomButton(
                        onPressed: (){
                          _login(context,loginNotifier: login);
                        },
                        width: AppLayout.getScreenWidth(context),
                        height: AppLayout.getHeight(context, 60),
                        fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                        title: AppLocalizations.of(context).translate('log'),

                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context).translate('have-acc'),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),),
                        CustomTextButton(
                          onPressed: (){
                            Navigator.of(context).push(customPageTransition(widget: const RegisterScreen()));
                          },
                          text: AppLocalizations.of(context).translate('reg-now'),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///ali.hassan@safwa.com
  /// test1234
  void _login(BuildContext context, {required LoginNotifier loginNotifier}) {
    LoginModel loginModel = LoginModel(
        email: loginNotifier.emailController.text,
        password: loginNotifier.passwordController.text
    );
    // LoginModel loginModel = LoginModel(
    //     email: 'ali.hassan@safwa.com',
    //     password: 'test1234'
    // );
    if (loginNotifier.formKey.currentState!.validate()) {
      loginNotifier.userLogin(loginModel).then((status) {
        if(status['status'] == 'success'){
          debugPrint('Logged in');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logging in...')),
          );
          Navigator.pushReplacementNamed(context, AppRoutes.main);
        }else{
          debugPrint('Could not Login!!!');
        }
      });

    }else{
      debugPrint('Could not Login!!!');
    }
  }
  @override
  void dispose() {
    _animationController.dispose();
    _buttonAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

}


