import 'package:data_visual_cubeten/screens/chart.dart';
import 'package:data_visual_cubeten/screens/detail.dart';
import 'package:data_visual_cubeten/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';

void main() {
  var queryClient = QueryClient();
  runApp(
    QueryClientProvider(
      queryClient: queryClient,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      getPages: [
        GetPage(
          name: HomeScreen.routeName,
          page: () => const SafeArea(child: Scaffold(body: HomeScreen())),
        ),
        GetPage(
          name: DetailData.routeName,
          page: () => const DetailData(),
        ),
        GetPage(
          name: ChartScreen.routeName,
          page: () => const ChartScreen(),
        )
      ],
    );
  }
}
