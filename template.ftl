<!DOCTYPE html>
<html>
<head>
    <title>Dashboard with Charts</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: Arial, sans-serif;
        }
    
        canvas {
            margin: 20px auto;
            margin-top: 20px;
            display: block;
            max-height: 400px;
            width: 100%;
        }
        div {
            width: 400px;
            height: 400px;
        }
    
    </style>
</head>
<body>
    <h1>User Dashboard</h1>
    
    <!-- Canvas for Eye Color Chart -->
    <div class="chart-container">
        <h2>Eye Color Distribution</h2>
        <canvas id="eyeColorChart" width="400" height="400"></canvas>
    </div>

    <!-- Canvas for IsActive Chart -->
    <div class="chart-container">
        <h2>Active User Distribution</h2>
        <canvas id="isActiveChart" width="400" height="400"></canvas>
    </div>

    <!-- Canvas for Gender Chart -->
    <div class="chart-container">
        <h2>Gender Distribution</h2>
        <canvas id="genderChart" width="400" height="400"></canvas>
    </div>

    <!-- Embedded JavaScript to render the charts -->
    <script>
        var eyeColorData = JSON.parse('${eyeColorData}');
        var isActiveData = JSON.parse('${isActiveData}');
        var genderData = JSON.parse('${genderData}');
    
        // Function to create a pie chart with dark theme
        function createPieChart(canvasId, data) {
            var ctx = document.getElementById(canvasId).getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: Object.keys(data),
                    datasets: [{
                        data: Object.values(data),
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.8)',
                            'rgba(54, 162, 235, 0.8)',
                            'rgba(255, 206, 86, 0.8)',
                            'rgba(75, 192, 192, 0.8)',
                            'rgba(153, 102, 255, 0.8)',
                            'rgba(255, 159, 64, 0.8)',
                            'rgba(199, 199, 199, 0.8)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(199, 199, 199, 1)'
                        ],
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    theme: {
                        mode: 'dark'
                        
                    }
                },
                options: {
                    layout: {
                        padding: {
                            top: 20
                            
                        }
                    }
                }
            });
        }
    
        // Creating charts
        createPieChart('eyeColorChart', eyeColorData);
        createPieChart('isActiveChart', isActiveData);
        createPieChart('genderChart', genderData);
    </script>
    
</body>
</html>
