import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String imageUrl;
  final String songUrl;
  final Color color;
  Song(
      {required this.name,
      required this.singer,
      required this.imageUrl,
      required this.songUrl,
      required this.color});
}

// !!!!       Komen database dan unkomen database lain jika program error 402       !!!!
// !!!!       / merujuk network provider, karena keterbatasan quota firebase        !!!!

// ------------------------------------------- Database Backup 1 --------------------------------------------------------

// List<Song> mostPopular = [
//   Song(
//       name: "Angel Baby",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FAngel%20Baby%20-%20Troyen%20Sivan.jpg?alt=media&token=36162b05-3b50-4927-b18e-41e881ca5cdf",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FAngel%20Baby%20-%20Troyen%20Sivan.mp3?alt=media&token=e19bb5bb-0355-460d-b287-24e4e7b49b3d",
//       singer: "Troyen Sivan",
//       color: Colors.grey),
//   Song(
//       name: "As It Was",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FAs%20It%20Was-%20Harry%20Styles.jpg?alt=media&token=ed676718-beeb-4dd9-b502-6c799556f6fb",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FAs%20It%20Was-%20Harry%20Styles.mp3?alt=media&token=3874f539-dac8-491d-9304-edb3b9db9f22",
//       singer: "Harry Styles",
//       color: Colors.red),
//   Song(
//       name: "Butter",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FButter%20-%20BTS.jpg?alt=media&token=1e51d120-6f67-4661-b30d-72e01f5c24aa",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FButter%20-%20BTS.mp3?alt=media&token=10240e96-a6d5-49ee-95d8-10854d1cd3e7",
//       singer: "BTS",
//       color: Colors.orange),
//   Song(
//       name: "Jiggle Jiggle",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.jpg?alt=media&token=abbba3f6-23a3-45cf-9989-9b2b34242ce9",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.mp3?alt=media&token=f3200c67-2560-4a5d-b241-9911562ddd6a",
//       singer: "Duke & Jones, Louis Theroux",
//       color: Colors.blue),
//   Song(
//       name: "Memories",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FMaroon%205%20-%20Memories.jpg?alt=media&token=16289ea6-934c-4531-966f-b96841131496",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FMaroon%205%20-%20Memories.mp3?alt=media&token=c85ce5e9-89c9-41e7-8071-a202e3c82187",
//       singer: "Maroon 5",
//       color: Colors.brown),
// ];

// List<Song> newRelease = [
//   Song(
//       name: "Hati hati di jalan",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FHati%20hati%20di%20jalan%20-%20Tulus.jpg?alt=media&token=3abb87d4-a2f2-4055-b2ac-14a5fbe1dbde",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FHati%20hati%20di%20jalan%20-%20Tulus.mp3?alt=media&token=c245a7e6-7077-47e2-9879-9fb71a5b2c3c",
//       singer: "Tulus",
//       color: Colors.red),
//   Song(
//       name: "Tak Ingin Usai",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.jpg?alt=media&token=b776a56f-7a85-47ef-a4f5-0df3f3057af2",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.mp3?alt=media&token=4fdc8237-46d4-439a-b852-14a1546c0507",
//       singer: "Keisya Levronka",
//       color: Colors.grey),
//   Song(
//       name: "Sugar",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FMaroon%205%20-%20Sugar.jpg?alt=media&token=aa7d7a49-0a1e-47a5-ac52-b82390a81a7f",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FMaroon%205%20-%20Sugar.mp3?alt=media&token=960bd77d-182f-45f9-a978-31600de3ecf2",
//       singer: "Maroon 5",
//       color: Colors.blue),
//   Song(
//       name: "Menepi Menetap",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.jpg?alt=media&token=6a36667d-a1f3-43e3-a495-2e8b689b988b",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.mp3?alt=media&token=16fe5025-6ff5-43c4-8c1a-28be536cc66c",
//       singer: "Mikha Tambayong & Deva Mahenra",
//       color: Colors.brown),
//   Song(
//       name: "Until I Found You",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/images%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.jpg?alt=media&token=33507ae9-1a3c-4a70-b2b5-d61cc1da4846",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/dartmusic-mobile.appspot.com/o/songs%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.mp3?alt=media&token=93579921-32b5-45f4-9505-e3c2129e55f8",
//       singer: "Stephen Sanchez",
//       color: Colors.orange),
// ];

// ------------------------------------------- Database Backup 2 --------------------------------------------------------

List<Song> mostPopular = [
  Song(
      name: "Angel Baby",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FAngel%20Baby%20-%20Troyen%20Sivan.jpg?alt=media&token=1b3329c8-cc26-4146-ba3c-487310cbb48e",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FAngel%20Baby%20-%20Troyen%20Sivan.mp3?alt=media&token=9e539787-7e53-46e8-b90b-e2a25bbbac91",
      singer: "Troyen Sivan",
      color: Colors.grey),
  Song(
      name: "As It Was",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FAs%20It%20Was-%20Harry%20Styles.jpg?alt=media&token=50b31a9e-8409-45ff-bab6-88bd94476320",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FAs%20It%20Was-%20Harry%20Styles.mp3?alt=media&token=b22416a1-6a24-4a30-b461-083f2135e232",
      singer: "Harry Styles",
      color: Colors.red),
  Song(
      name: "Butter",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FButter%20-%20BTS.jpg?alt=media&token=cb93b147-16ac-4a69-960a-e365d6f2cf1d",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FButter%20-%20BTS.mp3?alt=media&token=c7857b7e-a05e-46fb-a887-db0a48e59b08",
      singer: "BTS",
      color: Colors.orange),
  Song(
      name: "Jiggle Jiggle",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.jpg?alt=media&token=b2ac5f76-c0a9-40a6-b7bf-187c9d66447e",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.mp3?alt=media&token=6db350a9-dbe4-4875-a3d6-2457dbf0edda",
      singer: "Duke & Jones, Louis Theroux",
      color: Colors.blue),
  Song(
      name: "Memories",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FMaroon%205%20-%20Memories.jpg?alt=media&token=e668a427-ece5-4da8-af5f-351aecb347ae",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FMaroon%205%20-%20Memories.mp3?alt=media&token=9df82558-e478-4505-98a6-aaf4a33dc7a6",
      singer: "Maroon 5",
      color: Colors.brown),
];

List<Song> newRelease = [
  Song(
      name: "Hati hati di jalan",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FHati%20hati%20di%20jalan%20-%20Tulus.jpg?alt=media&token=99a316b3-7631-4463-9b9a-941afb648c2b",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FHati%20hati%20di%20jalan%20-%20Tulus.mp3?alt=media&token=305c5af2-d4a7-491c-bbbb-05c3d1bc7862",
      singer: "Tulus",
      color: Colors.red),
  Song(
      name: "Tak Ingin Usai",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.jpg?alt=media&token=dc2fee20-73ef-4676-9d55-aa5cc772d5f4",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.mp3?alt=media&token=0f66afaa-bd62-4af7-b082-51745ad619e4",
      singer: "Keisya Levronka",
      color: Colors.grey),
  Song(
      name: "Sugar",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FMaroon%205%20-%20Sugar.jpg?alt=media&token=f1104a45-f1a1-43f4-95fd-9a8f5f0d022e",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FMaroon%205%20-%20Sugar.mp3?alt=media&token=412ca3d0-1c64-4501-925b-71dadf729326",
      singer: "Maroon 5",
      color: Colors.blue),
  Song(
      name: "Menepi Menetap",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.jpg?alt=media&token=6b40c40e-f49e-4eec-9ff3-ef761e6a2afe",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.mp3?alt=media&token=fb5f1159-0804-4075-b0f3-76063c786c28",
      singer: "Mikha Tambayong & Deva Mahenra",
      color: Colors.brown),
  Song(
      name: "Until I Found You",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/images%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.jpg?alt=media&token=386fbd14-6fa4-491e-9772-045d87fef7da",
      songUrl:
          "https://firebasestorage.googleapis.com/v0/b/projek-mobile-10fbc.appspot.com/o/songs%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.mp3?alt=media&token=592b1103-bdd2-4d8d-8808-7df23d2ead68",
      singer: "Stephen Sanchez",
      color: Colors.orange),
];

// ------------------------------------------- Database Backup 3 --------------------------------------------------------


// List<Song> mostPopular = [
//   Song(
//       name: "Angel Baby",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FAngel%20Baby%20-%20Troyen%20Sivan.jpg?alt=media&token=4c627245-0ee8-433e-b165-9340c66fdc91",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FAngel%20Baby%20-%20Troyen%20Sivan.mp3?alt=media&token=f35fcd6d-cc34-4144-9493-820ce516e997",
//       singer: "Troyen Sivan",
//       color: Colors.grey),
//   Song(
//       name: "As It Was",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FAs%20It%20Was-%20Harry%20Styles.jpg?alt=media&token=79603095-8153-4c06-9bf1-98f67d463f8d",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FAs%20It%20Was-%20Harry%20Styles.mp3?alt=media&token=d0652a22-3eb8-41c1-a3f1-63b8f1a48f79",
//       singer: "Harry Styles",
//       color: Colors.red),
//   Song(
//       name: "Butter",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FButter%20-%20BTS.jpg?alt=media&token=3ac04665-0b72-4fdc-be48-2aeb6a2699d4",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FButter%20-%20BTS.mp3?alt=media&token=fe0f978d-2df1-4552-9f0b-a10b60cb2f18",
//       singer: "BTS",
//       color: Colors.orange),
//   Song(
//       name: "Jiggle Jiggle",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.jpg?alt=media&token=fcec99e1-5ca6-470e-b185-6b3973fe2371",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FDuke%20%26%20Jones%2C%20Louis%20Theroux%20-%20Jiggle%20Jiggle.mp3?alt=media&token=c95d7425-e573-4676-96b5-fd091a1524cd",
//       singer: "Duke & Jones, Louis Theroux",
//       color: Colors.blue),
//   Song(
//       name: "Memories",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FMaroon%205%20-%20Memories.jpg?alt=media&token=2cc15a78-fc7c-4cb1-96ce-682694ee2246",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FMaroon%205%20-%20Memories.mp3?alt=media&token=4657acbd-3c2b-4df0-acb8-0e7f1676059c",
//       singer: "Maroon 5",
//       color: Colors.brown),
// ];

// List<Song> newRelease = [
//   Song(
//       name: "Hati hati di jalan",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FHati%20hati%20di%20jalan%20-%20Tulus.jpg?alt=media&token=59a25771-ae46-4702-bd32-f57b6cedf64a",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FHati%20hati%20di%20jalan%20-%20Tulus.mp3?alt=media&token=014c45cb-74a2-4e5e-9a11-3a6493d8c7ea",
//       singer: "Tulus",
//       color: Colors.red),
//   Song(
//       name: "Tak Ingin Usai",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.jpg?alt=media&token=a483a312-409c-4cdf-8d21-c43509a5a2bf",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FKeisya%20Levronka%20-%20Tak%20Ingin%20Usai.mp3?alt=media&token=e9149b42-fe12-4ec4-b9b0-f9b713f12349",
//       singer: "Keisya Levronka",
//       color: Colors.grey),
//   Song(
//       name: "Sugar",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FMaroon%205%20-%20Sugar.jpg?alt=media&token=c6fb25df-c31c-438d-bfd2-30948dbc7c2f",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FMaroon%205%20-%20Sugar.mp3?alt=media&token=f0e41023-b208-46ce-962c-d7af2322624b",
//       singer: "Maroon 5",
//       color: Colors.blue),
//   Song(
//       name: "Menepi Menetap",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.jpg?alt=media&token=7233f721-2c9c-4d2d-9195-2dd8e5e66aa9",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FMenepi%20Menetap%20-%20Mikha%20Tambayong%20%26%20Deva%20Mahenra.mp3?alt=media&token=f982b075-bd49-4944-8f91-a42ad4121e08",
//       singer: "Mikha Tambayong & Deva Mahenra",
//       color: Colors.brown),
//   Song(
//       name: "Until I Found You",
//       imageUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/images%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.jpg?alt=media&token=c4c15cb2-2697-43e4-97e7-1f94e4ab4765",
//       songUrl:
//           "https://firebasestorage.googleapis.com/v0/b/projek-mobile-34f40.appspot.com/o/songs%2FStephen%20Sanchez%20-%20Until%20I%20Found%20You.mp3?alt=media&token=3cc1d1b8-a202-455a-9034-79524e68f994",
//       singer: "Stephen Sanchez",
//       color: Colors.orange),
// ];
