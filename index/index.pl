#!/usr/bin/perl

use DBI;

my $dsn = "DBI:MariaDB:database=shipping;host=mariadb-service";
my $dbh = DBI->connect($dsn,'root','abc123!');

my $sth = $dbh->prepare(
    'SELECT naam FROM namen WHERE id=1');
$sth -> execute();
$ref = $sth -> fetchrow_hashref();

print "Content-type:text/html\r\n\r\n";
print '<html>';
print '<head>';
print '<title>Shipping Challenge</title>';
print '</head>';
print '<body>';
print "<h2>$ref->{'naam'} says: Hello World!</h2>";
print '</body>';
print '</html>';

$sth->finish;
$dbh->disconnect();
