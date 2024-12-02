import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "나의 당근",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // 앱 설정 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // 프로필 섹션
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150",
                  ), // 프로필 이미지
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "전형서",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 220,),
                OutlinedButton.icon(
                  onPressed: (){}, 
                  label: Text(
                    "프로필 보기",
                    style: TextStyle(
                    fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),

          Column(
            children: [
              Text(
                "나의 거래",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 관심목록 메뉴
          _buildMenuItem(
            icon: Icons.favorite_border,
            title: "관심목록",
            onTap: () {
              // 관심목록 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(),
                ),
              );
            },
          ),

          // 판매내역 메뉴
          _buildMenuItem(
            icon: Icons.sell_outlined,
            title: "판매내역",
            onTap: () {
              // 판매내역 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SalesPage(),
                ),
              );
            },
          ),

          // 구매내역 메뉴
          _buildMenuItem(
            icon: Icons.shopping_cart_outlined,
            title: "구매내역",
            onTap: () {
              // 구매내역 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PurchasePage(),
                ),
              );
            },
          ),


          // 중고거래 메뉴
          _buildMenuItem(
            icon: Icons.shopping_cart_outlined,
            title: "중고거래 가계부",
            onTap: () {
              // 중고거래 가계부 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PurchasePage(),
                ),
              );
            },
          ),
          const Divider(),

          Column(
            children: [
              Text(
                "당근 소식",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 이벤트 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "이벤트",
            onTap: () {
              // 이벤트 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          // 공지사항 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "공지사항",
            onTap: () {
              // 공지사항 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Divider(),
          Column(
            children: [
              Text(
                "나의 동네생활",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 내 동네생활 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "내 동네생활",
            onTap: () {
              // 내 동네생활 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Divider(),
          Column(
            children: [
              Text(
                "동네 업체",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 후기 및 제안한 장소 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "후기 및 제안한 장소",
            onTap: () {
              // 후기 및 제안한 장소 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Divider(),

          Column(
            children: [
              Text(
                "나의 비즈니스",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // 비즈프로필 관리 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "비즈프로필 관리",
            onTap: () {
              // 비즈프로필 관리 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          // 광고 메뉴
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "광고",
            onTap: () {
              // 광고 페이지 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// 관심목록 페이지
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("관심목록"),
      ),
      body: const Center(
        child: Text("관심목록 페이지입니다."),
      ),
    );
  }
}

// 판매내역 페이지
class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("판매내역"),
      ),
      body: const Center(
        child: Text("판매내역 페이지입니다."),
      ),
    );
  }
}

// 구매내역 페이지
class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("구매내역"),
      ),
      body: const Center(
        child: Text("구매내역 페이지입니다."),
      ),
    );
  }
}

// 앱 설정 페이지
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("앱 설정"),
      ),
      body: const Center(
        child: Text("앱 설정 페이지입니다."),
      ),
    );
  }
}
