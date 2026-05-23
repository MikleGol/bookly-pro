import '../models/category.dart';
import '../models/service.dart';
import '../models/profile.dart';
import 'mock_data_source.dart';

class AppData {
  static List<Category> categories = [];
  static List<Service> services = [];
  static late Profile profile;

  static Future<void> load() async {
    final source = MockDataSource();
    categories = await source.loadCategories();
    services = await source.loadServices();
    profile = await source.loadProfile();
  }
}
