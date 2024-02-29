// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.getElementsByClassName("addcart").onclick = function() {
  document.getElementsByClassName("addcart").innerHTML = "AVAILABLE IN CART";
};

// $(document).ready(function () {
//   $(".addcart").click(function () {
//     value = "AVAILABLE IN CART";
//   });
// });
