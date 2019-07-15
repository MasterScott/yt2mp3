# YT2MP3

![Made with Perl](https://img.shields.io/badge/made%20with-perl-0.svg?color=cc2020&labelColor=ff3030&style=for-the-badge)
![Made with Batch](https://img.shields.io/badge/made%20with-batch-0.svg?color=cc2020&labelColor=ff3030&style=for-the-badge)

![GitHub](https://img.shields.io/github/license/DeBos99/yt2mp3.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)
![GitHub followers](https://img.shields.io/github/followers/DeBos99.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/DeBos99/yt2mp3.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)
![GitHub stars](https://img.shields.io/github/stars/DeBos99/yt2mp3.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)
![GitHub watchers](https://img.shields.io/github/watchers/DeBos99/yt2mp3.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)
![GitHub contributors](https://img.shields.io/github/contributors/DeBos99/yt2mp3.svg?color=2020cc&labelColor=5050ff&style=for-the-badge)

![GitHub commit activity](https://img.shields.io/github/commit-activity/w/DeBos99/yt2mp3.svg?color=ffaa00&labelColor=ffaa30&style=for-the-badge)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/DeBos99/yt2mp3.svg?color=ffaa00&labelColor=ffaa30&style=for-the-badge)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/DeBos99/yt2mp3.svg?color=ffaa00&labelColor=ffaa30&style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/DeBos99/yt2mp3.svg?color=ffaa00&labelColor=ffaa30&style=for-the-badge)

![GitHub issues](https://img.shields.io/github/issues-raw/DeBos99/yt2mp3.svg?color=cc2020&labelColor=ff3030&style=for-the-badge)
![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/DeBos99/yt2mp3.svg?color=10aa10&labelColor=30ff30&style=for-the-badge)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NH8JV53DSVDMY)

**YT2MP3** is simple perl script for downloading music from [YouTube](https://www.youtube.com/)

## Content

- [Content](#content)
- [Installation](#installation)
  - [Windows](#windows)
  - [Unix](#unix)
    - [Debian/Ubuntu](#apt)
    - [Arch Linux/Manjaro](#pacman)
    - [CentOS](#yum)
    - [MacOS](#homebrew)
- [Usage](#usage)
- [Authors](#authors)
- [Contact](#contact)
- [License](#license)

## Installation

### Windows

* Install [Git](https://git-scm.com/download/win).
* Install [Perl](http://strawberryperl.com/).
* Install [Microsoft Visual C++ 2010 Redistributable Package (x86)](https://www.microsoft.com/en-US/download/confirmation.aspx?id=5555)
* Run following commands in the command prompt:
```
git clone "https://github.com/DeBos99/yt2mp3.git"
cd yt2mp3
perl install.pl
cd ..
```

### Unix

#### <a name="APT">Debian/Ubuntu based

* Run following commands in the terminal:
```
sudo apt install git perl youtube-dl ffmpeg -y
git clone "https://github.com/DeBos99/yt2mp3.git"
```

#### <a name="Pacman">Arch Linux/Manjaro

* Run following commands in the terminal:
```
sudo pacman -S git perl youtube-dl ffmpeg --noconfirm
git clone "https://github.com/DeBos99/yt2mp3.git"
```

#### <a name="YUM">CentOS

* Run following commands in the terminal:
```
sudo yum install git perl youtube-dl ffmpeg -y
git clone "https://github.com/DeBos99/yt2mp3.git"
```

#### <a name="Homebrew">MacOS

* Run following commands in the terminal:
```
brew install git perl youtube-dl ffmpeg
git clone "https://github.com/DeBos99/yt2mp3.git"
```

## Usage

`perl main.pl`
Or
`perl main.pl FILE`
Or (Windows only)
Drag and drop file with links to [main.bat](main.bat) file.

## Authors

* **Michał Wróblewski** - Main Developer - [DeBos99](https://github.com/DeBos99)

## Contact

Discord: DeBos#3292

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
