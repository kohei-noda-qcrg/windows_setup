######################################
# Copy X-server settings
######################################

Copy-Item '.\config.xlaunch' "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


#####################################
# Install Openssh client
#####################################

# If you install Openssh client on Windows, You can use ssh, ssh-keygen, etc... commands!
# see also: https://docs.microsoft.com/ja-jp/windows-server/administration/openssh/openssh_install_firstuse
# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

##############################
# winget setup
##############################
# If you don't have winget, Manually install winget on $Env:USERPROFILE\Downloads Folder.
# See also : https://zenn.dev/nobokko/articles/idea_winget_wsb#windows%E3%82%B5%E3%83%B3%E3%83%89%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9%E3%81%ABwinget%E3%82%92%E5%B0%8E%E5%85%A5%E3%81%97%E3%82%88%E3%81%86%EF%BC%81%E3%81%A8%E3%81%84%E3%81%86%E8%A9%B1
$winget = "winget"
if ( -not ( Get-Command $winget -ErrorAction "silentlycontinue" ) ) {
    Write-Host "winget command does not exist.`n Try to install winget manually using invoke-webrequest and Add-AppxPackage!"
    invoke-webrequest -uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -outfile $Env:USERPROFILE\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx -UseBasicParsing
    invoke-webrequest -uri https://github.com/microsoft/winget-cli/releases/download/v1.0.12576/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -outfile $Env:USERPROFILE\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -UseBasicParsing
    Add-AppxPackage -Path $Env:USERPROFILE\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage -Path $Env:USERPROFILE\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}

##############################
# Install softwares (windows)
##############################

# WindowsTerminal (https://www.microsoft.com/ja-jp/p/windows-terminal/9n0dx20hk701)
# is a powerful terminal software. I recommend you to use this software when you use WSL2 ubuntu.
winget install --silent Microsoft.WindowsTerminal --accept-package-agreements --accept-source-agreements

# Vscode (https://code.visualstudio.com/)
# is a very powerful editor. I strongly suggest you to use this editor when you edit any text files.
# (Install option reference is here : https://proudust.github.io/20200726-winget-install-vscode/)
winget install --silent Microsoft.VisualStudioCode --override "/VERYSILENT /NORESTART /mergetasks=""!runcode,desktopicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath"""

# You can extract tar.gz etc. files by using 7zip (https://sevenzip.osdn.jp/).
winget install --silent 7zip.7zip

# Winscp (https://winscp.net/eng/docs/lang:jp)
# provides you to download/upload files with calculation servers by using scp (or sftp) protocol.
winget install --silent --scope user WinSCP.WinSCP

# Git (https://gitforwindows.org/) supports git command on windows.
winget install --silent Git.Git

# Teraterm (https://ttssh2.osdn.jp/) is a terminal software.
# If you don't like other terminal softwares, you can use this software.
winget install --silent TeraTermProject.teraterm --override "/VERYSILENT"

# VcXsrv (https://sourceforge.net/projects/vcxsrv/) is a X-server software.
# If you want to use GUI software when you use CLI WSL linux, VcXsrv supports this(GUI) feature.
winget install --silent marha.VcXsrv
