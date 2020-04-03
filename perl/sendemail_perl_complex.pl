#!/usr/bin/perl
 
open(MAIL, "|/usr/sbin/sendmail -t");
 
# Email Header
print MAIL 'To: <nitendra.gautam@gmail.com>
Subject: test
Accept-Language: en-US
Content-Language: en-US
Content-Type: multipart/alternative;
        boundary="_mypartsep_"
MIME-Version: 1.0

--_mypartsep_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Hi</title>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
</head>
<body>
<pre STYLE="font-family: Calibri; font-size: 11pt;">

Sending Email

</pre>
</body>
</html>

--_mypartsep_--
';

close(MAIL);
print "Email Sent Successfully\n";