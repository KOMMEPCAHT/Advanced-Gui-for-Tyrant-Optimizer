#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance off
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

BGEffects := "none|Bloodlust X|Counterflux|Evolve X Leech Refresh|Enfeeble all X|Heal all X|Protect all X|Rally all X|Siege all X|Strike all X|Weaken all X|Enhance all Armor X|Enhance all Berserk X|Enhance all Corrosive X|Enhance all Counter X|Enhance all Enfeeble X|Enhance all Evade X|Enhance all Heal X|Enhance all Inhibit X|Enhance all Leech X|Enhance all Legion X|Enhance all Pierce X|Enhance all Poison X|Enhance all Protect X|Enhance all Rally X|Enhance all Siege X|Enhance all Strike X|Enhance all Weaken X|Metamorphosis|Reaping X"
Quest := "none|Activate X times of Berserk|Activate X times of Enfeeble|Activate X times of Flurry|Activate X times of Heal|Activate X times of Jam|Activate X times of Leech|Activate X times of Poison|Activate X times of Protect|Activate X times of Rally|Activate X times of Strike|Activate X times of Valor|Activate X times of Weaken|Deal X Counter damage|Deal X Poison damage|Destroy X Assault cards|Destroy X Structure cards|Play 3 Structure cards in each battle|Play 4 Bloodthirsty cards in each battle|Play 4 Imperial cards in each battle|Play 4 Raider cards in each battle|Play 4 Righteous cards in each battle|Play 4 Xeno cards in each battle"
BGEffectsX := "1|2|3"
IniFileName := "data\SimpleTUOptimizeStarter.ini"
IniSection := "onLoad"

Forts_Siege= none
Forts_Siege_X := "1|2|3|4"
Forts_Defense= none
Forts_Defense_X := "1|2|3|4"
Forts_Conquest= none
Forts_Conquest_X := "1|2|3"


Loop, read, Fortress_Siege.txt
{	Loop, parse, A_LoopReadLine, %A_Tab%
		{	Fort_Siege= %A_LoopField%
			Forts_Siege= %Forts_Siege%|%A_LoopField%
		}
}
Loop, read, Fortress_Defense.txt
{	Loop, parse, A_LoopReadLine, %A_Tab%
		{	Fort_Defense= %A_LoopField%
			Forts_Defense= %Forts_Defense%|%A_LoopField%
		}
}
Loop, read, Fortress_Conquest.txt
{	Loop, parse, A_LoopReadLine, %A_Tab%
		{	Fort_Conquest= %A_LoopField%
			Forts_Conquest= %Forts_Conquest%|%A_LoopField%
		}
}

IniRead, IniMyDeck, %IniFileName%, %IniSection%, MyDeck, Cyrus, Medic, Revolver, Imperial APC, Medic, Imperial APC
IniRead, IniMySiege1, %IniFileName%, %IniSection%, MySiege1, none
IniRead, IniMySiege1X, %IniFileName%, %IniSection%, MySiege1X, 4
IniRead, IniMySiege2, %IniFileName%, %IniSection%, MySiege2, none
IniRead, IniMySiege2X, %IniFileName%, %IniSection%, MySiege2X, 4
IniRead, IniMyDefense1, %IniFileName%, %IniSection%, MyDefense1, none
IniRead, IniMyDefense1X, %IniFileName%, %IniSection%, MyDefense1X, 4
IniRead, IniMyDefense2, %IniFileName%, %IniSection%, MyDefense2, none
IniRead, IniMyDefense2X, %IniFileName%, %IniSection%, MyDefense2X, 4
IniRead, IniEnemyDeck, %IniFileName%, %IniSection%, EnemyDeck, Iron Mutant
IniRead, IniEnemySiege1, %IniFileName%, %IniSection%, EnemySiege1, none
IniRead, IniEnemySiege1X, %IniFileName%, %IniSection%, EnemySiege1X, 4
IniRead, IniEnemySiege2, %IniFileName%, %IniSection%, EnemySiege2, none
IniRead, IniEnemySiege2X, %IniFileName%, %IniSection%, EnemySiege2X, 4
IniRead, IniEnemyDefense1, %IniFileName%, %IniSection%, EnemyDefense1, none
IniRead, IniEnemyDefense1X, %IniFileName%, %IniSection%, EnemyDefense1X, 4
IniRead, IniEnemyDefense2, %IniFileName%, %IniSection%, EnemyDefense2, none
IniRead, IniEnemyDefense2X, %IniFileName%, %IniSection%, EnemyDefense2X, 4
IniRead, IniVIP, %IniFileName%, %IniSection%, VIP, %A_Space%
IniRead, IniIterations, %IniFileName%, %IniSection%, Iterations, 1000
IniRead, IniClimbex, %IniFileName%, %IniSection%, Climbex, 100000
IniRead, IniThreads, %IniFileName%, %IniSection%, Threads, 4
IniRead, IniSimOptions, %IniFileName%, %IniSection%, SimOptions, %A_Space%
IniRead, IniEffect, %IniFileName%, %IniSection%, Effect, 1
IniRead, IniMode, %IniFileName%, %IniSection%, Mode, 1
IniRead, IniCustomDeckFile, %IniFileName%, %IniSection%, CustomDeckFile, data\ownedcards.txt
IniRead, IniOrder, %IniFileName%, %IniSection%, Order, 1
IniRead, IniOperation, %IniFileName%, %IniSection%, Operation, 1
IniRead, IniEndgame, %IniFileName%, %IniSection%, Endgame, 1
IniRead, IniFund, %IniFileName%, %IniSection%, Fund, 0
IniRead, Inix86, %IniFileName%, %IniSection%, x86, 0

Menu, MyMenu, Add, ownedcards.txt, MenuOwnedcards
Menu, MyMenu, Add, customdecks.txt, MenuCustomdecks
Menu, MyMenu, Add, cardabbrs.txt, MenuCardabbrs
Menu, MyMenu, Add, Update XMLs, MenuUpdate
Menu, MyMenu, Add, Help, MenuHelp
Menu, MyMenu, Add, Web, MenuWeb
Gui, Menu, MyMenu

Gui, Add, Text, r2, My Deck:
Gui, Add, Text, r1, My Fortress:
Gui, Add, Text, r2, Enemy Deck(s):
Gui, Add, Text, r1, Enemy Fortress:
Gui, Add, Text, r1, VIP Units:
Gui, Add, Text, r1, Quest:
Gui, Add, Text, r1, Effect:
Gui, Add, Text, r1, Mode:
Gui, Add, Text, r1, Operation:
Gui, Add, Text, r1, Flags:
Gui, Add, Text, r1, Запасы:

Gui, Add, Edit, vMyDeck ym w680 r2, %IniMyDeck%

Gui, Add, DDL, vMySiege1 section w110, %Forts_Siege%
GuiControl, ChooseString, MySiege1, %IniMySiege1%
Gui, Add, Text, ys, -
Gui, Add, DDL, vMySiege1X ys w30, %Forts_Siege_X%
GuiControl, ChooseString, MySiege1X, %IniMySiege1X%

Gui, Add, DDL, vMySiege2 ys w110, %Forts_Siege%
GuiControl, ChooseString, MySiege2, %IniMySiege2%
Gui, Add, Text, ys, -
Gui, Add, DDL, vMySiege2X ys w30, %Forts_Siege_X%
GuiControl, ChooseString, MySiege2X, %IniMySiege2X%

Gui, Add, DDL, vMyDefense1 ys w110, %Forts_Defense%
GuiControl, ChooseString, MyDefense1, %IniMyDefense1%
Gui, Add, Text, ys, -
Gui, Add, DDL, vMyDefense1X ys w30, %Forts_Defense_X%
GuiControl, ChooseString, MyDefense1X, %IniMyDefense1X%

Gui, Add, DDL, vMyDefense2 ys w110, %Forts_Defense%
GuiControl, ChooseString, MyDefense2, %IniMyDefense2%
Gui, Add, Text, ys, -
Gui, Add, DDL, vMyDefense2X ys w30, %Forts_Defense_X%
GuiControl, ChooseString, MyDefense2X, %IniMyDefense2X%

Gui, Add, Edit, vEnemiesDeck w680 xs r2, %IniEnemiesDeck%

Gui, Add, DDL, vEnemySiege1 section w110, %Forts_Siege%
GuiControl, ChooseString, EnemySiege1, %IniEnemySiege1%
Gui, Add, Text, ys, -
Gui, Add, DDL, vEnemySiege1X ys w30, %Forts_Siege_X%
GuiControl, ChooseString, EnemySiege1X, %IniEnemySiege1X%

Gui, Add, DDL, vEnemySiege2 ys w110, %Forts_Siege%
GuiControl, ChooseString, EnemySiege2, %IniEnemySiege2%
Gui, Add, Text, ys, -
Gui, Add, DDL, vEnemySiege2X ys w30, %Forts_Siege_X%
GuiControl, ChooseString, EnemySiege2X, %IniEnemySiege2X%

Gui, Add, DDL, vEnemyDefense1 ys w110, %Forts_Defense%
GuiControl, ChooseString, EnemyDefense1, %IniEnemyDefense1%
Gui, Add, Text, ys, -
Gui, Add, DDL, vEnemyDefense1X ys w30, %Forts_Defense_X%
GuiControl, ChooseString, EnemyDefense1X, %IniEnemyDefense1X%

Gui, Add, DDL, vEnemyDefense2 ys w110, %Forts_Defense%
GuiControl, ChooseString, EnemyDefense2, %IniEnemyDefense2%
Gui, Add, Text, ys, -
Gui, Add, DDL, vEnemyDefense2X ys w30, %Forts_Defense_X%
GuiControl, ChooseString, EnemyDefense2X, %IniEnemyDefense2X%

Gui, Add, Edit, vVIP w680 xs r1, %IniVIP%

Gui, Add, DDL, vQuest w210 section, %Quest%
Gui, Add, Checkbox, vQuestWin ys Checked, and Win
Gui, Add, Text, ys, X=
Gui, Add, Edit, vQuestX number ys w30, 1

Gui, Add, ComboBox, vEffect xs Choose1 w150 section, %BGEffects%
Gui, Add, Text, ys section, -
Gui, Add, DDL, vEffectX ys w36, %BGEffectsX%
Gui, Add, Text, ys, Endgame:
Gui, Add, DDL, altsubmit vEndgame ys Choose%IniEndgame% w133, none|0 - Maxed Units|1 - Maxed Fused|2 - Maxed Quads

Gui, Add, DDL, altsubmit vMode xs-160 w110 Choose%IniMode% section, Battle / Mission|Battle (defense)|GW / CQ / Surge|GW (defense)|Brawl|Raid|Campaign
Gui, Add, Checkbox, vModeATK ys Checked, ATK
Gui, Add, Checkbox, vModeDEF ys Checked, DEF

Gui, Add, Text, ys w40, Order:
Gui, Add, DDL, altsubmit vOrder Group Choose%IniOrder% ys w133, Random|Ordered (honor 3-card hand)

Gui, Add, DDL, altsubmit vOperation Group Choose%IniOperation% xs w110 section, Climb|Climbex|Sim|Reorder
Gui, Add, Text, ys r1, Iterations:
Gui, Add, Edit, vIterations ys r1 w35, %IniIterations%

Gui, Add, Text, ys w45, Climbex:
Gui, Add, Edit, vClimbex ys w50, %IniClimbex%
Gui, Add, Text, ys, Threads:
Gui, Add, Edit, vThreads number ys w20, %IniThreads%

Gui, Add, Edit, vSimOptions r1 xs w410, %IniSimOptions%
Gui, Add, Button, r1 w50 section, ...
Gui, Add, Edit, vCustomDeckFile r1 ys w350 ReadOnly, %IniCustomDeckFile%
Gui, Add, Button, r1 ys w50, Edit
Gui, Add, Button, r1 ys w50, Clear
Gui, Add, Button, default r2 w100 x100 y+15 section, Simulate
Gui, Add, Checkbox, vx86 Checked%Inix86%, x86 (32-bit)
Gui, Add, Button, r2 w100 ys xs+200, Exit
Gui, Show,, Simple Tyrant Unleashed Optimize Starter v2.12.0
return  

Button...:
Gui, Submit
FileSelectFile, SelectedFile, 3, %A_WorkingDir%\data\ , Open a Owned Card text file, Text Documents (*.txt;)
if SelectedFile !=
	GuiControl,, CustomDeckFile, %SelectedFile%
Gui, Show
return

ButtonClear:
GuiControl,, CustomDeckFile, 
Gui, Show
return

ButtonEdit:
Gui, Submit
Run, Notepad.exe %CustomDeckFile%
Gui, Show
return

ButtonSimulate:
Gui, Submit
selTUO := (x86 ? "tuo-x86" : "tuo")
selMode := (Mode == 1 ? "pvp" : Mode == 2 ? "pvp-defense" : Mode == 3 ? "gw" : Mode == 4 ? "gw-defense" :Mode == 5 ? "brawl" : Mode == 6 ? "raid" : "campaign")
selOrder := (Order == 1 ? "random" : "ordered")
selOperation :=  (Operation == 1 ? "climb" : Operation == 2 ? "climbex" : Operation == 3 ? "sim" : "reorder")

if (Operation == "2")	{
		selIterations := Iterations " " Climbex
	}	else	{
		selIterations := Iterations
	}

	
if (MySiege1 == "" || MySiege1 == "none")	{
	if (MySiege2 == "" || MySiege2 == "none")	{
		selMySiege := ""
	}	else	{
		selMySiege := "yf """ MySiege2 "-" MySiege2X """ "
	}
}	else	{
	if (MySiege2 == "" || MySiege2 == "none")	{
		selMySiege := "yf """ MySiege1 "-" MySiege1X """ "
	}	else	{
		selMySiege := "yf """ MySiege1 "-" MySiege1X ", " MySiege2 "-" MySiege2X """ "
	}
}

if (MyDefense1 == "" || MyDefense1 == "none")	{
	if (MyDefense2 == "" || MyDefense2 == "none")	{
		selMyDefense := ""
	}	else	{
		selMyDefense := "yf """ MyDefense2 "-" MyDefense2X """ "
	}
}	else	{
	if (MyDefense2 == "" || MyDefense2 == "none")	{
		selMyDefense := "yf """ MyDefense1 "-" MyDefense1X """ "
	}	else	{
		selMyDefense := "yf """ MyDefense1 "-" MyDefense1X ", " MyDefense2 "-" MyDefense2X """ "
	}
}

if (EnemySiege1 == "" || EnemySiege1 == "none")	{
	if (EnemySiege2 == "" || EnemySiege2 == "none")	{
		selEnemySiege := ""
	}	else	{
		selEnemySiege := "ef """ EnemySiege2 "-" EnemySiege2X """ "
	}
}	else	{
	if (EnemySiege2 == "" || EnemySiege2 == "none")	{
		selEnemySiege := "ef """ EnemySiege1 "-" EnemySiege1X """ "
	}	else	{
		selEnemySiege := "ef """ EnemySiege1 "-" EnemySiege1X ", " EnemySiege2 "-" EnemySiege2X """ "
	}
}

if (EnemyDefense1 == "" || EnemyDefense1 == "none")	{
	if (EnemyDefense2 == "" || EnemyDefense2 == "none")	{
		selEnemyDefense := ""
	}	else	{
		selEnemyDefense := "ef """ EnemyDefense2 "-" EnemyDefense2X """ "
	}
}	else	{
	if (EnemyDefense2 == "" || EnemyDefense2 == "none")	{
		selEnemyDefense := "ef """ EnemyDefense1 "-" EnemyDefense1X """ "
	}	else	{
		selEnemyDefense := "ef """ EnemyDefense1 "-" EnemyDefense1X ", " EnemyDefense2 "-" EnemyDefense2X """ "
	}
}

selVIP := ( VIP == "" ? "" : "vip """ VIP """ " )
StringReplace, Quest, Quest, %A_Space%X%A_Space%,%A_Space%%QuestX%%A_Space%
StringReplace, Quest, Quest, Activate, su
StringReplace, Quest, Quest, %A_Space%times%A_Space%of
StringReplace, Quest, Quest, Deal, sd
StringReplace, Quest, Quest, %A_Space%damage
StringReplace, Quest, Quest, Destroy, ck
StringReplace, Quest, Quest, %A_Space%cards
StringReplace, Quest, Quest, Play, cu
StringReplace, Quest, Quest, in%A_Space%each%A_Space%battle, each
selQuest := (Quest == "" || Quest == "none" ? "" : "quest """ Quest (QuestWin ? " win" : "") """ ")
selEffect := ( Effect == "" || Effect == "none" ? "" : "-e """ Effect """ ")
selThreads := ( Threads == "4" ? "" : "-t " Threads " ")
selSimOptions := ( SimOptions == "" ? "" : SimOptions " ")
EndgameVal := Endgame -2
selEndgame := (Endgame <= 1 ? "" : "endgame " EndgameVal " ")
selFund := (Fund == "" ? "" : "fund " Fund " ")

if (ModeATK <> true && ModeDEF <> true)	{
	MsgBox, "Где, бля, галочка!? Что симить то?"
	Goto, Sim
}	else	{
	if (ModeATK == true && ModeDEF <> true)	{
		execStringATK = %selTUO% "%MyDeck%" "%EnemyDeck%" %selMode% %selOrder% %selMySiege%%selEnemyDefense%%selVIP%%selQuest%%selEffect%%selThreads%%selEndgame%%selFund%%selSimOptions%%selOperation% %selIterations%%selCustomDeckFile%
		Run, cmd.exe /c title TUOptimizeOutput && echo %execStringATK% && %execStringATK% & pause
	}	else	{
		if (ModeATK <> true && ModeDEF == true)	{
			execStringDEF = %selTUO% "%MyDeck%" "%EnemyDeck%" %selMode% %selOrder% %selMyDefense%%selEnemySiege%%selVIP%%selQuest%%selEffect%%selThreads%%selEndgame%%selFund%%selSimOptions%%selOperation% %selIterations%%selCustomDeckFile%
			Run, cmd.exe /c title TUOptimizeOutput && echo %execStringDEF% && %execStringDEF% & pause
		}	else	{
			if (ModeATK == true && ModeDEF == true)	{
			execStringATK = %selTUO% "%MyDeck%" "%EnemyDeck%" %selMode% %selOrder% %selMySiege%%selEnemyDefense%%selVIP%%selQuest%%selEffect%%selThreads%%selEndgame%%selFund%%selSimOptions%%selOperation% %selIterations%%selCustomDeckFile%}
			execStringDEF = %selTUO% "%MyDeck%" "%EnemyDeck%" %selMode% %selOrder% %selMyDefense%%selEnemySiege%%selVIP%%selQuest%%selEffect%%selThreads%%selEndgame%%selFund%%selSimOptions%%selOperation% %selIterations%%selCustomDeckFile%
			Run, cmd.exe /c title TUOptimizeOutput && echo %execStringATK% && %execStringATK% & cmd.exe /c title TUOptimizeOutput && echo %execStringDEF% && %execStringDEF% & pause
			Goto, Sim
		}
	}
}
}

Sim:
Gui, Show
return

MenuHelp:
Gui, Submit
selTUO := (x86 ? "tuo-x86" : "tuo")
Run, cmd.exe /c title TUOptimizeOutput && echo %selTUO% && %selTUO% & pause
Gui, Show
return

MenuWeb:
Gui, Submit
Run https://github.com/andor9/tyrant_optimize/releases
Gui, Show
return

MenuUpdate:
MsgBox, 0, Update started, Updating XML files.`nPlease wait at least one minute. A new window should open soon.`nThis Window will auto close in 5 seconds. , 5
UrlDownloadToFile, *0 http://mobile.tyrantonline.com/assets/fusion_recipes_cj2.xml, data\fusion_recipes_cj2.xml
had_error := false
if ErrorLevel
{
    MsgBox, Error downloading fusion_recipes_cj2.xml.
    had_error := true
}
UrlDownloadToFile, *0 http://mobile.tyrantonline.com/assets/missions.xml, data\missions.xml
if ErrorLevel
{
    MsgBox, Error downloading missions.xml.
    had_error := true
}
UrlDownloadToFile, *0 http://mobile.tyrantonline.com/assets/skills_set.xml, data\skills_set.xml
if ErrorLevel
{
    MsgBox, Error downloading missions.xml.
    had_error := true
}
Loop, 8
{
    UrlDownloadToFile, *0 http://mobile.tyrantonline.com/assets/cards_section_%A_Index%.xml, data\cards_section_%A_Index%.xml
    if ErrorLevel
    {
        MsgBox, Error downloading cards_section_%A_Index%.xml.
        had_error := true
    }
}
UrlDownloadToFile, *0 https://raw.githubusercontent.com/andor9/tyrant_optimize/unleashed/data/raids.xml, data\raids.xml
if ErrorLevel
{
    MsgBox, Error downloading raids.xml.
    had_error := true
}
if !had_error
    MsgBox, 0, Update finished, xml files successfully updated.`nThis Window will auto close in 2 seconds., 2
Gui, Show
return

MenuOwnedcards:
Gui, Submit
Run, Notepad.exe data\ownedcards.txt
Gui, Show
return

MenuCustomdecks:
Gui, Submit
Run, Notepad.exe data\customdecks.txt
Gui, Show
return

MenuCardabbrs:
Gui, Submit
Run, Notepad.exe data\cardabbrs.txt
Gui, Show
return

GuiClose:
ButtonExit:
Gui, Submit
IniWrite, %MyDeck%, %IniFileName%, %IniSection%, MyDeck
IniWrite, %MySiege%, %IniFileName%, %IniSection%, MySiege
IniWrite, %EnemyDeck%, %IniFileName%, %IniSection%, EnemyDeck
IniWrite, %EnemySiege%, %IniFileName%, %IniSection%, EnemySiege
IniWrite, %VIP%, %IniFileName%, %IniSection%, VIP
IniWrite, %Effect%, %IniFileName%, %IniSection%, Effect
IniWrite, %Mode%, %IniFileName%, %IniSection%, Mode
IniWrite, %Order%, %IniFileName%, %IniSection%, Order
IniWrite, %Operation%, %IniFileName%, %IniSection%, Operation
IniWrite, %Iterations%, %IniFileName%, %IniSection%, Iterations
IniWrite, %Threads%, %IniFileName%, %IniSection%, Threads
IniWrite, %SimOptions%, %IniFileName%, %IniSection%, SimOptions
IniWrite, %Endgame%, %IniFileName%, %IniSection%, Endgame
IniWrite, %Fund%, %IniFileName%, %IniSection%, Fund
IniWrite, %x86%, %IniFileName%, %IniSection%, x86

while true
{
  IfWinExist, TUOptimizeOutput
      WinClose ; use the window found above
  else
      break
}
ExitApp
