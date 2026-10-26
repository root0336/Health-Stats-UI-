import 'package:flutter/material.dart';

void main() {
  runApp(const HealthStatsApp());
}

class HealthStatsApp extends StatelessWidget {
  const HealthStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stats Screen',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F8FD),
      ),
      home: const StatsScreen(),
    );
  }
}

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _selectedTab = 0; // 0: Day, 1: Week, 2: Month
  int _selectedNavIndex = 1; // Stats selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color(0xFFEFF2F9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Color(0xFF555B77),
            ),
            onPressed: () {},
          ),
        ),
        centerTitle: true,
        title: const Text(
          'STATS',
          style: TextStyle(
            color: Color(0xFF383868),
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              // Segmented Time Filter
              Container(
                height: 48,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF1F8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    _buildTabItem('Day', 0),
                    _buildTabItem('Week', 1),
                    _buildTabItem('Month', 2),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Metric Cards Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.05,
                children: const [
                  StatCard(
                    title: 'Hart Rate',
                    value: '124',
                    unit: 'bpm',
                    subLabel1: '80-120',
                    subLabel2: 'Healthy',
                    icon: Icons.favorite,
                    gradientColors: [Color(0xFFFF7272), Color(0xFFFF5252)],
                  ),
                  StatCard(
                    title: 'Sleep',
                    value: '8 h 42 m',
                    unit: '',
                    subLabel1: 'Deep Sleep',
                    subLabel2: '5 h 13 m',
                    icon: Icons.nights_stay,
                    gradientColors: [Color(0xFF8B6BF7), Color(0xFF6C42F5)],
                  ),
                  StatCard(
                    title: 'Energy Burn',
                    value: '583',
                    unit: 'kcal',
                    subLabel1: 'Daily Goal',
                    subLabel2: '900 kcal',
                    icon: Icons.local_fire_department,
                    gradientColors: [Color(0xFFFFB356), Color(0xFFFF8A3D)],
                  ),
                  StatCard(
                    title: 'Steps',
                    value: '16,741',
                    unit: '',
                    subLabel1: 'Daily Goal',
                    subLabel2: '20,000 Steps',
                    icon: Icons.directions_walk,
                    gradientColors: [Color(0xFF48D3FF), Color(0xFF22B9ED)],
                  ),
                  StatCard(
                    title: 'Running',
                    value: '5,3',
                    unit: 'km',
                    subLabel1: 'Daily Goal',
                    subLabel2: '10 km',
                    icon: Icons.directions_run,
                    gradientColors: [Color(0xFF5E73FF), Color(0xFF3F52FF)],
                  ),
                  StatCard(
                    title: 'Cycling',
                    value: '12,5',
                    unit: 'km',
                    subLabel1: 'Daily Goal',
                    subLabel2: '20 km',
                    icon: Icons.pedal_bike,
                    gradientColors: [Color(0xFFA1E343), Color(0xFF81D21B)],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) => setState(() => _selectedNavIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF5E73FF),
        unselectedItemColor: const Color(0xFFA0A7BA),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarViewItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarViewItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Stats',
          ),
          BottomNavigationBarViewItem(
            icon: Icon(Icons.emoji_events),
            label: 'Rewards',
          ),
          BottomNavigationBarViewItem(
            icon: Icon(Icons.ads_click),
            label: 'Goals',
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF5759A9) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF8A90A6),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String subLabel1;
  final String subLabel2;
  final IconData icon;
  final List<Color> gradientColors;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.subLabel1,
    required this.subLabel2,
    required this.icon,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header Row (Title + Circular Icon Badge)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 16),
              ),
            ],
          ),

          // Value and Unit
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Footer Sub-labels aligned to bottom right
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  subLabel1,
                  style: const TextStyle(color: Colors.white60, fontSize: 11),
                ),
                Text(
                  subLabel2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper class for custom BottomNavigationBarItem without conflicting standard names
class BottomNavigationBarViewItem extends BottomNavigationBarItem {
  const BottomNavigationBarViewItem({
    required Widget icon,
    required String label,
  }) : super(icon: icon, label: label);
}
