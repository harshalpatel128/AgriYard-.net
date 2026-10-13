// ============================================================================
// SCRIPT: market.js
// DESCRIPTION: Client-side helpers for real-time market search, filtering,
//              and row highlight interactions
// ============================================================================

document.addEventListener("DOMContentLoaded", function () {
    // 1. Instant client-side search filtering on Shop Directory page
    var shopSearchInput = document.getElementById("shopSearchInput");
    if (shopSearchInput) {
        shopSearchInput.addEventListener("input", function () {
            var filter = this.value.toLowerCase().trim();
            var shopCards = document.querySelectorAll(".shop-card");

            shopCards.forEach(function (card) {
                var shopName = card.querySelector(".shop-card-details h3") ? card.querySelector(".shop-card-details h3").textContent.toLowerCase() : "";
                var shopPhone = card.querySelector(".shop-card-details p") ? card.querySelector(".shop-card-details p").textContent.toLowerCase() : "";

                if (shopName.indexOf(filter) > -1 || shopPhone.indexOf(filter) > -1) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
                }
            });
        });
    }

    // 2. Clear Search input helper on Crop Search page
    var clearSearchBtn = document.getElementById("clearSearchBtn");
    var cropSearchInput = document.getElementById("cropSearchInput");
    if (clearSearchBtn && cropSearchInput) {
        clearSearchBtn.addEventListener("click", function () {
            cropSearchInput.value = "";
            cropSearchInput.focus();
        });
    }
});
