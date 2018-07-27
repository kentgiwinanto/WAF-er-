// 1
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'line',

	// The data for our dataset
	data: {
		labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
		datasets: [{
			label: "Access Daily",
			borderColor: '#97ce2f',
			data: [0, 10, 5, 2, 20, 30, 45],
		}]
	},
	

	// Configuration options go here
	options: {
		legend: {
			display: false
		},
		title: {
			display: true,
			text: 'Custom Chart Title'
		},
	}
});

//2
var ctx = document.getElementById('myChart2').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'bar',

	// The data for our dataset
	data: {
		labels: ["June", "July", "Augustus", "September"],
		datasets: [{
			label: "Total Attack",
			backgroundColor: '#97ce2f',
			borderColor: '#97ce2f',
			data: [24, 26, 30, 40],
		}]
	},

	// Configuration options go here
	options: {}
});

//3
var ctx = document.getElementById('myChart3').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'horizontalBar',

	// The data for our dataset
	data: {
		labels: [ "GET", "POST", "PUT"],
		datasets: [{
			label: "Method",
			backgroundColor: '#97ce2f',
			borderColor: '#97ce2f',
			data: [30, 10, 5],
		}]
	},

	// Configuration options go here
	options: {}
});

//4
var ctx = document.getElementById('myChart4').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'doughnut',

	// The data for our dataset
	data: {
		labels: [ "200", "404", "502"],
		datasets: [{
			label: "Status Code",
			backgroundColor: '#97ce2f',
			borderColor: '#97ce2f',
			data: [10, 10, 5],
		}]
	},

	// Configuration options go here
	options: {}
});

//5
var ctx = document.getElementById('myChart5').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'radar',

	// The data for our dataset
	data: {
		labels: [ "Chrome", "FireFox", "Safari", "Komodo","IE"],
		datasets: [{
			label: "User Agent",
			backgroundColor: '#97ce2f',
			borderColor: '#97ce2f',
			data: [14, 10, 5, 7, 8, 7],
		}]
	},

	// Configuration options go here
	options: {
		legend: {
			display: false
		 },
	}
});

//6
var ctx = document.getElementById('myChart6').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type: 'pie',

	// The data for our dataset
	data: {
		labels: [ "May", "June", "July"],
		datasets: [{
			label: "My First dataset",
			backgroundColor: '#97ce2f',
			borderColor: '#97ce2f',
			data: [0, 10, 5, 2, 20, 30, 45],
		}]
	},

	// Configuration options go here
	options: {}
});