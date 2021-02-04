import 'package:provider/single_child_widget.dart';
import '../viewModel/counter_view_model.dart';
import '../viewModel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../model/user_info.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => HYCounterViewModel()),
  ChangeNotifierProvider(
      create: (ctx) => UserViewModel(UserInfo('why', 20, 'url')))
];
