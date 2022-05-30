import 'package:flutter_training_2/di/network_provider.dart';
import 'package:flutter_training_2/di/repository_provider.dart';
import 'package:flutter_training_2/di/view_model_provider.dart';

final appProviders = [
  ...networkProviders,
  ...repositoryProviders,
  ...viewModelProviders,
];
