import 'package:flutter/material.dart';

void main() {
  runApp(const PremiumCoffeeApp());
}

class Coffee {
  final String name;
  final String description;
  final double price;
  final IconData icon;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}

class PremiumCoffeeApp extends StatelessWidget {
  const PremiumCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أروما كافيه',
      debugShowCheckedModeBanner: false,
  
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F7F4),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF00B894), // Mint Green
          secondary: Color(0xFF6C5CE7), // Vibrant Purple
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Color(0xFF2D3436), fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Color(0xFF2D3436)),
        ),
        fontFamily: 'Roboto', 
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const WelcomeScreen(), 
    );
  }
}

// شاشة الترحيب / تسجيل الدخول


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF55E6C1), Color(0xFFF0F7F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.spa_rounded, size: 100, color: Color(0xFF00B894)),
            const SizedBox(height: 20),
            const Text(
              'أروما كافيه',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
            ),
            const SizedBox(height: 10),
            const Text(
              'لحظات مليئة بالحياة والسعادة',
              style: TextStyle(fontSize: 16, color: Color(0xFF636E72)),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
            
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B894),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('ابدأ رحلة السعادة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}


//  الشاشة الرئيسية

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أهلاً بك 👋', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'كيف نعدل مزاجك اليوم؟',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            
            // بطاقة الانتقال إلى قائمة المنتجات
            _buildActionCard(
              context,
              title: 'قائمة المشروبات',
              subtitle: 'استكشف تشكيلتنا الواسعة من القهوة',
              icon: Icons.menu_book_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
            ),
            
            const SizedBox(height: 20),
            
         
            _buildActionCard(
              context,
              title: 'عن أروما كافيه',
              subtitle: 'تعرف على قصتنا وشغفنا بالقهوة',
              icon: Icons.info_outline_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
                  const SizedBox(height: 5),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF636E72), fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFB2BEC3), size: 16),
          ],
        ),
      ),
    );
  }
}


//  شاشة التفاصيل العامة (معلومات عامة)

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عن أروما')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome_rounded, size: 80, color: Color(0xFF00B894)),
              const SizedBox(height: 30),
              const Text(
                'شغفنا هو تقديم لحظات سعيدة.\nنحن نختار كل تفصيلة لتشرح صدرك وتجدد طاقتك.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.5, color: Color(0xFF2D3436)),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('العودة للرئيسية'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5CE7),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//  شاشة قائمة المنتجات

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Coffee> coffees = [
      Coffee(name: 'إسبريسو', description: 'قهوة مركزة وغنية تعتصر خلاصة البن', price: 12.0, icon: Icons.coffee_rounded),
      Coffee(name: 'كابتشينو', description: 'إسبريسو متوازن مع حليب مبخر ورغوة غنية', price: 16.0, icon: Icons.local_cafe_rounded),
      Coffee(name: 'لاتيه', description: 'مزيج ناعم من الإسبريسو مع كمية وفيرة من الحليب', price: 18.0, icon: Icons.emoji_food_beverage_rounded),
      Coffee(name: 'موكا دافئة', description: 'لمحبي الشوكولاتة والقهوة معاً بلمسة ساحرة', price: 20.0, icon: Icons.coffee_maker_rounded),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('القائمة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          final coffee = coffees[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00B894).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(coffee.icon, color: const Color(0xFF00B894), size: 30),
              ),
              title: Text(coffee.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('${coffee.price} ريال', style: const TextStyle(color: Color(0xFF6C5CE7), fontWeight: FontWeight.bold)),
              ),
              trailing: const Icon(Icons.add_circle_outline_rounded, color: Color(0xFF00B894)),
              onTap: () async {
                
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeeDetailScreen(coffee: coffee),
                  ),
                );

                // التأكد من استلام النتيجة وأن الشاشة ما زالت في واجهة العرض
                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(result.toString(), style: const TextStyle(fontFamily: 'Roboto')),
                        ],
                      ),
                      backgroundColor: Colors.green.shade800,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}


class CoffeeDetailScreen extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المشروب')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // صورة تعبيرية للمنتج (أيقونة كبيرة بتصميم جميل)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4A373).withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD4A373).withOpacity(0.2),
                          blurRadius: 50,
                          spreadRadius: 10,
                        )
                      ],
                    ),
                    child: Icon(coffee.icon, size: 100, color: const Color(0xFFD4A373)),
                  ),
                  const SizedBox(height: 40),
                  
              
                  Text(
                    coffee.name,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${coffee.price} ريال',
                    style: const TextStyle(fontSize: 24, color: Color(0xFFD4A373), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    coffee.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          
      
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      
                      Navigator.pop(context, 'تمت إضافة "${coffee.name}" لطلباتك السعيدة 🌟');
                    },
                    icon: const Icon(Icons.favorite_rounded),
                    label: const Text('أضف للمفضلة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B894),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
