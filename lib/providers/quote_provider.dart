import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/quote_service.dart';

final quoteProvider = FutureProvider((ref) => QuoteGen.quoteGen());
