// Data
import 'data/model/revenue_model.dart';
import 'data/repositories/revenue_repository_impl.dart';

// Domain
import 'domain/repositories/revenue_repository.dart';
import 'domain/use_cases/add_revenue_usecase.dart';
import 'domain/use_cases/get_revenues_usecase.dart';

// Presentation
import 'presentation/logic/bloc/revenue_bloc.dart';
import 'presentation/logic/bloc/revenue_event.dart';
import 'presentation/logic/bloc/revenue_state.dart';
import 'presentation/view/revenues_view.dart';
import 'presentation/view/add_revenue_view.dart';
import 'presentation/widgets/revenue_widget.dart';
