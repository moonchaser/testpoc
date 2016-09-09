#!/usr/bin/perl

if ($ARGV[0] =~ m/dev/i) {
    `echo '<h1>Dev environment!</h1>' > /var/www/html/index.html`;
}elsif ($ARGV[0] =~ m/qa/i) {
    `echo '<h1>QA environment!</h1>' > /var/www/html/index.html`;
}elsif ($ARGV[0] =~ m/prod/i) {
    `echo '<h1>PROD environment!</h1>' > /var/www/html/index.html`;
}else {
    `echo '<h1>UNKNOWN environment!</h1>' > /var/www/html/index.html`;
}

# keep the container alive...                                                                                                                                                       
`echo ServerName localhost >> /etc/apache2/apache2.conf`;
`service  apache2 restart`;
`tail -f /var/log/apache2/access.log`;
