function validateRegistration() {
  const name = document.querySelector("#name").value;
  const pass = document.querySelector("#pass").value;
  const cpass = document.querySelector("#cpass").value;
  const phone = document.querySelector("#phone").value;

  if (!/^[a-zA-Z\.\s]*$/.test(name)) {
    showErrorMsg("Invalid Name!");
    return false;
  }
  if (pass !== cpass) {
    showErrorMsg("Password did not match confirm password!");
    return false;
  }
  if (!/^[6789]\d{9}$/.test(phone)) {
    showErrorMsg("Invalid phone number!");
    return false;
  }
  return true;
}
