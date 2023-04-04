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
function updateSuccessfully(event) {
  // xử lý logic cập nhật thành công
    alert("Update Successfully");
}
$(document).ready(function () {
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function () {
        if (this.checked) {
            checkbox.each(function () {
                this.checked = true;
            });
        } else {
            checkbox.each(function () {
                this.checked = false;
            });
        }
    });
    checkbox.click(function () {
        if (!this.checked) {
            $("#selectAll").prop("checked", false);
        }
    });
});
//window.addEventListener("scroll", function () {
//    var navbar = document.querySelector(".navbar");
//    navbar.classList.toggle("sticky", window.scrollY > 0);
//});