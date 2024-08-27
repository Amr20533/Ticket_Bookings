import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/auth/login_model.dart';
import 'package:ticket_booking_app/providers/auth/login_notifier.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: Text(AppLocalizations.of(context).translate('let-log'), style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.w600, fontFamily: 'DMSerif'),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: login.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        label: AppLocalizations.of(context).translate('mail'),
                      ),
                    ),
                    Padding(
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
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(onPressed: (){},
                        child: Text(AppLocalizations.of(context).translate('forgot-pass'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor),),),
                    ),
                    CustomButton(
                      onPressed: (){
                        _login(login);
                      },
                      width: AppLayout.getScreenWidth(context),
                      height: AppLayout.getHeight(context, 60),
                      fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                      title: AppLocalizations.of(context).translate('log'),

                    ),
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
  void _login(LoginNotifier loginNotifier) {
    LoginModel loginModel = LoginModel(
        email: loginNotifier.emailController.text,
        password: loginNotifier.passwordController.text
    );
    if (loginNotifier.formKey.currentState!.validate()) {
      loginNotifier.userLogin(loginModel).then((status) {
        if(status['status'] == 'success'){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logging in...')),
          );
          Navigator.pop(context);
        }else{
          debugPrint('Could not Login!!!');
        }
      });

    }else{
      debugPrint('Could not Login!!!');
    }
  }
}

