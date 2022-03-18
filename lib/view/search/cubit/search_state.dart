import 'package:equatable/equatable.dart';

import '../../../other/enums.dart';

class SearchState extends Equatable {
  final DataStatus status;
  final List<String> data;

  const SearchState({required this.status, required this.data});

  SearchState.init()
      : status = DataStatus.initial,
        data = [];

  SearchState copyWith({
    DataStatus? status,
    List<String>? data,
  }) {
    return SearchState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
