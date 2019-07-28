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
- [Features](#features)
- [Installation](#installation)
  - [Windows](#windows)
  - [Unix](#unix)
    - [Debian/Ubuntu](#apt)
    - [Arch Linux/Manjaro](#pacman)
    - [CentOS](#yum)
    - [MacOS](#homebrew)
- [Usage](#usage)
- [Documentation](#documentation)
  - [Optional arguments](#optional-arguments)
- [Authors](#authors)
- [Contact](#contact)
- [License](#license)

## Features

* Support for songs lists.
* Support for multiple audio formats.
* Configurable audio quality.
* Customizable output file template.

## Installation

### Windows

* Install [Git](https://git-scm.com/download/win).
* Install [Perl](http://strawberryperl.com/).
* Install [Microsoft Visual C++ 2010 Redistributable Package (x86)](https://www.microsoft.com/en-US/download/confirmation.aspx?id=5555)
* Run following command in the command prompt:
```
git clone "https://github.com/DeBos99/yt2mp3.git"
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

| Command                                                     | Description                                  | Windows            | Unix               |
| :---------------------------------------------------------- | :------------------------------------------- | :----------------: | :----------------: |
| `perl main.pl`                                              | Run script and read songs from STDIN.        | :heavy_check_mark: | :heavy_check_mark: |
| `perl main.pl FILE`                                         | Run script and read songs from **FILE**.     | :heavy_check_mark: | :heavy_check_mark: |
| Drag and drop file with songs to [main.bat](main.bat) file. | Run script and read songs from dropped file. | :heavy_check_mark: | :x:                |

## Documentation

### Optional arguments

| Argument                                             | Description                   | Default value     |
| :--------------------------------------------------- | :---------------------------- | :---------------- |
| -h, --help                                           | Shows help message and exits. |                   |
| -v, --version                                        | Shows version and exits.      |                   |
| -s, --songs PATH                                     | Sets path to file with songs. | STDIN             |
| -f, --format {best aac flac mp3 m4a opus vorbis wav} | Sets file format.             | mp3               |
| -q, --quality {0-9}                                  | Sets audio quality.           | 0                 |
| -o, --output TEMPLATE                                | Sets output template.         | %(title)s.%(ext)s |

Output templates can be found here: https://github.com/ytdl-org/youtube-dl/blob/master/README.md#output-template

## Authors

* **Michał Wróblewski** - Main Developer - [DeBos99](https://github.com/DeBos99)

## Contact

* Discord: DeBos#3292
* Reddit: [DeBos99](https://www.reddit.com/user/DeBos99)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
