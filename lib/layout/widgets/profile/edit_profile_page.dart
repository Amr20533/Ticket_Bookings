import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/auth/custom_input_field.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/models/profile/update_profile_model.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with TickerProviderStateMixin{
  late List<AnimationController> _animationControllers;
  late List<Animation<Offset>> _slideAnimations;

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


    _startStaggeredAnimations();

  }

  @override
  Widget build(BuildContext context) {
    final List<String> genders = [
      AppLocalizations.of(context).translate('male'),
      AppLocalizations.of(context).translate('female'),
    ];


    return Scaffold(
      appBar: customSettingsAppBar(context, title: AppLocalizations.of(context).translate('update-prof')),

      body: Consumer<ProfileNotifier>(
        builder: (context, profile, _){
          return Form(
            key: profile.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 22)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: AppLayout.getWidth(context, 58),
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: AppLayout.getWidth(context, 55),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(context, 30)),
                  SlideTransition(
                    position: _slideAnimations[0],
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                            child: CustomInputField(
                              controller: profile.firstNameController,
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
                              controller: profile.lastNameController,
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
                    position: _slideAnimations[0],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: profile.emailController,
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
                    position: _slideAnimations[0],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: profile.phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('phone')}';
                          }
                          return null;
                        },
                        label: AppLocalizations.of(context).translate('phone'),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[1],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                      child: CustomInputField(
                        controller: profile.dateOfBirthController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${AppLocalizations.of(context).translate('please_enter')} ${AppLocalizations.of(context).translate('password')}';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: const Icon(FluentSystemIcons.ic_fluent_calendar_date_regular),
                        ),
                        label: AppLocalizations.of(context).translate('DOB'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 6)),
                    child: Text(AppLocalizations.of(context).translate("gender"), style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Column(
                    children: List.generate(genders.length, (index) {
                      bool isSelected = profile.selectedGender == index;
                      return GestureDetector(
                        onTap: () {
                          profile.selectedGender = index;
                        },
                        child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: profile.selectedGender == index ? 1.0 : 0.5,
                            child: Container(
                              width: 25,
                              height: 25,
                              padding: EdgeInsets.all(AppLayout.getWidth(context, 2)),
                              margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 6)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: isSelected ? kPrimaryColor : kGreyColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isSelected ? kPrimaryColor : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Gap(AppLayout.getWidth(context, 10)),
                          Text(genders[index], style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 18),),

                        ],
                                            ),
                      );
                    }),
                  ),
                  const Spacer(),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: Padding(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(context, 22), bottom: AppLayout.getHeight(context, 14)),
                      child: CustomButton(
                        onPressed: (){
                          _updateProfile(context,profileNotifier: profile);
                        },
                        width: AppLayout.getScreenWidth(context),
                        height: AppLayout.getHeight(context, 60),
                        fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
                        title: AppLocalizations.of(context).translate('save'),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _updateProfile(BuildContext context, {required ProfileNotifier profileNotifier}) {

    UpdateProfileModel updateProfileModel = UpdateProfileModel(
        firstName: profileNotifier.firstNameController.text,
        lastName: profileNotifier.lastNameController.text,
        email: profileNotifier.emailController.text,
        phone: profileNotifier.phoneController.text,
        dateOfBirth: profileNotifier.dateOfBirthController.text,
        gender: profileNotifier.selectedGender.toString(),
    );
    if (profileNotifier.formKey.currentState!.validate()) {
      profileNotifier.updateProfile(updateProfileModel).then((status) {
        if(status['status'] == 'success'){
          Future.delayed(const Duration(seconds: 1));
          _clearForms(profileNotifier);
          Navigator.pop(context);
        }else{
          debugPrint('Could not Update your Password!!!');
        }
      });

    }else{
      debugPrint('Could not Update your Password!!!');
    }
  }

  void _clearForms(ProfileNotifier profileNotifier) {
    profileNotifier.firstNameController.clear();
    profileNotifier.lastNameController.clear();
    profileNotifier.emailController.clear();
    profileNotifier.phoneController.clear();
    profileNotifier.dateOfBirthController.clear();
  }


  Future<void> _startStaggeredAnimations() async {
    for (int i = 0; i < _animationControllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100)); // Stagger duration
      _animationControllers[i].forward();
    }
  }

  @override
  void dispose() {
    _animationControllers = [];
    _slideAnimations = [];
    super.dispose();
  }
}
