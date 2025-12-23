extends Node

var diologue = [
	#0 - intro
	"unfinished n0o0b090lv-o-os 2025@tm(soon)\n(Use HELP)\n", 
	#1 - help
	"Commandiessss ;DD
	\tx__--// DEFAULTS \\\\--__x
	\t\tHELP\t\t\t\tDISPLAYS ALL THE COMMANDS
	\t\tENTER\t\t\t\tCLEARS COMMAND
	\t\tCLEAR\t\t\t\tCLEARS COMMAND FR
	\t\tMUSIC\t\t\t\tTOGGLES NOISE (ALSO CORUPTMUSIC)
	\t\tFAST\t\t\t\tSPEEDS UP TERMINAL
	\t\tQUIT\t\t\t\tQUITS COMPUTER AND EXPLODES

	\tx__--// JOB \\\\--__x
	\t\tNMAIL\t\t\t\tCHECK YOUR EMAIL
	\t\tTASKS\t\t\t\tCHECK YOUR TASKS

	\tx__--// APP \\\\--__x
	\t\tAPP\t\t\t\t\tOPENS DOWNLOADED APP
	\t\tCLOSE\t\t\t\tCLOSES OPENED APP
	\t\tDELETE\t\t\tDELETES APP
	\t\tDOWNLOAD\t\tDOWNLOADS NEWEST APP\n",
	#2 - exit
	"TF YOU THINK YOU GOING XD\n",
	#3 - exit
	"NUH UH XD\n",
	#4 - exit
	"LOL NO\n",
	#5 - task help
	"Tasker Commandiessss ;DD
	\tx__--// DEFAULTS \\\\--__x
	\t\tHELP\t\t\t\tDISPLAYS ALL THE COMMANDS
	\t\tENTER\t\t\t\tCLEARS COMMAND
	\t\tCLEAR\t\t\t\tCLEARS COMMAND FR FR

	\tx__--// TASK-ER \\\\--__x
	\t\tEXIT\t\t\t\tEXITS TASKER
	\t\tREPEAT\t\t\t\tREPEATS GIVEN TASK\n",
]

var emails = [
	{
		"Content": "\t\tH3ll0, x-[R3DACT3D]-x

		50 45 y0u c4n 53 w3 h4v3 m41l3d y0u 4 p1p3b0mb.. 
		4nd 1t 15 0n c00ld0wn 50 y0u b3tt3r 5t4rt w0rk1ng XPP
		1t 15 51mpl3, y0u d0 w0rk 4nd y0u d0n't bl00w up
		
		R3mb3r, h4v3 fun w0rk1ng f0-r noob.corp.c00l

		[-] - F0r n0w 0p3n t45k5 - [-]

		~ l3 h1gg3r 3mploy3 #3941123 (4k4 gr4y on3)\n",
		"Task": 0,
		"App": 0
	},
	{ #rpogrammer
		"Content": "Hi, noob.corp.cool
		I have this platformer, can you guys check it out
		like.. i have no idea how to touch arrows..
		I just code i can't play.. PLS PLS PLS HELP
		
		+_ Cool programmer _+\n",
		"Task": 1,
		"App": 1
	},
	{ #rpogrammer
		"Content": "Hello, noob.corp.cool
		Here i am.. again,, stil only keyboard.
		plsss check aagain ;-;
		
		+_ Cool programmer _+\n",
		"Task": 2,
		"App": 2
	},
	{ #rpogrammer
		"Content": "Hii, noob.corp.cool
		
		After last upload.. i have added some assets..
		I really hope my bdget plan can aford the extra mb T>T
		Either way.. thanks!
		
		+_ Cool programmer _+\n",
		"Task": 3,
		"App": 3
	},
	{ #rpogrammer
		"Content": "Last one, noob.corp.cool
		
		I am readdy to publish.. well i still need on last QA 
		I hope it works out, and if everything on checklist works..
		Then you must have enjoyed the game!
		
		+_ Cool programmer _+\n",
		"Task": 4,
		"App": 4
	},
	{ #rpogrammer
		"Content": "Small error, noob.corp.cool
		
		I found and fixed it. This is truly the last one, thanks!
		Either way after many not slept nights i found error.
		
		+_ Cool programmer _+\n",
		"Task": 5,
		"App": 5
	}
]

var tasks = [
	{
		"Name": "C0NGR4T5 0n 0p3n1ng th15 :DD\n",
		"Requims": [
			{
				"Text": "D0 y0u 53ll y0ur [i]UNG0DLY 50UL[/i] t0 th15 noob.corp.c00l",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N",
				"Possible": true
			},
			{
				"Text": "G0 D0WNL04D APP\nTYP3: EXIT -> DOWNLOAD -> APP -> CLOSE",
				"Prompt": "C - C0N71NU3\n",
				"Expected": "C",
				"NoNo": "NUHUH",
				"Possible": true
			},
			{
				"Text": "?? D035 17 0P3N UP",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N",
				"Possible": true
			},
			{
				"Text": "?? 4R3 7#3R3 [[2]] 0",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N",
				"Possible": true
			}
		],
		"Fail": "\t00P5135 wr0ng 4n5w3r5, l0lz135
		*pr0c33d5 t0 4cc1d3nt4lly d3t0n4t3 l3 b0mb*\n
		00P51355...................................................................................................................................................................................................................54Y_BY3BY3BY3BBYY33BBBYYY333-----------______________________\n",
		"Succes": "W3lc0m3 t0 y0ur n3w f4m1ly ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;D
		->> 4L50 - NMAIL - N3W T45K\n"
	},
#* PROGRAMMER ------------------------------------------
	#1
	{
		"Name": "Some.. questions i have on top of the head, i would like to know...\n",
		"Requims": [
			{
				"Text": "Does.. does this app open on your system??",
				"Prompt": "Yeah / nope\n",
				"Expected": "NOPE",
				"NoNo": "YEAH",
				"Possible": true
			},
			{
				"Text": "Can you.. like move around.. using arrows?",
				"Prompt": "Works / no\n",
				"Expected": "WORKS",
				"NoNo": "NO",
				"Possible": false
			},
			{
				"Text": "Can you walk trough door?",
				"Prompt": "Yup / nope\n",
				"Expected": "YUP",
				"NoNo": "NOPE",
				"Possible": false
			},
			{
				"Text": "Can you beat the level?",
				"Prompt": "Ez / Impossible\n",
				"Expected": "EZ",
				"NoNo": "IMPOSSIBLE",
				"Possible": false
			},
			{
				"Text": "Does victory screen work?",
				"Prompt": "Yeah / no\n",
				"Expected": "YEAH",
				"NoNo": "NO",
				"Possible": false
			},
			{
				"Text": "Did.. did you enjoy the game? (please be honest)",
				"Prompt": "YESSS / HELL\n",
				"Expected": "YESSS",
				"NoNo": "HELL",
				"Possible": false
			}
		],
		"Fail": "OH NO, the customer wasn't so happy// YOUR TIME has come, cya lDD\n",
		"Succes": "Oh wow, thanks for feedback!\n"
	},
	#2
	{
		"Name": "I just pasted in the previous tasks.. if that is alright\n",
		"Requims": [
			{
				"Text": "Does.. does this app open on your system??",
				"Prompt": "Yeah / nope\n",
				"Expected": "YEAH",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you.. like move around.. using arrows?",
				"Prompt": "Works / no\n",
				"Expected": "WORKS",
				"NoNo": "NO",
				"Possible": true
			},
			{
				"Text": "Can you walk trough door?",
				"Prompt": "Yup / nope\n",
				"Expected": "NOPE",
				"NoNo": "YUP",
				"Possible": true
			},
			{
				"Text": "Can you beat the level?",
				"Prompt": "Ez / Impossible\n",
				"Expected": "EZ",
				"NoNo": "IMPOSSIBLE",
				"Possible": false
			},
			{
				"Text": "Does victory screen work?",
				"Prompt": "Yeah / no\n",
				"Expected": "YEAH",
				"NoNo": "NO",
				"Possible": false
			},
			{
				"Text": "Did.. did you enjoy the game? (please be honest)",
				"Prompt": "YESSS / HELL\n",
				"Expected": "HELL",
				"NoNo": "YESSS",
				"Possible": true
			}
		],
		"Fail": "OH NO, the customer wasn't so happy// YOUR TIME has come, cya lDD\n",
		"Succes": "Oh wow, thanks for feedback!\n"
	},
	#3
	{
		"Name": "Previous tasks once again!\n",
		"Requims": [
			{
				"Text": "Does.. does this app open on your system??",
				"Prompt": "Yeah / nope\n",
				"Expected": "YEAH",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you.. like move around.. using arrows?",
				"Prompt": "Works / no\n",
				"Expected": "WORKS",
				"NoNo": "NO",
				"Possible": true
			},
			{
				"Text": "Can you walk trough door?",
				"Prompt": "Yup / nope\n",
				"Expected": "YUP",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you beat the level?",
				"Prompt": "Ez / Impossible\n",
				"Expected": "IMPOSSIBLE",
				"NoNo": "EZ",
				"Possible": true
			},
			{
				"Text": "Does victory screen work?",
				"Prompt": "Yeah / no\n",
				"Expected": "NO",
				"NoNo": "YEAH",
				"Possible": false
			},
			{
				"Text": "Did.. did you enjoy the game? (please be honest)",
				"Prompt": "YESSS / HELL\n",
				"Expected": "HELL",
				"NoNo": "YESSS",
				"Possible": true
			}
		],
		"Fail": "OH NO, the customer wasn't so happy// YOUR TIME has come, cya lDD\n",
		"Succes": "Oh wow, thanks for feedback!\n"
	},
	#4
	{
		"Name": "Thanks alot, this is the final one!\n",
		"Requims": [
			{
				"Text": "Does.. does this app open on your system??",
				"Prompt": "Yeah / nope\n",
				"Expected": "YEAH",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you.. like move around.. using arrows?",
				"Prompt": "Works / no\n",
				"Expected": "WORKS",
				"NoNo": "NO",
				"Possible": true
			},
			{
				"Text": "Can you walk trough door?",
				"Prompt": "Yup / nope\n",
				"Expected": "YUP",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you beat the level?",
				"Prompt": "Ez / Impossible\n",
				"Expected": "EZ",
				"NoNo": "IMPOSSIBLE",
				"Possible": true
			},
			{
				"Text": "Does victory screen work?",
				"Prompt": "Yeah / no\n",
				"Expected": "NO",
				"NoNo": "YEAH",
				"Possible": true
			},
			{
				"Text": "Did.. did you enjoy the game? (please be honest)",
				"Prompt": "YESSS / HELL\n",
				"Expected": "HELL",
				"NoNo": "YESSS",
				"Possible": true
			}
		],
		"Fail": "OH NO, the customer wasn't so happy// YOUR TIME has come, cya lDD\n",
		"Succes": "Oh wow, thanks for QA noob.corp.cool\n"
	},
	#5
	{
		"Name": "Sorry for last time.. but i hope this is it\n",
		"Requims": [
			{
				"Text": "Does.. does this app open on your system??",
				"Prompt": "Yeah / nope\n",
				"Expected": "YEAH",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you.. like move around.. using arrows?",
				"Prompt": "Works / no\n",
				"Expected": "WORKS",
				"NoNo": "NO",
				"Possible": true
			},
			{
				"Text": "Can you walk trough door?",
				"Prompt": "Yup / nope\n",
				"Expected": "YUP",
				"NoNo": "NOPE",
				"Possible": true
			},
			{
				"Text": "Can you beat the level?",
				"Prompt": "Ez / Impossible\n",
				"Expected": "EZ",
				"NoNo": "IMPOSSIBLE",
				"Possible": true
			},
			{
				"Text": "Does victory screen work?",
				"Prompt": "Yeah / no\n",
				"Expected": "YEAH",
				"NoNo": "NO",
				"Possible": true
			},
			{
				"Text": "Did.. did you enjoy the game? (please be honest)",
				"Prompt": "YESSS / HELL\n",
				"Expected": "YESSS",
				"NoNo": "HELL",
				"Possible": true
			}
		],
		"Fail": "OH NO, the customer wasn't so happy// YOUR TIME has come, cya lDD\n",
		"Succes": "Oh wow, thanks for QA noob.corp.cool\n"
	}
]

var apps = [
	#0
	{
		"Name": "73571NG 4PP",
		"Size": "4mb",
		"Modules": [
			"Core",
			"Text_display"
		],
		"Scene": preload("res://scenes/apps/TestApp.tscn")
	},
	#* PROGRaMMER ---------------------------------------
	#1
	{
		"Name": "Cool platformer",
		"Size": "23.5mb",
		"Modules": [
			"Core",
			"Text_display",
			"Player",
			"Level",
			"Movement",
		],
		"Scene": preload("res://scenes/apps/programmer_1.tscn")
	},
	#2
	{
		"Name": "Cool platformer",
		"Size": "26mb",
		"Modules": [
			"Core",
			"Text_display",
			"Packgaker",
			"Player",
			"Level",
			"Movement",
			"Door",
			"Logic"
		],
		"Scene": preload("res://scenes/apps/programmer_2.tscn")
	},
	#3
	{
		"Name": "Cool platformer",
		"Size": "50.3mb",
		"Modules": [
			"Core",
			"Text_display",
			"Assets",
			"Packgaker",
			"Player v2",
			"Level",
			"Movement",
			"Door",
			"Logic"
		],
		"Scene": preload("res://scenes/apps/programmer_3.tscn")
	},
	#4
	{
		"Name": "Cool platformer",
		"Size": "52.8mb",
		"Modules": [
			"Core",
			"Text_display",
			"Assets",
			"Packgaker",
			"Player v3",
			"Level",
			"Movement",
			"Door",
			"Logic"
		],
		"Scene": preload("res://scenes/apps/programmer_4.tscn")
	},
	#5
	{
		"Name": "Cool platformer",
		"Size": "54.2mb",
		"Modules": [
			"Core",
			"Text_display",
			"Assets",
			"Packgaker",
			"Player v3",
			"Level",
			"Movement",
			"Win",
			"Door",
			"Logic"
		],
		"Scene": preload("res://scenes/apps/programmer_5.tscn")
	}
]

func getTask(p_index: int) -> Dictionary:
	return tasks[p_index]

func getDiologue(p_index: int) -> String:
	return diologue[p_index]

func getEmail(p_index: int) -> Dictionary:
	return emails[p_index]

func getApp(p_index: int) -> Dictionary:
	return apps[p_index]

func getEmailAmount() -> int:
	return emails.size()
