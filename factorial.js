// require: readline-sync

// Your actual plugin code starts here
function factorial(n) {
    if (n < 0) {
        return "Invalid input. Please enter a non-negative integer.";
    }
    var result = 1; 
    for (var i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

function run(getInputFunction) {
    // Using the getInputFunction to get user input
    var input = getInputFunction("Enter a number to calculate its factorial:"); 
    var number = parseInt(input); 

    if (isNaN(number)) {
        console.log("Invalid input. Please enter a valid number.");
        return "Invalid input. Please enter a valid number.";
    }

    var result = factorial(number); 
    var outputMessage = "The factorial of " + number + " is " + result + "."; 
    console.log(outputMessage);
    return outputMessage;
}

// factorial.js by LewdLillyVT
// https://github.com/LewdLillyVT/PluginLib
// An example plugin to test the new node package manager integration feature