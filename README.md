# Wimlib-Imagex-Package

## We use cross-platform Library wimlib to built it in macos.
#### Important do not mix this program with that of Homebrew! Use Wimlib-Imagex-Package alone.
The files in this repository are from the [Official wimlib site Release-v-1.13.6](https://wimlib.net/index.html)

- Wimlib-Imagex for macOS, working from macOS Catalina 10.15 to macOS Ventura 13
- Working for Hackintosh and real Mac
- This program will built then install wimlib in `/usr/local/`

#### Prerequisite: Command Line Tools (CLT) for Xcode (from `xcode-select --install` or [Developer Apple Command Line Tools](https://developer.apple.com/download/all/)

- If you have Xcode installed that's also good
- A 64-bit Intel CPU

### This program will allow you to create a Windows 10, 11 Bootable USB key in macOS
### Prerequisite for installing Windows
- USB key of 8 Gig and more
- Windows ISO image X64 download from ➤ [Microsoft](https://www.microsoft.com/en-us/software-download/windows11)
- Using ➤ [ `Create-Windows-USB.tool` ] inside the program

<img width="128" alt="logo" src="https://user-images.githubusercontent.com/6248794/211173953-4df687de-26e9-40b8-9053-62be4f1a03f8.png">

See ➤ [What is wimlib](https://github.com/chris1111/Wimlib-Imagex-Package/blob/main/README)
Usage ➤ [Usage wimlib](https://github.com/chris1111/Wimlib-Imagex-Package/blob/main/Usage.pdf)

- [x] `Usage`

#### Installation
```bash
mkdir -p WimlibDev
cd WimlibDev
git clone https://github.com/chris1111/Wimlib-Imagex-Package
./Wimlib-Imagex-Package/Build-Package.tool
```
See Video Demonstartion ➤ [![Modular Image Creation](https://user-images.githubusercontent.com/6248794/211171949-884b17a1-8edc-435d-a2b0-272334068365.png)](https://github.com/chris1111/Wimlib-Imagex-Package/blob/main/Video%20Page.md)
  
### Credit: 
- Special thanks to ➤ [Wimlib](https://wimlib.net/) for Wimlib
- Special thanks to ➤ [Homebrew](https://github.com/homebrew) for the build Library
- Apple for the Command Line Tools (CLT)

### SIP Security and Gatekeeper must be disable
- WINUSB is bootable only in UEFI ( 🚫  Not working in Legacy booting )

#### Uninstallation of wimlib use ➤ [ `Uninstall-Package.tool` ]
