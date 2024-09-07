import 'package:flutter_bloc/flutter_bloc.dart';

class PassCubit extends Cubit<bool> {
  PassCubit() : super(false);

  void toggleVisibility() => emit(!state);
}