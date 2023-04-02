/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deletePost(event) {
    // Get a reference to the button element
    event.preventDefault();
    var confirmed = confirm("Are you sure you want to delete?");
    if (confirmed) {
        // continue with the default action (i.e. follow the href link)
        window.location.href = event.currentTarget.getAttribute("href");
    } else {
        //do nothing

    }
}
//window.addEventListener("scroll", function () {
//    var navbar = document.querySelector(".navbar");
//    navbar.classList.toggle("sticky", window.scrollY > 0);
//});