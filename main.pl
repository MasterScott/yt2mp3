use v5.10;
use strict;
no strict qw(subs refs);
use warnings;
use experimental 'smartmatch';
use Term::ANSIColor qw(color colored);

my $VERSION='2.1.6';

if($^Oeq'MSWin32'){
	my $youtube_dl_not_installed=system('where youtube-dl >NUL 2>NUL');
	my $ffmpeg_not_installed=system('where ffmpeg >NUL 2>NUL');
	my $anything_not_installed=$youtube_dl_not_installed||$ffmpeg_not_installed;
	if($anything_not_installed){
		require Win32::Console::ANSI;
		Win32::Console::ANSI->import();
		print colored "[-] YT2MP3 is not installed.\n",'red';
		print colored "[+] Starting the installation.\n",'green';
		print colored "[+] Downloading wget.exe\n",'green';
		my $arch=$ENV{'PROCESSOR_ARCHITECTURE'}eq'x86'?32:64;
		system 'certutil','-urlcache','-split','-f',"https://eternallybored.org/misc/wget/1.20.3/$arch/wget.exe" and exit $?>>8;
		print colored "[+] Successfully downloaded wget.exe\n",'green';
		if($youtube_dl_not_installed){
			print colored "[-] Youtube-dl is not installed.\n",'red';
			print colored "[+] Downloading youtube-dl.exe\n",'green';
			system './wget','https://yt-dl.org/downloads/latest/youtube-dl.exe' and exit $?>>8;
			print colored "[+] Successfully downloaded youtube-dl.exe\n",'green';
		}
		if($ffmpeg_not_installed){
			use IO::Uncompress::Unzip 'unzip','$UnzipError';
			print colored "[-] FFmpeg is not installed.\n",'red';
			system './wget',"https://ffmpeg.zeranoe.com/builds/win$arch/static/ffmpeg-latest-win$arch-static.zip" and exit $?>>8;
			print colored "[+] Extracting \"ffmpeg.exe\" from \"ffmpeg-latest-win$arch-static.zip\"\n",'green';
			unzip "ffmpeg-latest-win$arch-static.zip"=>'ffmpeg.exe',Name=>"ffmpeg-latest-win$arch-static/bin/ffmpeg.exe" or die $UnzipError;
			print colored "[+] Successfully extracted \"ffmpeg.exe\" from the \"ffmpeg-latest-win$arch-static.zip\"\n",'green';
			print colored "[+] Removing \"ffmpeg-latest-win$arch-static.zip\"\n",'green';
			unlink "ffmpeg-latest-win$arch-static.zip" or die colored "[-] Can't remove \"ffmpeg-latest-win$arch-static.zip\": $!.\n",'red';
			print colored "[+] Successfully removed \"ffmpeg-latest-win$arch-static.zip\"\n",'green';
			print colored "[+] Successfully installed FFMpeg.\n",'green';
		}
		print colored "[+] Removing \"wget.exe\"\n",'green';
		unlink 'wget.exe';
		print colored "[+] Successfully removed \"wget.exe\"\n",'green';
		print colored "[+] Successfully installed YT2MP3.\n",'green';
	}
}

my $songs_file=STDIN;
my $audio_format='mp3';
my $audio_quality='0';
my $output_template='%(title)s.%(ext)s';

sub get_arg{
	my $arg=shift @ARGV;
	if(!$arg||$arg=~/^-{1,2}.+/){die "Wrong number of arguments for \"$_\".\nExpected $_[1].\nGot ".($_[0]-1).".\n"}
	return $arg;
}
do{
	given(shift @ARGV){
		when(undef){}
		when(['-v','--version']){
			print("YT2MP3 v$VERSION\n");
			exit;
		}
		when(['-s','--songs']){
			my $songs_list=get_arg(1,1);
			open $songs_file,'<',$songs_list or die "Can't open file \"$songs_list\": $!";
		}
		when(['-f','--format']){
			$audio_format=get_arg(1,1);
			if(not $audio_format~~['best','aac','flac','mp3','m4a','opus','vorbis','wav']){
				die "Invalid audio format \"$audio_format\".\nSupported audio formats: best aac flac mp3 m4a opus vorbis wav.\n"
			}
		}
		when(['-q','--quality']){
			$audio_quality=get_arg(1,1);
			if($audio_quality!~/^\d$/){
				die "Invalid audio quality \"$audio_quality\".\nAudio quality has to be number between 0, for best quality, and 9, for worst.\n"
			}
		}
		when(['-o','--output']){$output_template=get_arg(1,1)}
		default{
			print color 'blue';
			print "usage: perl main.pl [-h] [-v] [-s FILE] [-f {best aac flac mp3 m4a opus vorbis wav}] [-q {0-9}] [-o TEMPLATE]\n";
			print "  -h, --help            show this help message and exit\n";
			print "  -v, --version            show version and exit\n";
			print "  -s, --songs FILE\n            set path to file with songs\n";
			print "  -f, --format {best aac flac mp3 m4a opus vorbis wav}\n            set custom file format\n";
			print "  -q, --quality {0-9}\n            set custom audio quality\n";
			print "  -o, --output TEMPLATE\n            set custom output template\n";
			if(not $_~~['-h','--help']){die colored "Invalid option \"$_\".\n",'red'}
			print color 'reset';
			exit
		}
	}
}while(@ARGV);

my @songs;
while(<$songs_file>){/v=[\w_-]+/ ?push @songs,"https://www.youtube.com/watch?$&":last};
system(($^O=~/^ms/i ?'./':'').'youtube-dl','--geo-bypass','-x','--audio-format',$audio_format,'--audio-quality',$audio_quality,'-o',$output_template,@songs) and exit $?>>8;
rename $_,$_=~s/^\s+|(\([^\)]*\))|[^ -~]+|\s+$//gr foreach(glob '*.'.$audio_format);
