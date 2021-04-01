# Security Principles for Developers

Security on the web relies on confidentiality, integrity, and availability. We are able to produce robust security control by considering each of these key pieces while we build software. The following security principles embody these ideals.

## Defense in Depth

**A secure application has multiple layers of security controls.**

Defense in depth is the idea that security should have layers. Multiple layers of security controls make severe vulnerabilities difficult for an attacker to exploit.

For example, a flawed administrative interface is unlikely to be vulnerable if it gates access to networks, checks for admin user authorization, and logs all access.

## Positive Security Model

**A secure application defines what is allowed and rejects everything else.**

For example, if we’re using the positive security model while working with a form input, we should specify only what characters will be allowed. That may mean only alphanumeric characters are allowed or only numbers are allowed, for example.

Another example is in user access control, where a user would be allowed access only to what is needed and denied access to everything else.

## Fail Securely

**A secure application handles errors and exceptions securely.**

Handling errors securely is a key aspect of secure coding. Exceptions that occur while processing a security control deserve special attention. These exceptions must not allow behavior that the control wouldn’t normally allow. Any time we implement a security mechanism, there are three possible outcomes:

* Allow the operation
* Disallow the operation
* Exception

Generally, we design security mechanisms so that failure, or exception, is the same as disallowing the operation.

## Principle of Least Privilege

**A secure application gives the least amount of privilege required.**

This principle encompasses user rights and resource permissions.

Examples of least privilege include:

* only give clients access to one external client Slack channel
* only giving a server permission to a network, read access to a database table, and the ability to write a log

Keep in mind that it’s often easier to give additional permissions than to take away existing permissions.

## Separation of Duties

**A secure application separates duties, restricting the power of any individual.**

Separation of duties manages conflict of interest by restricting any one individual’s power. It is best implemented by using role-based access control and by carefully defining what each role should be able to do.

We can apply this method to environments, where developers would not have administrative access to production environments. This kind of separation ensures production changes only occur through controlled means.

Another example of this method is how we write code at Sparkbox. We write modular, componentized code to limit complexity, which can limit what an attacker may be able to communicate with in an attack.

## Security by Obscurity

**A secure application limits what parts of the application are revealed.**

Security through obscurity means limiting what is revealed about the design or implementation of a system. For example, it's best practice not to include the `X-Powered-By` header in HTTP responses.

Security by obscurity can be a weak control if you're trying to hide information that you've shared. Attackers have all the time in the world to find things we hide from them, so systems shouldn’t be reliant only on keeping details hidden.

## Do Not Trust the Client

**A secure application validates information coming from the client.**

This principle acknowledges that anything you send a client (a person or machine that’s consuming the application) can be tampered with. Data sent from the client to the server should not be trusted. For this reason, the backend code should validate all data and permissions. 

## Additional Resources

- [OWASP Top 10 Web Application Security Risks](https://owasp.org/www-project-top-ten/)
- [OWASP Cross Site Scripting Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
- [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/)
- [NIST Digital Identity Guidelines, Section 5: Authenticator and Verifier Requirements](https://pages.nist.gov/800-63-3/sp800-63b.html#sec5)
- [Juice Shop](https://github.com/bkimminich/juice-shop)
- [Burp Suite](https://portswigger.net/burp)
