class Validators {
  static String? emailValidator(String? email) {
    if (email == '') {
      return "email is required";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email ?? '')) {
      return "Enter valid Email";
    }
    return null;
  }

  static String? forgotPasswordEmailValidator(String? email, String? phoneNumber) {
    if(email=="" && phoneNumber==""){
      return "Please enter any one field";
    }
    if (email == '' && phoneNumber!.length>0) {
      return null;
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email ?? '')) {
      return "Enter valid Email";
    }
    return null;
  }

  static String? forgotPasswordPhoneValidator(String? phoneNumber, String? email) {
    if(email=="" && phoneNumber==""){
      return "Please enter any one field";
    }
    if (email!.length>0 && phoneNumber=="") {
      return null;
    }
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber ?? '')) {
      return "Enter valid phone number";
    }
    return null;
  }

  static String? phoneValidator(String? number) {
    if (number == '') {
      return "Phone number is required";
    }
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(number ?? '')) {
      return "Enter valid phone number";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == '') {
      return "password is required";
    }
    if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[]).{8,}$').hasMatch(password ?? '')) {
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
}
