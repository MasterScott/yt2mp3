use warnings;
use IO::Uncompress::Unzip 'unzip','$UnzipError';
my $arch=$ENV{'PROCESSOR_ARCHITECTURE'}eq'x86'?32:64;
system('certutil','-urlcache','-split','-f',"https://eternallybored.org/misc/wget/1.20.3/$arch/wget.exe");
system('./wget','https://yt-dl.org/downloads/latest/youtube-dl.exe',"https://ffmpeg.zeranoe.com/builds/win$arch/static/ffmpeg-latest-win$arch-static.zip");
unlink 'wget.exe';
unzip("ffmpeg-latest-win$arch-static.zip"=>'ffmpeg.exe',Name=>"ffmpeg-latest-win$arch-static/bin/ffmpeg.exe") or die $UnzipError;
unlink "ffmpeg-latest-win$arch-static.zip";
