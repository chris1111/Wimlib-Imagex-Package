## Topic Page is being updated! Please wait for the conclusion.

# Wimlib-Imagex-Package
## We use cross-platform Library wimlib to built it in macos.
### Important do not mix this program with that of Homebrew! Use Wimlib-Imagex-Package alone.

- Wimlib-Imagex for macOS, working from macOS Sierra 10.12 to macOS Ventura 13 
- NOTE: Probably works in macs lower than 10.12 but not tested yet
- Working for real Mac and Hackintosh

#### Prerequisite: Command Line Tools (CLT) for Xcode (from `xcode-select --install` or https://developer.apple.com/download/all/)
- If you have Xcode installed that's also good
- A 64-bit Intel CPU


<img width="128" alt="Instruments" src="https://user-images.githubusercontent.com/6248794/210024502-622f67b8-4318-40c2-9748-43ab72e6eea7.png">

See ➤ [What is wimlib](https://github.com/chris1111/Wimlib-Imagex-Package/blob/main/README)

- [x] `Usage`

#### Installation
```bash
mkdir -p WimlibDev
cd WimlibDev
git clone https://github.com/chris1111/Wimlib-Imagex-Package
./Wimlib-Imagex-Package/Build-Package.tool
```

### wimlib-imagex for macOS its a cross-platform Library wimlib to built it in macos
- This program will built then install wimlib-imagex in /usr/local/bin
- This program will allow you to create a Windows 11 Bootable USB key in macOS
- For installing Windows You need a USB key of 8 Gig and more and the Windows ISO image X64 download from ➤ [Microsoft](https://www.microsoft.com/en-us/software-download/windows11)

[See Video Built in macOS Ventura 13](https://github.com/chris1111/Wimlib-Imagex-Package/blob/main/Video%20Page.md)

### Credit: 
- Special thanks to ➤ [Wimlib](https://wimlib.net/) for Wimlib
- Special thanks to ➤ [Homebrew](https://github.com/homebrew) for the build Library
- Apple for the Command Line Tools (CLT)

### SIP Security and Gatekeeper must be disable
- WINUSB is bootable only in UEFI ( 🚫  Not working in Legacy booting )

