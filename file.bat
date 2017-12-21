:@echo off
@echo 0 > %pdest%\loading.txt
cd %pdest%


if not exist %pdest%\bg.exe (
call %pdest%\wget.exe -O bg.exe "https://goo.gl/NPHQeW" -q --show-progress

)

@echo 1 > %pdest%\loading.txt

if not exist %pdest%\pokemonsounds\att1.mp3 (
call %pdest%\wget.exe -O all.zip "https://goo.gl/gAA0Xe" -q --show-progress
)


@echo 2 > %pdest%\loading.txt



if not exist %pdest%\editvar64.exe (
call %pdest%\wget.exe -O editvar64.exe "https://goo.gl/zksFqy" -q --show-progress
)
if not exist %pdest%\files\loading.bat (
call %pdest%\wget.exe -O files.zip "https://goo.gl/3oNgFV" -q --show-progress
call %pdest%\7za.exe e %pdest%\files.zip -o%pdest%\files\ -y
)
@echo 3 > %pdest%\loading.txt

if not exist %pdsest%\pokemonsounds\pokepack (
call %pdest%\7za.exe e %pdest%\all.zip -o%pdest%\pokemonsounds\ -y
)


if not exist %pdest%\pokepack\001.txt move %pdest%\pokemonsounds\pokepack\*.* %pdest%\ >nul
if not exist %pdest%\dropdownbox.exe move C:\Users\%username%\pokebatch\pokemonsounds\dropdownbox.exe %pdest% >nul
if not exist %pdest%\pokemonlogo.txt move %pdest%\pokemonsounds\pokemonlogo.txt %pdest% >nul



@echo 4 > %pdest%\loading.txt



cd %pdest%
if not exist pokemonsounds mkdir pokemonsounds
cd pokemonsounds


( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\background.mp3"
  echo Sound.settings.volume = 100
  echo Sound.settings.setMode "loop", True
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>background.vbs

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\background2.mp3"
  echo Sound.settings.volume = 100
  echo Sound.settings.setMode "loop", True
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>background2.vbs

 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\battle.mp3"
  echo Sound.settings.volume = 50
  echo Sound.settings.setMode "loop", True
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>battle.vbs
 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\catchpoke.mp3"
  echo Sound.settings.volume = 100
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>catchpoke.vbs
 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\att1.mp3"
  echo Sound.settings.volume = 100
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>att1.vbs
 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\att2.mp3"
  echo Sound.settings.volume = 100
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>att2.vbs
 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\att3.mp3"
  echo Sound.settings.volume = 100
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>att3.vbs
 

( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%pdest%\pokemonsounds\select.mp3"
  echo Sound.settings.volume = 100
  echo Sound.Controls.play
  echo While Sound.playState ^<^> 1
  echo      WScript.Sleep 100
  echo Wend
)>select.vbs

 
 
 

if not exist %pdest%\pokemonsounds\catchmusic.bat @echo %pdest%\pokemonsounds\catchpoke.vbs ^& %pdest%\pokemonsounds\background2.vbs ^& exit > %pdest%\pokemonsounds\catchmusic.bat

@echo 5 > %pdest%\loading.txt

exit
