use strict;
use warnings;

if($^Oeq'MSWin32'){
	my $youtube_dl_not_installed=system('where youtube-dl 2>NUL');
	my $ffmpeg_not_installed=system('where ffmpeg 2>NUL');
	my $anything_not_installed=$youtube_dl_not_installed||$ffmpeg_not_installed;
	if($anything_not_installed){
		require Win32::Console::ANSI;
		Win32::Console::ANSI->import();
		use Term::ANSIColor;
		print(color('red'));
		print("[-] YT2MP3 is not installed.\n");
		print(color('green'));
		print("[+] Starting the installation.\n");
		print("[+] Downloading wget.exe\n");
		print(color('reset'));
		my $arch=$ENV{'PROCESSOR_ARCHITECTURE'}eq'x86'?32:64;
		system('certutil','-urlcache','-split','-f',"https://eternallybored.org/misc/wget/1.20.3/$arch/wget.exe");
		print(color('green'));
		print("[+] Successfully downloaded wget.exe\n");
		if($youtube_dl_not_installed){
			print(color('red'));
			print("[-] Youtube-dl is not installed.\n");
			print(color('green'));
			print("[+] Downloading youtube-dl.exe\n");
			print(color('reset'));
			system('./wget','https://yt-dl.org/downloads/latest/youtube-dl.exe');
			print(color('green'));
			print("[+] Successfully downloaded youtube-dl.exe\n");
		}
		if($ffmpeg_not_installed){
			use IO::Uncompress::Unzip 'unzip','$UnzipError';
			print(color('red'));
			print("[-] FFmpeg is not installed.\n");
			print(color('reset'));
			system('./wget',"https://ffmpeg.zeranoe.com/builds/win$arch/static/ffmpeg-latest-win$arch-static.zip");
			print(color('green'));
			print("[+] Extracting file from the archive.\n");
			unzip("ffmpeg-latest-win$arch-static.zip"=>'ffmpeg.exe',Name=>"ffmpeg-latest-win$arch-static/bin/ffmpeg.exe") or die $UnzipError;
			print("[+] Successfully extracted file from the archive.\n");
			print("[+] Removing the archive.\n");
			unlink "ffmpeg-latest-win$arch-static.zip";
		}
		print("[+] Removing wget.exe\n");
		unlink 'wget.exe';
		print("[+] Successfully installed YT2MP3.\n");
		print(color('reset'));
	}
}

my @songs;
while(<>){/v=[\w_-]+/ ?push(@songs,"https://www.youtube.com/watch?$&"):last};
system(($^O=~/^ms/i ?'./':'').'youtube-dl','--geo-bypass','-x','--audio-format','mp3','--audio-quality','0','-o','%(title)s.%(ext)s',@songs);
rename($_,$_=~s/^\s+|(\([^\)]*\))|[^ -~]+|\s+$//gr) foreach(glob('*.mp3'));
