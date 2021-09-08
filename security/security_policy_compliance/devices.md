# Device Security

## iOS Passcode
As of iOS 9, Apple has increased Passcodes from 4 numbers to 6. Along with
other improvements, this has a dramatic effect on the ability to [brute
force](http://fortune.com/2016/03/18/apple-fbi-iphone-passcode-hack/) access.

### Setting a Numeric Passcode
A numeric passcode can be set by:

1. Settings -> Touch ID/Face ID & Passcode (Note: Touch ID is only available on 5s and
   newer; Face ID is available on the X or newer)
2. Turn Passcode On
3. Enter a 6 digit number

### Setting an Alphanumeric Passcode
Passcodes are more complex the more components they can contain. iOS does
support an alphanumeric passcode by:

1. Settings -> Touch ID/Face ID & Passcode
2. Turn Passcode On
3. Select _Passcode Options_ in blue #0000ff
4. Choose Custom Alphanumeric Code
5. Enter a passcode 6 or more entries in length

### Touch ID
With iPhone 5s and greater, Apple has implemented Touch ID. Once a 6 or greater
passcode has been set, Touch ID is absolutely acceptable.

### Face ID
With iPhone X and greater, Apple has implemented Face ID. Once a 6 or greater
passcode has been set, Face ID is absolutely acceptable.

### Setting Passcode Activation Period
Passcode activation period is the time after which an idle iPhone or iPad will
require a passcode. This can be set by:

1. Settings -> Touch ID/Face ID & Passcode
2. Require Passcode
3. Choose a time of _After 5 minutes_ or less.

Enabling _Use Touch ID/Face ID for iPhone Unlock_ and _Use Touch ID/Face ID for iTunes & App
Store_ within Settings -> Touch ID & Passcode results in a _Required Passcode_
of _Immediately_. This is great!

### Capturing Status

1. Settings -> Touch ID/Face ID & Passcode (Note: Touch ID is only available on 5s and
newer; Face ID is available on the X or newer)
2. Capture a [screen shot][iOS Screenshot] of which includes _Turn Passcode
   Off_ and _Require Passcode_.

![iOS Passcode Status Example]

## Android Passcode

### Setting a Numeric/Pattern Passcode
A numeric or pattern passcode can be set by:

1. Settings -> Security & Location
2. Turn Screen Lock On
3. Enter a 6 digit number for your pin, set an alphanumeric password of 6 characters or longer, OR set to pattern
  - If you opt for the pattern lock, see the next section

### Increase Pattern Security
While patterns can be less secure than a pin or alphanumeric password, there are tactics for making this option more secure if you prefer this route.

1. Turn off "Make Pattern Visible." This will hide the visual path as you move your finger on the screen. How to set:
  - Go to settings -> security -> screen lock (gear icon/ settings)
  - Turn off the toggle for "Make Pattern Visible."
2. Choose a pattern that crosses over itself. In other words, avoid patterns that could be solved by tracing the leftover marks on your screen.
3. Set Fingerprint ID as your primary option and use the pattern as a backup (if the option is available to you)

### Fingerprint ID
Some Android devices support Fingerprint security. Once a 6 or greater
passcode has been set, Fingerprint ID is absolutely acceptable.

### Setting Passcode Activation Period
Passcode activation period is the time after which an idle iPhone or iPad will
require a passcode. This can be set by:

1. Settings -> Security & Location
2. Screen Lock gear icon
3. Choose a time of _5 minutes_ or less.

### Capturing Status

1. Settings -> Security & Location
2. Capture a screen shot which includes _Screen Lock_
3. Touch the gear icon next to Screen lock
4. Capture a screen shot which includes _Automatically lock_ setting

![Android Passcode Status Example1]
![Android Passcode Status Example2]

[iOS Screenshot]: https://support.apple.com/en-us/HT200289
[iOS Passcode Status Example]: ./ios-passcode-status.png
[Android Passcode Status Example1]: ./android-passcode-status1.png
[Android Passcode Status Example2]: ./android-passcode-status2.png
