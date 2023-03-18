String? validateInput(String value) {
  if (value.isEmpty) {
    return 'لا يجب ان يكون الحقل فارغا';
  }
  if (value.length < 4) {
    return ' يجب ان يكون الحقل اكبر من 4 احرف';
  }
  return null;
}
