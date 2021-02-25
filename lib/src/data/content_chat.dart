class ContentChat {
  final String id;
  final String content;
  final String image;
  final DateTime createdAt;
  final String createdUser;
  final bool isDeteled;
  final DateTime isSeenAt;

  ContentChat({
    this.content,
    this.createdAt,
    this.createdUser,
    this.id,
    this.image,
    this.isDeteled,
    this.isSeenAt,
  });
}

List<ContentChat> contents = [
  ContentChat(
    id: '1',
    content: 'Hi, Nice to meet you!',
    image: '',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 4)),
    createdAt: DateTime.now().add(Duration(minutes: 4)),
  ),
  ContentChat(
    id: '2',
    content: 'I\'m Vinh',
    image: '',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 5)),
    createdAt: DateTime.now().add(Duration(minutes: 5)),
  ),
  ContentChat(
    id: '3',
    content: 'Okay, me too',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 5)),
    createdAt: DateTime.now().add(Duration(minutes: 5)),
  ),
  ContentChat(
    id: '4',
    content: 'I\'m a Mobile App Developer',
    image: '',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 7)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '5',
    content: 'Oh, I\'m a Backend Developer',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 6)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '6',
    content: 'I hope we have a pretty app',
    image:
        'https://images.unsplash.com/photo-1508606572321-901ea443707f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDJ8fG1vZGVsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 10)),
    createdAt: DateTime.now().add(Duration(minutes: 8)),
  ),
  ContentChat(
    id: '3',
    content: 'Okay, me too',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 5)),
    createdAt: DateTime.now().add(Duration(minutes: 5)),
  ),
  ContentChat(
    id: '4',
    content: 'I\'m a Mobile App Developer',
    image: '',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 7)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '5',
    content: 'Oh, I\'m a Backend Developer',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 6)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '6',
    content: 'I hope we have a pretty app',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 10)),
    createdAt: DateTime.now().add(Duration(minutes: 8)),
  ),
  ContentChat(
    id: '3',
    content: 'Okay, me too',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 5)),
    createdAt: DateTime.now().add(Duration(minutes: 5)),
  ),
  ContentChat(
    id: '4',
    content: 'I\'m a Mobile App Developer',
    image: '',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 7)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '5',
    content: 'Oh, I\'m a Backend Developer',
    image: '',
    createdUser: '957',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 6)),
    createdAt: DateTime.now().add(Duration(minutes: 6)),
  ),
  ContentChat(
    id: '6',
    content: 'I hope we have a pretty app',
    image:
        'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bW9kZWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    createdUser: '18110239',
    isDeteled: false,
    isSeenAt: DateTime.now().add(Duration(minutes: 10)),
    createdAt: DateTime.now().add(Duration(minutes: 8)),
  ),
];
