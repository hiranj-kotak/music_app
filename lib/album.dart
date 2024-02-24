class Album {
  String title;
  String coverImage;
  String artist;

  Album({required this.title, required this.coverImage, required this.artist});
}

List<Album> albums = [
  Album(
    title: "Hot Hits Hindi",
    coverImage:
        "https://i.scdn.co/image/ab67706f00000002319bd79eba1610f1f5fe6a4b",
    artist: "Ed Sheeran",
  ),
  Album(
    title: "Hot Hits Punjabi",
    coverImage:
        "https://i.scdn.co/image/ab67706f00000002106c1e6d4101c5a5a2325b98",
    artist: "Ed Sheeran",
  ),
  Album(
    title: "Hot Hits India",
    coverImage:
        "https://i.scdn.co/image/ab67706f000000022d540e60774de71fef7d50f0",
    artist: "Ed Sheeran",
  ),
  Album(
    title: "TOp-50 Global",
    coverImage:
        "https://charts-images.scdn.co/assets/locale_en/regional/daily/region_global_default.jpg",
    artist: "Ed Sheeran",
  ),
];

List<Album> recentlyPlayed = [
  Album(
    title: "Arjan Vailly",
    coverImage:
        "https://i.scdn.co/image/ab67616d0000b273aeb151f6774b6edf52195631",
    artist: "Manan Bhardwaj",
  ),
  Album(
    title: "Satranga",
    coverImage:
        "https://i.scdn.co/image/ab67616d0000b273021d7017f73387b008eab271",
    artist: "Arijit Singh",
  ),
  Album(
    title: "Khalasi",
    coverImage:
        "https://i.scdn.co/image/ab67616d0000b273a6f83b62be5e3dea563f6d79",
    artist: "Aditya Gadhvi",
  ),
  Album(
    title: "Shape of You",
    coverImage:
        "https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96",
    artist: "Ed Sheeran",
  ),
];

Album nowPlaying = Album(
  title: "Koi Si",
  coverImage:
      "https://i.scdn.co/image/ab67616d0000b273d1f34cdaf432660e5fe91818",
  artist: "Afsana Khan",
);
