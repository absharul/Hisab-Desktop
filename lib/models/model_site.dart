import 'package:hisab/models/model_firm.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ModelSite {
  @Id()
  int id = 0;

  String? name;

  final firm = ToOne<ModelFirm>();
}
