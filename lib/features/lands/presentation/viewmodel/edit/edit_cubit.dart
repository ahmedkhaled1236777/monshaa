import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/repos/editaqar/editaqarrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_state.dart';

class EditlandCubit extends Cubit<EditlandState> {
 final editaqarrepoimplementation editrepo;
  EditlandCubit({required this.editrepo}) : super(EditlandInitial());
String?advistor_type;

  
  changeaddlandadvistortype(String val){
advistor_type=val;
emit(editlandchangeadvistortype());
  }
  updateaqar({required String token,required int id,required addaqarrequest add_aqar}) async {
    emit(editlandloading());
var result=await editrepo.editaqar(token: token, id: id,add_aqar: add_aqar);
result.fold((failure) {
emit(editlandfailure(error_message: failure.error_message));
}, (success) {
emit(editlandsuccess(successmessage: success));
});
  }
  
}
