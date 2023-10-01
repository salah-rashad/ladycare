import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/widgets/errors_list.dart';

class FormErrorsList<B extends BlocBase<S>, S, E extends S>
    extends StatelessWidget {
  final List<String> Function(E state) messages;
  const FormErrorsList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, E?>(
      selector: (state) {
        if (state is E) return state;
        return null;
      },
      builder: (context, state) {
        if (state != null) {
          return ErrorsList(
            messages: messages(state),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
