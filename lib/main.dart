import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valiance_task/src/config/routes/app_routes.dart';
import 'package:valiance_task/src/config/themes/app_theme.dart';
import 'package:valiance_task/src/core/utils/constants.dart';
import 'package:valiance_task/src/injector.dart';
import 'package:valiance_task/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_) => injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}
