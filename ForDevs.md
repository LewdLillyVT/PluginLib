# For Developers - Adding Plugins to goCLI

Welcome to the goCLI plugin development guide! This document explains how to enhance your plugins by adding Node.js modules for JavaScript, as well as documenting your plugins with code comments. We also support PowerShell plugins, and while Python plugins are currently limited, we have plans for future enhancements.

## Adding Node.js Modules

To use Node.js modules in your JavaScript plugins, you can include them at the top of your `.js` file. Make sure to install the necessary modules before using them in your code. Here’s how you can do it:

1. **Install Node Modules**: Use npm (Node Package Manager) to install any required modules. For example, if you want to use the `readline-sync` module, you would run:

   ```bash
   npm install readline-sync
   ```

2. **Include Modules in Your Plugin**: At the top of your JavaScript file, you can specify the required modules in comments and then require them. Here’s how you can do it:

   ```javascript
   // require: readline-sync

   // Your actual plugin code starts here
   ```

Here’s an example of how the top of your JavaScript plugin might look:

```javascript
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
```

## PowerShell Plugins

For PowerShell plugins, you just write the powershell code. Here's an example:

```powershell
# get-diskinfo.ps1

# Get disk information
$disks = Get-PSDrive -PSProvider FileSystem

# Check if any disks were found
if ($disks.Count -eq 0) {
    Write-Host "No disks found."
    exit 1
}

# Display disk information
Write-Host "Drive Information:"
foreach ($disk in $disks) {
    $usedSpace = [math]::round($disk.Used / 1GB, 2)
    $freeSpace = [math]::round($disk.Free / 1GB, 2)
    $totalSpace = [math]::round($disk.Used / 1GB + $disk.Free / 1GB, 2)
    
    Write-Host "Drive: $($disk.Name)"
    Write-Host "  Total Size: ${totalSpace} GB"
    Write-Host "  Used Space: ${usedSpace} GB"
    Write-Host "  Free Space: ${freeSpace} GB"
    Write-Host "----------------------------------------"
}

# diskinfo.ps1 by LewdLillyVT
# https://github.com/LewdLillyVT/PluginLib
# An example plugin 
```

### Documenting Plugin Information

To ensure that users of your plugin have the necessary information, please add three lines of code comments at the end of each plugin file. This information will be read by the goCLI application to provide users with details about the plugin.

#### Format of the Plugin Information Comments

The last three lines should ideally include:

1. A brief description of what the plugin does.
2. Any specific usage instructions or requirements.
3. The author's name or a link to the plugin repository.

#### Example

At the end of your PowerShell plugin, you might add:

```powershell
# Author: LewdLillyVT
# This plugin retrieves disk information from the system.
# Ensure you have the necessary PowerShell modules installed.
```

## Python Plugins

Currently, Python plugins do not support external libraries, but this functionality is planned for a future release. You can still write your Python code without additional dependencies. Here’s an example:

```python
# sysinfo.py

import platform

def get_system_info():
    system_info = {
        "System": platform.system(),
        "Node Name": platform.node(),
        "Release": platform.release(),
        "Version": platform.version(),
        "Machine": platform.machine(),
        "Processor": platform.processor(),
    }

    print("System Information:")
    for key, value in system_info.items():
        print(f"{key}: {value}")

if __name__ == "__main__":
    get_system_info()

# sysinfo.py by LewdLillyVT
# https://github.com/LewdLillyVT/PluginLib
# An example plugin 
```

Thank you for contributing to goCLI!
