#!/usr/bin/perl
#-------------------------------------------------------
# Save the click done on managed hits into a trace file
# and return to browser a redirector to tell browser to visit this URL.
# Ex: <a href="http://athena/cgi-bin/awredir/awredir.pl?tag=TAGFORLOG&url=http://212.43.217.240/%7Eforumgp/forum/list.php3?f=11">XXX</a>
#-------------------------------------------------------

#use DBD::mysql;


#-------------------------------------------------------
# Defines
#-------------------------------------------------------
use vars qw/ $REVISION $VERSION /;
$REVISION='$Revision: 1.2 $'; $REVISION =~ /\s(.*)\s/; $REVISION=$1;
$VERSION="1.1 (build $REVISION)";

use vars qw / $DIR $PROG $Extension $DEBUG $DEBUGFILE $REPLOG $DEBUGRESET $SITE $REPCONF /;
($DIR=$0) =~ s/([^\/\\]*)$//; ($PROG=$1) =~ s/\.([^\.]*)$//; $Extension=$1;
$DEBUG=0;					# Debug level
$DEBUGFILE="$PROG.log";		# Debug output (A log file name or "screen" to have debug on screen)
$REPLOG="$DIR../../../../../apache/logs";				# Debug directory

$TRACEBASE=0;	# Set to 1 to track click on links that point to extern site into a database
$TRACEFILE=0;	# Set to 1 to track click on links that point to extern site into a file
$TXTDIR="$DIR../../../../../apache/logs";	# Directory where to write tracking file (if TRACEFILE=1)
$TXTFILE="awredir.trc";			# Tracking file (if TRACEFILE=1)
$EXCLUDEIP="127.0.0.1";


#-------------------------------------------------------
# Functions
#-------------------------------------------------------

sub error {
	print "Content-type: text/html; charset=iso-8859-1\n";
	print "\n";
	print "<html>\n";
	print "<head>\n";
	print "</head>\n";
	print "\n";
	print "<body>\n";
	print "<center><br>\n";
	print "<font size=2><b>AWRedir</b></font><br>\n\n";
   	print "<font color=#880000>$_[0].</font><br><br>\n";
	print "Setup (setup or logfile permissions) may be wrong.\n";
	$date=localtime();
	print "<CENTER><br><font size=1>$date - <b>Advanced Web Redirector $VERSION</b><br>\n";
	print "<br>\n";
	print "</body>";
	print "</html>";
    die;
}

#-------------------------------------------------------
# MAIN
#-------------------------------------------------------

if ($DEBUG) {
	open(LOGFILE,">$REPLOG/$PROG.log");
	print LOGFILE "----- $PROG $VERSION -----\n";	
}

if (! $ENV{'GATEWAY_INTERFACE'}) {	# Run from command line
	print "----- $PROG $VERSION (c) Laurent Destailleur -----\n";
	print "This script is absolutely not required to use AWStats.\n";
	print "It's a third tool that can help webmaster in their tracking tasks but is\n";
	print "not used by AWStats engine.\n";
	print "\n";
	print "This tools must be used as a CGI script. When called as a CGI, it returns to\n";
	print "browser a redirector to tell it to show the page provided in 'url' parameter.\n";
	print "So, to use this script, you must replace HTML code for external links onto your\n";
	print "HTML pages from\n";
	print "<a href=\"http://externalsite/pagelinked\">Link</a>\n";
	print "to\n";
	print "<a href=\"http://mysite/cgi-bin/awredir.pl?url=http://externalsite/pagelinked\">Link</a>\n";
	print "\n";
	print "For your web visitor, there is no difference. However this allow you to track\n";
	print "clicks done on links onto your web pages that point to external web sites,\n";
	print "because an entry will be seen in your own server log, to awredir.pl script\n";
	print "with url parameter, even if link was pointing to another external web server.\n";
	print "\n";
	sleep 2;
	exit 0;
}

# Extract tag
$Tag='NOTAG';
if ($ENV{QUERY_STRING} =~ /tag=\"?([^\"&]+)\"?/) { $Tag=$1; }

# Extract url to redirect to
$Url=$ENV{QUERY_STRING};
if ($Url =~ /url=\"([^\"]+)\"/) { $Url=$1; }
elsif ($Url =~ /url=(.+)$/) { $Url=$1; }

if ($Url !~ /^\w+:/i) { $Url = "http://".$Url; }
if (! $Url) {
	error("Error: Bad use of $PROG. To redirect an URL with $PROG, use the following syntax:<br><i>/cgi-bin/$PROG.pl?url=http://urltogo</i>");
}
if ($DEBUG) { print LOGFILE "Url=$Url\n"; }

# Get date
($nowsec,$nowmin,$nowhour,$nowday,$nowmonth,$nowyear,$nowwday,$nowyday,$nowisdst) = localtime(time);
if ($nowyear < 100) { $nowyear+=2000; } else { $nowyear+=1900; }
$nowsmallyear=$nowyear;$nowsmallyear =~ s/^..//;
if (++$nowmonth < 10) { $nowmonth = "0$nowmonth"; }
if ($nowday < 10) { $nowday = "0$nowday"; }
if ($nowhour < 10) { $nowhour = "0$nowhour"; }
if ($nowmin < 10) { $nowmin = "0$nowmin"; }
if ($nowsec < 10) { $nowsec = "0$nowsec"; }

if ($TRACEBASE == 1) {
	if ($ENV{REMOTE_ADDR} !~ /$EXCLUDEIP/) {
		if ($DEBUG == 1) { print LOGFILE "Execution requete Update sur BASE=$BASE, USER=$USER, PASS=$PASS\n"; }
		my $dbh = DBI->connect("DBI:mysql:$BASE", $USER, $PASS) || die "Can't connect to DBI:mysql:$BASE: $dbh->errstr\n";
		my $sth = $dbh->prepare("UPDATE T_LINKS set HITS_LINKS = HIT_LINKS+1 where URL_LINKS = '$Url'");
		$sth->execute || error("Error: Unable execute query:$dbh->err, $dbh->errstr");
		$sth->finish;
		$dbh->disconnect;
		if ($DEBUG == 1) { print LOGFILE "Execution requete Update - OK\n"; }
	}
}

if ($TRACEFILE == 1) {
	if ($ENV{REMOTE_ADDR} !~ /$EXCLUDEIP/) {
		open(FICHIER,">>$TXTDIR/$TXTFILE") || error("Error: Enable to open trace file $TXTDIR/$TXTFILE: $!");
		print FICHIER "$nowyear-$nowmonth-$nowday $nowhour:$nowmin:$nowsec\t$ENV{REMOTE_ADDR}\t$Tag\t$Url\n";
		close(FICHIER);
	}
}

# Redir html instructions
# HF (7/1/09) CR #42924 - Prevent hacker from using awredir.pl to launch DoS attack against random
# websites.  Done by defining a whitelist of URLs which the Planet website redirects to.
# Not a pretty solution, but it gets the job done.  Whenever a new external link is added
# to the website, this list must be expanded, and similar when deleted.

my $isValidUrl=0;
my @redirSites = (
        "http://.*cancer.gov",
        "http://www.cdc.gov",
        "http://cancer.org",
        "http://www.cancer.org",
        "http://www.samhsa.gov",
        "http://www.microsoft.com",
        "http://www.facs.org/cancerprogram",
        "http://www.surgeongeneral.gov",
        "http://www.health.gov",
        "http://apps.nccd.cdc.gov/statesystem",
        "http://www.thecommunityguide.org",
        "http://www.preventiveservices.ahrq.gov",
        "http://www.ahrq.gov",
        "http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0",
        "http://www.macromedia.com/go/getflashplayer",
        "http://channels.netscape.com/ns/browsers/download.jsp",
        "http://www.planetcancer.org",
        "http://www.usa.gov",
	"http://www.cochrane.org",
	"http://www3.interscience.wiley.com",
	"http://secure.mmgct.com/planettraining/",
	"http://www.uspreventiveservicestaskforce.org/",
	"http://www.egappreviews.org/",
	"http://www.iccp-portal.org/"
);

# Parse the list of sites listed on planet.cancer.gov (above) and if the current Url matches, then allow redirection. 
foreach $redirSite (@redirSites)
{
        if ($Url =~ m/^$redirSite/) {
                $isValidUrl = 1;
                break;
        }
}
 
if ($isValidUrl == 1)
{
	# HF (11/5/07) CR #40008 - per http://johnbokma.com/perl/redirectioncgiscript.html,
	#   needed to change the Location HTTP header to Status 302.  Don't know why, but it works.
	#   print "Location: $Url\n\n";
        print "Status: 302 Moved\nLocation: $Url\n\n";
} else {
	# HF Note: logging does not work for some reason, so comment out.
	# open(LOGFILE1,">>$DIR$PROG.log");
	# print LOGFILE1 "Bad external URL entered: $Url\n";
	# close(LOGFILE1);
	print "Content-type: text/html\n";
	print "Status: 401 Access Denied\n\n";
	print "<html><body><h1 style='color: rgb(0, 0, 0); font-family: verdana; font-style: normal; font-variant: normal; font-weight: normal; font-size: 13pt; line-height: 15pt; font-size-adjust: none; font-stretch: normal; -x-system-font: none;'>The requested page is not accessible from this site.</h1></body></html>";
}

if ($DEBUG) {
	print LOGFILE "Redirect to $Url\n";
	close(LOGFILE);
}

0;
