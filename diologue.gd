extends Node

var diologue = [
	#0 - intro
	"unfinished n0o0b090lv-o-os 2025@tm(soon)\n(Use HELP)\n", 
	#1 - help
	"Commandiessss ;DD
	\tx__--// DEFAULTS \\\\--__x
	\t\tHELP\t\t\t\tDISPLAYS ALL THE COMMANDS
	\t\tENTER\t\t\t\tCLEARS COMMAND
	\t\tCLEAR\t\t\t\tCLEARS COMMAND FR FR
	\t\tMUSIC\t\t\t\tTOGGLES MUSIC (Actually don't.. stay in silent bliss ;-;)
	\t\tFAST\t\t\t\tSPEEDS UP BOMB TIMER XDD

	\tx__--// JOB \\\\--__x
	\t\tNMAIL\t\t\t\tCHECK YOUR EMAIL
	\t\tTASKS\t\t\t\tCHECK YOUR TASKS

	\tx__--// APP \\\\--__x
	\t\tAPP\t\t\t\t\tOPENS DOWNLOADED APP
	\t\tCLOSE\t\t\t\t\tCLOSES OPENED APP
	\t\tDELETE\t\t\tDELETES APP
	\t\tDOWN\t\t\tDOWNLOADS NEWEST APP\n",
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
	{
		"Content": "Hi, noob.corp.cool
		I have this platformer, can you guys check it out
		like.. i have no idea how to touch arrows..
		I just code i can't play.. PLS PLS PLS HELP
		
		+_ Cool programmer _+\n",
		"Task": 1,
		"App": 1
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
				"NoNo": "N"
			},
			{
				"Text": "G0 D0WNL04D APP",
				"Prompt": "|| EXIT ||\n",
				"Expected": "EXIT",
				"NoNo": "NUHUH"
			},
			{
				"Text": "?? D035 17 0P3N UP",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N"
			}
		],
		"Fail": "\t00P5135 wr0ng 4n5w3r5, l0lz135
		*pr0c33d5 t0 4cc1d3nt4lly d3t0n4t3 l3 b0mb*\n
		00P51355...................................................................................................................................................................................................................54Y_BY3BY3BY3BBYY33BBBYYY333-----------______________________\n",
		"Succes": "W3lc0m3 t0 y0ur n3w f4m1ly ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;D\n"
	},
	{
		"Name": "C0NGR4T5 0n 0p3n1ng th15 :DD\n",
		"Requims": [
			{
				"Text": "D0 y0u 53ll y0ur [i]UNG0DLY 50UL[/i] t0 th15 noob.corp.c00l",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N"
			},
			{
				"Text": "?? 4R3 Y0U 3X173D !!",
				"Prompt": "Y - y35 || n0 - N\n",
				"Expected": "Y",
				"NoNo": "N"
			}
		],
		"Fail": "\t00P5135 wr0ng 4n5w3r5, l0lz135
		*pr0c33d5 t0 4cc1d3nt4lly d3t0n4t3 l3 b0mb*\n
		00P51355...................................................................................................................................................................................................................54Y_BY3BY3BY3BBYY33BBBYYY333-----------______________________\n",
		"Succes": "W3lc0m3 t0 y0ur n3w f4m1ly ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;D\n"
	}
]

var apps = [
	{
		"Name": "73571NG 4PP",
		"Size": "4.0mb",
		"Modules": [
			"Core",
			"Text_display"
		],
		"Scene": preload("res://scenes/apps/TestApp.tscn")
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
