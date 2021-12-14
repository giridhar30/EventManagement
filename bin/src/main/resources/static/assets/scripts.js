function validateRegistration() {
  const name = document.querySelector("#name").value;
  const pass = document.querySelector("#pass").value;
  const cpass = document.querySelector("#cpass").value;
  const phone = document.querySelector("#phone").value;

  if (!/^[a-zA-Z\.\s]*$/.test(name)) {
    swal("Sign up failed!", "Invalid Name!", "error");
    return false;
  }
  if (pass !== cpass) {
    swal(
      "Sign up failed!",
      "Password did not match confirm password!",
      "error"
    );
    return false;
  }
  if (!/^[6789]\d{9}$/.test(phone)) {
    swal("Sign up failed!", "Invalid phone number!", "error");
    return false;
  }
  return true;
}
