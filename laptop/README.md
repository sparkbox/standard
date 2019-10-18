# Sparkbox Laptop Maintenance

Sparkbox employees are each given a laptop to do their work.

These laptops aren't locked down. This gives our team the
freedom to install whatever software and developer tools they need to be productive. With this freedom comes the responsibility to keep the device maintained and up to date, including complying with all [security requirements](../security/README.md).

Sparkbox provides several tools and guidelines to help with laptop maintenance, as outlined below:

## Laptop Script

Sparkbox provides [a Laptop Script](https://github.com/sparkbox/laptop) which sets up the software, developer tools, and security practices we commonly use.

Running this script is one of the first things we do on a new laptop. Its purpose is to provide a common foundation. Once it has been run, employees are free to install additional software and customize their development environment to meet their preferences.

## Hardware Issues

If you are having any hardware issues, let the office manager know and they will help you get them resolved.

## Wiping a laptop

When you are done using your laptop, you'll need to wipe it clean and reset it to a default state.

To do this, use the [Apple provided command line utility][apple-cli] to create a bootable drive. Use that drive to boot up the old Mac by holding down `OPT` during a restart. Once you've booted off the external drive, select Disk Utility and erase the internal Mac drive.

After that re-install the current and latest macOS.

[apple-cli]: https://support.apple.com/en-us/HT201372
