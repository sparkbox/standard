# Device Security

## iOS Passcode
As of iOS 9, Apple has increased Passcodes from 4 numbers to 6. Along with
other improvements, this has a dramatic effect on the ability to [brute
force](http://fortune.com/2016/03/18/apple-fbi-iphone-passcode-hack/) access.

### Setting a Numeric Passcode
A numeric passcode can be set by:

1. Settings -> Touch ID & Passcode (Note: Touch ID is only available on 5s and
   newer)
2. Turn Passcode On
3. Enter a 6 digit number

### Setting an Alphanumeric Passcode
Passcodes are more complex the more components they can contain. iOS does
support an alphanumeric passcode by:

1. Settings -> Touch ID & Passcode
2. Turn Passcode On
3. Select _Passcode Options_ in blue #0000ff
4. Choose Custom Alphanumeric Code
5. Enter a passcode 6 or more entries in length

### Touch ID
With iPhone 5s and greater, Apple has implemented Touch ID. Once a 6 or greater
passcode has been set, Touch ID is absolutely acceptable.

### Setting Passcode Activation Period
Passcode activation period is the time after which an idle iPhone or iPad will
require a passcode. This can be set by:

1. Settings -> Touch ID & Passcode
2. Require Passcode
3. Choose a time of _After 5 minutes_ or less.

Enabling _Use Touch ID for iPhone Unlock_ and _Use Touch ID for iTunes & App
Store_ within Settings -> Touch ID & Passcode results in a _Required Passcode_
of _Immediately_. This is great!

### Capturing Status

1. Settings -> Touch ID & Passcode (Note: Touch ID is only available on 5s and
newer)
2. Capture a [screen shot][iOS Screenshot] of which includes _Turn Passcode
   Off_ and _Require Passcode_.

![iOS Passcode Status Example]


[iOS Screenshot]: https://support.apple.com/en-us/HT200289
[iOS Passcode Status Example]: ./ios-passcode-status.png
