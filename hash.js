const fs = require('fs');
const crypto = require('crypto');

// Main function that runs when the plugin is loaded
function run() {
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // Ask user to enter the file path
    readline.question("Enter the path to the file you want to hash: ", function(filePath) {
        // Read the file and generate SHA-256 hash
        try {
            const fileBuffer = fs.readFileSync(filePath);
            const hashSum = crypto.createHash('sha256');
            hashSum.update(fileBuffer);

            const hex = hashSum.digest('hex');
            console.log(`SHA-256 Hash of ${filePath}: ${hex}`);
        } catch (error) {
            console.error("Error reading file or generating hash:", error.message);
        }

        readline.close();
    });
}
