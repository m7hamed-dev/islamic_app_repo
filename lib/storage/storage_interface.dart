abstract class StroageInterface<TYPE> {
  Future<void> setValue(String key, TYPE value);
  Future<TYPE> getValue(String key);
}
