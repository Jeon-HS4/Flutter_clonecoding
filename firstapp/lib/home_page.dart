import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feed.dart';
import 'mypage.dart';
import 'chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // 현재 탭 상태

  // 탭 별 페이지 리스트
  final List<Widget> _pages = [
    const HomeFeedPage(), // Feed 리스트 화면
    const Center(child: Text("동네생활")),
    const Center(child: Text("내 근처")),
    const ChatPage(),
    const MyPage(), // 나의 당근 페이지 연결
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: Row(
          children: const [
            SizedBox(width: 16),
            Text(
              '중앙동',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          ],
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell, color: Colors.black),
          ),
        ],
      ),
      body: _pages[_currentIndex], // 현재 선택된 탭의 페이지 표시
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Floating Action Button의 동작 추가 가능
        },
        backgroundColor: const Color(0xFFFF7E36),
        elevation: 1,
        child: const Icon(Icons.add_rounded, size: 36),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 탭 변경 시 상태 업데이트
          });
        },
        showUnselectedLabels: true, // 선택되지 않은 탭에도 라벨 표시
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined), label: '동네생활'),
          BottomNavigationBarItem(icon: Icon(Icons.fmd_good_outlined), label: '내 근처'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '나의 당근'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://cdn2.thecatapi.com/images/6bt.jpg",
      "https://cdn2.thecatapi.com/images/ahr.jpg",
      "https://cdn2.thecatapi.com/images/arj.jpg",
    ];

    final List<String> titles = [
      "M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.",
      "새로운 iPhone 13 Pro 판매 중!",
      "삼성 갤럭시 Z 플립 3 팔아요.",
    ];

    final List<String> locations = ["정왕동", "서초동", "강남구"];
    final List<String> times = ["6분 전", "10분 전", "15분 전"];
    final List<String> prices = ["100만원", "120만원", "90만원"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Feed(
            imageUrl: images[index],
            title: titles[index],
            location: locations[index],
            time: times[index],
            price: prices[index],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
