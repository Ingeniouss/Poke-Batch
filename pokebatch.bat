@echo off
::wget https://drive.google.com/uc?export=download&id=1_Ir7pUDKivuRbL7MP8Aj2baUslc7CVal https://goo.gl/KTKBa2
::7za https://drive.google.com/uc?export=download&id=1L5gDsxr6UeFGi5PxZ_qc5P95l1XOsG3q https://goo.gl/NpyCXt
::boxes https://drive.google.com/uc?export=download&id=19OD4DdpR38odGIubm64UZfeMwgGeJlhL https://goo.gl/oACCcP
::logo https://docs.google.com/document/d/1WiE7Mp5qepUqGsLqusAmQwNn4PiYgAeoz63KY8_T9OY/export?format=txt https://goo.gl/T2R78a
::pid https://drive.google.com/uc?export=download&id=1KHnyifaTpQ8PGgj1qysGTjFZSrCY3ytB https://goo.gl/rGWFAe
::editvar https://drive.google.com/uc?export=download&id=1j_US24NT73oMZEdx7A6i5hEpaEY4CdZe https://goo.gl/zksFqy
::bar https://drive.google.com/uc?export=download&id=1k8XiFNNqNmjGKye2Ll6mJnvMTV8Kn-Kr https://goo.gl/FFSkbG
::file https://drive.google.com/uc?export=download&id=1qzFu41CgQjSzzysg7w-_dcF6z4GSBpsr https://goo.gl/3oNgFV
::file.bat https://drive.google.com/uc?export=download&id=1ol1CZBaK_NjVGW1aou_9encaUMkRcT6J https://goo.gl/xRaB5D
::t.txt https://raw.githubusercontent.com/Ingeniouss/Poke-Batch/master/t.zip https://goo.gl/dCFFJu

msg * no sounds because they're all messed up.

:start
cls
set playmusic=1
::begin
Title PokeBatch
setx pdest "%userprofile%\pokebatch" >nul

if not exist %userprofile%\pokebatch mkdir %userprofile%\pokebatch
if not exist %pdest%\pokemonsounds mkdir %pdest%\pokemonsounds

cd %userprofile%\pokebatch
::for /f "tokens=2 USEBACKQ" %%f IN (`tasklist /NH /FI "WINDOWTITLE eq PokeBatch*"`) Do (
::@echo %%f > %pdest%\pid.txt
::set pid=%%f
::)

cd %pdest%\
::if not exist %pdest%\pid.bat (
::@echo @echo off > %pdest%\pid.bat > %pdest%\pid.bat
::@echo set /p pid=^<%pdest%\pid.txt >> %pdest%\pid.bat 
::@echo Title Pokebatch >> %pdest%\pid.bat
::@echo ^rem checks if the application closes, and stops the music accordingly. >> %pdest%\pid.bat
::@echo :top >> %pdest%\pid.bat
::@echo tasklist ^| find /i "%pid%" ^&^& echo . ^|^| taskkill /im wscript.exe /F ^&^& exit >> %pdest%\pid.bat
::@echo goto top >> %pdest%\pid.bat
::)
::start /min %pdest%\pid.bat
mode con:cols=120 lines=30

Echo wget.exe...
if not exist %pdest%\wget.exe (
@echo $client = new-object System.Net.WebClient > get.ps1
@echo $client.DownloadFile^("https://goo.gl/KTKBa2","%pdest%\wget.exe"^) >> get.ps1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%pdest%\get.ps1'"
)
Echo 7za.exe...
if not exist %pdest%\7za.exe (
call %pdest%\wget.exe -O 7za.exe "https://goo.gl/NpyCXt" -q
)
echo File.bat
if not exist %pdest%\file.bat (
call %pdest%\wget.exe -O file.bat "https://goo.gl/xRaB5D" -q
)
if not exist %pdest%\t.txt (
call %pdest%\wget.exe -O t.zip "https://goo.gl/dCFFJu" -q
call %pdest%\7za.exe e %pdest%\t.zip -o%pdest%\t.txt -y >nul

)
echo boxes.exe...
if not exist %pdest%\boxes-1.2\boxes.exe (
call %pdest%\wget.exe -O %pdest%\boxes.zip "https://goo.gl/oACCcP" -q
call %pdest%\7za.exe e %pdest%\boxes.zip -o%pdest%\boxes-1.2\ -y >nul
)



set loading = 0

start /min %pdest%\file.bat
cls
@echo WScript.Sleep(100) > %pdest%\delay.vbs
%pdest%\delay.vbs
:loop
set /p loading=<%pdest%\loading.txt

cls
(
echo Loading...
echo DO NOT CLOSE
echo You may see a few dialog boxes, ignore them.
Echo Collected %loading%/ 5 neccesary files.
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
if %loading%==5 ping localhost -n 4 >nul&goto :startingthegame
ping localhost -n 2 >nul
goto loop



:startingthegame
cls

type %pdest%\t.txt|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a hcvc
ping localhost -n 4 >nul

:actualstart
::start /min %userprofile%\pokebatch\pid.bat 
start /min %pdest%\pokemonsounds\background.vbs

color 1F
:name
cls

(
echo Please enter your name :
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
::set /p "playername="
%pdest%\editvar64.exe -l 20 "playername"

::implement system to check for null


::test length
cls
(
echo So your name is "%playername%"?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
start /min %pdest%\pokemonsounds\select.vbs
%pdest%\delay.vbs
choice /c yn /n >nul
cls
if %errorlevel%==1 (
goto intro
)
if %errorlevel%==2 (
echo Oh, my mistake.|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
set "playername="
ping localhost -n 2 >nul
goto name
)

:intro

(
echo Hello "%playername%"  Welcome to the land of pokemon. 
echo Press any key to continue.
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
pause>nul
cls
start /min %pdest%\pokemonsounds\select.vbs

(
echo Remember to have fun!
echo Press any key to continue.
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
pause>nul
start /min %pdest%\pokemonsounds\select.vbs
cls
(
echo Okay, "%playername%", now is the part you may or may not have waited for.
echo That's right, it's the part of the game where you choose your starter. 
echo Are you ready for your adventure?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c yn /n >nul
cls
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
goto choosestarter
)

if %errorlevel%==2 (
goto screwoff
)

:screwoff
Echo Well, Thats too bad.|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
ping localhost -n 2 >nul
:choosestarter
cls
color 1F
(
echo Okay well I hope you've played pokemon and know who these guys are.
echo Go ahead, "%playername%", choose 
echo 1. Charmander
echo 2.  Squirtle
echo 3. Bulbasaur
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c 1234 /n >nul
start /min %pdest%\pokemonsounds\select.vbs

if %errorlevel%==1 (
cls
goto choosecharmander
)
if %errorlevel%==2 (
cls
goto choosesquirtle
)
if %errorlevel%==3 (
cls
goto choosebulba
)

:pikachu
cls
color 6f
::echo              \---------------------------------------------------\
::echo               \                   Pikachu (Lvl 7)                 \
::echo                \---------------------------------------------------\
echo Pikachu (Lvl 7)|%pdest%\boxes-1.2\boxes.exe -d whirly -s 119x1 -a c
::type %pdest%\pokemonsounds\025.txt

set startertxt=%pdest%\pokemonsounds\025.txt
(
echo Easter Egg Unlocked!           
echo Choose the LIGHTNING pokemon, Pikachu?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x24 -a c
choice /c yn /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
set starter=PIKACHU
set startertype=lightning
set starterlevel=7
set startermaxexp=100
set starterexp=0
set startermaxhp=50
set starterhp=50
set starterattack=17
set starterspattack=17
set starterdefence=15

set attack[0]=Quick Attack 
set attack[1]=LIGHTNING
set attack[2]=Growl



goto namestarter
)
if %errorlevel%==2 (
goto choosestarter
)
:choosecharmander
color 4F

::echo              \---------------------------------------------------\
::echo               \                 Charmandar (Lvl 7)                \
::echo                \---------------------------------------------------\
echo Charmandar (Lvl 7)|%pdest%\boxes-1.2\boxes.exe -d whirly -s 119x1 -a c
::type %pdest%\pokemonsounds\004.txt
set startertxt=%pdest%\pokemonsounds\004.txt
(  
echo Choose the fire pokemon, Charmander?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x24 -a c
choice /c yn /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
set starter=Charmander
set startertype=fire
set starterlevel=7
set startermaxexp=100
set starterexp=0
set startermaxhp=32
set starterhp=32
set starterattack=17
set starterspattack=17
set starterdefence=15

set attack[0]=Scratch
set attack[1]=Growl
set attack[2]=Ember


goto namestarter
)
if %errorlevel%==2 (
goto choosestarter
)
pause
:choosesquirtle
color 3F

::echo               \---------------------------------------------------\
::echo                \                  Squirtle (Lvl 7)                 \
::echo                 \---------------------------------------------------\
echo Squirtle (Lvl 7)|%pdest%\boxes-1.2\boxes.exe -d whirly -s 119x1 -a c
::type %pdest%\pokemonsounds\007.txt
set startertxt=%pdest%\pokemonsounds\007.txt
(
echo Choose the water pokemon, Squirtle?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x24 -a c
choice /c yn /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
set starter=Squirtle
set startertype=water
set starterlevel=7
set startermaxexp=100
set starterexp=0
set startermaxhp=36
set starterhp=36
set starterattack=15
set starterspattack=14
set starterdefence=17

set attack[0]=Tackle
set attack[1]=Tail Whip
set attack[2]=Water Gun


goto namestarter
)
if %errorlevel%==2 (
goto choosestarter
)
pause
:choosebulba
color 2F

::echo               \---------------------------------------------------\
::echo                \                  Bulbasaur (Lvl 7)                \
::echo                 \---------------------------------------------------\
Echo Bulbasaur (Lvl 7)|%pdest%\boxes-1.2\boxes.exe -d whirly -s 119x1 -a c
::type %pdest%\pokemonsounds\001.txt   
set startertxt=%pdest%\pokemonsounds\001.txt
(
echo Choose the grass pokemon, Bulbasaur?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x24 -a c
choice /c yn /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
set starter=Bulbasaur
set startertype=grass
set starterlevel=7
set startermaxexp=100
set starterexp=0
set startermaxhp=34
set starterhp=34
set starterattack=16
set starterspattack=18
set starterdefence=16

set attack[0]=Tackle
set attack[1]=Growl
set attack[2]=Vine Whip


goto namestarter
)
if %errorlevel%==2 (
goto choosestarter
)
pause
:namestarter
color 1F
tskill wscript

::start /min %pdest%\pokemonsounds\catchmusic.bat
cls
(
echo New Pokemon Gained 
echo Would you like to name your new %starter%?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c yn /n >nul
start /min %pdest%\pokemonsounds\select.vbs

if %errorlevel%==1 (
cls
goto namestarter2
)
if %errorlevel%==2 (
cls
set startername=%starter%
echo Boring, but okay.
goto town
)
pause
:namestarter2
:nammee
cls
(
echo New Pokemon Gained 
echo What would you like to name %starter%?
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
::set /p startername=
%pdest%\editvar64.exe -l 20 "startername"
cls
(
echo You want it to be named "%startername%"?
echo _._._._.y/n._._._._
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c yn /n >nul

start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==2 (
cls
goto namestarter2
)
:town
cls               

(
echo "%playername%" steps outside and looks at their home, Pallet Town, one more
echo time before setting on an adventure. What will "%playername%" do?
echo 1.Visit home       2.Start on route 1
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c 12 /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
goto home
)
if %errorlevel%==2 (
cls
goto route1
)
pause
:home
cls
(
echo "%playername%" goes to see their mother one last time, only to
echo realize that their mother is still dead. After 5 years, you
echo would think that a kid would remember being an orphan...
echo Press any key to continue.
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
pause >nul
cls
goto town
pause
:route1
cls
(
echo %playername% continues their journey with %startername% by their side.
echo %playername% notices some rustling tall grass. What will %playername% do?
echo 1.Investigate the tall grass	2.Go to Pallet Forest
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
choice /c 12 /n >nul
start /min %pdest%\pokemonsounds\select.vbs
if %errorlevel%==1 (
cls
goto route1ratata
)
cls

:route1ratata
cls
set /a battlepoke=%random%%%3
if %battlepoke%==0 (
type %pdest%\pokemonsounds\019.txt

set enemytxt=%pdest%\pokemonsounds\019.txt
set enemyname=Ratatta
set enemymaxhp=25
set enemyhp=25
set enemyattack=12
set enemydefence=10
set enemyattack1=Bite
set enemyattack2=Thunder
set enemyattack3=Hyper Fang
set enemyattack4=empty
)
if %battlepoke%==1 (
type %pdest%\pokemonsounds\016.txt
set enemytxt=%pdest%\pokemonsounds\016.txt
set enemyname=Pidgey

set enemymaxhp=25
set enemyhp=25
set enemyattack=12
set enemydefence=10
set enemyattack1=Tackle
set enemyattack2=Quick Attack
set enemyattack3=Aerial Ace
set enemyattack4=Air Cutter
)
if %battlepoke%==2 (
type %pdest%\pokemonsounds\013.txt
set enemytxt=%pdest%\pokemonsounds\013.txt
set enemyname=Weedle
set enemymaxhp=50
set enemyhp=50
set enemyattack=12
set enemydefence=10
set enemyattack1=Tackle
set enemyattack2=Quick Attack
set enemyattack3=Aerial Ace
set enemyattack4=Air Cutter
)
cls
(						  
echo Oh My! A %enemyname% Appeared 
set redo=0


:startbattle
echo Go get em %startername% 

)|%pdest%\boxes-1.2\boxes.exe -d stone -s 119x29 -a c
ping localhost -n 3 >nul
cls



set eminus=0
set sminus=0
tskill wscript
start /min %pdest%\pokemonsounds\battle.vbs
color 07
mode con:cols=109 lines=30
:battle
if %starterhp% LEQ 0 goto lose
if %enemyhp% LEQ 0 goto :win

set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%
cls
::enemy
set ehpcolor=aa
if %epercent% LEQ 60 set ehpcolor=ee
if %epercent% LEQ 35 set ehpcolor=cc
::starter

set shpcolor=aa
if %spercent% LEQ 60 set shpcolor=ee
if %spercent% LEQ 35 set shpcolor=cc
set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%

cls
echo %enemyname%: %enemyhp%/%enemymaxhp%                                        %Startername%: %starterhp%/%startermaxhp% {-%damage%} |%pdest%\boxes-1.2\boxes.exe -d stone -s 108x3 -a c

::echo ^|-----------------------------------------------------^|--------------------------------------------------------------- 

cd %pdest%\files\


	(
	Call loading 1 3 50 %ehpcolor% 4 1 NoFill %epercent%
	%pdest%\files\batbox /w 100
	)
	
	(
	Call loading 55 3 50 %shpcolor% 4 1 NoFill %spercent%
	%pdest%\files\batbox /w 100
	)

for /l %%A in (1, 1, 4) do echo(



set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%
::colors for health bar
::enemy
if %epercent% LEQ 60 set ehpcolor=ee
if %epercent% LEQ 35 set ehpcolor=cc
::starter

set shpcolor=aa
if %spercent% LEQ 60 set shpcolor=ee
if %spercent% LEQ 35 set shpcolor=cc
::colors for health bar
for /l %%a in (1, 1, 2) do echo(
Echo Waiting for player input...|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x3 -a c
:chooseattack
%userprofile%\pokebatch\DROPDOWNBOX "1: %attack[0]%;2: %attack[1]%;3: %attack[2]%" "Select An Attack" "Attack" /RI /C:157 >nul

if %errorlevel%==0 goto chooseattack
set starterattack=%errorlevel%



set /a atsound=%random%%%3
if %atsound%==0 (
start /min %pdest%\pokemonsounds\att1.vbs
)
if %atsound%==1 (
start /min %pdest%\pokemonsounds\att2.vbs
)
if %atsound%==2 (
start /min %pdest%\pokemonsounds\att3.vbs
)
set /a effective=%random%%%75
if %effective% LEQ 75 set emultiplier=1&set string=It's not very effective{1x damage}...
if %effective% LEQ 37 set emultiplier=2&set string=It's very effective{2x damage}!
if %effective% LEQ 10 set emultiplier=3&set string=It's extremely effective{3x damage}!..


if %starterattack%==1 (
set /a damage=2*%emultiplier%
set /a enemyhp-=2*%emultiplier%
)
if %starterattack%==2 (
set /a damage=6*%emultiplier%
set /a enemyhp-=6*%emultiplier%
)
if %starterattack%==3 (
set /a damage=4*%emultiplier%
set /a enemyhp-=4*%emultiplier%
)
if %starterattack%==4 (
set /a damage=4*%emultiplier%
set /a enemyhp-=4*%emultiplier%
)
if %starterhp% LEQ 0 goto lose
if %enemyhp% LEQ 0 goto :win
if %starterattack%==1 (echo %startername% used %attack[0]%!
echo %string% )|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x20 -a c
if %starterattack%==2 (echo %startername% used %attack[1]%!
echo %string% )|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x20 -a c
if %starterattack%==3 (echo %startername% used %attack[2]%!
echo %string% )|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x20 -a c

ping localhost -n 4 >nul

set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%
::enemy
set ehpcolor=aa
if %epercent% LEQ 60 set ehpcolor=ee
if %epercent% LEQ 35 set ehpcolor=cc
::starter

set shpcolor=aa
if %spercent% LEQ 60 set shpcolor=ee
if %spercent% LEQ 35 set shpcolor=cc
:battle2

cls

set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%


echo %enemyname%: %enemyhp%/%enemymaxhp% {-%damage%}                                       %Startername%: %starterhp%/%startermaxhp%|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x3 -a c


cd %pdest%\files\


	(
	Call loading 1 3 50 %ehpcolor% 4 1 NoFill %epercent%
	%pdest%\files\batbox /w 100
	)
	
	(
	Call loading 55 3 50 %shpcolor% 4 1 NoFill %spercent%
	%pdest%\files\batbox /w 100
	)

cd %pdest%





if %enemyhp% LEQ 0 (
goto win
)

for /l %%A in (1, 1, 6) do echo(
Echo Waiting for enemy move...|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x3 -a c
ping localhost -n 4 >NUL

set /a effective=%random%%%75
if %effective% LEQ 75 set emultiplier=1&set string=It's not very effective{1x damage}...
if %effective% LEQ 37 set emultiplier=2&set string=It's very effective{2x damage}!
if %effective% LEQ 10 set emultiplier=3&set string=It's extremely effective{3x damage}!..

set /a enemyattacknum=%random%%%4
if %enemyattacknum%==0 (
set /a damage=2*%emultiplier%
set enemyattack=Scratch
set /a starterhp-=2*%emultiplier%
)
if %enemyattacknum%==1 (
set /a damage=4*%emultiplier%
set enemyattack=%enemyattack1%
set /a starterhp-=4*%emultiplier%
)
if %enemyattacknum%==2 (
set /a damage=4*%emultiplier%
set enemyattack=%enemyattack2%
set /a starterhp-=4*%emultiplier%
)
if %enemyattacknum%==3 (
set /a damage=3*%emultiplier%
set enemyattack=%enemyattack3%
set /a starterhp-=3*%emultiplier%
)
if %starterhp% LEQ 0 goto lose
if %enemyhp% LEQ 0 goto :win
(
echo %enemyname% used '%enemyattack%'!
echo %string%
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x20 -a c
ping localhost -n 4 >nul

set /a epercent=%enemyhp%*100/%enemymaxhp%
set /a spercent=%starterhp%*100/%startermaxhp%
::enemy
set ehpcolor=aa
if %epercent% LEQ 60 set ehpcolor=ee
if %epercent% LEQ 35 set ehpcolor=cc
::starter

set shpcolor=aa
if %spercent% LEQ 60 set shpcolor=ee
if %spercent% LEQ 35 set shpcolor=cc

goto battle











:win
cls

(
echo %enemyname%
echo HP:%enemyhp%
echo(
echo %startername%
echo HP:%starterhp%
echo(
Echo %startername% defeated %enemyname% 
Echo You Win!
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x29 -a c
pause>nul
exit

:lose
cls
(
echo %enemyname%
echo HP:%enemyhp%
echo(
echo %startername%
echo HP:%starterhp%
echo(
Echo %enemyname% defeated %startername%
Echo You Lose!
)|%pdest%\boxes-1.2\boxes.exe -d stone -s 108x29 -a c
pause>nul
exit









