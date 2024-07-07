import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/extensions/string_extension.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/bloc/bloc.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<AddressBloc, AddressBlocState>(
              buildWhen: (previous, current) => current is AddressLoaded,
              builder: (context, state) {
                LocationEntity? location =
                    state is AddressLoaded ? state.location : null;
                String fullAddress =
                    "${(location?.street?.isNotEmpty ?? false) ? '${location!.street!}, ' : ''}${(location?.locality?.isNotEmpty ?? false) ? '${location!.locality!}, ' : ''}${(location?.subAdministrativeArea?.isNotEmpty ?? false) ? '${location!.subAdministrativeArea!}, ' : ''}${(location?.administrativeArea?.isNotEmpty ?? false) ? '${location!.administrativeArea!}, ' : ''}${(location?.country?.isNotEmpty ?? false) ? '${location!.country!}, ' : ''}${(location?.postalCode?.isNotEmpty ?? false) ? '${location!.postalCode!}, ' : ''}";
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.pin_drop_outlined,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: 6.w,
                            ),
                          ),
                          TextSpan(
                            text: location?.name ?? 'Not Available'.hardcoded,
                            style: TextStyle(
                              fontFamily: AppFontFamilies.dmSans,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.chineeseBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      fullAddress.isNotEmpty
                          ? fullAddress
                          : 'Not Available'.hardcoded,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: AppFontFamilies.dmSans,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.pureWhite,
          ),
        ],
      ),
    );
  }
}
