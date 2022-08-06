document.addEventListener("DOMContentLoaded", function(){
    let icon = document.getElementById('host-icon');
    let menu = document.getElementById('header-nav-menu');

    icon.addEventListener('click', function() {
        if (menu.classList.contains("hiddn") == true) {
            menu.classList.remove("hiddn");
        } else {
            menu.classList.add("hiddn");
        }
    });
});