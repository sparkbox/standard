# Sparkbox Laptop Maintenance

Sparkbox employees are each given a laptop to do their work.

These laptops aren't locked down. This gives our team the
freedom to install whatever software and developer tools they need to be productive. With this freedom comes the responsibility to keep the device maintained and up to date, including complying with all [security requirements](../security/README.md).

Sparkbox provides several tools and guidelines to help with laptop maintenance, as outlined below:

## Laptop Setup

After receiving a laptop, creating an account, and logging in, the following should be done before using it for work:

1. Run any pending macOS and system updates.
2. Run [the Laptop Script](#laptop-script).
3. Ensure the machine meets the Sparkbox [security requirements](../security/README.md).

### The Laptop Script

Sparkbox provides [a Laptop Script](https://github.com/sparkbox/laptop), which sets up the software, developer tools, and security practices we commonly use.

Running this script is one of the first things we do on a new laptop. Its purpose is to provide a common foundation. Once it has been run, employees are free to install additional software and customize their development environment to meet their preferences.

## Hardware Issues

If any hardware issues arise while using the laptop, let the office manager know, and they will help get them resolved.

## Wiping a Laptop

When an employee is done using their laptop, it will need to be wiped clean for the next person to use. Here are some steps to follow:

1. Follow these [instructions](https://support.apple.com/en-us/HT201065) to remove important connections between your Mac and Apple cloud services
1. Ensure the laptop is plugged into a power outlet and connected to the internet.
2. Restart the computer.
3. When the computer shuts off and powers back on, hold *Command+R* to access the macOS recovery system.
4. In the macOS Utilities window, open *Disk Utility*, choose the main hard drive (usually Macintosh HD), and hit *Erase*, [as described in Apple's docs](https://support.apple.com/en-us/HT208496).
5. After erasing the disk, quit *Disk Utility* and choose *Reinstall macOS*.
6. Once the reinstall is done, the setup assistant will load and start asking basic questions about the region, etc. At this point, hit *Command+Q* and select *Shut Down*, allowing the next user to set it up.
