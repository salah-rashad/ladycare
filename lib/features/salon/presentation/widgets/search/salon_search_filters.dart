import '../../../../../core/utils/extensions.dart';
import '../../../../../global/widgets/buttons/custom_elevated_button.dart';
import '../../../../../injection_container.dart';
import '../../bloc/salon_search_cubit/salon_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_range/time_range.dart';

class SalonSearchFilters extends StatelessWidget {
  const SalonSearchFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = sl<SalonSearchCubit>();
    return BlocBuilder<SalonSearchCubit, SalonSearchState>(
      bloc: cubit,
      builder: (context, state) {
        final selectedRating = cubit.state.filterMinRate;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "تصفية حسب الخدمات:",
                style: context.textTheme.titleMedium,
              ),
              _servicesList(cubit),
              const Divider(height: 0.0),
              Text(
                () {
                  switch (selectedRating) {
                    case 0.0:
                      return "تصفية حسب التقييم:";
                    case 5.0:
                      return "تصفية حسب التقييم ($selectedRating)";
                    default:
                      return "تصفية حسب التقييم ($selectedRating+)";
                  }
                }(),
                style: context.textTheme.titleMedium,
              ),
              Slider(
                min: 0,
                max: 5,
                divisions: 5,
                value: selectedRating,
                onChanged: cubit.updateMinRating,
                label: "$selectedRating",
              ),
              const Divider(height: 0.0),
              Text(
                "تصفية حسب أوقات العمل:",
                style: context.textTheme.titleMedium,
              ),
              _timeRangePicker(context, cubit),
              const SizedBox(height: 16.0),
              CustomElevatedButton(
                onPressed: () {
                  cubit.search();
                  Navigator.pop(context);
                },
                text: "بحث",
              )
            ].withGap(height: 16.0),
          ),
        );
      },
    );
  }

  Wrap _servicesList(SalonSearchCubit cubit) {
    return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: cubit.getServiceCategories().map((e) {
                bool isSelected =
                    cubit.state.filterServices.contains(e.name);
                return FilterChip(
                  label: Text(e.name),
                  onSelected: (selected) {
                    if (selected) {
                      cubit.addServiceFilter(e.name);
                    } else {
                      cubit.removeServiceFilter(e.name);
                    }
                  },
                  selected: isSelected,
                );
              }).toList(),
            );
  }

  Widget _timeRangePicker(BuildContext context, SalonSearchCubit cubit) {
    return TimeRange(
      titlePadding: 0,
      fromTitle: Text('من', style: context.textTheme.titleSmall),
      toTitle: Text('إلى', style: context.textTheme.titleSmall),
      // textStyle
      textStyle: context.textTheme.labelMedium
          .apply(color: context.colors.tertiaryText),
      activeTextStyle:
          context.textTheme.labelMedium.apply(color: context.colors.white),
      // normal
      // borderColor: context.colors.tertiaryText,
      // backgroundColor: Colors.transparent,
      // active
      // activeBorderColor: context.colors.primary,
      // activeBackgroundColor: context.colors.primary,
      // start & end times
      firstTime: const TimeOfDay(hour: 6, minute: 0),
      lastTime: const TimeOfDay(hour: 24, minute: 00),
      timeStep: 30,
      timeBlock: 30,
      onRangeCompleted: cubit.onTimeRangeCompleted,
      initialRange: () {
        final startTime = cubit.state.filterStartTime;
        final endTime = cubit.state.filterEndTime;

        if (startTime != null && endTime != null) {
          return TimeRangeResult(startTime, endTime);
        }
      }(),
    );
  }
}
