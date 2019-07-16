use strict;
use warnings;

my @songs;
while(<>){push(@songs,"https://www.youtube.com/watch?$&") if(/v=[\w_-]+/)};
system(($^O=~/^ms/i ?'./':'').'youtube-dl','--geo-bypass','-x','--audio-format','mp3','--audio-quality','0','-o','%(title)s.%(ext)s',@songs);
rename($_,$_=~s/^\s+|(\([^\)]*\))|[^ -~]+|\s+$//gr) foreach(glob('*.mp3'));
