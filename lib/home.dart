import 'package:flutter/material.dart';
import 'package:music_app/album.dart';
import 'package:music_app/music.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double top_padding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color(0xFF374e54),
      body: Column(
        children: [
          SizedBox(height: top_padding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xff71cae3),
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xff71cae3),
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                catagory(
                  title: "Trending",
                  currentIndex: 0,
                ),
                catagory(
                  title: "Favorites",
                  currentIndex: 1,
                ),
                catagory(
                  title: "My Playlist",
                  currentIndex: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => trendingALbums(albums[index]),
              itemCount: albums.length,
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text("Recently Played",
                    style: TextStyle(
                      color: Color(0xff71cae3),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    recentlyplayed(width, recentlyPlayed[index]),
                itemCount: recentlyPlayed.length,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 75,
            width: width * 100,
            decoration: BoxDecoration(
              // border: Border.all(
              //   width: 0.8,
              // ),
              image: DecorationImage(
                image: NetworkImage(
                  nowPlaying.coverImage,
                ),
                fit: BoxFit.fitWidth,
                opacity: 0.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    musicPage(context, height, nowPlaying);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nowPlaying.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      nowPlaying.artist,
                      style: const TextStyle(
                        color: Color(0xff71cae3),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle,
                    color: Color(0xff71cae3),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> musicPage(BuildContext context, double height, Album album) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Music(album: album),
    );
  }

  recentlyplayed(double width, Album album) {
    return InkWell(
      onTap: () =>
          musicPage(context, MediaQuery.of(context).size.height, album),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: width * 0.85,
        decoration: const BoxDecoration(
          color: Color(0xff5c7d86),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(album.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  album.artist,
                  style: const TextStyle(
                    color: Color(0xff71cae3),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              "3:56",
              style: TextStyle(
                color: Color(0xff71cae3), //Color(0xff71cae3
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  trendingALbums(Album album) {
    return InkWell(
      onTap: () =>
          musicPage(context, MediaQuery.of(context).size.height, album),
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(album.coverImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                album.title,
                textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: false),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle,
                      color: Color(0xFF71cae3),
                      size: 40,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell catagory({required String title, required int currentIndex}) {
    return InkWell(
      onTap: () {
        selectedIndex = currentIndex;
        setState(() {});
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: selectedIndex == currentIndex
                    ? const Color(0xff71cae3)
                    : Colors.grey,
                fontSize: 20),
          ),
          selectedIndex == currentIndex
              ? Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    color: Color(0xff71cae3),
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
