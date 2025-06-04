import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfbf8),
      appBar: AppBar(
        backgroundColor: Color(0xfffcfbf8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'العملاء',
          style: TextStyle(
            color: Color(0xff1c170d),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // هنا تضع الوظيفة عند الضغط على زر الإضافة
            },
            icon: const Icon(Icons.add, color: Color(0xff1c170d)),
          ),
        ],
        iconTheme: const IconThemeData(color: Color(0xff1c170d)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Color(0xff9b844b)),
                hintText: 'ابحث عن العملاء',
                filled: true,
                fillColor: Color(0xfff3f0e7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                hintStyle: const TextStyle(color: Color(0xff9b844b)),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _customerItem(
                  name: 'عامر العلي',
                  cases: 3,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDUhZMj49ueytp0BO5SUARD9fUPNkyQPtZTid5lhoB10BqZtXCxxTk-wuCqbJ1xZDwnvBHl7QEz2uPC3tNEph6EKG3WyCiRlaTX564lhLZ8RXAZJ7ca3Z1qfSgn5Iafn3EtxqbOzuE7kdio_nWaj-7iK5r6Uihmdeq2HXP2Cv0KvlYCcvAB058yCmFHXktXXuZe9VwwMq2W-8UgUp9HctYAgSZwKWeScRuUBJ4CtJPlPS0I79HgPEEH8OD9PU-gb3D8_J1RG8lvMZAl',
                ),
                _customerItem(
                  name: 'عبد الله الرحمن',
                  cases: 1,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuC3trv9wKz9VVUpL_-U0AvwApkOPXmge9mhkO74iFspI49FomRny1vFf-UpXJGHNpQA-NaYFSdpyGMccDfSx8IgwfL2WLUHqEfRtFRnFsKHE7fes658OE_3ASo3LmUfFJ9Ts4zLFTinuoTFwA2E_Rim-fw-9MP5IKyGBLWSt5Xn__0CEI679zGdy3JNGRhqycWMBGytbZuguTIOYIAiGOuPZMqDhhhVD7W2sanlU55JEiN91N8up_NmVvX983FCCTlm_T3TsBPlJsNN',
                ),
                _customerItem(
                  name: 'ليلى السليمان',
                  cases: 2,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDb-BZ79xaKry44NQcYlaHsEi2IayfaibzlFyj6uUousvPBhH8CdV0n-zxs0xo_TDPEM8Au9XImrEmbBlNSZIF0I1POQZjPECHbo7TULdwFutwdaZRJGtlrlABoUdRWbTNawjiOQ9w6nZ6ZTRy-c1iL6zQearrB6AWA6fgx6XCQYRwtcUAGoVOJ0mja_FPKNSWa50_kLWaQWM0HN68NMxY4BcT5cACRUupY9JVExP0Um1sBoSZYTRWGMIq6X5438bmmWTeNOhhlSHTs',
                ),
                _customerItem(
                  name: 'عادل العامر',
                  cases: 4,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDSttLIV2ZyWIY1A7gNYXeBb8K-XXwmAF5AHMptcd--q4OmrQwCJWj4glA8c8Wfg33-aoj05uVB3EOKnrngds1uQHo2AZ9Cg7CcYRbD8oYSFHG_xihM6DiQ86MrFuolMYLBdJKzzPAmSUR35mQLTVkQAH-w_sETMACQoN0pPdtH0kynLoYxSyxLJfL99VGAgbF3iSrfzIobLY3cKwDWs81FHNvAK5Lu1_EqHTjZKBg38KtcbnR3XQQ08ZPTEGSHnikcpQbAAx-BYz5b',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customerItem({
    required String name,
    required int cases,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('العملاء',
                      style: TextStyle(
                          color: Color(0xff9b844b),
                          fontSize: 12,
                          fontWeight: FontWeight.normal)),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xff1c170d),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$cases قضايا',
                    style: TextStyle(
                      color: Color(0xff9b844b),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
