// ============================================================================
// SCRIPT: site.js
// DESCRIPTION: Global interactive scripts for AgriYard navigation and UI modals
// ============================================================================

document.addEventListener("DOMContentLoaded", function () {
    // 1. Mobile Navigation Menu Drawer Toggle
    var navToggle = document.getElementById("mobileNavToggle");
    var mobileDrawer = document.getElementById("mobileNavDrawer");

    if (navToggle && mobileDrawer) {
        navToggle.addEventListener("click", function () {
            mobileDrawer.classList.toggle("open");
            var isOpen = mobileDrawer.classList.contains("open");
            navToggle.setAttribute("aria-expanded", isOpen ? "true" : "false");
        });
    }

    // 2. Generic Modal Open & Close Handler
    var modalOpenButtons = document.querySelectorAll("[data-open-modal]");
    modalOpenButtons.forEach(function (btn) {
        btn.addEventListener("click", function () {
            var targetId = btn.getAttribute("data-open-modal");
            var targetModal = document.getElementById(targetId);
            if (targetModal) {
                targetModal.style.display = "flex";
            }
        });
    });

    var modalCloseButtons = document.querySelectorAll("[data-close-modal]");
    modalCloseButtons.forEach(function (btn) {
        btn.addEventListener("click", function () {
            var targetModal = btn.closest(".modal-backdrop");
            if (targetModal) {
                targetModal.style.display = "none";
            }
        });
    });

    // 3. Password Visibility Toggle
    var togglePasswordBtns = document.querySelectorAll(".toggle-password-btn");
    togglePasswordBtns.forEach(function (btn) {
        btn.addEventListener("click", function () {
            var inputId = btn.getAttribute("data-target");
            var targetInput = document.getElementById(inputId);
            if (targetInput) {
                if (targetInput.type === "password") {
                    targetInput.type = "text";
                    btn.textContent = "Hide";
                } else {
                    targetInput.type = "password";
                    btn.textContent = "Show";
                }
            }
        });
    });
});
