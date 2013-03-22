# Contributing to Phishing Templates
## Steps:
1. Look at the template format.
2. Figure out which variables you can use with Mustache
3. Read the [Mustache](#mustache) section below.
4. Scenario + .mustache = example_scenario.mustache
5. Test against [example.rb](example.rb)
6. Open a [pull request](https://github.com/threatagent/community/pulls).
7. Collaborate, refine, get merged in.

The phishing templates used by ThreatAgent utilize
[Mustache](https://github.com/defunkt/mustache).

## Mustache
Templates in mustache are easy. Write the content and then throw
mustaches ('{{variable}}') around your [variables](#variables). The
format we chose to use is reminiscent of an email transcript.

example_scenario.mustache:
```
Subject:
URGENT: Your {{domain}} email account has been compromised

Body:
Hey, {{fname}}

It looks like your email account may have been broken into.
{{company}} employees have been receiving some suspicious emails from
{{email}}.

Thanks, IT Guy
```

### Components of a Phishing Template:
'To:', 'Subject:', and 'Body:' represent the segments of the email.
Variables can be used anywhere in a template, but we ***always*** want
to include the email variable as a recepient.

### Variables
The variables we currently provide to templates are:
* company - the victim's place of work
* domain - the company domain
* email - the email address of the victim
* fname - first name of the victim
* lname - last name of the victim
* location - victim's listed location
* name - full name of the victim
