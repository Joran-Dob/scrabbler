import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'yesy_state.dart';

class YesyCubit extends Cubit<YesyState> {
  YesyCubit() : super(YesyInitial());
}
