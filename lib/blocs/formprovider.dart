import 'package:bloc_login/blocs/formbloc.dart';
import 'package:flutter/cupertino.dart';

class FormProvider extends InheritedWidget {
  final bloc = FormBloc();

  FormProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FormProvider) as FormProvider)
        .bloc;
  }
}
