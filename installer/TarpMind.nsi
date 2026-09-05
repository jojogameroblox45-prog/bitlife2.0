Unicode true
RequestExecutionLevel user
SetCompressor /SOLID lzma

!include "MUI2.nsh"

!ifndef APP_DIR
  !error "APP_DIR define is required"
!endif

Name "TarpMind"
OutFile "TarpMind-Setup-1.4.2.exe"
InstallDir "$LOCALAPPDATA\Programs\TarpMind"
InstallDirRegKey HKCU "Software\TarpMind" "InstallDir"

VIProductVersion "1.4.2.0"
VIAddVersionKey "ProductName" "TarpMind"
VIAddVersionKey "CompanyName" "TarpMind"
VIAddVersionKey "FileDescription" "TarpMind Setup"
VIAddVersionKey "FileVersion" "1.4.2"
VIAddVersionKey "ProductVersion" "1.4.2"
VIAddVersionKey "LegalCopyright" "TarpMind"

!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define MUI_FINISHPAGE_RUN "$INSTDIR\TarpMind.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Launch TarpMind"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"

Section "TarpMind" SEC01
  SetOutPath "$INSTDIR"
  File /r "${APP_DIR}\*.*"

  WriteUninstaller "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "Software\TarpMind" "InstallDir" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "DisplayName" "TarpMind"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "DisplayVersion" "1.4.2"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "Publisher" "TarpMind"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "DisplayIcon" "$INSTDIR\TarpMind.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "UninstallString" '"$INSTDIR\Uninstall.exe"'
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "NoModify" 1
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind" "NoRepair" 1

  CreateDirectory "$SMPROGRAMS\TarpMind"
  CreateShortcut "$SMPROGRAMS\TarpMind\TarpMind.lnk" "$INSTDIR\TarpMind.exe" "" "$INSTDIR\TarpMind.exe" 0
  CreateShortcut "$SMPROGRAMS\TarpMind\Uninstall TarpMind.lnk" "$INSTDIR\Uninstall.exe"
  CreateShortcut "$DESKTOP\TarpMind.lnk" "$INSTDIR\TarpMind.exe" "" "$INSTDIR\TarpMind.exe" 0
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\TarpMind.lnk"
  Delete "$SMPROGRAMS\TarpMind\TarpMind.lnk"
  Delete "$SMPROGRAMS\TarpMind\Uninstall TarpMind.lnk"
  RMDir "$SMPROGRAMS\TarpMind"

  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\TarpMind"
  DeleteRegKey HKCU "Software\TarpMind"

  RMDir /r "$INSTDIR"
SectionEnd
