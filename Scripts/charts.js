// ============================================================================
// SCRIPT: charts.js
// DESCRIPTION: Local lightweight HTML5 Canvas renderer for the 7-day price trend
//              chart on Page 10 of the Figma PDF design.
//              Notice: Uses purely client-side canvas logic without external APIs.
// ============================================================================

function renderPriceTrendChart(canvasId) {
    var canvas = document.getElementById(canvasId);
    if (!canvas) return;

    var ctx = canvas.getContext("2d");
    if (!ctx) return;

    // Handle high DPI displays for crisp line rendering
    var dpr = window.devicePixelRatio || 1;
    var rect = canvas.getBoundingClientRect();
    canvas.width = rect.width * dpr;
    canvas.height = rect.height * dpr;
    ctx.scale(dpr, dpr);

    var width = rect.width;
    var height = rect.height;

    // Chart padding
    var padLeft = 45;
    var padRight = 20;
    var padTop = 25;
    var padBottom = 35;

    var plotWidth = width - padLeft - padRight;
    var plotHeight = height - padTop - padBottom;

    // Data matching Page 10 of PDF
    var dates = ["14 May", "15 May", "16 May", "17 May", "18 May", "19 May", "20 May"];
    var minPrices = [540, 550, 560, 570, 580, 590, 600];
    var avgPrices = [590, 600, 610, 620, 630, 640, 650];
    var maxPrices = [640, 650, 660, 670, 680, 690, 700];

    var yMin = 500;
    var yMax = 700;

    // Helper to calculate X and Y coordinates
    function getX(index) {
        return padLeft + (index / (dates.length - 1)) * plotWidth;
    }

    function getY(val) {
        return padTop + plotHeight - ((val - yMin) / (yMax - yMin)) * plotHeight;
    }

    // Clear canvas
    ctx.clearRect(0, 0, width, height);

    // 1. Draw horizontal grid lines and Y axis labels (500, 550, 600, 650, 700)
    var ySteps = [500, 550, 600, 650, 700];
    ctx.font = "12px -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif";
    ctx.textAlign = "right";
    ctx.textBaseline = "middle";

    ySteps.forEach(function (yVal) {
        var yPos = getY(yVal);

        // Grid line
        ctx.strokeStyle = "#e8ece8";
        ctx.lineWidth = 1;
        ctx.beginPath();
        ctx.moveTo(padLeft, yPos);
        ctx.lineTo(width - padRight, yPos);
        ctx.stroke();

        // Label
        ctx.fillStyle = "#8a9a8a";
        ctx.fillText(yVal.toString(), padLeft - 10, yPos);
    });

    // 2. Draw X axis dates
    ctx.textAlign = "center";
    ctx.textBaseline = "top";
    ctx.fillStyle = "#8a9a8a";

    dates.forEach(function (d, i) {
        var xPos = getX(i);
        ctx.fillText(d, xPos, height - padBottom + 12);
    });

    // 3. Helper to draw series line and points
    function drawSeries(data, color, isDashed) {
        ctx.save();
        ctx.strokeStyle = color;
        ctx.lineWidth = 2.5;

        if (isDashed) {
            ctx.setLineDash([5, 5]);
        } else {
            ctx.setLineDash([]);
        }

        ctx.beginPath();
        data.forEach(function (val, i) {
            var x = getX(i);
            var y = getY(val);
            if (i === 0) {
                ctx.moveTo(x, y);
            } else {
                ctx.lineTo(x, y);
            }
        });
        ctx.stroke();
        ctx.restore();

        // Draw point dots
        data.forEach(function (val, i) {
            var x = getX(i);
            var y = getY(val);

            ctx.beginPath();
            ctx.arc(x, y, 4.5, 0, Math.PI * 2);
            ctx.fillStyle = color;
            ctx.fill();
            ctx.lineWidth = 2;
            ctx.strokeStyle = "#ffffff";
            ctx.stroke();
        });
    }

    // Draw Min Price (Green #2E7D32)
    drawSeries(minPrices, "#2e7d32", false);

    // Draw Avg Price (Dark Gray #555555, Dashed)
    drawSeries(avgPrices, "#555555", true);

    // Draw Max Price (Blue #2196F3)
    drawSeries(maxPrices, "#2196f3", false);
}

// Re-render chart on page load and window resize
window.addEventListener("DOMContentLoaded", function () {
    renderPriceTrendChart("priceTrendCanvas");
});

window.addEventListener("resize", function () {
    renderPriceTrendChart("priceTrendCanvas");
});
