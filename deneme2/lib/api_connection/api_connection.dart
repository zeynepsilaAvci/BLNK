class API
{
  static const hostConnect= "http://192.168.1.11/api_fapp"; //bilgisayarın ıpsine göre sürekli olarak bu kısmı değiştirin
  static const hostConnectUser = "$hostConnect/user";

  //signUp user
  static const validateEmail = "$hostConnect/user/validate_email.php";
  static const signUp = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";


}