import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';

class DeleteAccountCard extends StatefulWidget {
  const DeleteAccountCard({
    super.key,
  });

  @override
  State<DeleteAccountCard> createState() => _DeleteAccountCardState();
}

class _DeleteAccountCardState extends State<DeleteAccountCard> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late AnimationController _buttonAnimationController;
  late Animation<Offset> _animation;
  late Animation<Offset> _buttonAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 700),
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

    _animationController.forward();
    _buttonAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 16))
      ),
      child: Consumer<ProfileNotifier>(
        builder:(context, account, _){
          return Form(
            key: account.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16)),
                  child: Text('${AppLocalizations.of(context).translate('acc')}!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'DMSerif', fontSize: 30,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(AppLocalizations.of(context).translate('remove-all-data'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 3)),
                  child: Text('${AppLocalizations.of(context).translate('undo-remove')}.',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('${AppLocalizations.of(context).translate('ent-pass-first')}.',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SlideTransition(
                  position: _animation,
                  child: Container(
                    height: AppLayout.getHeight(context, 60),
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                    margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8), horizontal: AppLayout.getWidth(context, 20), ),
                    child: CustomInputField(
                      controller: account.passwordController,
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 4), horizontal: AppLayout.getWidth(context, 20), ),
                  child: Row(
                    children: [
                      Expanded(child: SlideTransition(
                        position: _buttonAnimation,
                        child: CustomButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          width: AppLayout.getScreenWidth(context),
                          height: AppLayout.getHeight(context, 40),
                          buttonColor: Colors.white,
                          border: BorderSide(width: AppLayout.getWidth(context, 1.5), color: kPrimaryColor),
                          fontSize: 16,
                          borderRadius: 36,
                          textColor: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          hPadding: 0,
                          title: AppLocalizations.of(context).translate('cancel'),

                        ),
                      )),
                      Gap(AppLayout.getWidth(context, 12)),
                      Expanded(child: SlideTransition(
                        position: _buttonAnimation,
                        child: CustomButton(
                          onPressed: (){
                            _deleteUserAccount(context, profileNotifier: account);
                          },
                          width: AppLayout.getScreenWidth(context),
                          height: AppLayout.getHeight(context, 40),
                          fontSize: 16,
                          borderRadius: 36,
                          fontWeight: FontWeight.w400,
                          hPadding: 0,
                          buttonColor: kRedColor,
                          title: AppLocalizations.of(context).translate('delete'),

                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
  void _deleteUserAccount(BuildContext context, {required ProfileNotifier profileNotifier}) {

    if (profileNotifier.formKey.currentState!.validate()) {
      profileNotifier.deleteAccount().then((status) {
        if(status['status'] == 'success'){
          profileNotifier.passwordController.clear();
          Navigator.of(context).pushReplacementNamed(AppRoutes.main);
        }else{
          debugPrint('Could not Update your Password!!!');
        }
      });

    }else{
      debugPrint('Could not Update your Password!!!');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }
}
