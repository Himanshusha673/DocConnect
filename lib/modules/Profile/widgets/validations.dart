class Validations {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    final nameRegExp = RegExp(
        r'^[a-zA-Z ]+$'); // Regular expression to allow only alphabets and spaces
    if (!nameRegExp.hasMatch(value)) {
      return 'Name can only contain alphabets and spaces';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == '') {
      return "email is required";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email ?? '')) {
      return "Enter valid Email";
    }
    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Height cannot be empty';
    }
    final heightRegExp = RegExp(
        r'^\d{1,3}(\.\d{1,2})?$'); // Regular expression to allow only numeric values in the format xxx or xxx.xx
    if (!heightRegExp.hasMatch(value)) {
      return 'Height must be a number in the format xxx or xxx.xx';
    }
    final height = double.tryParse(value);
    if (height == null || height < 50 || height > 300) {
      return 'Height must be between 50 and 300 cm';
    }
    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Weight cannot be empty';
    }
    final weightRegExp = RegExp(
        r'^\d{1,3}(\.\d{1,2})?$'); // Regular expression to allow only numeric values in the format xxx or xxx.xx
    if (!weightRegExp.hasMatch(value)) {
      return 'Weight must be a number in the format xxx or xxx.xx';
    }
    final weight = double.tryParse(value);
    if (weight == null || weight < 2.0 || weight > 300.0) {
      return 'Weight must be between 2 and 300 kg';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }
    final addressRegExp = RegExp(
        r'^[a-zA-Z0-9\s,.-]+$'); // Regular expression to allow only alphanumeric characters, spaces, commas, periods, and hyphens
    if (!addressRegExp.hasMatch(value)) {
      return 'Address can only contain alphanumeric characters, spaces, commas, periods, and hyphens';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == '') {
      return "password is required";
    }
    if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password ?? '')) {
      return "Enter valid password";
    }
    if (password!.length < 8) {
      return "Password should be atleast 8 characters";
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name == '') {
      return "name is required";
    }

    return null;
  }

  static String? validateZipPostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zip/Postal code cannot be empty';
    }
    final zipPostalCodeRegExp = RegExp(
        r'^[a-zA-Z0-9-\s]+$'); // Regular expression to allow only alphanumeric characters, spaces, and hyphens
    if (!zipPostalCodeRegExp.hasMatch(value)) {
      return 'Zip/Postal code can only contain alphanumeric characters, spaces, and hyphens';
    }
    return null;
  }
}
