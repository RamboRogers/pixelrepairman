#!perl
use strict;
use Win32::GUI();


my ($message,$screen,$desktop,$desktopWidth,$desktopHeight,$colorTimer,$screen2,$screen3,$screen4,$screen5);
my ($r,$g,$b) = (0,0,0);
my $timer;
sub coreApplication {
	print "Starting\n";
	#Grab Desktop Info for Application Construction
	 $desktop = Win32::GUI::GetDesktopWindow();
	 $desktopWidth = Win32::GUI::Width($desktop);
	 $desktopHeight = Win32::GUI::Height($desktop);
	
	&buildScreen;
	&buildScreen2;
	&buildScreen3;
	&buildScreen4;
	&buildScreen5;
    $screen->Show(3);
	$message = Win32::MsgBox("Hey, I wrote this program in 10 minutes, press ALT-F4 to exit! matt\@matthewrogers.org","0 | MB_ICONSTOP","Attention");
	print "Dialog System UP\n";
	$colorTimer = $screen->AddTimer('colorTimer',200);
	
	
	Win32::GUI::Dialog();

	
	
}

sub colorTimer_Timer {
	

		$screen2->Hide();
		$screen3->Hide();
		$screen4->Hide();
		$screen5->Hide();
		if ($timer eq 1){ $screen->Show(3); }
	    if ($timer eq 2){ $screen2->Show(3); }
		if ($timer eq 3){ $screen3->Show(3); }
		if ($timer eq 4){ $screen4->Show(3); }
		if ($timer eq 5){ $screen5->Show(3); }
		if ($timer eq 6){ $timer = 0; $screen->Show(3); }
		
		
	$timer++;
}

sub buildScreen {
	#Secondary Window
	$screen = Win32::GUI::Window->new(
		-name => 'screen',
		-width => $desktopWidth,
		-height => $desktopHeight,
		-title => "screen",
		-foreground => [ 0,0,0],
		-background => [ $r,$g,$b],
		-pushstyle => 0x80000000,
		-popstyle => 0x40000 | 0xC00000,
		);
}
sub buildScreen2 {
	#Secondary Window
	$screen2 = Win32::GUI::Window->new(
		-name => 'screen2',
		-width => $desktopWidth,
		-height => $desktopHeight,
		-title => "screen2",
		-foreground => [ 0,0,0],
		-background => [ 255,255,255],
		-pushstyle => 0x80000000,
		-popstyle => 0x40000 | 0xC00000,
		);
}
sub buildScreen3 {
	#Secondary Window
	$screen3 = Win32::GUI::Window->new(
		-name => 'screen3',
		-width => $desktopWidth,
		-height => $desktopHeight,
		-title => "screen3",
		-foreground => [ 0,0,0],
		-background => [ 255,0,0],
		-pushstyle => 0x80000000,
		-popstyle => 0x40000 | 0xC00000,
		);
}
sub buildScreen4 {
	#Secondary Window
	$screen4 = Win32::GUI::Window->new(
		-name => 'screen4',
		-width => $desktopWidth,
		-height => $desktopHeight,
		-title => "screen4",
		-foreground => [ 0,0,0],
		-background => [ 0,255,0],
		-pushstyle => 0x80000000,
		-popstyle => 0x40000 | 0xC00000,
		);
}

sub buildScreen5 {
	#Secondary Window
	$screen5 = Win32::GUI::Window->new(
		-name => 'screen5',
		-width => $desktopWidth,
		-height => $desktopHeight,
		-title => "screen5",
		-foreground => [ 0,0,0],
		-background => [ 0,0,255],
		-pushstyle => 0x80000000,
		-popstyle => 0x40000 | 0xC00000,
		);
}

#Oracle Date Format
sub getDateTime {
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
    $year += 1900;
	$mon++;
	$mon = sprintf("%02d", $mon);
	$mday = sprintf("%02d", $mday);
	$hour = sprintf("%02d", $hour);
	$min = sprintf("%02d", $min);
	$sec = sprintf("%02d", $sec);
	my $returnValue = "${year}-${mon}-${mday} $hour:$min:$sec";
	return $returnValue;
}

&coreApplication;