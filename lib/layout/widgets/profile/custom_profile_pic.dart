import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_bottom_sheet_button.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';

class CustomProfilePic extends StatelessWidget {
  const CustomProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileNotifier profile = Provider.of<ProfileNotifier>(context);
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: AppLayout.getWidth(context, 100),
        height: AppLayout.getWidth(context, 100),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child:  Stack(alignment: Alignment.bottomRight,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: AppLayout.getWidth(context, 100) - 3,
              height: AppLayout.getWidth(context, 100) - 3,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            InkWell(
              onTap: () {
                _showBottomSheet(context, profile);
              },
              child: Container(
                width: AppLayout.getWidth(context, 35),
                height: AppLayout.getWidth(context, 35),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed:(){},
                    icon: const Icon(FluentSystemIcons.ic_fluent_camera_add_filled, color: kPrimaryColor,size: 22,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> _showBottomSheet(context, ProfileNotifier controllerImp){

    return showModalBottomSheet(context: context,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        barrierColor: Colors.black26,
        elevation: 0.0,
        isDismissible: false,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (context) => Container(
            padding:const EdgeInsets.symmetric(vertical: 10),
            height: 825 * 0.29,
            width:double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(42),topLeft: Radius.circular(42)),
            ),
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 2.7,width:95,margin: const EdgeInsets.only(top: 2.0,bottom: 10.0,),
                      decoration:BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Text('359',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),),
                    ),  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('360',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14,color: const Color(0XFF7A7A7A),fontWeight: FontWeight.w400),),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomBottomSheetButton(onPressed: (){
                          // Get.to(TakePictureScreen());
                        },
                            text: "361",
                            image: AppAssets.profileAddPhoto,size: 28,)),
                        Expanded(
                            child: CustomBottomSheetButton(onPressed: (){
                          // controllerImp.pickImage();
                          Navigator.pop(context);
                        },
                            text: "362", image: AppAssets.profileGalleryIcon)),
                      ],
                    ),
                    CustomBottomSheetButton(
                        onPressed: () => Navigator.pop(context),
                        text: "93",
                        isCancel: true
                    ),

                  ]),
            )
        ));
  }

}
