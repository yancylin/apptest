class DynamicMockData {
  static Future<List<Map<String, Object>>> list(int page, int size) async {
    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl':
            'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=688497718,308119011&fm=26&gp=0.jpg',
        'viewCount': index * 180,
      };
    });
  }
}
