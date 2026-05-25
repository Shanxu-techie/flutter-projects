import 'package:ecommerce_project/pages/home_page.dart';
import 'package:ecommerce_project/providers/cart_provider.dart';
import 'package:ecommerce_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// https://ikljeooagekhecbihvgx.supabase.co
// sb_publishable__sXLa34IlNoDYpFcMAb51g_48WYG_dn

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ikljeooagekhecbihvgx.supabase.co',
    anonKey: 'sb_publishable__sXLa34IlNoDYpFcMAb51g_48WYG_dn',
  );

  runApp(const MyApp());
}

// Cart: It is just a list
//Cart List:
//Krunch Burger, Qty: 2
//Chicken n Chips, Qty:1
// Add to Cart
// View

// Update
// Delete
//CRUD - 3: Data changes(CREATE, UPDATE, DELETE), 1: No change in data(Read)
// proceed to checkout

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: HomePage(),
      ),
    );
  }
}
