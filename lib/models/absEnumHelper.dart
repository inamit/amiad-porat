abstract class AbsEnumHelper<T, V> {
  T? getEnum(V value);

  V getValue(T enumValue);

  String getHebrew(T enumValue);
}
