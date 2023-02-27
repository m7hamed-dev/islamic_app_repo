class Imags {
  static const bc = 'assets/home/bc.jpg';
  static const chat = 'assets/home/chat.png';
  // static const chats = '$getImageUrl()/chat.png';

  String getImageUrl(String img) {
    return 'assets/home/$img';
  }
}
