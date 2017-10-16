# Authentication

When building applications that use authentication, security is crucial. To help ensure that we are building secure applications, we follow the [OWASP Authentication General Guidelines](https://www.owasp.org/index.php/Authentication_Cheat_Sheet#Authentication_General_Guidelines).

Because security is a constantly moving target, we recommend that you [don't roll your own authentication](https://blog.codeship.com/why-you-shouldnt-roll-your-own-authentication/), and instead rely on a battle-tested authentication mechanism. As an example, for Rails apps we use [Devise](https://github.com/plataformatec/devise), and for JavaScript/React apps we have used [Passport JS](http://passportjs.org/).

## Password Requirements

We follow the [OWASP Password Guidelines](https://www.owasp.org/index.php/Authentication_Cheat_Sheet#Implement_Proper_Password_Strength_Controls) for strong passwords:

> The password change mechanism should require a minimum level of complexity that makes sense for the application and its user population. For example:
>
> Password must meet at least 3 out of the following 4 complexity rules:
>
> - at least 1 uppercase character (A-Z)
> - at least 1 lowercase character (a-z)
> - at least 1 digit (0-9)
> - at least 1 special character (punctuation) — at least 1 special character (punctuation) — a space counts as a special character
> - at least 10 characters
> - at most 128 characters
> - not more than 2 identical characters in a row (e.g., 111 not allowed)

We're also a fan of _passphrases over passwords_.

![Password Strength](./password_strength.png)

_via [xkcd](https://xkcd.com/936/)_
