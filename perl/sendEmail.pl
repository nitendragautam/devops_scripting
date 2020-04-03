#!/usr/bin/perl
use strict;
use warnings;

# first, create your message
use Email::MIME;
my $message = Email::MIME->create(
  header_str => [
    From    => 'nitendra.gautam@gmail.com',
    To      => 'nitendra.gautam@gmail.com',
    Subject => 'EMail testing',
  ],
  attributes => {
    encoding => 'quoted-printable',
    charset  => 'ISO-8859-1',
  },
  body_str => "Email Testing!\n",
);

# send the message
use Email::Sender::Simple qw(sendmail);
sendmail($message);