import 'package:hisab/models/model_site.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ModelFirm {
  @Id()
  int id = 0;

  String? name;

  @Property(type: PropertyType.date)
  DateTime? date;

  @Backlink('modelfirm')
  final sites = ToMany<ModelSite>();
}
