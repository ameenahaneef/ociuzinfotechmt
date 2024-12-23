import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ociuzinfotechmt/data/model/product_model.dart';
import 'package:ociuzinfotechmt/data/repository/api_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
   final ApiService apiService;
  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit)async {
      try {
         final List<Product> products = await apiService.fetchProducts();
      emit(ProductLoaded(products));
      } catch (e) {
         emit(ProductError(e.toString()));
      }
    });
  }
}
