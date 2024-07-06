import 'package:flutter/foundation.dart';
import '../../models/stashpoint/stashpoint.dart';
import '../../../services/stashpoint_service.dart';

class StashpointViewModel extends ChangeNotifier {
  final _stashpointService = StashpointService();
  final _stashpoints = <Stashpoint>[];
  bool _hasNext = false;
  bool _isLoading = false;
  bool _hasError = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  int _page = 1;
  List<Stashpoint> get stashpoints => _stashpoints.toList();
  bool get hasNext => _hasNext;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  bool get isLoadingMore => _isLoadingMore;
  String get errorMessage => _errorMessage ?? '';

  StashpointViewModel() {
    fetchStashpoints();
  }

  Future<void> fetchStashpoints() async {
    _isLoading = !_isLoading;
    notifyListeners();
    try {
      final response = await _stashpointService.getStashpoints(page: _page);
      _stashpoints.addAll(response.stashpoints);
      _hasNext = response.hasNext;
      notifyListeners();
    } on StashpointError catch (error) {
      _hasError = true;
      _errorMessage = error.message;
      notifyListeners();
      debugPrint(
          'API error: Status Code: ${error.statusCode}, Message: ${error.message}');
    } finally {
      _isLoading = !_isLoading;
      notifyListeners();
    }
  }

  Future<void> fetchMoreStashpoints() async {
    if (!_hasNext || _isLoading) return;
    _isLoadingMore = !_isLoadingMore;
    _page++;
    notifyListeners();
    await fetchStashpoints();
    _isLoadingMore = !_isLoadingMore;
    notifyListeners();
  }
}
