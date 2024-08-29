import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_text_button.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/auth/register_model.dart';
import 'package:ticket_booking_app/providers/auth/register_notifier.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin{
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<RegisterNotifier>(
        builder: (context, register, _){
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: register.formKey,
                child: Column(

                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: Text('${AppLocalizations.of(context).translate('reg-now')}!', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.w600, fontFamily: 'DMSerif'),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(context, 4), bottom: AppLayout.getHeight(context, 18)),
                      child: Text(AppLocalizations.of(context).translate('ent-info'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14,fontWeight: FontWeight.w400),),
                    ),
                    SlideTransition(
                      position: _animation,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                              child: CustomInputField(
                                controller: register.firstNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('firstName')}';
                                  }
                                  return null;
                                },
                                label: AppLocalizations.of(context).translate('firstName'),
                              ),
                            ),
                          ),
                          Gap(AppLayout.getWidth(context, 16)),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                              child: CustomInputField(
                                controller: register.lastNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('lastName')}';
                                  }
                                  return null;
                                },
                                label: AppLocalizations.of(context).translate('lastName'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SlideTransition(
                      position: _animation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                        child: CustomInputField(
                          controller: register.emailController,
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
                      position: _animation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                        child: CustomInputField(
                          controller: register.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('password')}';
                            }
                            return null;
                          },
                          label: AppLocalizations.of(context).translate('password'),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _animation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                        child: CustomInputField(
                          controller: register.confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('password')}';
                            }
                            return null;
                          },
                          label: AppLocalizations.of(context).translate('conf-pass'),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _buttonAnimation,
                      child: Padding(
                        padding: EdgeInsets.only(top: AppLayout.getHeight(context, 22)),
                        child: CustomButton(
                          onPressed: (){
                            _register(context,register: register);
                          },
                          width: AppLayout.getScreenWidth(context),
                          height: AppLayout.getHeight(context, 60),
                          fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                          title: AppLocalizations.of(context).translate('reg'),

                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context).translate('al-mem'),
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),),
                        CustomTextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.login);
                          },
                          text: AppLocalizations.of(context).translate('log'),),
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

  void _register(BuildContext context, {required RegisterNotifier register}) {
    RegisterModel registerModel = RegisterModel(
        firstName: register.firstNameController.text,
        lastName: register.lastNameController.text,
        email: register.emailController.text,
        password: register.passwordController.text,
        confirmPassword: register.confirmPasswordController.text
    );
    if (register.formKey.currentState!.validate()) {
      register.userRegister(registerModel).then((status) {
        if(status['status'] == 'success'){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registering...')),
          );
          _clearForms(register);
          Future.delayed(const Duration(seconds: 1), (){
            Navigator.pop(context);
          });
        }else{
          debugPrint('Could not Register!!!');
        }
      });

    }else{
      debugPrint('Could not Register!!!');
    }
  }

  void _clearForms(RegisterNotifier register) {
    register.emailController.clear();
    register.firstNameController.clear();
    register.lastNameController.clear();
    register.passwordController.clear();
    register.confirmPasswordController.clear();
  }
}


