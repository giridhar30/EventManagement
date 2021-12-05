function showErrorMsg(error) {
  const x = document.querySelector("#errorMsg");
  x.innerHTML = error;
  x.className = "show";
  setTimeout(() => (x.className = x.className.replace("show", "")), 4000);
}

function showSuccessMsg(success) {
  const x = document.querySelector("#successMsg");
  x.innerHTML = success;
  x.className = "show";
  setTimeout(() => (x.className = x.className.replace("show", "")), 4000);
}
