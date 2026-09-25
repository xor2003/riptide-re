; decomp/seg2608.asm — extracted (extracted from RIPTIDE_.asm)
		.386p

FILE		struc ;	(sizeof=0x14, align=0x2, copyof_7) ; XREF: seg2608:stru_2B114/r
					; seg2608:stru_2B128/r ...
level		dw ?
flags		dw ?			; XREF:	__setupio+8C/w __setupio+96/r
fd		db ?			; XREF:	__setupio+7D/r
hold		db ?
bsize		dw ?
buffer		dd ?			; offset
curp		dd ?			; offset
istemp		dw ?
token		dw ?
FILE		ends

		extrn	loc_420A:near
		extrn	sub_420D:near
		extrn	@bs1_start_up$qv:near
		extrn	@bs2_start_up$qv:near
		extrn	@bs3_start_up$qv:near
		extrn	@gui_item@draw$qv:far
		extrn	@gui_item@erase$qv:near
		extrn	@button@draw$qv:near
		extrn	@button@poll$qv:near
		extrn	@file_box@draw$qv:near
		extrn	@file_box@poll$qv:near
		extrn	@prompt_box@draw$qv:near
		extrn	@prompt_box@poll$qv:near
		extrn	@text_box@draw$qv:near
		extrn	@text_box@erase$qv:near
		extrn	@text_box@poll$qv:near
		extrn	@menu_bar@draw$qv:near
		extrn	@menu_bar@erase$qv:near
		extrn	@menu_bar@poll$qv:near
		extrn	@pull_down@draw$qv:near
		extrn	@pull_down@poll$qv:near
		extrn	nullsub_1:far16
		extrn	start:far16
		extrn	sub_26F1:near
		extrn	sub_3C32:near
		extrn	loc_3C37:near
		extrn	sub_24D9:near
		extrn	__setupio:near
		extrn	__c0crtinit:near
		extrn	loc_3C6C:near
		extrn	unknown_libname_3:near
		public	@button@
		public	@file_box@
		public	@gui_item@
		public	@menu_bar@
		public	@prompt_box@
		public	@pull_down@
		public	@text_box@
		public	@text_pager@
		public	AboutRiptide
		public	__8087
		public	___brklvl
		public	___signalptr
		public	__argc
		public	__argv
		public	__atexitcnt
		public	__atexittbl
		public	__brklvl
		public	__c0argc
		public	__c0argv
		public	__c0environ
		public	__cchar
		public	__cflag
		public	__ctype
		public	__default87
		public	__doserrno
		public	__doserrortosv
		public	__envlng
		public	__envseg
		public	__envsize
		public	__exitbuf
		public	__exitfopen
		public	__exitopen
		public	__fmode
		public	__fpstklen
		public	__heapbase
		public	__heaptop
		public	__int0vector
		public	__int4vector
		public	__int5vector
		public	__int6vector
		public	__ldt
		public	__new_handler
		public	__nfile
		public	__notumask
		public	__openfd
		public	__osminor
		public	__protected
		public	__psp
		public	__realcvtvector
		public	__scantodvector
		public	__starttime
		public	__stklen
		public	__streams
		public	__version
		public	__video
		public	__wscroll
		public	_act
		public	_air_count
		public	_air_speed
		public	_air_supply
		public	_all_explosions
		public	_all_maps
		public	_all_messages
		public	_all_projectiles
		public	_all_secrets
		public	_all_teleports
		public	_auto_fire
		public	_auto_fire_count
		public	_barrel_msg
		public	_barrier_count
		public	_barrier_list
		public	_boss
		public	_cave_msg
		public	_cheat_mode
		public	_control
		public	_cur_map
		public	_cur_message
		public	_cur_sound
		public	_cur_sub
		public	_death_type
		public	_debug
		public	_debug_mode
		public	_debug_ptr
		public	_default_mouse
		public	_diff_x
		public	_diff_y
		public	_directvideo
		public	_disable_exit_routine
		public	_display
		public	_displayed_page
		public	_download_pos
		public	_ed_list
		public	_ed_list_size
		public	_ego
		public	_ego_map_h
		public	_ego_map_w
		public	_ego_x_speed
		public	_ego_y_speed
		public	_end_door_ptr
		public	_end_door_tile
		public	_enemies_killed
		public	_enemy_count
		public	_errno
		public	_exit_routine
		public	_external_open
		public	_external_read
		public	_finish_tile
		public	_force_pc_sound
		public	_g_handle
		public	_game_highs
		public	_game_in_progress
		public	_god_mode
		public	_goodies_found
		public	_goody_count
		public	_got_key
		public	_gr_keys
		public	_gr_old_int9
		public	_gun_count
		public	_gun_msg
		public	_gun_pieces_xy
		public	_gun_underbits
		public	_heavy_timer
		public	_high_score
		public	_i_external_button
		public	_i_external_down
		public	_i_external_left
		public	_i_external_right
		public	_i_external_up
		public	_isr
		public	_jason
		public	_jason_count
		public	_jason_fire
		public	_jason_msg
		public	_jason_on
		public	_jason_power
		public	_jason_present
		public	_jguage_underbits
		public	_m_dont_handle
		public	_map_exploded
		public	_map_messages
		public	_maximum_jason_power
		public	_maximum_text_length
		public	_men
		public	_menu_bar_height
		public	_message_count
		public	_message_posted
		public	_mode
		public	_mouse
		public	_new_map_name
		public	_non_displayed_page
		public	_old_palette
		public	_page_offsets
		public	_palette
		public	_pd_redraws
		public	_restart
		public	_resume
		public	_saw_title_screen
		public	_score
		public	_score_count
		public	_scrn
		public	_secret_tile
		public	_shld_supply
		public	_shootable_count
		public	_shootable_list
		public	_shot_count
		public	_shot_size
		public	_show_box
		public	_show_box_on
		public	_smart_missiles
		public	_space_bar_been_up
		public	_spare_palette
		public	_src
		public	_start_x
		public	_start_y
		public	_stop_room
		public	_stream
		public	_string
		public	_sys_errlist
		public	_sys_nerr
		public	_system_bench
		public	_system_font_ptr
		public	_tbl_mul80
		public	_tbl_mul_tw
		public	_tbl_tile_dst
		public	_tbl_tile_src
		public	_teleport_count
		public	_the_cast
		public	_the_game
		public	_the_map
		public	_the_menu_bar
		public	_theirhandler
		public	_tmp
		public	_tmp2
		public	_tmp3
		public	_top_fire
		public	_top_shot_count
		public	_worx_ax
		public	_worx_bx
		public	_worx_di
		public	_worx_dx
		public	_zapper_count
		public	_zoom_to_map
		public	a1_0
		public	aAdd
		public	aAdd_0
		public	aAdd_1
		public	aAdd_2
		public	aAddingALoopToG
		public	aAddingActorToC
		public	aAdlibCardNotPr
		public	aAdlibCardNot_0
		public	aAndPackMediaCo
		public	aAreYouSureYo_0
		public	aAreYouSureYouW
		public	aArtwork
		public	aAttemptToDivid
		public	aAveryPack
		public	aBacksub_l
		public	aBacksub_l_0
		public	aBadgrunt
		public	aBadgrunt_0
		public	aBadgrunt_1
		public	aBadgrunt_2
		public	aBarrel1_l
		public	aBarrel1_l_0
		public	aBarrel2_l
		public	aBarrel2_l_0
		public	aBarrel3_l
		public	aBarrel3_l_0
		public	aBlock2_l
		public	aBlock2_l_0
		public	aBlock_l
		public	aBlock_l_0
		public	aBonus1_l
		public	aBonus1_l_0
		public	aBonus2_l
		public	aBonus2_l_0
		public	aBonusX100
		public	aBonusX50
		public	aBosshit_l
		public	aBosshit_l_0
		public	aBs1_bdl_l
		public	aBs1_bdl_l_0
		public	aBs1_bdl_l_1
		public	aBs1_bdl_l_2
		public	aBs1_bdl_l_3
		public	aBs1_bdr_l
		public	aBs1_bdr_l_0
		public	aBs1_bdr_l_1
		public	aBs1dr_l
		public	aBs1dr_l_0
		public	aBs1dr_l_1
		public	aBs2_bod_l
		public	aBs2_bod_l_0
		public	aBs2_bod_l_1
		public	aBs2_tnl1_l
		public	aBs2_tnl1_l_0
		public	aBs2_tnl1_l_1
		public	aBs2_tnl2_l
		public	aBs2_tnl2_l_0
		public	aBs2_tnl2_l_1
		public	aBs2_tnr1_l
		public	aBs2_tnr1_l_0
		public	aBs2_tnr1_l_1
		public	aBs2_tnr2_l
		public	aBs2_tnr2_l_0
		public	aBs2_tnr2_l_1
		public	aBs3_arl_l
		public	aBs3_arl_l_0
		public	aBs3_arl_l_1
		public	aBs3_arl_l_2
		public	aBs3_arr_l
		public	aBs3_arr_l_0
		public	aBs3_arr_l_1
		public	aBs3_arr_l_2
		public	aBs3_bdl_l
		public	aBs3_bdl_l_0
		public	aBs3_bdl_l_1
		public	aBs3_bdl_l_2
		public	aBs3_bdr_l
		public	aBs3_bdr_l_0
		public	aBs3_bdr_l_1
		public	aBs3_dthr_l
		public	aBs3_dthr_l_0
		public	aBs3_dthr_l_1
		public	aBs3_facl_l
		public	aBs3_facl_l_0
		public	aBs3_facl_l_1
		public	aBs3_facl_l_2
		public	aBs3_facr_l
		public	aBs3_facr_l_0
		public	aBs3_facr_l_1
		public	aBs3_facr_l_2
		public	aBs3_prpl_l
		public	aBs3_prpl_l_0
		public	aBs3_prpl_l_1
		public	aBs3_prpl_l_2
		public	aBs3_prpr_l
		public	aBs3_prpr_l_0
		public	aBs3_prpr_l_1
		public	aBs3_prpr_l_2
		public	aBubbles2
		public	aBubbles2_0
		public	aBubbles2_1
		public	aBubmd_l
		public	aBubmd_l_0
		public	aBubsm_l
		public	aBubsm_l_0
		public	aBytesFree
		public	aBytesFreeLu
		public	aCanTFindSong
		public	aCancel
		public	aCancel_0
		public	aCannonl_l
		public	aCannonl_l_0
		public	aCannonr_l
		public	aCannonr_l_0
		public	aCannonr_l_1
		public	aCastSize
		public	aCatalog___
		public	aCd
		public	aCenterJoystick
		public	aChain_l
		public	aChain_l_0
		public	aChain_l_1
		public	aChangeDirector
		public	aCharge
		public	aCheatModeOnLet
		public	aChest_l
		public	aChest_l_0
		public	aClam_l
		public	aClam_l_0
		public	aCoin_l
		public	aCoin_l_0
		public	aCoin_l_1
		public	aCompaq
		public	aComposerSoundE
		public	aConfig_rip
		public	aConfigrip
		public	aControl
		public	aCopyright1991B
		public	aCopyrightC1994
		public	aCouldnTOpen
		public	aCouldnTOpenRip
		public	aCrab_l
		public	aCrab_l_0
		public	aCrabdie_l
		public	aCrabdie_l_0
		public	aCreatingPcxH_0
		public	aCreatingPcxHea
		public	aCry
		public	aDanFroelich
		public	aDead
		public	aDebugModeEnabl
		public	aDebug_
		public	aDebug_1
		public	aDebug_2
		public	aDesignAndProgr
		public	aDirhit
		public	aDirhit_0
		public	aDirhit_1
		public	aDirhit_2
		public	aDirhit_3
		public	aDivideErrorAbn
		public	aDone
		public	aDoor
		public	aDoor_0
		public	aDoor_ud_l
		public	aDoor_ud_l_0
		public	aDrillhi
		public	aDrillhi_0
		public	aDrillhi_1
		public	aDrillhi_2
		public	aDrillhi_3
		public	aDrillhi_4
		public	aDrillhi_5
		public	aDrillhi_6
		public	aDrillhi_7
		public	aDuct_d_l
		public	aDuct_d_l_0
		public	aDuct_l_l
		public	aDuct_l_l_0
		public	aDuct_r_l
		public	aDuct_r_l_0
		public	aDuct_u_l
		public	aDuct_u_l_0
		public	aEgoXY
		public	aEgodie2_l_0
		public	aEgodie2_l_0_
		public	aEgodie2_l_1
		public	aElementNotOpen
		public	aEndCurrentGame
		public	aEndDoorSwitchW
		public	aEnd_dr_l
		public	aEnd_dr_l_0
		public	aEnd_l
		public	aEnemiesDestroy
		public	aEnterName
		public	aEnterNewPath
		public	aEnterNewShotSi
		public	aEnterPasswordB
		public	aErrorLoadingPc
		public	aErrorLookingFo
		public	aErrorUpdatingG
		public	aError_
		public	aExit
		public	aExp1
		public	aExp2
		public	aExp2_0
		public	aExp2_1
		public	aExp3_l
		public	aExp3_l_0
		public	aExp3_l_1
		public	aExplg_l
		public	aExpmd_l
		public	aExpsm_l
		public	aFFloatingPoint
		public	aFace_l_l
		public	aFace_l_l_0
		public	aFace_r_l
		public	aFace_r_l_0
		public	aFast
		public	aFast_0
		public	aFaze
		public	aFirbaldn_l
		public	aFirbaldn_l_0
		public	aFirbalup_l
		public	aFirbalup_l_0
		public	aFire1
		public	aFire1_0
		public	aFire2
		public	aFire2_0
		public	aFire2_1
		public	aFire_pit_l
		public	aFire_pit_l_0
		public	aFireball_l
		public	aFish1l_l
		public	aFish1l_l_0
		public	aFish1r_l
		public	aFish1r_l_0
		public	aFish1r_l_1
		public	aFish1r_l_2
		public	aFish2l_l
		public	aFish2l_l_0
		public	aFish2r_l
		public	aFish2r_l_0
		public	aFish2r_l_1
		public	aFloatingPointE
		public	aForcingPcSound
		public	aFramesPerSecon
		public	aFreemine_l
		public	aFreemine_l_0
		public	aGame
		public	aGameControl
		public	aGameControlIsC
		public	aGameSound
		public	aGameSoundsAreC
		public	aGameSpeed
		public	aGameSpeedIsCur
		public	aGameSpeed_0
		public	aGame_0
		public	aGame_1
		public	aGem_l
		public	aGem_l_0
		public	aGem_l_1
		public	aGem_l_2
		public	aGettingScreenB
		public	aGodMode
		public	aGodModeNowOn
		public	aGoodies
		public	aGotcha_l
		public	aGotcha_l_0
		public	aGotcha_l_1
		public	aGun_1_l
		public	aGun_1_l_0
		public	aGun_2_l
		public	aGun_2_l_0
		public	aGun_3_l
		public	aGun_3_l_0
		public	aGun_4_l
		public	aGun_4_l_0
		public	aHelp
		public	aHighScores___
		public	aHigh_scr
		public	aHuge
		public	aInSearchOfDr_R
		public	aInfo
		public	aInitMap_
		public	aInstructions__
		public	aInvalidSecre_0
		public	aInvalidSecretL
		public	aJelly_l
		public	aJelly_l_0
		public	aJoy
		public	aJoystick
		public	aJoystickCalibr
		public	aKey
		public	aKey_l
		public	aKey_l_0
		public	aKeyboard
		public	aLetsrip
		public	aLoadingLoop_
		public	aLoadingMap_
		public	aLoadingPcxFi_0
		public	aLoadingPcxFile
		public	aLogos_pcx
		public	aLoopDoesNotExi
		public	aLoopStorageFul
		public	aMapHeight
		public	aMapWidth
		public	aMedium
		public	aMelGuymon
		public	aMine_l
		public	aMine_l_0
		public	aMore
		public	aMouse_l
		public	aMouse_l_0
		public	aMreal_l
		public	aMreal_l_0
		public	aMsg_bar_l
		public	aMsg_cave_l
		public	aMsg_gun_l
		public	aMsg_jasn_l
		public	aMsl_arwl_l
		public	aMsl_arwr_l
		public	aMsl_bg2l_l
		public	aMsl_bg2r_l
		public	aMsl_bigl_l
		public	aMsl_bigr_l
		public	aMsl_hbl_l
		public	aMsl_hbr_l
		public	aMsl_inkl_l
		public	aMsl_inkl_l_0
		public	aMsl_inkr_l
		public	aMsl_inkr_l_0
		public	aMsl_pea_l
		public	aMsl_red_l
		public	aMsl_rkl_l
		public	aMsl_rkr_l
		public	aMsl_sm_l
		public	aMsl_spt_l
		public	aMsl_str_l
		public	aMsl_top_l
		public	aMsl_top_l_0
		public	aMsl_tpl_l
		public	aMsl_tpr_l
		public	aNewPassword
		public	aNewSettingq
		public	aNo
		public	aNotAValidPath_
		public	aNotInModeXAbor
		public	aNull
		public	aOff
		public	aOff_
		public	aOk
		public	aOk_0
		public	aOk_1
		public	aOk_2
		public	aOn
		public	aOn_
		public	aOpenFile
		public	aOtis_l
		public	aOtiseyes_l
		public	aOtiseyes_l_0
		public	aOtiseyes_l_1
		public	aOutOfHeap
		public	aP_death1_pcx
		public	aP_death2_pcx
		public	aP_frame_pcx
		public	aP_highs_pcx
		public	aP_stats_pcx
		public	aP_title_pcx
		public	aPaletteCycleNo
		public	aPassword
		public	aPassword_0
		public	aPat1_l
		public	aPat1_l_0
		public	aPat1_l_1
		public	aPcsound
		public	aPiece_1_l
		public	aPiece_1_l_0
		public	aPiece_2_l
		public	aPiece_2_l_0
		public	aPiece_3_l
		public	aPiece_3_l_0
		public	aPiece_4_l
		public	aPiece_4_l_0
		public	aPing
		public	aPing_0
		public	aPing_1
		public	aPing_2
		public	aPirana
		public	aPirana_0
		public	aPirana_1
		public	aPirana_2
		public	aPirana_3
		public	aPiranal_l
		public	aPiranal_l_0
		public	aPiranal_l_1
		public	aPiranar_l
		public	aPiranar_l_0
		public	aPiranar_l_1
		public	aPlaySong___
		public	aPlunk2
		public	aPlunk2_0
		public	aPlunk2_1
		public	aPod1_l
		public	aPod1_l_0
		public	aPod2_l
		public	aPod2_l_0
		public	aPrelude_l
		public	aPrint
		public	aPrinterError_C
		public	aProbel_l
		public	aProbel_l_0
		public	aProbel_l_1
		public	aProber_l
		public	aProber_l_0
		public	aProber_l_1
		public	aProber_l_2
		public	aProbspin_l
		public	aProbspin_l_0
		public	aProducer
		public	aPu_1up_l
		public	aPu_1up_l_0
		public	aPu_air_l
		public	aPu_air_l_0
		public	aPu_auto_l
		public	aPu_auto_l_0
		public	aPu_auto_l_1
		public	aPu_fire_l
		public	aPu_fire_l_0
		public	aPu_fire_l_1
		public	aPu_jason_l
		public	aPu_jason_l_0
		public	aPu_jason_l_1
		public	aPu_jf_l
		public	aPu_jf_l_0
		public	aPu_jwl1_l
		public	aPu_key_l
		public	aPu_key_l_0
		public	aPu_shld_l
		public	aPu_shld_l_0
		public	aPu_shld_l_1
		public	aPu_top_l
		public	aPu_top_l_0
		public	aPup
		public	aPup2
		public	aPup2_0
		public	aPup2_1
		public	aPup2_2
		public	aPup2_3
		public	aPupNotDefined
		public	aPup_0
		public	aPup_1
		public	aQuit
		public	aREGISTERED
		public	aRaoulSaid
		public	aReadError
		public	aRequestToOpenM
		public	aReset
		public	aResume
		public	aResume_0
		public	aResume_1
		public	aRiptideRegiste
		public	aRiptideRequi_0
		public	aRiptideRequire
		public	aRiptide_dat
		public	aRiptide_pcx
		public	aRiptide_pcxHas
		public	aRiptide_pcx_0
		public	aRscFile_
		public	aRunBenchmark
		public	aRunBenchmark_0
		public	aRunBenchmark_1
		public	aS
		public	aSS
		public	aSS_0
		public	aSavingMap_
		public	aScan
		public	aScr_1000_l
		public	aScr_1000_l_0
		public	aScr_100_l
		public	aScr_100_l_0
		public	aScr_2000_l
		public	aScr_2000_l_0
		public	aScr_3000_l
		public	aScr_3000_l_0
		public	aScr_4000_l
		public	aScr_4000_l_0
		public	aScr_500_l
		public	aScr_500_l_0
		public	aScream
		public	aSerp_l_l
		public	aSerp_l_l_0
		public	aSerp_l_l_1
		public	aSerp_r_l
		public	aSerp_r_l_0
		public	aSerp_r_l_1
		public	aSerpdie_l
		public	aSerpdie_l_0
		public	aSetup
		public	aSharkdie_l
		public	aSharkdie_l_0
		public	aSharkdie_l_1
		public	aSharkl_l
		public	aSharkl_l_0
		public	aSharkl_l_1
		public	aSharkl_l_2
		public	aSharkr_l
		public	aSharkr_l_0
		public	aSharkr_l_1
		public	aSharkr_l_2
		public	aShipl_l
		public	aShipl_l_0
		public	aShipl_l_1
		public	aShipr_l
		public	aShipr_l_0
		public	aShipr_l_1
		public	aShotSize
		public	aShotSize___
		public	aShowStats
		public	aShpbmb_l
		public	aShpbmb_l_0
		public	aShutl_l_l
		public	aShutl_l_l_0
		public	aShutl_l_l_1
		public	aShutl_r_l
		public	aShutl_r_l_0
		public	aSlow
		public	aSlow_0
		public	aSmall
		public	aSmash
		public	aSmash_0
		public	aSndNotInStorag
		public	aSound
		public	aSoundStorageFu
		public	aSoundblasterDe
		public	aSpikes_d_l
		public	aSpikes_d_l_0
		public	aSpikes_u_l
		public	aSpikes_u_l_0
		public	aSplat_l
		public	aSprtStorage
		public	aSqueek
		public	aStart
		public	aStartActIi
		public	aStartGameFromB
		public	aStart_0
		public	aStats_cmf
		public	aStatue_l
		public	aStatue_l_0
		public	aStopSong
		public	aStory___
		public	aSubl_l
		public	aSubl_l_0
		public	aSubl_l_1
		public	aSubl_l_2
		public	aSubr_l
		public	aSubr_l_0
		public	aSubr_l_1
		public	aSubr_l_2
		public	aSubr_l_3
		public	aSum
		public	aSum_0
		public	aSum_1
		public	aSum_2
		public	aSwish
		public	aSwish_0
		public	aSwish_1
		public	aSwitch_l
		public	aSwitch_l_0
		public	aSystemBench
		public	aT_cat_txt
		public	aT_exit_txt
		public	aT_help_txt
		public	aT_inst_txt
		public	aT_story_txt
		public	aTent_in_l
		public	aTent_in_l_0
		public	aTent_out_l
		public	aTent_out_l_0
		public	aTent_out_l_1
		public	aTextBox
		public	aThatIsNotAVali
		public	aThe_l
		public	aThisFeatureHas
		public	aTileChangeOutO
		public	aTiles_
		public	aTiles__0
		public	aTitle
		public	aTitle_cmf
		public	aTmp
		public	aTooManyActorsI
		public	aTooManyActorsT
		public	aTooManyBarrier
		public	aTooManyShootab
		public	aTport
		public	aTport_0
		public	aTulip
		public	aTulip_l
		public	aTulip_l_0
		public	aTulip_l_1
		public	aTulipl_l
		public	aTulipl_l_0
		public	aTulipr_l
		public	aTulipr_l_0
		public	aTurn_l
		public	aTurn_l_0
		public	aTurn_l_1
		public	aTurn_l_2
		public	aUndefinedScore
		public	aUnknownError
		public	aViewportHeight
		public	aViewportWidthT
		public	aVillans
		public	aVocNotFound
		public	aWb
		public	aWeed1_l
		public	aWeed1_l_0
		public	aWriteError
		public	aYes
		public	aYouMadeTheTop1
		public	aYouReInTheTop1
		public	aYourScore
		public	aZap
		public	aZap_0
		public	aZap_ud_l
		public	aZap_ud_l_0
		public	a_
		public	a__0
		public	a________
		public	a_cmf
		public	a_pcs
		public	a_pcx
		public	a_voc
		public	a_voc_0
		public	amandich
		public	aq
		public	arb
		public	asc_29B47
		public	asc_29B5E
		public	asc_29EFE
		public	asc_2A262
		public	asc_2A2B4
		public	asc_2A621
		public	asc_2A623
		public	asc_2B6CC
		public	byte_2B104
		public	byte_2B333
		public	byte_2B397
		public	byte_2B398
		public	byte_2B399
		public	byte_2B39A
		public	byte_2B39B
		public	byte_2B39C
		public	byte_2B39D
		public	byte_2B39E
		public	byte_2B39F
		public	byte_2B3A0
		public	byte_2B6DC
		public	byte_2D304
		public	byte_2D3AC
		public	byte_2D3AD
		public	byte_2D3AE
		public	byte_2D3BE
		public	byte_2D3C1
		public	byte_2D3C4
		public	byte_2D3C7
		public	byte_2D3C8
		public	byte_2D3C9
		public	byte_2D3CA
		public	byte_2D3CB
		public	byte_2D3CC
		public	byte_2D3CD
		public	byte_2D3CE
		public	byte_2D3CF
		public	byte_2D3D7
		public	byte_2D3E3
		public	byte_2D3E4
		public	byte_2D3E6
		public	byte_2D3E7
		public	byte_2D3E8
		public	byte_2D3E9
		public	byte_2D3EF
		public	byte_2D3F3
		public	byte_2D3F6
		public	byte_2D3F8
		public	byte_2D3FB
		public	byte_2D42D
		public	byte_2D47C
		public	byte_2D6E8
		public	byte_2D700
		public	byte_2D702
		public	dataseg@
		public	dbl_2A2C6
		public	dbl_2AF94
		public	dword_2D2F0
		public	dword_2D300
		public	first_time
		public	flt_29B10
		public	flt_2A2CE
		public	flt_2AF70
		public	flt_2AF90
		public	flt_2AFEC
		public	format
		public	fp_kbd_head
		public	fp_kbd_tail
		public	leftclipplanemask
		public	off_2826E
		public	off_28270
		public	off_284E0
		public	off_2B112
		public	off_2B3EE
		public	rightclipplanemask
		public	stru_2B114
		public	stru_2B128
		public	target_rgb
		public	tbyte_2AF9C
		public	tbyte_2AFA6
		public	tbyte_2AFB0
		public	tbyte_2AFBA
		public	tbyte_2AFC4
		public	tbyte_2AFCE
		public	tbyte_2AFD8
		public	tbyte_2AFE2
		public	ticks18_2
		public	tmp_rgb
		public	unk_2A7EC
		public	unk_2B6FA
		public	unk_2BFA0
		public	unk_2C0E0
		public	unk_2D2E6
		public	unk_2D6EA
		public	unk_2D704
		public	word_28262
		public	word_28264
		public	word_28266
		public	word_28268
		public	word_2826C
		public	word_2A700
		public	word_2B102
		public	word_2B326
		public	word_2B328
		public	word_2B3A1
		public	word_2B3A3
		public	word_2B3E0
		public	word_2B3E2
		public	word_2B3E4
		public	word_2B3EC
		public	word_2B3F0
		public	word_2B3F2
		public	word_2B3F4
		public	word_2B3F6
		public	word_2B6CE
		public	word_2B6D0
		public	word_2B724
		public	word_2B728
		public	word_2B75C
		public	word_2B78C
		public	word_2B818
		public	word_2B890
		public	word_2B8BC
		public	word_2B8CC
		public	word_2D66A
		public	_@button@
		public	_@file_box@
		public	_@gui_item@
		public	_@menu_bar@
		public	_@prompt_box@
		public	_@pull_down@
		public	_@text_box@
		public	_@text_pager@
		public	_AboutRiptide
		public	___8087
		public	____brklvl
		public	____signalptr
		public	___argc
		public	___argv
		public	___atexitcnt
		public	___atexittbl
		public	___c0argc
		public	___c0argv
		public	___c0environ
		public	___cchar
		public	___cflag
		public	___ctype
		public	___default87
		public	___doserrno
		public	___doserrortosv
		public	___envlng
		public	___envseg
		public	___envsize
		public	___exitbuf
		public	___exitfopen
		public	___exitopen
		public	___fmode
		public	___fpstklen
		public	___heapbase
		public	___heaptop
		public	___int0vector
		public	___int4vector
		public	___int5vector
		public	___int6vector
		public	___ldt
		public	___new_handler
		public	___nfile
		public	___notumask
		public	___openfd
		public	___osminor
		public	___protected
		public	___psp
		public	___realcvtvector
		public	___scantodvector
		public	___starttime
		public	___stklen
		public	___streams
		public	___version
		public	___video
		public	___wscroll
		public	__act
		public	__air_count
		public	__air_speed
		public	__air_supply
		public	__all_explosions
		public	__all_maps
		public	__all_messages
		public	__all_projectiles
		public	__all_secrets
		public	__all_teleports
		public	__auto_fire
		public	__auto_fire_count
		public	__barrel_msg
		public	__barrier_count
		public	__barrier_list
		public	__boss
		public	__cave_msg
		public	__cheat_mode
		public	__control
		public	__cur_map
		public	__cur_message
		public	__cur_sound
		public	__cur_sub
		public	__death_type
		public	__debug
		public	__debug_mode
		public	__debug_ptr
		public	__default_mouse
		public	__diff_x
		public	__diff_y
		public	__directvideo
		public	__disable_exit_routine
		public	__display
		public	__displayed_page
		public	__download_pos
		public	__ed_list
		public	__ed_list_size
		public	__ego
		public	__ego_map_h
		public	__ego_map_w
		public	__ego_x_speed
		public	__ego_y_speed
		public	__end_door_ptr
		public	__end_door_tile
		public	__enemies_killed
		public	__enemy_count
		public	__errno
		public	__exit_routine
		public	__external_open
		public	__external_read
		public	__finish_tile
		public	__force_pc_sound
		public	__g_handle
		public	__game_highs
		public	__game_in_progress
		public	__god_mode
		public	__goodies_found
		public	__goody_count
		public	__got_key
		public	__gr_keys
		public	__gr_old_int9
		public	__gun_count
		public	__gun_msg
		public	__gun_pieces_xy
		public	__gun_underbits
		public	__heavy_timer
		public	__high_score
		public	__i_external_button
		public	__i_external_down
		public	__i_external_left
		public	__i_external_right
		public	__i_external_up
		public	__isr
		public	__jason
		public	__jason_count
		public	__jason_fire
		public	__jason_msg
		public	__jason_on
		public	__jason_power
		public	__jason_present
		public	__jguage_underbits
		public	__m_dont_handle
		public	__map_exploded
		public	__map_messages
		public	__maximum_jason_power
		public	__maximum_text_length
		public	__men
		public	__menu_bar_height
		public	__message_count
		public	__message_posted
		public	__mode
		public	__mouse
		public	__new_map_name
		public	__non_displayed_page
		public	__old_palette
		public	__page_offsets
		public	__palette
		public	__pd_redraws
		public	__restart
		public	__resume
		public	__saw_title_screen
		public	__score
		public	__score_count
		public	__scrn
		public	__secret_tile
		public	__shld_supply
		public	__shootable_count
		public	__shootable_list
		public	__shot_count
		public	__shot_size
		public	__show_box
		public	__show_box_on
		public	__smart_missiles
		public	__space_bar_been_up
		public	__spare_palette
		public	__src
		public	__start_x
		public	__start_y
		public	__stop_room
		public	__stream
		public	__string
		public	__sys_errlist
		public	__sys_nerr
		public	__system_bench
		public	__system_font_ptr
		public	__tbl_mul80
		public	__tbl_mul_tw
		public	__tbl_tile_dst
		public	__tbl_tile_src
		public	__teleport_count
		public	__the_cast
		public	__the_game
		public	__the_map
		public	__the_menu_bar
		public	__theirhandler
		public	__tmp
		public	__tmp2
		public	__tmp3
		public	__top_fire
		public	__top_shot_count
		public	__worx_ax
		public	__worx_bx
		public	__worx_di
		public	__worx_dx
		public	__zapper_count
		public	__zoom_to_map
		public	_a1_0
		public	_aAdd
		public	_aAdd_0
		public	_aAdd_1
		public	_aAdd_2
		public	_aAddingALoopToG
		public	_aAddingActorToC
		public	_aAdlibCardNotPr
		public	_aAdlibCardNot_0
		public	_aAndPackMediaCo
		public	_aAreYouSureYo_0
		public	_aAreYouSureYouW
		public	_aArtwork
		public	_aAttemptToDivid
		public	_aAveryPack
		public	_aBacksub_l
		public	_aBacksub_l_0
		public	_aBadgrunt
		public	_aBadgrunt_0
		public	_aBadgrunt_1
		public	_aBadgrunt_2
		public	_aBarrel1_l
		public	_aBarrel1_l_0
		public	_aBarrel2_l
		public	_aBarrel2_l_0
		public	_aBarrel3_l
		public	_aBarrel3_l_0
		public	_aBlock2_l
		public	_aBlock2_l_0
		public	_aBlock_l
		public	_aBlock_l_0
		public	_aBonus1_l
		public	_aBonus1_l_0
		public	_aBonus2_l
		public	_aBonus2_l_0
		public	_aBonusX100
		public	_aBonusX50
		public	_aBosshit_l
		public	_aBosshit_l_0
		public	_aBs1_bdl_l
		public	_aBs1_bdl_l_0
		public	_aBs1_bdl_l_1
		public	_aBs1_bdl_l_2
		public	_aBs1_bdl_l_3
		public	_aBs1_bdr_l
		public	_aBs1_bdr_l_0
		public	_aBs1_bdr_l_1
		public	_aBs1dr_l
		public	_aBs1dr_l_0
		public	_aBs1dr_l_1
		public	_aBs2_bod_l
		public	_aBs2_bod_l_0
		public	_aBs2_bod_l_1
		public	_aBs2_tnl1_l
		public	_aBs2_tnl1_l_0
		public	_aBs2_tnl1_l_1
		public	_aBs2_tnl2_l
		public	_aBs2_tnl2_l_0
		public	_aBs2_tnl2_l_1
		public	_aBs2_tnr1_l
		public	_aBs2_tnr1_l_0
		public	_aBs2_tnr1_l_1
		public	_aBs2_tnr2_l
		public	_aBs2_tnr2_l_0
		public	_aBs2_tnr2_l_1
		public	_aBs3_arl_l
		public	_aBs3_arl_l_0
		public	_aBs3_arl_l_1
		public	_aBs3_arl_l_2
		public	_aBs3_arr_l
		public	_aBs3_arr_l_0
		public	_aBs3_arr_l_1
		public	_aBs3_arr_l_2
		public	_aBs3_bdl_l
		public	_aBs3_bdl_l_0
		public	_aBs3_bdl_l_1
		public	_aBs3_bdl_l_2
		public	_aBs3_bdr_l
		public	_aBs3_bdr_l_0
		public	_aBs3_bdr_l_1
		public	_aBs3_dthr_l
		public	_aBs3_dthr_l_0
		public	_aBs3_dthr_l_1
		public	_aBs3_facl_l
		public	_aBs3_facl_l_0
		public	_aBs3_facl_l_1
		public	_aBs3_facl_l_2
		public	_aBs3_facr_l
		public	_aBs3_facr_l_0
		public	_aBs3_facr_l_1
		public	_aBs3_facr_l_2
		public	_aBs3_prpl_l
		public	_aBs3_prpl_l_0
		public	_aBs3_prpl_l_1
		public	_aBs3_prpl_l_2
		public	_aBs3_prpr_l
		public	_aBs3_prpr_l_0
		public	_aBs3_prpr_l_1
		public	_aBs3_prpr_l_2
		public	_aBubbles2
		public	_aBubbles2_0
		public	_aBubbles2_1
		public	_aBubmd_l
		public	_aBubmd_l_0
		public	_aBubsm_l
		public	_aBubsm_l_0
		public	_aBytesFree
		public	_aBytesFreeLu
		public	_aCanTFindSong
		public	_aCancel
		public	_aCancel_0
		public	_aCannonl_l
		public	_aCannonl_l_0
		public	_aCannonr_l
		public	_aCannonr_l_0
		public	_aCannonr_l_1
		public	_aCastSize
		public	_aCatalog___
		public	_aCd
		public	_aCenterJoystick
		public	_aChain_l
		public	_aChain_l_0
		public	_aChain_l_1
		public	_aChangeDirector
		public	_aCharge
		public	_aCheatModeOnLet
		public	_aChest_l
		public	_aChest_l_0
		public	_aClam_l
		public	_aClam_l_0
		public	_aCoin_l
		public	_aCoin_l_0
		public	_aCoin_l_1
		public	_aCompaq
		public	_aComposerSoundE
		public	_aConfig_rip
		public	_aConfigrip
		public	_aControl
		public	_aCopyright1991B
		public	_aCopyrightC1994
		public	_aCouldnTOpen
		public	_aCouldnTOpenRip
		public	_aCrab_l
		public	_aCrab_l_0
		public	_aCrabdie_l
		public	_aCrabdie_l_0
		public	_aCreatingPcxH_0
		public	_aCreatingPcxHea
		public	_aCry
		public	_aDanFroelich
		public	_aDead
		public	_aDebugModeEnabl
		public	_aDebug_
		public	_aDebug_1
		public	_aDebug_2
		public	_aDesignAndProgr
		public	_aDirhit
		public	_aDirhit_0
		public	_aDirhit_1
		public	_aDirhit_2
		public	_aDirhit_3
		public	_aDivideErrorAbn
		public	_aDone
		public	_aDoor
		public	_aDoor_0
		public	_aDoor_ud_l
		public	_aDoor_ud_l_0
		public	_aDrillhi
		public	_aDrillhi_0
		public	_aDrillhi_1
		public	_aDrillhi_2
		public	_aDrillhi_3
		public	_aDrillhi_4
		public	_aDrillhi_5
		public	_aDrillhi_6
		public	_aDrillhi_7
		public	_aDuct_d_l
		public	_aDuct_d_l_0
		public	_aDuct_l_l
		public	_aDuct_l_l_0
		public	_aDuct_r_l
		public	_aDuct_r_l_0
		public	_aDuct_u_l
		public	_aDuct_u_l_0
		public	_aEgoXY
		public	_aEgodie2_l_0
		public	_aEgodie2_l_0_
		public	_aEgodie2_l_1
		public	_aElementNotOpen
		public	_aEndCurrentGame
		public	_aEndDoorSwitchW
		public	_aEnd_dr_l
		public	_aEnd_dr_l_0
		public	_aEnd_l
		public	_aEnemiesDestroy
		public	_aEnterName
		public	_aEnterNewPath
		public	_aEnterNewShotSi
		public	_aEnterPasswordB
		public	_aErrorLoadingPc
		public	_aErrorLookingFo
		public	_aErrorUpdatingG
		public	_aError_
		public	_aExit
		public	_aExp1
		public	_aExp2
		public	_aExp2_0
		public	_aExp2_1
		public	_aExp3_l
		public	_aExp3_l_0
		public	_aExp3_l_1
		public	_aExplg_l
		public	_aExpmd_l
		public	_aExpsm_l
		public	_aFFloatingPoint
		public	_aFace_l_l
		public	_aFace_l_l_0
		public	_aFace_r_l
		public	_aFace_r_l_0
		public	_aFast
		public	_aFast_0
		public	_aFaze
		public	_aFirbaldn_l
		public	_aFirbaldn_l_0
		public	_aFirbalup_l
		public	_aFirbalup_l_0
		public	_aFire1
		public	_aFire1_0
		public	_aFire2
		public	_aFire2_0
		public	_aFire2_1
		public	_aFire_pit_l
		public	_aFire_pit_l_0
		public	_aFireball_l
		public	_aFish1l_l
		public	_aFish1l_l_0
		public	_aFish1r_l
		public	_aFish1r_l_0
		public	_aFish1r_l_1
		public	_aFish1r_l_2
		public	_aFish2l_l
		public	_aFish2l_l_0
		public	_aFish2r_l
		public	_aFish2r_l_0
		public	_aFish2r_l_1
		public	_aFloatingPointE
		public	_aForcingPcSound
		public	_aFramesPerSecon
		public	_aFreemine_l
		public	_aFreemine_l_0
		public	_aGame
		public	_aGameControl
		public	_aGameControlIsC
		public	_aGameSound
		public	_aGameSoundsAreC
		public	_aGameSpeed
		public	_aGameSpeedIsCur
		public	_aGameSpeed_0
		public	_aGame_0
		public	_aGame_1
		public	_aGem_l
		public	_aGem_l_0
		public	_aGem_l_1
		public	_aGem_l_2
		public	_aGettingScreenB
		public	_aGodMode
		public	_aGodModeNowOn
		public	_aGoodies
		public	_aGotcha_l
		public	_aGotcha_l_0
		public	_aGotcha_l_1
		public	_aGun_1_l
		public	_aGun_1_l_0
		public	_aGun_2_l
		public	_aGun_2_l_0
		public	_aGun_3_l
		public	_aGun_3_l_0
		public	_aGun_4_l
		public	_aGun_4_l_0
		public	_aHelp
		public	_aHighScores___
		public	_aHigh_scr
		public	_aHuge
		public	_aInSearchOfDr_R
		public	_aInfo
		public	_aInitMap_
		public	_aInstructions__
		public	_aInvalidSecre_0
		public	_aInvalidSecretL
		public	_aJelly_l
		public	_aJelly_l_0
		public	_aJoy
		public	_aJoystick
		public	_aJoystickCalibr
		public	_aKey
		public	_aKey_l
		public	_aKey_l_0
		public	_aKeyboard
		public	_aLetsrip
		public	_aLoadingLoop_
		public	_aLoadingMap_
		public	_aLoadingPcxFi_0
		public	_aLoadingPcxFile
		public	_aLogos_pcx
		public	_aLoopDoesNotExi
		public	_aLoopStorageFul
		public	_aMapHeight
		public	_aMapWidth
		public	_aMedium
		public	_aMelGuymon
		public	_aMine_l
		public	_aMine_l_0
		public	_aMore
		public	_aMouse_l
		public	_aMouse_l_0
		public	_aMreal_l
		public	_aMreal_l_0
		public	_aMsg_bar_l
		public	_aMsg_cave_l
		public	_aMsg_gun_l
		public	_aMsg_jasn_l
		public	_aMsl_arwl_l
		public	_aMsl_arwr_l
		public	_aMsl_bg2l_l
		public	_aMsl_bg2r_l
		public	_aMsl_bigl_l
		public	_aMsl_bigr_l
		public	_aMsl_hbl_l
		public	_aMsl_hbr_l
		public	_aMsl_inkl_l
		public	_aMsl_inkl_l_0
		public	_aMsl_inkr_l
		public	_aMsl_inkr_l_0
		public	_aMsl_pea_l
		public	_aMsl_red_l
		public	_aMsl_rkl_l
		public	_aMsl_rkr_l
		public	_aMsl_sm_l
		public	_aMsl_spt_l
		public	_aMsl_str_l
		public	_aMsl_top_l
		public	_aMsl_top_l_0
		public	_aMsl_tpl_l
		public	_aMsl_tpr_l
		public	_aNewPassword
		public	_aNewSettingq
		public	_aNo
		public	_aNotAValidPath_
		public	_aNotInModeXAbor
		public	_aNull
		public	_aOff
		public	_aOff_
		public	_aOk
		public	_aOk_0
		public	_aOk_1
		public	_aOk_2
		public	_aOn
		public	_aOn_
		public	_aOpenFile
		public	_aOtis_l
		public	_aOtiseyes_l
		public	_aOtiseyes_l_0
		public	_aOtiseyes_l_1
		public	_aOutOfHeap
		public	_aP_death1_pcx
		public	_aP_death2_pcx
		public	_aP_frame_pcx
		public	_aP_highs_pcx
		public	_aP_stats_pcx
		public	_aP_title_pcx
		public	_aPaletteCycleNo
		public	_aPassword
		public	_aPassword_0
		public	_aPat1_l
		public	_aPat1_l_0
		public	_aPat1_l_1
		public	_aPcsound
		public	_aPiece_1_l
		public	_aPiece_1_l_0
		public	_aPiece_2_l
		public	_aPiece_2_l_0
		public	_aPiece_3_l
		public	_aPiece_3_l_0
		public	_aPiece_4_l
		public	_aPiece_4_l_0
		public	_aPing
		public	_aPing_0
		public	_aPing_1
		public	_aPing_2
		public	_aPirana
		public	_aPirana_0
		public	_aPirana_1
		public	_aPirana_2
		public	_aPirana_3
		public	_aPiranal_l
		public	_aPiranal_l_0
		public	_aPiranal_l_1
		public	_aPiranar_l
		public	_aPiranar_l_0
		public	_aPiranar_l_1
		public	_aPlaySong___
		public	_aPlunk2
		public	_aPlunk2_0
		public	_aPlunk2_1
		public	_aPod1_l
		public	_aPod1_l_0
		public	_aPod2_l
		public	_aPod2_l_0
		public	_aPrelude_l
		public	_aPrint
		public	_aPrinterError_C
		public	_aProbel_l
		public	_aProbel_l_0
		public	_aProbel_l_1
		public	_aProber_l
		public	_aProber_l_0
		public	_aProber_l_1
		public	_aProber_l_2
		public	_aProbspin_l
		public	_aProbspin_l_0
		public	_aProducer
		public	_aPu_1up_l
		public	_aPu_1up_l_0
		public	_aPu_air_l
		public	_aPu_air_l_0
		public	_aPu_auto_l
		public	_aPu_auto_l_0
		public	_aPu_auto_l_1
		public	_aPu_fire_l
		public	_aPu_fire_l_0
		public	_aPu_fire_l_1
		public	_aPu_jason_l
		public	_aPu_jason_l_0
		public	_aPu_jason_l_1
		public	_aPu_jf_l
		public	_aPu_jf_l_0
		public	_aPu_jwl1_l
		public	_aPu_key_l
		public	_aPu_key_l_0
		public	_aPu_shld_l
		public	_aPu_shld_l_0
		public	_aPu_shld_l_1
		public	_aPu_top_l
		public	_aPu_top_l_0
		public	_aPup
		public	_aPup2
		public	_aPup2_0
		public	_aPup2_1
		public	_aPup2_2
		public	_aPup2_3
		public	_aPupNotDefined
		public	_aPup_0
		public	_aPup_1
		public	_aQuit
		public	_aREGISTERED
		public	_aRaoulSaid
		public	_aReadError
		public	_aRequestToOpenM
		public	_aReset
		public	_aResume
		public	_aResume_0
		public	_aResume_1
		public	_aRiptideRegiste
		public	_aRiptideRequi_0
		public	_aRiptideRequire
		public	_aRiptide_dat
		public	_aRiptide_pcx
		public	_aRiptide_pcxHas
		public	_aRiptide_pcx_0
		public	_aRscFile_
		public	_aRunBenchmark
		public	_aRunBenchmark_0
		public	_aRunBenchmark_1
		public	_aS
		public	_aSS
		public	_aSS_0
		public	_aSavingMap_
		public	_aScan
		public	_aScr_1000_l
		public	_aScr_1000_l_0
		public	_aScr_100_l
		public	_aScr_100_l_0
		public	_aScr_2000_l
		public	_aScr_2000_l_0
		public	_aScr_3000_l
		public	_aScr_3000_l_0
		public	_aScr_4000_l
		public	_aScr_4000_l_0
		public	_aScr_500_l
		public	_aScr_500_l_0
		public	_aScream
		public	_aSerp_l_l
		public	_aSerp_l_l_0
		public	_aSerp_l_l_1
		public	_aSerp_r_l
		public	_aSerp_r_l_0
		public	_aSerp_r_l_1
		public	_aSerpdie_l
		public	_aSerpdie_l_0
		public	_aSetup
		public	_aSharkdie_l
		public	_aSharkdie_l_0
		public	_aSharkdie_l_1
		public	_aSharkl_l
		public	_aSharkl_l_0
		public	_aSharkl_l_1
		public	_aSharkl_l_2
		public	_aSharkr_l
		public	_aSharkr_l_0
		public	_aSharkr_l_1
		public	_aSharkr_l_2
		public	_aShipl_l
		public	_aShipl_l_0
		public	_aShipl_l_1
		public	_aShipr_l
		public	_aShipr_l_0
		public	_aShipr_l_1
		public	_aShotSize
		public	_aShotSize___
		public	_aShowStats
		public	_aShpbmb_l
		public	_aShpbmb_l_0
		public	_aShutl_l_l
		public	_aShutl_l_l_0
		public	_aShutl_l_l_1
		public	_aShutl_r_l
		public	_aShutl_r_l_0
		public	_aSlow
		public	_aSlow_0
		public	_aSmall
		public	_aSmash
		public	_aSmash_0
		public	_aSndNotInStorag
		public	_aSound
		public	_aSoundStorageFu
		public	_aSoundblasterDe
		public	_aSpikes_d_l
		public	_aSpikes_d_l_0
		public	_aSpikes_u_l
		public	_aSpikes_u_l_0
		public	_aSplat_l
		public	_aSprtStorage
		public	_aSqueek
		public	_aStart
		public	_aStartActIi
		public	_aStartGameFromB
		public	_aStart_0
		public	_aStats_cmf
		public	_aStatue_l
		public	_aStatue_l_0
		public	_aStopSong
		public	_aStory___
		public	_aSubl_l
		public	_aSubl_l_0
		public	_aSubl_l_1
		public	_aSubl_l_2
		public	_aSubr_l
		public	_aSubr_l_0
		public	_aSubr_l_1
		public	_aSubr_l_2
		public	_aSubr_l_3
		public	_aSum
		public	_aSum_0
		public	_aSum_1
		public	_aSum_2
		public	_aSwish
		public	_aSwish_0
		public	_aSwish_1
		public	_aSwitch_l
		public	_aSwitch_l_0
		public	_aSystemBench
		public	_aT_cat_txt
		public	_aT_exit_txt
		public	_aT_help_txt
		public	_aT_inst_txt
		public	_aT_story_txt
		public	_aTent_in_l
		public	_aTent_in_l_0
		public	_aTent_out_l
		public	_aTent_out_l_0
		public	_aTent_out_l_1
		public	_aTextBox
		public	_aThatIsNotAVali
		public	_aThe_l
		public	_aThisFeatureHas
		public	_aTileChangeOutO
		public	_aTiles_
		public	_aTiles__0
		public	_aTitle
		public	_aTitle_cmf
		public	_aTmp
		public	_aTooManyActorsI
		public	_aTooManyActorsT
		public	_aTooManyBarrier
		public	_aTooManyShootab
		public	_aTport
		public	_aTport_0
		public	_aTulip
		public	_aTulip_l
		public	_aTulip_l_0
		public	_aTulip_l_1
		public	_aTulipl_l
		public	_aTulipl_l_0
		public	_aTulipr_l
		public	_aTulipr_l_0
		public	_aTurn_l
		public	_aTurn_l_0
		public	_aTurn_l_1
		public	_aTurn_l_2
		public	_aUndefinedScore
		public	_aUnknownError
		public	_aViewportHeight
		public	_aViewportWidthT
		public	_aVillans
		public	_aVocNotFound
		public	_aWb
		public	_aWeed1_l
		public	_aWeed1_l_0
		public	_aWriteError
		public	_aYes
		public	_aYouMadeTheTop1
		public	_aYouReInTheTop1
		public	_aYourScore
		public	_aZap
		public	_aZap_0
		public	_aZap_ud_l
		public	_aZap_ud_l_0
		public	_a_
		public	_a__0
		public	_a________
		public	_a_cmf
		public	_a_pcs
		public	_a_pcx
		public	_a_voc
		public	_a_voc_0
		public	_amandich
		public	_aq
		public	_arb
		public	_asc_29B47
		public	_asc_29B5E
		public	_asc_29EFE
		public	_asc_2A262
		public	_asc_2A2B4
		public	_asc_2A621
		public	_asc_2A623
		public	_asc_2B6CC
		public	_byte_2B104
		public	_byte_2B333
		public	_byte_2B397
		public	_byte_2B398
		public	_byte_2B399
		public	_byte_2B39A
		public	_byte_2B39B
		public	_byte_2B39C
		public	_byte_2B39D
		public	_byte_2B39E
		public	_byte_2B39F
		public	_byte_2B3A0
		public	_byte_2B6DC
		public	_byte_2D304
		public	_byte_2D3AC
		public	_byte_2D3AD
		public	_byte_2D3AE
		public	_byte_2D3BE
		public	_byte_2D3C1
		public	_byte_2D3C4
		public	_byte_2D3C7
		public	_byte_2D3C8
		public	_byte_2D3C9
		public	_byte_2D3CA
		public	_byte_2D3CB
		public	_byte_2D3CC
		public	_byte_2D3CD
		public	_byte_2D3CE
		public	_byte_2D3CF
		public	_byte_2D3D7
		public	_byte_2D3E3
		public	_byte_2D3E4
		public	_byte_2D3E6
		public	_byte_2D3E7
		public	_byte_2D3E8
		public	_byte_2D3E9
		public	_byte_2D3EF
		public	_byte_2D3F3
		public	_byte_2D3F6
		public	_byte_2D3F8
		public	_byte_2D3FB
		public	_byte_2D42D
		public	_byte_2D47C
		public	_byte_2D6E8
		public	_byte_2D700
		public	_byte_2D702
		public	_dataseg@
		public	_dbl_2A2C6
		public	_dbl_2AF94
		public	_dword_2D2F0
		public	_dword_2D300
		public	_first_time
		public	_flt_29B10
		public	_flt_2A2CE
		public	_flt_2AF70
		public	_flt_2AF90
		public	_flt_2AFEC
		public	_format
		public	_fp_kbd_head
		public	_fp_kbd_tail
		public	_leftclipplanemask
		public	_off_2826E
		public	_off_28270
		public	_off_284E0
		public	_off_2B112
		public	_off_2B3EE
		public	_rightclipplanemask
		public	_stru_2B114
		public	_stru_2B128
		public	_target_rgb
		public	_tbyte_2AF9C
		public	_tbyte_2AFA6
		public	_tbyte_2AFB0
		public	_tbyte_2AFBA
		public	_tbyte_2AFC4
		public	_tbyte_2AFCE
		public	_tbyte_2AFD8
		public	_tbyte_2AFE2
		public	_ticks18_2
		public	_tmp_rgb
		public	_unk_2A7EC
		public	_unk_2B6FA
		public	_unk_2BFA0
		public	_unk_2C0E0
		public	_unk_2D2E6
		public	_unk_2D6EA
		public	_unk_2D704
		public	_word_28262
		public	_word_28264
		public	_word_28266
		public	_word_28268
		public	_word_2826C
		public	_word_2A700
		public	_word_2B102
		public	_word_2B326
		public	_word_2B328
		public	_word_2B3A1
		public	_word_2B3A3
		public	_word_2B3E0
		public	_word_2B3E2
		public	_word_2B3E4
		public	_word_2B3EC
		public	_word_2B3F0
		public	_word_2B3F2
		public	_word_2B3F4
		public	_word_2B3F6
		public	_word_2B6CE
		public	_word_2B6D0
		public	_word_2B724
		public	_word_2B728
		public	_word_2B75C
		public	_word_2B78C
		public	_word_2B818
		public	_word_2B890
		public	_word_2B8BC
		public	_word_2B8CC
		public	_word_2D66A

seg0000		segment	byte public 'CODE' use16
seg0000		ends

seg03f9		segment	byte public 'CODE' use16
seg03f9		ends

seg137f		segment	byte public 'CODE' use16
seg137f		ends


; ---- segment seg2608 ----
seg2608		segment	para public 'DATA' use16
		assume cs:seg2608
dataseg@	dw 0			; DATA XREF: sub_3FBF+20r sub_2782F+6w ...
word_28262	dw 0			; DATA XREF: seg2333:1DEDr
					; seg2333:1E00w ...
word_28264	dw 6F42h		; DATA XREF: _farmalloc+71o
					; seg2333:22CBw ...
word_28266	dw 6C72h		; DATA XREF: e087_trap+9r
					; e087_trap+39r ...
word_28268	dw 6E61h		; DATA XREF: e087_trap+111w
		dw 2064h
word_2826C	dw 2B43h		; DATA XREF: seg2333:0801r
					; seg2333:0823r ...
off_2826E	dw offset loc_420A+1	; DATA XREF: sub_333C+17r
					; sub_27A82+B2r ...
off_28270	dw offset sub_420D	; DATA XREF: sub_27843+6r sub_278C7r ...
aCopyright1991B	db 'Copyright 1991 Borland Intl.',0
aDivideErrorAbn	db 'Divide error',0Dh,0Ah ; DATA XREF: e087_trap+77w
					; e087_trap+7Cw ...
		db 'Abnormal program termination',0Dh,0Ah
__int0vector	dd 0			; DATA XREF: sub_235D+6w
					; __restorezero+4r ...
__int4vector	dd 0			; DATA XREF: sub_235D+13w
					; __restorezero+Fr ...
__int5vector	dd 0			; DATA XREF: sub_235D+20w
					; __restorezero+1Ar ...
__int6vector	dd 0			; DATA XREF: sub_235D+2Dw
					; __restorezero+25r ...
; int _c0argc
__c0argc	dw 0			; DATA XREF: start+148r
					; unknown_libname_3+116w
; char **_c0argv
__c0argv	dd 0			; DATA XREF: start+144r
					; unknown_libname_3+122w ...
; char **_c0environ
__c0environ	dd 0			; DATA XREF: start+13Cr start+138r
__envlng	dw 0			; DATA XREF: start+46w
					; unknown_libname_3+2Br
__envseg	dw 0			; DATA XREF: start+1Dw	start+28r ...
__envsize	dw 0			; DATA XREF: start+55w
; unsigned int _psp
__psp		dw 0			; DATA XREF: start+19w	start+8Dr ...
; unsigned int _version
__version	db 0			; DATA XREF: start+16w	start+C5r ...
; unsigned __int8 _osminor
__osminor	db 0			; DATA XREF: start+CEr
; int errno
_errno		dw 0			; DATA XREF: __ioerror:loc_2F48w
					; _perror+6r ...
__starttime	dd 0			; DATA XREF: start+110w _clock+3Dr ...
___brklvl	dw offset unk_2D704
__heapbase	dd 0			; DATA XREF: __brk+7r sub_420D+13r ...
__brklvl	dd 0			; DATA XREF: sub_4120+22w __sbrk+10r ...
__heaptop	dd 0			; DATA XREF: sub_4120+69w __brk+1Ar ...
		db 0
_gun_pieces_xy	db  80h	; 
		db  97h	; 
		db  92h	; 
		db  97h	; 
		db  9Ch	; 
		db  97h	; 
		db 0ABh	; «
		db  97h	; 
_all_messages	dd aYouNeedTheKeyF	; "You need the	key for	this door."
		dd aYouGotTheKey	; "You got the key!"
		dd aThink		; "Think!"
		dd aExtraFirePower	; "Extra fire power added!"
		dd aAutoFireAdded	; "Auto-fire added!"
		dd aWarningAirIsLo	; "WARNING: Air	is low."
		dd aWatchOutForTho	; "Watch out for those piranas!"
		dd aTryGoingInThat	; "Try going in	that drain hole!"
		dd aWarningJasonPo	; "WARNING: JASON power	low."
		dd aWarningShieldI	; "WARNING: Shield is low."
		dd aShootTheBarrel	; "Shoot the barrels!  They may\ncontain g"...
		dd aYouGotTheJason	; "You got the JASON sub!  To\ncontrol the"...
		dd aCollectAllTheW	; "Collect all the weapon\npieces to get t"...
		dd aToEnterACavePr	; "To enter a cave press\nAlt or Ctrl."
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_all_projectiles dd aFire1_1		; "fire1"
		dd aMsl_sm_l_0		; "msl_sm.l"
		dd aMsl_sm_l_1		; "msl_sm.l"
		db 1
		db 0Ah
		db 0
		db    0
		dw 0
		dw 0
		db 1
		db    0
		dd aFire1_2		; "fire1"
		dd aMsl_tpl_l_0		; "msl_tpl.l"
		dd aMsl_tpr_l_0		; "msl_tpr.l"
		db    2
		db  0Ch
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		dd aFire2_2		; "fire2"
		dd aMsl_rkl_l_0		; "msl_rkl.l"
		dd aMsl_rkr_l_0		; "msl_rkr.l"
		db    4
		db  0Eh
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		dd aFire2_3		; "fire2"
		dd aMsl_bigl_l_0	; "msl_bigl.l"
		dd aMsl_bigr_l_0	; "msl_bigr.l"
		db    6
		db  0Ah
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		dd aFire2_4		; "fire2"
		dd aMsl_hbl_l_0		; "msl_hbl.l"
		dd aMsl_hbr_l_0		; "msl_hbr.l"
		db  0Ah
		db  0Fh
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd aFire2_5		; "fire2"
		dd aMsl_str_l_0		; "msl_str.l"
		dd aMsl_str_l_1		; "msl_str.l"
		db    6
		db  0Eh
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd aTulip_0		; "tulip"
		dd aMsl_pea_l_0		; "msl_pea.l"
		dd aMsl_pea_l_1		; "msl_pea.l"
		db    7
		db    8
		db    0
		db    0
		dd aDirhit_4		; "dirhit"
		db    0
		db    0
		dd aFire1_3		; "fire1"
		dd aMsl_spt_l_0		; "msl_spt.l"
		dd aMsl_spt_l_1		; "msl_spt.l"
		db    6
		db    5
		db    0
		db    0
		dd aDirhit_5		; "dirhit"
		db 0
		db    0
		dd aSwish_2		; "swish"
		dd aMsl_arwl_l_0	; "msl_arwl.l"
		dd aMsl_arwr_l_0	; "msl_arwr.l"
		db    5
		db    8
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd aFire1_4		; "fire1"
		dd aMsl_red_l_0		; "msl_red.l"
		dd aMsl_red_l_1		; "msl_red.l"
		db    7
		db    5
		db    0
		db    0
		dd aDirhit_6		; "dirhit"
		db 0
		db    0
		dd aFaze_0		; "faze"
		dd aMsl_bg2l_l_0	; "msl_bg2l.l"
		dd aMsl_bg2r_l_0	; "msl_bg2r.l"
		db    9
		db    8
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd aFire2_6		; "fire2"
		dd aMsl_inkl_l_1	; "msl_inkl.l"
		dd aMsl_inkr_l_1	; "msl_inkr.l"
		db    9
		db    6
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_all_explosions	dd aExpsm_l_0		; "expsm.l"
		dd aExp1_0		; "exp1"
		dd aExpmd_l_0		; "expmd.l"
		dd aExp1_1		; "exp1"
		dd aExplg_l_0		; "explg.l"
		dd aExp2_2		; "exp2"
		dd aSplat_l_0		; "splat.l"
		dd aExp1_2		; "exp1"
		dd aSplat_l_1		; "splat.l"
		dd aExp1_3		; "exp1"
		dd aBosshit_l_1		; "bosshit.l"
		dd aExp2_3		; "exp2"
_all_secrets	db  16h
		db    4
		db  17h
		db    9
_all_maps	dd a11_m		; "1-1.m"
		dd a1_cmf		; "1.cmf"
		dd a1			; "1"
		dd aShallowSea		; "Shallow Sea"
		dd 0
		dd a12_m		; "1-2.m"
		dd a2_cmf		; "2.cmf"
		dd aUr2gd		; "UR2GD"
		dd aMicroMenace		; "Micro Menace"
		dd 0
		dd a13_m		; "1-3.m"
		dd a3_cmf		; "3.cmf"
		dd aUrgr8		; "URGR8"
		dd aTulipTango		; "Tulip Tango"
		dd 0
		dd a14_m		; "1-4.m"
		dd a1_cmf_0		; "1.cmf"
		dd a4good		; "4GOOD"
		dd aRedTide		; "Red Tide"
		dd 0
		dd a15_m		; "1-5.m"
		dd a2_cmf_0		; "2.cmf"
off_284E0	dd a2much4u		; DATA XREF: show_prelude(void)+126o
					; show_prelude(void)+210o
					; "2MUCH4U"
		dd aFathomsOfTeeth	; "Fathoms of Teeth"
		dd 0
		dd a16_m		; "1-6.m"
		dd a3_cmf_0		; "3.cmf"
off_284F4	dd aAce			; "ACE"
		dd aThinkTank		; "Think Tank"
		dd 0
		dd aBs1_m		; "bs1.m"
		dd a5_cmf		; "5.cmf"
		dd aBs1			; "BS1"
		dd aOscarSLair		; "Oscar's Lair"
		dd @bs1_start_up$qv	; bs1_start_up(void)
		dd a21_m		; "2-1.m"
		dd aOxygen_cmf		; "oxygen.cmf"
		dd aDnundr		; "DNUNDR"
		dd aAtlantis		; "Atlantis"
		dd 0
		dd a22_m		; "2-2.m"
		dd a4_cmf		; "4.cmf"
		dd aOut2gtu		; "OUT2GTU"
		dd aAquaTremendom	; "Aqua	Tremendom"
		dd 0
		dd a23_m		; "2-3.m"
		dd aBossa_cmf		; "bossa.cmf"
		dd aAic			; "AIC"
		dd aSpawningWaters	; "Spawning Waters"
		dd 0
		dd a24_m		; "2-4.m"
		dd a1_cmf_1		; "1.cmf"
off_28558	dd aHang10		; "HANG10"
		dd aJasonQuest		; "JASON Quest"
		dd 0
		dd a25_m		; "2-5.m"
		dd aWeerd_cmf		; "weerd.cmf"
		dd aRun4it		; "RUN4IT"
		dd aFranticAttack	; "Frantic Attack"
		dd 0
		dd aBs2_m		; "bs2.m"
		dd aChaos_cmf		; "chaos.cmf"
		dd aBs2			; "BS2"
		dd aEnterOtis		; "Enter Otis"
		dd @bs2_start_up$qv	; bs2_start_up(void)
		dd a31_m		; "3-1.m"
		dd a1_cmf_2		; "1.cmf"
		dd aGetit		; "GETIT"
		dd aSeaEscape		; "Sea Escape"
		dd 0
		dd a32_m		; "3-2.m"
		dd aOxygen_cmf_0	; "oxygen.cmf"
		dd aUrinde		; "URINDE"
		dd aDeepEnigma		; "Deep	Enigma"
		dd 0
		dd a33_m		; "3-3.m"
		dd a4_cmf_0		; "4.cmf"
		dd aSos			; "SOS"
		dd aSinkOrSwim		; "Sink	or Swim"
		dd 0
		dd a34_m		; "3-4.m"
		dd a3_cmf_1		; "3.cmf"
		dd aRun2me		; "RUN2ME"
		dd aMarathon		; "Marathon"
		db    0
		db    0
		db    0
		db    0
		dd a35_m		; "3-5.m"
		dd aChaos_cmf_0		; "chaos.cmf"
		dd a512tr		; "512TR"
		dd aLabRynth		; "Lab Rynth"
		db 0
		db    0
		db    0
		db    0
		dd a36_m		; "3-6.m"
		dd aTurn_cmf		; "turn.cmf"
		dd a2b4udy		; "2B4UDY"
off_285FC	dd aAbyssOfPeril	; "Abyss of Peril"
		db    0
		db    0
		db    0
		db    0
		dd a37_m		; "3-7.m"
		dd a2_cmf_1		; "2.cmf"
		dd aHoh			; "HOH"
		dd aHallsOfHell		; "Halls of Hell"
		db 0
		db    0
		db    0
		db    0
		dd a38_m		; "3-8.m"
		dd aOxygen_cmf_1	; "oxygen.cmf"
		dd aRip			; "RIP"
		dd aMysteriousMaze	; "Mysterious Maze"
		db    0
		db    0
		db    0
		db    0
		dd aBs3_m		; "bs3.m"
		dd a5_cmf_0		; "5.cmf"
		dd aBs3			; "BS3"
		dd aConfrontation	; "Confrontation"
		dd @bs3_start_up$qv	; bs3_start_up(void)
		dd aSec1_m		; "sec1.m"
		dd a4_cmf_1		; "4.cmf"
		dd aSec1		; "SEC1"
		dd aOutpostEnigma	; "Outpost Enigma"
		db    0
		db    0
		db    0
		db    0
		dd aSec2_m		; "sec2.m"
		dd aWeerd_cmf_0		; "weerd.cmf"
		dd aSec2		; "SEC2"
		dd aqqqqqq		; "??????"
		db 0
		db    0
		db    0
		db    0
aYouNeedTheKeyF	db 'You need the key for this door.',0 ; DATA XREF: seg2608:_all_messageso
aYouGotTheKey	db 'You got the key!',0 ; DATA XREF: seg2608:00A0o
aThink		db 'Think!',0           ; DATA XREF: seg2608:00A4o
aExtraFirePower	db 'Extra fire power added!',0 ; DATA XREF: seg2608:00A8o
aAutoFireAdded	db 'Auto-fire added!',0 ; DATA XREF: seg2608:00ACo
aWarningAirIsLo	db 'WARNING: Air is low.',0 ; DATA XREF: seg2608:00B0o
aWatchOutForTho	db 'Watch out for those piranas!',0 ; DATA XREF: seg2608:00B4o
aTryGoingInThat	db 'Try going in that drain hole!',0 ; DATA XREF: seg2608:00B8o
aWarningJasonPo	db 'WARNING: JASON power low.',0 ; DATA XREF: seg2608:00BCo
aWarningShieldI	db 'WARNING: Shield is low.',0 ; DATA XREF: seg2608:00C0o
aShootTheBarrel	db 'Shoot the barrels!  They may',0Ah ; DATA XREF: seg2608:00C4o
		db 'contain goodies or enemies.',0
aYouGotTheJason	db 'You got the JASON sub!  To',0Ah ; DATA XREF: seg2608:00C8o
		db 'control the JASON sub',0Ah
		db ' press Alt or Ctrl.',0
aCollectAllTheW	db 'Collect all the weapon',0Ah ; DATA XREF: seg2608:00CCo
		db 'pieces to get the Super Gun!',0
aToEnterACavePr	db 'To enter a cave press',0Ah ; DATA XREF: seg2608:00D0o
		db 'Alt or Ctrl.',0
aFire1_1	db 'fire1',0            ; DATA XREF: seg2608:_all_projectileso
aMsl_sm_l_0	db 'msl_sm.l',0         ; DATA XREF: seg2608:00F0o
aMsl_sm_l_1	db 'msl_sm.l',0         ; DATA XREF: seg2608:00F4o
aFire1_2	db 'fire1',0            ; DATA XREF: seg2608:0102o
aMsl_tpl_l_0	db 'msl_tpl.l',0        ; DATA XREF: seg2608:0106o
aMsl_tpr_l_0	db 'msl_tpr.l',0        ; DATA XREF: seg2608:010Ao
aFire2_2	db 'fire2',0            ; DATA XREF: seg2608:0118o
aMsl_rkl_l_0	db 'msl_rkl.l',0        ; DATA XREF: seg2608:011Co
aMsl_rkr_l_0	db 'msl_rkr.l',0        ; DATA XREF: seg2608:0120o
aFire2_3	db 'fire2',0            ; DATA XREF: seg2608:012Eo
aMsl_bigl_l_0	db 'msl_bigl.l',0       ; DATA XREF: seg2608:0132o
aMsl_bigr_l_0	db 'msl_bigr.l',0       ; DATA XREF: seg2608:0136o
aFire2_4	db 'fire2',0            ; DATA XREF: seg2608:0144o
aMsl_hbl_l_0	db 'msl_hbl.l',0        ; DATA XREF: seg2608:0148o
aMsl_hbr_l_0	db 'msl_hbr.l',0        ; DATA XREF: seg2608:014Co
aFire2_5	db 'fire2',0            ; DATA XREF: seg2608:015Ao
aMsl_str_l_0	db 'msl_str.l',0        ; DATA XREF: seg2608:015Eo
aMsl_str_l_1	db 'msl_str.l',0        ; DATA XREF: seg2608:0162o
aTulip_0	db 'tulip',0            ; DATA XREF: seg2608:0170o
aMsl_pea_l_0	db 'msl_pea.l',0        ; DATA XREF: seg2608:0174o
aMsl_pea_l_1	db 'msl_pea.l',0        ; DATA XREF: seg2608:0178o
aDirhit_4	db 'dirhit',0           ; DATA XREF: seg2608:0180o
aFire1_3	db 'fire1',0            ; DATA XREF: seg2608:0186o
aMsl_spt_l_0	db 'msl_spt.l',0        ; DATA XREF: seg2608:018Ao
aMsl_spt_l_1	db 'msl_spt.l',0        ; DATA XREF: seg2608:018Eo
aDirhit_5	db 'dirhit',0           ; DATA XREF: seg2608:0196o
aSwish_2	db 'swish',0            ; DATA XREF: seg2608:019Co
aMsl_arwl_l_0	db 'msl_arwl.l',0       ; DATA XREF: seg2608:01A0o
aMsl_arwr_l_0	db 'msl_arwr.l',0       ; DATA XREF: seg2608:01A4o
aFire1_4	db 'fire1',0            ; DATA XREF: seg2608:01B2o
aMsl_red_l_0	db 'msl_red.l',0        ; DATA XREF: seg2608:01B6o
aMsl_red_l_1	db 'msl_red.l',0        ; DATA XREF: seg2608:01BAo
aDirhit_6	db 'dirhit',0           ; DATA XREF: seg2608:01C2o
aFaze_0		db 'faze',0             ; DATA XREF: seg2608:01C8o
aMsl_bg2l_l_0	db 'msl_bg2l.l',0       ; DATA XREF: seg2608:01CCo
aMsl_bg2r_l_0	db 'msl_bg2r.l',0       ; DATA XREF: seg2608:01D0o
aFire2_6	db 'fire2',0            ; DATA XREF: seg2608:01DEo
aMsl_inkl_l_1	db 'msl_inkl.l',0       ; DATA XREF: seg2608:01E2o
aMsl_inkr_l_1	db 'msl_inkr.l',0       ; DATA XREF: seg2608:01E6o
aExpsm_l_0	db 'expsm.l',0          ; DATA XREF: seg2608:_all_explosionso
aExp1_0		db 'exp1',0             ; DATA XREF: seg2608:01F8o
aExpmd_l_0	db 'expmd.l',0          ; DATA XREF: seg2608:01FCo
aExp1_1		db 'exp1',0             ; DATA XREF: seg2608:0200o
aExplg_l_0	db 'explg.l',0          ; DATA XREF: seg2608:0204o
aExp2_2		db 'exp2',0             ; DATA XREF: seg2608:0208o
aSplat_l_0	db 'splat.l',0          ; DATA XREF: seg2608:020Co
aExp1_2		db 'exp1',0             ; DATA XREF: seg2608:0210o
aSplat_l_1	db 'splat.l',0          ; DATA XREF: seg2608:0214o
aExp1_3		db 'exp1',0             ; DATA XREF: seg2608:0218o
aBosshit_l_1	db 'bosshit.l',0        ; DATA XREF: seg2608:021Co
aExp2_3		db 'exp2',0             ; DATA XREF: seg2608:0220o
a11_m		db '1-1.m',0            ; DATA XREF: seg2608:_all_mapso
a1_cmf		db '1.cmf',0            ; DATA XREF: seg2608:022Co
a1		db '1',0                ; DATA XREF: seg2608:0230o
aShallowSea	db 'Shallow Sea',0      ; DATA XREF: seg2608:0234o
a12_m		db '1-2.m',0            ; DATA XREF: seg2608:023Co
a2_cmf		db '2.cmf',0            ; DATA XREF: seg2608:0240o
aUr2gd		db 'UR2GD',0            ; DATA XREF: seg2608:0244o
aMicroMenace	db 'Micro Menace',0     ; DATA XREF: seg2608:0248o
a13_m		db '1-3.m',0            ; DATA XREF: seg2608:0250o
a3_cmf		db '3.cmf',0            ; DATA XREF: seg2608:0254o
aUrgr8		db 'URGR8',0            ; DATA XREF: seg2608:0258o
aTulipTango	db 'Tulip Tango',0      ; DATA XREF: seg2608:025Co
a14_m		db '1-4.m',0            ; DATA XREF: seg2608:0264o
a1_cmf_0	db '1.cmf',0            ; DATA XREF: seg2608:0268o
a4good		db '4GOOD',0            ; DATA XREF: seg2608:026Co
aRedTide	db 'Red Tide',0         ; DATA XREF: seg2608:0270o
a15_m		db '1-5.m',0            ; DATA XREF: seg2608:0278o
a2_cmf_0	db '2.cmf',0            ; DATA XREF: seg2608:027Co
a2much4u	db '2MUCH4U',0          ; DATA XREF: seg2608:off_284E0o
aFathomsOfTeeth	db 'Fathoms of Teeth',0 ; DATA XREF: seg2608:0284o
a16_m		db '1-6.m',0            ; DATA XREF: seg2608:028Co
a3_cmf_0	db '3.cmf',0            ; DATA XREF: seg2608:0290o
aAce		db 'ACE',0              ; DATA XREF: seg2608:off_284F4o
aThinkTank	db 'Think Tank',0       ; DATA XREF: seg2608:0298o
aBs1_m		db 'bs1.m',0            ; DATA XREF: seg2608:02A0o
a5_cmf		db '5.cmf',0            ; DATA XREF: seg2608:02A4o
aBs1		db 'BS1',0              ; DATA XREF: seg2608:02A8o
aOscarSLair	db 'Oscar',27h,'s Lair',0 ; DATA XREF: seg2608:02ACo
a21_m		db '2-1.m',0            ; DATA XREF: seg2608:02B4o
aOxygen_cmf	db 'oxygen.cmf',0       ; DATA XREF: seg2608:02B8o
aDnundr		db 'DNUNDR',0           ; DATA XREF: seg2608:02BCo
aAtlantis	db 'Atlantis',0         ; DATA XREF: seg2608:02C0o
a22_m		db '2-2.m',0            ; DATA XREF: seg2608:02C8o
a4_cmf		db '4.cmf',0            ; DATA XREF: seg2608:02CCo
aOut2gtu	db 'OUT2GTU',0          ; DATA XREF: seg2608:02D0o
aAquaTremendom	db 'Aqua Tremendom',0   ; DATA XREF: seg2608:02D4o
a23_m		db '2-3.m',0            ; DATA XREF: seg2608:02DCo
aBossa_cmf	db 'bossa.cmf',0        ; DATA XREF: seg2608:02E0o
aAic		db 'AIC',0              ; DATA XREF: seg2608:02E4o
aSpawningWaters	db 'Spawning Waters',0  ; DATA XREF: seg2608:02E8o
a24_m		db '2-4.m',0            ; DATA XREF: seg2608:02F0o
a1_cmf_1	db '1.cmf',0            ; DATA XREF: seg2608:02F4o
aHang10		db 'HANG10',0           ; DATA XREF: seg2608:off_28558o
aJasonQuest	db 'JASON Quest',0      ; DATA XREF: seg2608:02FCo
a25_m		db '2-5.m',0            ; DATA XREF: seg2608:0304o
aWeerd_cmf	db 'weerd.cmf',0        ; DATA XREF: seg2608:0308o
aRun4it		db 'RUN4IT',0           ; DATA XREF: seg2608:030Co
aFranticAttack	db 'Frantic Attack',0   ; DATA XREF: seg2608:0310o
aBs2_m		db 'bs2.m',0            ; DATA XREF: seg2608:0318o
aChaos_cmf	db 'chaos.cmf',0        ; DATA XREF: seg2608:031Co
aBs2		db 'BS2',0              ; DATA XREF: seg2608:0320o
aEnterOtis	db 'Enter Otis',0       ; DATA XREF: seg2608:0324o
a31_m		db '3-1.m',0            ; DATA XREF: seg2608:032Co
a1_cmf_2	db '1.cmf',0            ; DATA XREF: seg2608:0330o
aGetit		db 'GETIT',0            ; DATA XREF: seg2608:0334o
aSeaEscape	db 'Sea Escape',0       ; DATA XREF: seg2608:0338o
a32_m		db '3-2.m',0            ; DATA XREF: seg2608:0340o
aOxygen_cmf_0	db 'oxygen.cmf',0       ; DATA XREF: seg2608:0344o
aUrinde		db 'URINDE',0           ; DATA XREF: seg2608:0348o
aDeepEnigma	db 'Deep Enigma',0      ; DATA XREF: seg2608:034Co
a33_m		db '3-3.m',0            ; DATA XREF: seg2608:0354o
a4_cmf_0	db '4.cmf',0            ; DATA XREF: seg2608:0358o
aSos		db 'SOS',0              ; DATA XREF: seg2608:035Co
aSinkOrSwim	db 'Sink or Swim',0     ; DATA XREF: seg2608:0360o
a34_m		db '3-4.m',0            ; DATA XREF: seg2608:0368o
a3_cmf_1	db '3.cmf',0            ; DATA XREF: seg2608:036Co
aRun2me		db 'RUN2ME',0           ; DATA XREF: seg2608:0370o
aMarathon	db 'Marathon',0         ; DATA XREF: seg2608:0374o
a35_m		db '3-5.m',0            ; DATA XREF: seg2608:037Co
aChaos_cmf_0	db 'chaos.cmf',0        ; DATA XREF: seg2608:0380o
a512tr		db '512TR',0            ; DATA XREF: seg2608:0384o
aLabRynth	db 'Lab Rynth',0        ; DATA XREF: seg2608:0388o
a36_m		db '3-6.m',0            ; DATA XREF: seg2608:0390o
aTurn_cmf	db 'turn.cmf',0         ; DATA XREF: seg2608:0394o
a2b4udy		db '2B4UDY',0           ; DATA XREF: seg2608:0398o
aAbyssOfPeril	db 'Abyss of Peril',0   ; DATA XREF: seg2608:off_285FCo
a37_m		db '3-7.m',0            ; DATA XREF: seg2608:03A4o
a2_cmf_1	db '2.cmf',0            ; DATA XREF: seg2608:03A8o
aHoh		db 'HOH',0              ; DATA XREF: seg2608:03ACo
aHallsOfHell	db 'Halls of Hell',0    ; DATA XREF: seg2608:03B0o
a38_m		db '3-8.m',0            ; DATA XREF: seg2608:03B8o
aOxygen_cmf_1	db 'oxygen.cmf',0       ; DATA XREF: seg2608:03BCo
aRip		db 'RIP',0              ; DATA XREF: seg2608:03C0o
aMysteriousMaze	db 'Mysterious Maze',0  ; DATA XREF: seg2608:03C4o
aBs3_m		db 'bs3.m',0            ; DATA XREF: seg2608:03CCo
a5_cmf_0	db '5.cmf',0            ; DATA XREF: seg2608:03D0o
aBs3		db 'BS3',0              ; DATA XREF: seg2608:03D4o
aConfrontation	db 'Confrontation',0    ; DATA XREF: seg2608:03D8o
aSec1_m		db 'sec1.m',0           ; DATA XREF: seg2608:03E0o
a4_cmf_1	db '4.cmf',0            ; DATA XREF: seg2608:03E4o
aSec1		db 'SEC1',0             ; DATA XREF: seg2608:03E8o
aOutpostEnigma	db 'Outpost Enigma',0   ; DATA XREF: seg2608:03ECo
aSec2_m		db 'sec2.m',0           ; DATA XREF: seg2608:03F4o
aWeerd_cmf_0	db 'weerd.cmf',0        ; DATA XREF: seg2608:03F8o
aSec2		db 'SEC2',0             ; DATA XREF: seg2608:03FCo
aqqqqqq		db '??????',0           ; DATA XREF: seg2608:0400o
; char format[4]
format		db '%s',0Ah,0           ; DATA XREF: init_game(void)+13o
aRiptideRegiste	db 'Riptide (Registered) 1.0 (C) 1994 MindStorm Software',0
					; DATA XREF: init_game(void)+Fo
; char aDebugModeEnabl[]
aDebugModeEnabl	db '>> DEBUG MODE ENABLED <<',0Ah,0 ; DATA XREF: init_game(void)+26o
; char aForcingPcSound[]
aForcingPcSound	db '>>  FORCING PC SOUND  <<',0Ah,0 ; DATA XREF: init_game(void)+39o
aRiptide_dat	db 'riptide.dat',0      ; DATA XREF: init_game(void)+45o
aRiptideRequire	db 'Riptide requires 600k with digital sound.  Increase memory or run'
					; DATA XREF: init_game(void)+CEo
		db 0Ah
		db 'with the -pcsound option.',0
aRiptideRequi_0	db 'Riptide requires 500k running pc sound.',0
					; DATA XREF: init_game(void)+D8o
; char aLogos_pcx[]
aLogos_pcx	db 'logos.pcx',0        ; DATA XREF: init_game(void)+102o
; char aBytesFreeLu[]
aBytesFreeLu	db 'Bytes free %lu',0Ah,0 ; DATA XREF: init_game(void)+131o
; char aMouse_l[]
aMouse_l	db 'mouse.l',0          ; DATA XREF: init_game(void)+179o
; char aConfigrip[]
aConfigrip	db 'config.rip',0       ; DATA XREF: init_game(void)+2E0o
; char mode[]
_mode		db 'rb',0               ; DATA XREF: init_game(void)+2DCo
; char aP_frame_pcx[]
aP_frame_pcx	db 'p_frame.pcx',0      ; DATA XREF: play_game(uchar)+1Bo
; char aBs1_bdl_l[]
aBs1_bdl_l	db 'bs1_bdl.l',0        ; DATA XREF: play_game(uchar)+142o
; char aBs1_bdr_l[]
aBs1_bdr_l	db 'bs1_bdr.l',0        ; DATA XREF: play_game(uchar)+156o
; char aBs1dr_l[]
aBs1dr_l	db 'bs1dr.l',0          ; DATA XREF: play_game(uchar)+16Ao
; char aBosshit_l[]
aBosshit_l	db 'bosshit.l',0        ; DATA XREF: play_game(uchar)+17Eo
; char aBadgrunt[]
aBadgrunt	db 'badgrunt',0         ; DATA XREF: play_game(uchar)+194o
; char aBs2_bod_l[]
aBs2_bod_l	db 'bs2_bod.l',0        ; DATA XREF: play_game(uchar)+1B7o
; char aBs2_tnr1_l[]
aBs2_tnr1_l	db 'bs2_tnr1.l',0       ; DATA XREF: play_game(uchar)+1CBo
; char aBs2_tnl1_l[]
aBs2_tnl1_l	db 'bs2_tnl1.l',0       ; DATA XREF: play_game(uchar)+1DFo
; char aBs2_tnr2_l[]
aBs2_tnr2_l	db 'bs2_tnr2.l',0       ; DATA XREF: play_game(uchar)+1F3o
; char aBs2_tnl2_l[]
aBs2_tnl2_l	db 'bs2_tnl2.l',0       ; DATA XREF: play_game(uchar)+207o
; char aMsl_inkl_l[]
aMsl_inkl_l	db 'msl_inkl.l',0       ; DATA XREF: play_game(uchar)+21Bo
; char aMsl_inkr_l[]
aMsl_inkr_l	db 'msl_inkr.l',0       ; DATA XREF: play_game(uchar)+22Fo
; char aOtiseyes_l[]
aOtiseyes_l	db 'otiseyes.l',0       ; DATA XREF: play_game(uchar)+243o
; char aBs3_bdr_l[]
aBs3_bdr_l	db 'bs3_bdr.l',0        ; DATA XREF: play_game(uchar)+266o
; char aBs3_arr_l[]
aBs3_arr_l	db 'bs3_arr.l',0        ; DATA XREF: play_game(uchar)+27Ao
; char aBs3_bdl_l[]
aBs3_bdl_l	db 'bs3_bdl.l',0        ; DATA XREF: play_game(uchar)+28Eo
; char aBs3_arl_l[]
aBs3_arl_l	db 'bs3_arl.l',0        ; DATA XREF: play_game(uchar)+2A2o
; char aBs3_dthr_l[]
aBs3_dthr_l	db 'bs3_dthr.l',0       ; DATA XREF: play_game(uchar)+2B6o
; char aBs3_prpl_l[]
aBs3_prpl_l	db 'bs3_prpl.l',0       ; DATA XREF: play_game(uchar)+2CAo
; char aBs3_prpr_l[]
aBs3_prpr_l	db 'bs3_prpr.l',0       ; DATA XREF: play_game(uchar)+2DEo
; char aBs3_facl_l[]
aBs3_facl_l	db 'bs3_facl.l',0       ; DATA XREF: play_game(uchar)+2F2o
; char aBs3_facr_l[]
aBs3_facr_l	db 'bs3_facr.l',0       ; DATA XREF: play_game(uchar)+306o
; char aChain_l[]
aChain_l	db 'chain.l',0          ; DATA XREF: play_game(uchar)+31Ao
; char aExp3_l[]
aExp3_l		db 'exp3.l',0           ; DATA XREF: play_game(uchar)+32Eo
aPlunk2		db 'plunk2',0           ; DATA XREF: play_game(uchar)+344o
; char aSharkr_l[]
aSharkr_l	db 'sharkr.l',0         ; DATA XREF: play_game(uchar)+34Bo
; char aSharkl_l[]
aSharkl_l	db 'sharkl.l',0         ; DATA XREF: play_game(uchar)+35Fo
; char aSharkdie_l[]
aSharkdie_l	db 'sharkdie.l',0       ; DATA XREF: play_game(uchar)+373o
; char aBs1_bdl_l_0[]
aBs1_bdl_l_0	db 'bs1_bdl.l',0        ; DATA XREF: play_game(uchar)+3EEo
; char aBs1_bdr_l_0[]
aBs1_bdr_l_0	db 'bs1_bdr.l',0        ; DATA XREF: play_game(uchar)+402o
; char aBs1dr_l_0[]
aBs1dr_l_0	db 'bs1dr.l',0          ; DATA XREF: play_game(uchar)+416o
; char aBosshit_l_0[]
aBosshit_l_0	db 'bosshit.l',0        ; DATA XREF: play_game(uchar)+42Ao
; char aBadgrunt_0[]
aBadgrunt_0	db 'badgrunt',0         ; DATA XREF: play_game(uchar)+43Eo
; char aBs2_bod_l_0[]
aBs2_bod_l_0	db 'bs2_bod.l',0        ; DATA XREF: play_game(uchar)+452o
; char aBs2_tnr1_l_0[]
aBs2_tnr1_l_0	db 'bs2_tnr1.l',0       ; DATA XREF: play_game(uchar)+466o
; char aBs2_tnl1_l_0[]
aBs2_tnl1_l_0	db 'bs2_tnl1.l',0       ; DATA XREF: play_game(uchar)+47Ao
; char aBs2_tnr2_l_0[]
aBs2_tnr2_l_0	db 'bs2_tnr2.l',0       ; DATA XREF: play_game(uchar)+48Eo
; char aBs2_tnl2_l_0[]
aBs2_tnl2_l_0	db 'bs2_tnl2.l',0       ; DATA XREF: play_game(uchar)+4A2o
; char aMsl_inkl_l_0[]
aMsl_inkl_l_0	db 'msl_inkl.l',0       ; DATA XREF: play_game(uchar)+4B6o
; char aMsl_inkr_l_0[]
aMsl_inkr_l_0	db 'msl_inkr.l',0       ; DATA XREF: play_game(uchar)+4CAo
; char aOtiseyes_l_0[]
aOtiseyes_l_0	db 'otiseyes.l',0       ; DATA XREF: play_game(uchar)+4DEo
; char aBs3_bdr_l_0[]
aBs3_bdr_l_0	db 'bs3_bdr.l',0        ; DATA XREF: play_game(uchar)+4F2o
; char aBs3_arr_l_0[]
aBs3_arr_l_0	db 'bs3_arr.l',0        ; DATA XREF: play_game(uchar)+506o
; char aBs3_bdl_l_0[]
aBs3_bdl_l_0	db 'bs3_bdl.l',0        ; DATA XREF: play_game(uchar)+51Ao
; char aBs3_arl_l_0[]
aBs3_arl_l_0	db 'bs3_arl.l',0        ; DATA XREF: play_game(uchar)+52Eo
; char aBs3_prpl_l_0[]
aBs3_prpl_l_0	db 'bs3_prpl.l',0       ; DATA XREF: play_game(uchar)+542o
; char aBs3_prpr_l_0[]
aBs3_prpr_l_0	db 'bs3_prpr.l',0       ; DATA XREF: play_game(uchar)+556o
; char aBs3_facl_l_0[]
aBs3_facl_l_0	db 'bs3_facl.l',0       ; DATA XREF: play_game(uchar)+56Ao
; char aBs3_facr_l_0[]
aBs3_facr_l_0	db 'bs3_facr.l',0       ; DATA XREF: play_game(uchar)+57Eo
; char aBs3_dthr_l_0[]
aBs3_dthr_l_0	db 'bs3_dthr.l',0       ; DATA XREF: play_game(uchar)+592o
; char aChain_l_0[]
aChain_l_0	db 'chain.l',0          ; DATA XREF: play_game(uchar)+5A6o
; char aExp3_l_0[]
aExp3_l_0	db 'exp3.l',0           ; DATA XREF: play_game(uchar)+5BAo
; char aPlunk2_0[]
aPlunk2_0	db 'plunk2',0           ; DATA XREF: play_game(uchar)+5CEo
; char aSharkr_l_0[]
aSharkr_l_0	db 'sharkr.l',0         ; DATA XREF: play_game(uchar)+5E2o
; char aSharkl_l_0[]
aSharkl_l_0	db 'sharkl.l',0         ; DATA XREF: play_game(uchar)+5F6o
; char aSharkdie_l_0[]
aSharkdie_l_0	db 'sharkdie.l',0       ; DATA XREF: play_game(uchar)+60Ao
; char aNewPassword[]
aNewPassword	db 'New password : ',0  ; DATA XREF: play_game(uchar)+6BAo
aInvalidSecretL	db 'Invalid secret level exit.',0 ; DATA XREF: setup_secret_level(void)+3Co
aInvalidSecre_0	db 'Invalid secret level re-entrance.',0
					; DATA XREF: exit_secret_level(void)+33o
; char aSubl_l[]
aSubl_l		db 'subl.l',0           ; DATA XREF: start_room(uchar *)+2D6o
; char aSubr_l[]
aSubr_l		db 'subr.l',0           ; DATA XREF: start_room(uchar *)+308o
aTooManyBarrier	db 'Too many barriers for list.',0 ; DATA XREF: de_doit(void)+47o
aTooManyShootab	db 'Too many shootables.',0 ; DATA XREF: de_doit(void)+BAo
aEndDoorSwitchW	db 'End door switch without door.',0 ; DATA XREF: de_doit(void)+29Eo
; char aBubbles2[]
aBubbles2	db 'bubbles2',0         ; DATA XREF: de_doit(void)+380o
; char aSubr_l_0[]
aSubr_l_0	db 'subr.l',0           ; DATA XREF: de_doit(void)+5B8o
; char aChain_l_1[]
aChain_l_1	db 'chain.l',0          ; DATA XREF: de_doit(void)+5DDo
; char aPlunk2_1[]
aPlunk2_1	db 'plunk2',0           ; DATA XREF: de_doit(void)+66Bo
; char aThe_l[]
aThe_l		db 'the.l',0            ; DATA XREF: de_doit(void)+6E5o
; char aEnd_l[]
aEnd_l		db 'end.l',0            ; DATA XREF: de_doit(void)+6FAo
aP_death1_pcx	db 'p_death1.pcx',0     ; DATA XREF: end_game(void)+43o
; char aP_death2_pcx[]
aP_death2_pcx	db 'p_death2.pcx',0     ; DATA XREF: end_game(void)+4Fo
aBubbles2_0	db 'bubbles2',0         ; DATA XREF: end_game(void)+7Eo
; char aDead[]
aDead		db 'dead',0             ; DATA XREF: end_game(void)+84o
; char aYouMadeTheTop1[]
aYouMadeTheTop1	db 'You made the top 10!  Unfortunately',0Ah
					; DATA XREF: end_game(void)+101o
		db 'you used the cheat code...  Sorry!',0
aEnterName	db 'Enter Name',0       ; DATA XREF: end_game(void)+117o
aYouReInTheTop1	db 'You',27h,'re in the top 10!',0 ; DATA XREF: end_game(void)+113o
		db    0
; char aEgodie2_l_0_[]
aEgodie2_l_0_	db 'egodie2.l',0        ; DATA XREF: kill_ego(int,int)+41o
; char aEgodie2_l_0[]
aEgodie2_l_0	db 'egodie2.l',0        ; DATA XREF: kill_ego(int,int)+55o
; char aSwish[]
aSwish		db 'swish',0            ; DATA XREF: kill_ego(int,int)+A7o
; char aGotcha_l[]
aGotcha_l	db 'gotcha.l',0         ; DATA XREF: kill_ego(int,int)+BBo
; char aGotcha_l_0[]
aGotcha_l_0	db 'gotcha.l',0         ; DATA XREF: kill_ego(int,int)+CFo
; char aSmash[]
aSmash		db 'smash',0            ; DATA XREF: kill_ego(int,int)+117o
; char aExp2[]
aExp2		db 'exp2',0             ; DATA XREF: kill_ego(int,int)+175o
aEgodie2_l_1	db 'egodie2.l',0        ; DATA XREF: kill_ego(int,int)+1F6o
; char aGotcha_l_1[]
aGotcha_l_1	db 'gotcha.l',0         ; DATA XREF: kill_ego(int,int)+1FCo
; char aCry[]
aCry		db 'cry',0              ; DATA XREF: kill_ego(int,int)+236o
aVillans	db 'villans',0          ; DATA XREF: kill_ego(int,int)+24Co
aScr_100_l_0	db 'scr_100.l',0        ; DATA XREF: score_at(int,int,int)+26o
aScr_500_l_0	db 'scr_500.l',0        ; DATA XREF: score_at(int,int,int)+30o
aScr_1000_l_0	db 'scr_1000.l',0       ; DATA XREF: score_at(int,int,int)+3Ao
aScr_2000_l_0	db 'scr_2000.l',0       ; DATA XREF: score_at(int,int,int)+44o
aScr_3000_l_0	db 'scr_3000.l',0       ; DATA XREF: score_at(int,int,int)+4Eo
aScr_4000_l_0	db 'scr_4000.l',0       ; DATA XREF: score_at(int,int,int)+58o
aUndefinedScore	db 'Undefined score animation.',0 ; DATA XREF: score_at(int,int,int)+64o
aMsg_bar_l	db 'msg_bar.l',0        ; DATA XREF: post_message(uchar)+34o
aMsg_cave_l	db 'msg_cave.l',0       ; DATA XREF: post_message(uchar)+3Eo
aMsg_gun_l	db 'msg_gun.l',0        ; DATA XREF: post_message(uchar)+48o
aMsg_jasn_l	db 'msg_jasn.l',0       ; DATA XREF: post_message(uchar)+52o
aGem_l_2	db 'gem.l',0            ; DATA XREF: add_map_item(uint,uint)+6Do
aBonus1_l_0	db 'bonus1.l',0         ; DATA XREF: add_map_item(uint,uint)+8Eo
aBonus2_l_0	db 'bonus2.l',0         ; DATA XREF: add_map_item(uint,uint)+98o
aCoin_l_1	db 'coin.l',0           ; DATA XREF: add_map_item(uint,uint)+A4o
; char aPod1_l[]
aPod1_l		db 'pod1.l',0           ; DATA XREF: add_map_item(uint,uint)+12Ao
; char aPod2_l[]
aPod2_l		db 'pod2.l',0           ; DATA XREF: add_map_item(uint,uint)+153o
; char aMine_l[]
aMine_l		db 'mine.l',0           ; DATA XREF: add_map_item(uint,uint)+1BAo
; char aZap_ud_l[]
aZap_ud_l	db 'zap_ud.l',0         ; DATA XREF: add_map_item(uint,uint)+21Fo
; char aFish1r_l[]
aFish1r_l	db 'fish1r.l',0         ; DATA XREF: add_map_item(uint,uint)+295o
; char aFish2r_l[]
aFish2r_l	db 'fish2r.l',0         ; DATA XREF: add_map_item(uint,uint)+2C6o
; char aWeed1_l[]
aWeed1_l	db 'weed1.l',0          ; DATA XREF: add_map_item(uint,uint)+330o
; char aTulip_l[]
aTulip_l	db 'tulip.l',0          ; DATA XREF: add_map_item(uint,uint)+382o
; char aChest_l[]
aChest_l	db 'chest.l',0          ; DATA XREF: add_map_item(uint,uint)+3DFo
; char aDuct_r_l[]
aDuct_r_l	db 'duct_r.l',0         ; DATA XREF: add_map_item(uint,uint)+44Do
; char aDuct_l_l[]
aDuct_l_l	db 'duct_l.l',0         ; DATA XREF: add_map_item(uint,uint)+47Do
; char aDuct_u_l[]
aDuct_u_l	db 'duct_u.l',0         ; DATA XREF: add_map_item(uint,uint)+4B7o
; char aDuct_d_l[]
aDuct_d_l	db 'duct_d.l',0         ; DATA XREF: add_map_item(uint,uint)+4E7o
; char aPiranar_l[]
aPiranar_l	db 'piranar.l',0        ; DATA XREF: add_map_item(uint,uint)+538o
; char aPiranal_l[]
aPiranal_l	db 'piranal.l',0        ; DATA XREF: add_map_item(uint,uint)+574o
aBlock2_l	db 'block2.l',0         ; DATA XREF: add_map_item(uint,uint)+5F2o
; char aBlock_l[]
aBlock_l	db 'block.l',0          ; DATA XREF: add_map_item(uint,uint)+602o
; char aFace_r_l[]
aFace_r_l	db 'face_r.l',0         ; DATA XREF: add_map_item(uint,uint)+63Ao
; char aFace_l_l[]
aFace_l_l	db 'face_l.l',0         ; DATA XREF: add_map_item(uint,uint)+66Eo
; char aSerp_r_l[]
aSerp_r_l	db 'serp_r.l',0         ; DATA XREF: add_map_item(uint,uint)+6D4o
; char aSerp_l_l[]
aSerp_l_l	db 'serp_l.l',0         ; DATA XREF: add_map_item(uint,uint)+710o
; char aCrab_l[]
aCrab_l		db 'crab.l',0           ; DATA XREF: add_map_item(uint,uint)+775o
aPiece_1_l_0	db 'piece_1.l',0        ; DATA XREF: add_map_item(uint,uint)+81Do
aPiece_2_l_0	db 'piece_2.l',0        ; DATA XREF: add_map_item(uint,uint)+827o
aPiece_3_l_0	db 'piece_3.l',0        ; DATA XREF: add_map_item(uint,uint)+831o
aPiece_4_l_0	db 'piece_4.l',0        ; DATA XREF: add_map_item(uint,uint)+83Bo
; char aJelly_l[]
aJelly_l	db 'jelly.l',0          ; DATA XREF: add_map_item(uint,uint)+89Ao
; char aSharkr_l_1[]
aSharkr_l_1	db 'sharkr.l',0         ; DATA XREF: add_map_item(uint,uint)+8DFo
; char aSharkl_l_1[]
aSharkl_l_1	db 'sharkl.l',0         ; DATA XREF: add_map_item(uint,uint)+911o
; char aTent_out_l[]
aTent_out_l	db 'tent_out.l',0       ; DATA XREF: add_map_item(uint,uint)+973o
; char aSpikes_d_l[]
aSpikes_d_l	db 'spikes_d.l',0       ; DATA XREF: add_map_item(uint,uint)+9D7o
; char aSpikes_u_l[]
aSpikes_u_l	db 'spikes_u.l',0       ; DATA XREF: add_map_item(uint,uint)+A02o
; char aStatue_l[]
aStatue_l	db 'statue.l',0         ; DATA XREF: add_map_item(uint,uint)+A6Bo
; char aFire_pit_l[]
aFire_pit_l	db 'fire_pit.l',0       ; DATA XREF: add_map_item(uint,uint)+AABo
; char aShutl_l_l[]
aShutl_l_l	db 'shutl_l.l',0        ; DATA XREF: add_map_item(uint,uint)+B07o
; char aClam_l[]
aClam_l		db 'clam.l',0           ; DATA XREF: add_map_item(uint,uint)+B41o
; char aCannonr_l[]
aCannonr_l	db 'cannonr.l',0        ; DATA XREF: add_map_item(uint,uint)+BA6o
; char aShipl_l[]
aShipl_l	db 'shipl.l',0          ; DATA XREF: add_map_item(uint,uint)+C1Eo
; char aShipr_l[]
aShipr_l	db 'shipr.l',0          ; DATA XREF: add_map_item(uint,uint)+C5Ao
; char aBarrel2_l[]
aBarrel2_l	db 'barrel2.l',0        ; DATA XREF: add_barrel(uint,uint)+Bo
; char aBarrel1_l[]
aBarrel1_l	db 'barrel1.l',0        ; DATA XREF: add_barrel(uint,uint)+3Co
aBarrel3_l	db 'barrel3.l',0        ; DATA XREF: add_barrel(uint,uint)+4Eo
; char aPu_air_l[]
aPu_air_l	db 'pu_air.l',0         ; DATA XREF: add_map_pup(uint,uint)+18o
aPu_shld_l	db 'pu_shld.l',0        ; DATA XREF: add_map_pup(uint,uint)+2Bo
aPu_fire_l	db 'pu_fire.l',0        ; DATA XREF: add_map_pup(uint,uint)+3Bo
aPu_top_l	db 'pu_top.l',0         ; DATA XREF: add_map_pup(uint,uint)+4Bo
; char aPu_1up_l[]
aPu_1up_l	db 'pu_1up.l',0         ; DATA XREF: add_map_pup(uint,uint)+5Fo
aPu_auto_l	db 'pu_auto.l',0        ; DATA XREF: add_map_pup(uint,uint)+87o
aPu_key_l	db 'pu_key.l',0         ; DATA XREF: add_map_pup(uint,uint)+8Do
aPu_jason_l	db 'pu_jason.l',0       ; DATA XREF: add_map_pup(uint,uint)+9Do
aPu_jf_l	db 'pu_jf.l',0          ; DATA XREF: add_map_pup(uint,uint)+B8o
aPupNotDefined	db 'Pup not defined!',0 ; DATA XREF: add_map_pup(uint,uint)+C3o
; char aSwitch_l[]
aSwitch_l	db 'switch.l',0         ; DATA XREF: add_switch(uint,uint)+24o
; char aEnd_dr_l[]
aEnd_dr_l	db 'end_dr.l',0         ; DATA XREF: add_door(uint,uint)+37o
; char aDoor_ud_l[]
aDoor_ud_l	db 'door_ud.l',0        ; DATA XREF: add_door(uint,uint)+66o
aBubmd_l	db 'bubmd.l',0          ; DATA XREF: add_bubble(int,int,int)+33o
; char aBubsm_l[]
aBubsm_l	db 'bubsm.l',0          ; DATA XREF: add_bubble(int,int,int)+43o
; char aMsl_top_l[]
aMsl_top_l	db 'msl_top.l',0        ; DATA XREF: add_missile(m_actor *,uchar,int)+227o
; char aProber_l[]
aProber_l	db 'prober.l',0         ; DATA XREF: add_jason(void)+10o
; char aSqueek[]
aSqueek		db 'squeek',0           ; DATA XREF: toggle_sub_control(void)+Do
aProber_l_0	db 'prober.l',0         ; DATA XREF: turn_ego(void)+16o
; char aProbel_l[]
aProbel_l	db 'probel.l',0         ; DATA XREF: turn_ego(void)+1Co
; char aTurn_l[]
aTurn_l		db 'turn.l',0           ; DATA XREF: turn_ego(void)+45o
; char aDrillhi[]
aDrillhi	db 'drillhi',0          ; DATA XREF: check_user(void)+2FFo
; char aDrillhi_0[]
aDrillhi_0	db 'drillhi',0          ; DATA XREF: check_user(void)+326o
; char aDrillhi_1[]
aDrillhi_1	db 'drillhi',0          ; DATA XREF: check_user(void)+34Co
; char aDrillhi_2[]
aDrillhi_2	db 'drillhi',0          ; DATA XREF: check_user(void)+37Ao
; char aDrillhi_3[]
aDrillhi_3	db 'drillhi',0          ; DATA XREF: check_user(void)+3A1o
; char aDrillhi_4[]
aDrillhi_4	db 'drillhi',0          ; DATA XREF: check_user(void)+3C8o
; char aRiptide_pcxHas[]
aRiptide_pcxHas	db 27h,'riptide.pcx',27h,' has been dumped.',0
					; DATA XREF: check_user(void)+415o
; char aBacksub_l[]
aBacksub_l	db 'backsub.l',0        ; DATA XREF: teleport_to(uint)+1Ao
; char aTport[]
aTport		db 'tport',0            ; DATA XREF: teleport_to(uint)+5Do
; char aTurn_l_0[]
aTurn_l_0	db 'turn.l',0           ; DATA XREF: teleport_to(uint)+F6o
aSubr_l_1	db 'subr.l',0           ; DATA XREF: teleport_to(uint)+147o
; char aSubl_l_0[]
aSubl_l_0	db 'subl.l',0           ; DATA XREF: teleport_to(uint)+14Do
; char aKey_l[]
aKey_l		db 'key.l',0            ; DATA XREF: update_key_guage(void)+37o
aGun_1_l_0	db 'gun_1.l',0          ; DATA XREF: update_gun(void)+43o
aGun_2_l_0	db 'gun_2.l',0          ; DATA XREF: update_gun(void)+4Do
aGun_3_l_0	db 'gun_3.l',0          ; DATA XREF: update_gun(void)+57o
aGun_4_l_0	db 'gun_4.l',0          ; DATA XREF: update_gun(void)+61o
aErrorUpdatingG	db 'Error updating gun.',0 ; DATA XREF: update_gun(void)+6Do
; char aDebug_[]
aDebug_		db 'Debug',0            ; DATA XREF: activate_menu_bar(void)+21o
; char aRunBenchmark[]
aRunBenchmark	db 'Run benchmark',0    ; DATA XREF: activate_menu_bar(void)+1Do
; char aGame[]
aGame		db 'Game',0             ; DATA XREF: activate_menu_bar(void)+3Bo
; char aResume[]
aResume		db 'Resume',0           ; DATA XREF: activate_menu_bar(void)+37o
; char aDebug_2[]
aDebug_2	db 'Debug',0            ; DATA XREF: activate_menu_bar(void)+67o
; char aRunBenchmark_0[]
aRunBenchmark_0	db 'Run benchmark',0    ; DATA XREF: activate_menu_bar(void)+63o
; char aGame_0[]
aGame_0		db 'Game',0             ; DATA XREF: activate_menu_bar(void)+81o
; char aResume_0[]
aResume_0	db 'Resume',0           ; DATA XREF: activate_menu_bar(void)+7Do
; char aPing[]
aPing		db 'ping',0             ; DATA XREF: check_guages(void)+47o
; char aPing_0[]
aPing_0		db 'ping',0             ; DATA XREF: check_guages(void)+9Eo
; char aPing_1[]
aPing_1		db 'ping',0             ; DATA XREF: check_guages(void)+18Co
; char aBubsm_l_0[]
aBubsm_l_0	db 'bubsm.l',0          ; DATA XREF: load_resources(void)+4o
; char aBubmd_l_0[]
aBubmd_l_0	db 'bubmd.l',0          ; DATA XREF: load_resources(void)+18o
; char aSubr_l_2[]
aSubr_l_2	db 'subr.l',0           ; DATA XREF: load_resources(void)+2Co
; char aSubl_l_1[]
aSubl_l_1	db 'subl.l',0           ; DATA XREF: load_resources(void)+40o
; char aTurn_l_1[]
aTurn_l_1	db 'turn.l',0           ; DATA XREF: load_resources(void)+54o
; char aMsl_str_l[]
aMsl_str_l	db 'msl_str.l',0        ; DATA XREF: load_resources(void)+68o
; char aMsl_sm_l[]
aMsl_sm_l	db 'msl_sm.l',0         ; DATA XREF: load_resources(void)+7Co
; char aMsl_tpl_l[]
aMsl_tpl_l	db 'msl_tpl.l',0        ; DATA XREF: load_resources(void)+90o
; char aMsl_tpr_l[]
aMsl_tpr_l	db 'msl_tpr.l',0        ; DATA XREF: load_resources(void)+A4o
; char aMsl_rkr_l[]
aMsl_rkr_l	db 'msl_rkr.l',0        ; DATA XREF: load_resources(void)+B8o
; char aMsl_rkl_l[]
aMsl_rkl_l	db 'msl_rkl.l',0        ; DATA XREF: load_resources(void)+CCo
; char aMsl_top_l_0[]
aMsl_top_l_0	db 'msl_top.l',0        ; DATA XREF: load_resources(void)+E0o
; char aMsl_pea_l[]
aMsl_pea_l	db 'msl_pea.l',0        ; DATA XREF: load_resources(void)+F4o
; char aMsl_spt_l[]
aMsl_spt_l	db 'msl_spt.l',0        ; DATA XREF: load_resources(void)+108o
; char aMsl_red_l[]
aMsl_red_l	db 'msl_red.l',0        ; DATA XREF: load_resources(void)+11Co
; char aMsl_arwl_l[]
aMsl_arwl_l	db 'msl_arwl.l',0       ; DATA XREF: load_resources(void)+130o
; char aMsl_arwr_l[]
aMsl_arwr_l	db 'msl_arwr.l',0       ; DATA XREF: load_resources(void)+144o
; char aMsl_bg2l_l[]
aMsl_bg2l_l	db 'msl_bg2l.l',0       ; DATA XREF: load_resources(void)+158o
; char aMsl_bg2r_l[]
aMsl_bg2r_l	db 'msl_bg2r.l',0       ; DATA XREF: load_resources(void)+16Co
; char aShpbmb_l[]
aShpbmb_l	db 'shpbmb.l',0         ; DATA XREF: load_resources(void)+180o
; char aFireball_l[]
aFireball_l	db 'fireball.l',0       ; DATA XREF: load_resources(void)+194o
; char aExplg_l[]
aExplg_l	db 'explg.l',0          ; DATA XREF: load_resources(void)+1A8o
; char aExpmd_l[]
aExpmd_l	db 'expmd.l',0          ; DATA XREF: load_resources(void)+1BCo
; char aExpsm_l[]
aExpsm_l	db 'expsm.l',0          ; DATA XREF: load_resources(void)+1D0o
; char aSplat_l[]
aSplat_l	db 'splat.l',0          ; DATA XREF: load_resources(void)+1E4o
; char aProber_l_1[]
aProber_l_1	db 'prober.l',0         ; DATA XREF: load_resources(void)+1F8o
; char aProbel_l_0[]
aProbel_l_0	db 'probel.l',0         ; DATA XREF: load_resources(void)+20Co
; char aFish1l_l[]
aFish1l_l	db 'fish1l.l',0         ; DATA XREF: load_resources(void)+220o
; char aFish1r_l_0[]
aFish1r_l_0	db 'fish1r.l',0         ; DATA XREF: load_resources(void)+234o
; char aFish2l_l[]
aFish2l_l	db 'fish2l.l',0         ; DATA XREF: load_resources(void)+248o
; char aFish2r_l_0[]
aFish2r_l_0	db 'fish2r.l',0         ; DATA XREF: load_resources(void)+25Co
; char aScr_100_l[]
aScr_100_l	db 'scr_100.l',0        ; DATA XREF: load_resources(void)+270o
; char aScr_500_l[]
aScr_500_l	db 'scr_500.l',0        ; DATA XREF: load_resources(void)+284o
; char aScr_1000_l[]
aScr_1000_l	db 'scr_1000.l',0       ; DATA XREF: load_resources(void)+298o
; char aScr_2000_l[]
aScr_2000_l	db 'scr_2000.l',0       ; DATA XREF: load_resources(void)+2ACo
; char aScr_3000_l[]
aScr_3000_l	db 'scr_3000.l',0       ; DATA XREF: load_resources(void)+2C0o
; char aScr_4000_l[]
aScr_4000_l	db 'scr_4000.l',0       ; DATA XREF: load_resources(void)+2D4o
; char aCoin_l[]
aCoin_l		db 'coin.l',0           ; DATA XREF: load_resources(void)+2E8o
; char aBonus1_l[]
aBonus1_l	db 'bonus1.l',0         ; DATA XREF: load_resources(void)+2FCo
; char aBonus2_l[]
aBonus2_l	db 'bonus2.l',0         ; DATA XREF: load_resources(void)+310o
; char aTulipl_l[]
aTulipl_l	db 'tulipl.l',0         ; DATA XREF: load_resources(void)+324o
; char aTulipr_l[]
aTulipr_l	db 'tulipr.l',0         ; DATA XREF: load_resources(void)+338o
; char aTulip_l_0[]
aTulip_l_0	db 'tulip.l',0          ; DATA XREF: load_resources(void)+34Co
; char aSerp_r_l_0[]
aSerp_r_l_0	db 'serp_r.l',0         ; DATA XREF: load_resources(void)+360o
; char aSerp_l_l_0[]
aSerp_l_l_0	db 'serp_l.l',0         ; DATA XREF: load_resources(void)+374o
; char aMsl_bigl_l[]
aMsl_bigl_l	db 'msl_bigl.l',0       ; DATA XREF: load_resources(void)+388o
; char aMsl_bigr_l[]
aMsl_bigr_l	db 'msl_bigr.l',0       ; DATA XREF: load_resources(void)+39Co
; char aMsl_hbl_l[]
aMsl_hbl_l	db 'msl_hbl.l',0        ; DATA XREF: load_resources(void)+3B0o
; char aMsl_hbr_l[]
aMsl_hbr_l	db 'msl_hbr.l',0        ; DATA XREF: load_resources(void)+3C4o
; char aFirbalup_l[]
aFirbalup_l	db 'firbalup.l',0       ; DATA XREF: load_resources(void)+3D8o
; char aFirbaldn_l[]
aFirbaldn_l	db 'firbaldn.l',0       ; DATA XREF: load_resources(void)+3ECo
; char aPu_air_l_0[]
aPu_air_l_0	db 'pu_air.l',0         ; DATA XREF: load_resources(void)+400o
; char aPu_fire_l_0[]
aPu_fire_l_0	db 'pu_fire.l',0        ; DATA XREF: load_resources(void)+414o
; char aPu_shld_l_0[]
aPu_shld_l_0	db 'pu_shld.l',0        ; DATA XREF: load_resources(void)+428o
; char aPu_jwl1_l[]
aPu_jwl1_l	db 'pu_jwl1.l',0        ; DATA XREF: load_resources(void)+43Co
; char aPu_1up_l_0[]
aPu_1up_l_0	db 'pu_1up.l',0         ; DATA XREF: load_resources(void)+450o
; char aPu_auto_l_0[]
aPu_auto_l_0	db 'pu_auto.l',0        ; DATA XREF: load_resources(void)+464o
; char aPu_key_l_0[]
aPu_key_l_0	db 'pu_key.l',0         ; DATA XREF: load_resources(void)+478o
; char aPu_top_l_0[]
aPu_top_l_0	db 'pu_top.l',0         ; DATA XREF: load_resources(void)+48Co
; char aPu_jason_l_0[]
aPu_jason_l_0	db 'pu_jason.l',0       ; DATA XREF: load_resources(void)+4A0o
; char aPu_jf_l_0[]
aPu_jf_l_0	db 'pu_jf.l',0          ; DATA XREF: load_resources(void)+4B4o
; char aGem_l[]
aGem_l		db 'gem.l',0            ; DATA XREF: load_resources(void)+4C8o
; char aSpikes_u_l_0[]
aSpikes_u_l_0	db 'spikes_u.l',0       ; DATA XREF: load_resources(void)+4DCo
; char aSpikes_d_l_0[]
aSpikes_d_l_0	db 'spikes_d.l',0       ; DATA XREF: load_resources(void)+4F0o
; char aShutl_l_l_0[]
aShutl_l_l_0	db 'shutl_l.l',0        ; DATA XREF: load_resources(void)+504o
; char aShutl_r_l[]
aShutl_r_l	db 'shutl_r.l',0        ; DATA XREF: load_resources(void)+518o
; char aMreal_l[]
aMreal_l	db 'mreal.l',0          ; DATA XREF: load_resources(void)+52Co
; char aFreemine_l[]
aFreemine_l	db 'freemine.l',0       ; DATA XREF: load_resources(void)+540o
; char aTent_out_l_0[]
aTent_out_l_0	db 'tent_out.l',0       ; DATA XREF: load_resources(void)+554o
; char aTent_in_l[]
aTent_in_l	db 'tent_in.l',0        ; DATA XREF: load_resources(void)+568o
; char aMine_l_0[]
aMine_l_0	db 'mine.l',0           ; DATA XREF: load_resources(void)+57Co
; char aBarrel1_l_0[]
aBarrel1_l_0	db 'barrel1.l',0        ; DATA XREF: load_resources(void)+590o
; char aBarrel2_l_0[]
aBarrel2_l_0	db 'barrel2.l',0        ; DATA XREF: load_resources(void)+5A4o
; char aBarrel3_l_0[]
aBarrel3_l_0	db 'barrel3.l',0        ; DATA XREF: load_resources(void)+5B8o
; char aPod1_l_0[]
aPod1_l_0	db 'pod1.l',0           ; DATA XREF: load_resources(void)+5CCo
; char aPod2_l_0[]
aPod2_l_0	db 'pod2.l',0           ; DATA XREF: load_resources(void)+5E0o
; char aPiranar_l_0[]
aPiranar_l_0	db 'piranar.l',0        ; DATA XREF: load_resources(void)+5F4o
; char aPiranal_l_0[]
aPiranal_l_0	db 'piranal.l',0        ; DATA XREF: load_resources(void)+608o
; char aJelly_l_0[]
aJelly_l_0	db 'jelly.l',0          ; DATA XREF: load_resources(void)+61Co
; char aBacksub_l_0[]
aBacksub_l_0	db 'backsub.l',0        ; DATA XREF: load_resources(void)+630o
; char aEnd_dr_l_0[]
aEnd_dr_l_0	db 'end_dr.l',0         ; DATA XREF: load_resources(void)+644o
; char aDoor_ud_l_0[]
aDoor_ud_l_0	db 'door_ud.l',0        ; DATA XREF: load_resources(void)+658o
; char aDuct_l_l_0[]
aDuct_l_l_0	db 'duct_l.l',0         ; DATA XREF: load_resources(void)+66Co
; char aDuct_r_l_0[]
aDuct_r_l_0	db 'duct_r.l',0         ; DATA XREF: load_resources(void)+680o
; char aDuct_u_l_0[]
aDuct_u_l_0	db 'duct_u.l',0         ; DATA XREF: load_resources(void)+694o
; char aDuct_d_l_0[]
aDuct_d_l_0	db 'duct_d.l',0         ; DATA XREF: load_resources(void)+6A8o
; char aBlock_l_0[]
aBlock_l_0	db 'block.l',0          ; DATA XREF: load_resources(void)+6BCo
; char aBlock2_l_0[]
aBlock2_l_0	db 'block2.l',0         ; DATA XREF: load_resources(void)+6D0o
; char aSwitch_l_0[]
aSwitch_l_0	db 'switch.l',0         ; DATA XREF: load_resources(void)+6E4o
; char aZap_ud_l_0[]
aZap_ud_l_0	db 'zap_ud.l',0         ; DATA XREF: load_resources(void)+6F8o
; char aWeed1_l_0[]
aWeed1_l_0	db 'weed1.l',0          ; DATA XREF: load_resources(void)+70Co
; char aChest_l_0[]
aChest_l_0	db 'chest.l',0          ; DATA XREF: load_resources(void)+720o
; char aFace_r_l_0[]
aFace_r_l_0	db 'face_r.l',0         ; DATA XREF: load_resources(void)+734o
; char aFace_l_l_0[]
aFace_l_l_0	db 'face_l.l',0         ; DATA XREF: load_resources(void)+748o
; char aCrab_l_0[]
aCrab_l_0	db 'crab.l',0           ; DATA XREF: load_resources(void)+75Co
; char aCrabdie_l[]
aCrabdie_l	db 'crabdie.l',0        ; DATA XREF: load_resources(void)+770o
; char aSerpdie_l[]
aSerpdie_l	db 'serpdie.l',0        ; DATA XREF: load_resources(void)+784o
; char aProbspin_l[]
aProbspin_l	db 'probspin.l',0       ; DATA XREF: load_resources(void)+798o
; char aPiece_1_l[]
aPiece_1_l	db 'piece_1.l',0        ; DATA XREF: load_resources(void)+7ACo
; char aPiece_2_l[]
aPiece_2_l	db 'piece_2.l',0        ; DATA XREF: load_resources(void)+7C0o
; char aPiece_3_l[]
aPiece_3_l	db 'piece_3.l',0        ; DATA XREF: load_resources(void)+7D4o
; char aPiece_4_l[]
aPiece_4_l	db 'piece_4.l',0        ; DATA XREF: load_resources(void)+7E8o
; char aGun_1_l[]
aGun_1_l	db 'gun_1.l',0          ; DATA XREF: load_resources(void)+7FCo
; char aGun_2_l[]
aGun_2_l	db 'gun_2.l',0          ; DATA XREF: load_resources(void)+810o
; char aGun_3_l[]
aGun_3_l	db 'gun_3.l',0          ; DATA XREF: load_resources(void)+824o
; char aGun_4_l[]
aGun_4_l	db 'gun_4.l',0          ; DATA XREF: load_resources(void)+838o
; char aStatue_l_0[]
aStatue_l_0	db 'statue.l',0         ; DATA XREF: load_resources(void)+84Co
; char aFire_pit_l_0[]
aFire_pit_l_0	db 'fire_pit.l',0       ; DATA XREF: load_resources(void)+860o
; char aClam_l_0[]
aClam_l_0	db 'clam.l',0           ; DATA XREF: load_resources(void)+874o
; char aCannonr_l_0[]
aCannonr_l_0	db 'cannonr.l',0        ; DATA XREF: load_resources(void)+888o
; char aCannonl_l[]
aCannonl_l	db 'cannonl.l',0        ; DATA XREF: load_resources(void)+89Co
; char aShipr_l_0[]
aShipr_l_0	db 'shipr.l',0          ; DATA XREF: load_resources(void)+8B0o
; char aShipl_l_0[]
aShipl_l_0	db 'shipl.l',0          ; DATA XREF: load_resources(void)+8C4o
; char aMouse_l_0[]
aMouse_l_0	db 'mouse.l',0          ; DATA XREF: load_resources(void)+8D8o
; char aKey_l_0[]
aKey_l_0	db 'key.l',0            ; DATA XREF: load_resources(void)+8ECo
; char aPat1_l[]
aPat1_l		db 'pat1.l',0           ; DATA XREF: load_resources(void)+900o
; char aFire1[]
aFire1		db 'fire1',0            ; DATA XREF: load_resources(void)+916o
; char aFire2[]
aFire2		db 'fire2',0            ; DATA XREF: load_resources(void)+92Co
; char aExp1[]
aExp1		db 'exp1',0             ; DATA XREF: load_resources(void)+942o
; char aExp2_0[]
aExp2_0		db 'exp2',0             ; DATA XREF: load_resources(void)+958o
; char aDirhit[]
aDirhit		db 'dirhit',0           ; DATA XREF: load_resources(void)+96Eo
; char aBubbles2_1[]
aBubbles2_1	db 'bubbles2',0         ; DATA XREF: load_resources(void)+984o
; char aPirana[]
aPirana		db 'pirana',0           ; DATA XREF: load_resources(void)+99Ao
; char aDoor[]
aDoor		db 'door',0             ; DATA XREF: load_resources(void)+9B0o
; char aDrillhi_5[]
aDrillhi_5	db 'drillhi',0          ; DATA XREF: load_resources(void)+9C6o
; char aZap[]
aZap		db 'zap',0              ; DATA XREF: load_resources(void)+9DCo
; char aPup[]
aPup		db 'pup',0              ; DATA XREF: load_resources(void)+9F2o
; char aPup2[]
aPup2		db 'pup2',0             ; DATA XREF: load_resources(void)+A08o
; char aFaze[]
aFaze		db 'faze',0             ; DATA XREF: load_resources(void)+A1Eo
; char aTulip[]
aTulip		db 'tulip',0            ; DATA XREF: load_resources(void)+A34o
; char aPing_2[]
aPing_2		db 'ping',0             ; DATA XREF: load_resources(void)+A4Ao
; char aTport_0[]
aTport_0	db 'tport',0            ; DATA XREF: load_resources(void)+A60o
; char aSwish_0[]
aSwish_0	db 'swish',0            ; DATA XREF: load_resources(void)+A76o
; char aSmash_0[]
aSmash_0	db 'smash',0            ; DATA XREF: load_resources(void)+A8Co
aTitle_cmf	db 'title.cmf',0        ; DATA XREF: start_title_loop(void)+5o
; char aP_title_pcx[]
aP_title_pcx	db 'p_title.pcx',0      ; DATA XREF: start_title_loop(void)+2Fo
aTitle		db 'title',0            ; DATA XREF: start_title_loop(void)+6Eo
; char aPup2_0[]
aPup2_0		db 'pup2',0             ; DATA XREF: start_title_loop(void)+74o
; char aSum[]
aSum		db 'sum',0              ; DATA XREF: start_title_loop(void)+D3o
; char aP_highs_pcx[]
aP_highs_pcx	db 'p_highs.pcx',0      ; DATA XREF: show_high_scores(uchar)+2Bo
; char src[]
_src		db '.',0                ; DATA XREF: show_high_scores(uchar)+C4o
; char aYourScore[]
aYourScore	db 'Your score: ',0     ; DATA XREF: show_high_scores(uchar)+19Fo
aReset		db 'Reset',0            ; DATA XREF: show_high_scores(uchar)+20Ao
aOk		db 'Ok',0               ; DATA XREF: show_high_scores(uchar)+226o
; char aAreYouSureYouW[]
aAreYouSureYouW	db 'Are you sure you want to',0Ah ; DATA XREF: show_high_scores(uchar)+335o
		db 'reset the high scoresq',0
aStats_cmf	db 'stats.cmf',0        ; DATA XREF: show_stats(void)+41o
; char aAdd[]
aAdd		db 'add',0              ; DATA XREF: show_stats(void)+57o
; char aSum_0[]
aSum_0		db 'sum',0              ; DATA XREF: show_stats(void)+6Do
aAttemptToDivid	db 'Attempt to divide by zero in show_stats.',0
					; DATA XREF: show_stats(void)+E5o
flt_29B10	dd 100.0		; DATA XREF: show_stats(void)+10Br
					; show_stats(void)+133r
aShowStats	db 'show stats',0       ; DATA XREF: show_stats(void)+167o
; char aP_stats_pcx[]
aP_stats_pcx	db 'p_stats.pcx',0      ; DATA XREF: show_stats(void)+18Eo
; char aOtis_l[]
aOtis_l		db 'otis.l',0           ; DATA XREF: show_stats(void)+1B6o
; char aEnemiesDestroy[]
aEnemiesDestroy	db 'Enemies destroyed : ',0 ; DATA XREF: show_stats(void)+1EDo
; char asc_29B47[]
asc_29B47	db '%',0                ; DATA XREF: show_stats(void)+21Co
; char aGoodies[]
aGoodies	db 'Goodies           : ',0 ; DATA XREF: show_stats(void)+24Co
; char asc_29B5E[]
asc_29B5E	db '%',0                ; DATA XREF: show_stats(void)+27Bo
; char aBonusX50[]
aBonusX50	db 'Bonus X 50        :',0 ; DATA XREF: show_stats(void)+2ADo
; char aBonusX100[]
aBonusX100	db 'Bonus X 100       :',0 ; DATA XREF: show_stats(void)+2C9o
; char aAdd_0[]
aAdd_0		db 'add',0              ; DATA XREF: show_stats(void)+339o
; char aAdd_1[]
aAdd_1		db 'add',0              ; DATA XREF: show_stats(void)+4ECo
; char aSum_1[]
aSum_1		db 'sum',0              ; DATA XREF: show_stats(void)+648o
; char aAdd_2[]
aAdd_2		db 'add',0              ; DATA XREF: show_stats(void)+691o
; char aSum_2[]
aSum_2		db 'sum',0              ; DATA XREF: show_stats(void)+6A5o
; char aPrelude_l[]
aPrelude_l	db 'prelude.l',0        ; DATA XREF: show_prelude(void)+7Do
; char aFire2_0[]
aFire2_0	db 'fire2',0            ; DATA XREF: show_prelude(void)+E6o
; char aExp2_1[]
aExp2_1		db 'exp2',0             ; DATA XREF: show_prelude(void)+174o
; char aFire2_1[]
aFire2_1	db 'fire2',0            ; DATA XREF: show_prelude(void)+1E0o
aLoopDoesNotExi	db 'Loop does not exist.',0
					; DATA XREF: show_loop(uchar *,int,int,uchar,uint)+5Eo
; char amandich[]
amandich	db '-mandich',0         ; DATA XREF: update_gun(void):loc_ABB9t
					; parse_options(int,uchar **)+1Co
; char aPcsound[]
aPcsound	db '-pcsound',0         ; DATA XREF: parse_options(int,uchar **)+43o
; char aStart[]
aStart		db '-start',0           ; DATA XREF: parse_options(int,uchar **)+6Ao
aBs1_bdl_l_1	db 'bs1_bdl.l',0        ; DATA XREF: seg03f9:6B4Fo
aBs2_bod_l_1	db 'bs2_bod.l',0        ; DATA XREF: seg03f9:6BD5o
aOtiseyes_l_1	db 'otiseyes.l',0       ; DATA XREF: seg03f9:6C5Ao
aBs2_tnl2_l_1	db 'bs2_tnl2.l',0       ; DATA XREF: seg03f9:6CF8o
aBs2_tnr2_l_1	db 'bs2_tnr2.l',0       ; DATA XREF: seg03f9:6D9Fo
aBs2_tnl1_l_1	db 'bs2_tnl1.l',0       ; DATA XREF: seg03f9:6E46o
aBs2_tnr1_l_1	db 'bs2_tnr1.l',0       ; DATA XREF: seg03f9:6EEDo
aBs3_bdl_l_1	db 'bs3_bdl.l',0        ; DATA XREF: seg03f9:6F9Eo
aBs3_arr_l_1	db 'bs3_arr.l',0        ; DATA XREF: seg03f9:7019o
aBs3_arl_l_1	db 'bs3_arl.l',0        ; DATA XREF: seg03f9:70DBo
aBs3_prpr_l_1	db 'bs3_prpr.l',0       ; DATA XREF: seg03f9:70FBo
aBs3_prpl_l_1	db 'bs3_prpl.l',0       ; DATA XREF: seg03f9:71A3o
aBs3_facr_l_1	db 'bs3_facr.l',0       ; DATA XREF: seg03f9:71C3o
aBs3_facl_l_1	db 'bs3_facl.l',0       ; DATA XREF: seg03f9:726Bo
; `__vtable__'[gui_item]
@gui_item@	dd @gui_item@draw$qv	; DATA XREF: gui_item::~gui_item(void)+Do
					; gui_item::gui_item(void)+1Fo
					; gui_item::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
		dd 6177334h
; `__vtable__'[button]
@button@	dd @button@draw$qv	; DATA XREF: button::~button(void)+Do
					; button::button(uchar *,void *,uchar)+2Co
					; button::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
		dd @button@poll$qv	; button::poll(void)
aSubl_l_2	db 'subl.l',0           ; DATA XREF: seg0b2c:08C5o
aSubr_l_3	db 'subr.l',0           ; DATA XREF: seg0b2c:08CBo
aProbspin_l_0	db 'probspin.l',0       ; DATA XREF: seg0b2c:0A51o
aDrillhi_6	db 'drillhi',0          ; DATA XREF: seg0b2c:0A91o
aProbel_l_1	db 'probel.l',0         ; DATA XREF: seg0b2c:0CDCo
aProber_l_2	db 'prober.l',0         ; DATA XREF: seg0b2c:0CE2o
aPup2_1		db 'pup2',0             ; DATA XREF: seg0b2c:0D66o
aGem_l_1	db 'gem.l',0            ; DATA XREF: seg0b2c:0EB7o
aCoin_l_0	db 'coin.l',0           ; DATA XREF: seg0b2c:0EE7o
aPup_0		db 'pup',0              ; DATA XREF: seg0b2c:10C6o
aFish1r_l_1	db 'fish1r.l',0         ; DATA XREF: seg0b2c:1190o
aFish2r_l_1	db 'fish2r.l',0         ; DATA XREF: seg0b2c:1196o
aFish1l_l_0	db 'fish1l.l',0         ; DATA XREF: seg0b2c:11B4o
aFish2l_l_0	db 'fish2l.l',0         ; DATA XREF: seg0b2c:11BAo
aDoor_0		db 'door',0             ; DATA XREF: seg0b2c:126Eo
aPup2_2		db 'pup2',0             ; DATA XREF: seg0b2c:160Bo
aPup2_3		db 'pup2',0             ; DATA XREF: seg0b2c:163Fo
aPup_1		db 'pup',0              ; DATA XREF: seg0b2c:1662o
aShipr_l_1	db 'shipr.l',0          ; DATA XREF: seg0b2c:19B4o
aShipl_l_1	db 'shipl.l',0          ; DATA XREF: seg0b2c:19BAo
aShpbmb_l_0	db 'shpbmb.l',0         ; DATA XREF: seg0b2c:19F8o
aCannonr_l_1	db 'cannonr.l',0        ; DATA XREF: seg0b2c:1B32o
aCannonl_l_0	db 'cannonl.l',0        ; DATA XREF: seg0b2c:1B38o
aGem_l_0	db 'gem.l',0            ; DATA XREF: seg0b2c:1CBAo
aDirhit_0	db 'dirhit',0           ; DATA XREF: seg0b2c:1DF6o
aSwish_1	db 'swish',0            ; DATA XREF: seg0b2c:1E90o
aShutl_r_l_0	db 'shutl_r.l',0        ; DATA XREF: seg0b2c:1FA8o
aShutl_l_l_1	db 'shutl_l.l',0        ; DATA XREF: seg0b2c:1FAEo
aFirbaldn_l_0	db 'firbaldn.l',0       ; DATA XREF: seg0b2c:202Bo
aFire1_0	db 'fire1',0            ; DATA XREF: seg0b2c:20F8o
aFirbalup_l_0	db 'firbalup.l',0       ; DATA XREF: seg0b2c:2116o
aTent_out_l_1	db 'tent_out.l',0       ; DATA XREF: seg0b2c:229Fo
aTent_in_l_0	db 'tent_in.l',0        ; DATA XREF: seg0b2c:2313o
aPirana_1	db 'pirana',0           ; DATA XREF: seg0b2c:2433o
aSharkdie_l_1	db 'sharkdie.l',0       ; DATA XREF: seg0b2c:2545o
aPirana_2	db 'pirana',0           ; DATA XREF: seg0b2c:2558o
aSharkr_l_2	db 'sharkr.l',0         ; DATA XREF: seg0b2c:2579o
aSharkl_l_2	db 'sharkl.l',0         ; DATA XREF: seg0b2c:257Fo
aCrabdie_l_0	db 'crabdie.l',0        ; DATA XREF: seg0b2c:28C8o
aPirana_0	db 'pirana',0           ; DATA XREF: seg0b2c:28DBo
aSerpdie_l_0	db 'serpdie.l',0        ; DATA XREF: seg0b2c:29D5o
aSerp_l_l_1	db 'serp_l.l',0         ; DATA XREF: seg0b2c:2A0Fo
aSerp_r_l_1	db 'serp_r.l',0         ; DATA XREF: seg0b2c:2A15o
aPiranar_l_1	db 'piranar.l',0        ; DATA XREF: seg0b2c:2BDAo
aPiranal_l_1	db 'piranal.l',0        ; DATA XREF: seg0b2c:2BE0o
aPirana_3	db 'pirana',0           ; DATA XREF: seg0b2c:2D98o
aTulipl_l_0	db 'tulipl.l',0         ; DATA XREF: seg0b2c:2E4Ao
aTulipr_l_0	db 'tulipr.l',0         ; DATA XREF: seg0b2c:2E88o
aTulip_l_1	db 'tulip.l',0          ; DATA XREF: seg0b2c:2F7Co
aZap_0		db 'zap',0              ; DATA XREF: seg0b2c:3267o
aFreemine_l_0	db 'freemine.l',0       ; DATA XREF: seg0b2c:335Fo
aMreal_l_0	db 'mreal.l',0          ; DATA XREF: seg0b2c:33CFo
aDirhit_2	db 'dirhit',0           ; DATA XREF: seg0b2c:3502o
aBadgrunt_1	db 'badgrunt',0         ; DATA XREF: seg0b2c:39C2o
aBs1dr_l_1	db 'bs1dr.l',0          ; DATA XREF: seg0b2c:3A53o
aDirhit_1	db 'dirhit',0           ; DATA XREF: seg0b2c:3AC7o
aBs1_bdr_l_1	db 'bs1_bdr.l',0        ; DATA XREF: seg0b2c:3B34o
aBs1_bdl_l_2	db 'bs1_bdl.l',0        ; DATA XREF: seg0b2c:3B3Ao
aBadgrunt_2	db 'badgrunt',0         ; DATA XREF: seg0b2c:3C93o
aExp3_l_1	db 'exp3.l',0           ; DATA XREF: seg0b2c:4231o
aBs3_dthr_l_1	db 'bs3_dthr.l',0       ; DATA XREF: seg0b2c:42A3o
aDirhit_3	db 'dirhit',0           ; DATA XREF: seg0b2c:43B4o
aBs3_bdr_l_1	db 'bs3_bdr.l',0        ; DATA XREF: seg0b2c:449Bo
aBs3_arr_l_2	db 'bs3_arr.l',0        ; DATA XREF: seg0b2c:44B8o
aBs3_bdl_l_2	db 'bs3_bdl.l',0        ; DATA XREF: seg0b2c:44D1o
aBs3_arl_l_2	db 'bs3_arl.l',0        ; DATA XREF: seg0b2c:44EEo
aBs3_prpl_l_2	db 'bs3_prpl.l',0       ; DATA XREF: seg0b2c:4702o
aBs3_prpr_l_2	db 'bs3_prpr.l',0       ; DATA XREF: seg0b2c:4708o
aBs3_facl_l_2	db 'bs3_facl.l',0       ; DATA XREF: seg0b2c:47B0o
aBs3_facr_l_2	db 'bs3_facr.l',0       ; DATA XREF: seg0b2c:47B6o
; char aPrinterError_C[]
aPrinterError_C	db 'Printer error.  Continueq',0 ; DATA XREF: print_form(uchar *,uchar)+7Eo
; char asc_29EFE[]
asc_29EFE	db '        ',0         ; DATA XREF: print_form(uchar *,uchar)+CFo
aTurn_l_2	db 'turn.l',0           ; DATA XREF: seg0fa9:0289o
aFish1r_l_2	db 'fish1r.l',0         ; DATA XREF: seg0fa9:029Do
aBs1_bdl_l_3	db 'bs1_bdl.l',0        ; DATA XREF: seg0fa9:02B2o
aInSearchOfDr_R	db 'In Search of Dr. Riptide',0 ; DATA XREF: seg0fa9:02D1o
aREGISTERED	db 'R E G I S T E R E D',0 ; DATA XREF: seg0fa9:02EBo
aDesignAndProgr	db 'Design and Programming:',0 ; DATA XREF: seg0fa9:0318o
aRaoulSaid	db 'Raoul Said',0       ; DATA XREF: seg0fa9:0342o
aProducer	db 'Producer:',0        ; DATA XREF: seg0fa9:036Fo
aAveryPack	db 'Avery Pack',0       ; DATA XREF: seg0fa9:0399o
aArtwork	db 'Artwork:',0         ; DATA XREF: seg0fa9:03C6o
aMelGuymon	db 'Mel Guymon',0       ; DATA XREF: seg0fa9:03F0o
aComposerSoundE	db 'Composer/Sound Effects:',0 ; DATA XREF: seg0fa9:041Eo
aDanFroelich	db 'Dan Froelich',0     ; DATA XREF: seg0fa9:0449o
aCopyrightC1994	db 'Copyright (C) 1994 MindStorm Software',0 ; DATA XREF: seg0fa9:0475o
aAndPackMediaCo	db 'and Pack Media Company, Inc.',0 ; DATA XREF: seg0fa9:0490o
aScream		db 'scream',0           ; DATA XREF: seg0fa9:04B9o
aT_cat_txt	db 't_cat.txt',0        ; DATA XREF: seg0fa9:0621o
aStartGameFromB	db 'Start game from beginingq',0 ; DATA XREF: seg0fa9:0659o
aEndCurrentGame	db 'End current gameq',0 ; DATA XREF: seg0fa9:0688o
aPassword_0	db 'Password',0         ; DATA XREF: seg0fa9:06C3o
aEnterPasswordB	db 'Enter password below:',0 ; DATA XREF: seg0fa9:06BFo
aCharge		db 'charge',0           ; DATA XREF: seg0fa9:071Do
aLetsrip	db 'LETSRIP!',0         ; DATA XREF: seg0fa9:074Co
aDrillhi_7	db 'drillhi',0          ; DATA XREF: seg0fa9:0764o
aCheatModeOnLet	db 'Cheat mode ON!',0Ah ; DATA XREF: seg0fa9:077Eo
		db 'Let',27h,'s Rip!',0
aThatIsNotAVali	db 'That is not a valid',0Ah ; DATA XREF: seg0fa9:079Do
		db 'password.',0
aPat1_l_0	db 'pat1.l',0           ; DATA XREF: seg0fa9:0815o
aPu_shld_l_1	db 'pu_shld.l',0        ; DATA XREF: seg0fa9:0850o
aPu_auto_l_1	db 'pu_auto.l',0        ; DATA XREF: seg0fa9:086Ao
aPu_fire_l_1	db 'pu_fire.l',0        ; DATA XREF: seg0fa9:0884o
aPu_jason_l_1	db 'pu_jason.l',0       ; DATA XREF: seg0fa9:089Eo
aT_inst_txt	db 't_inst.txt',0       ; DATA XREF: seg0fa9:08BCo
aPat1_l_1	db 'pat1.l',0           ; DATA XREF: seg0fa9:094Co
aT_story_txt	db 't_story.txt',0      ; DATA XREF: seg0fa9:097Do
aAreYouSureYo_0	db 'Are you sure you want to',0Ah ; DATA XREF: seg0fa9:09EFo
		db 'leaveq',0
aConfig_rip	db 'config.rip',0       ; DATA XREF: seg0fa9:0A3Fo
aWb		db 'wb+',0              ; DATA XREF: seg0fa9:0A3Bo
aT_exit_txt	db 't_exit.txt',0       ; DATA XREF: seg0fa9:0ABCo
aGameSound	db 'Game Sound',0       ; DATA XREF: seg0fa9:0AE7o
aGameSoundsAreC	db 'Game sounds are currently ',0 ; DATA XREF: seg0fa9:0AFDo
aOn_		db 'ON.',0              ; DATA XREF: seg0fa9:0B18o
aOff_		db 'OFF.',0             ; DATA XREF: seg0fa9:0B1Eo
aNewSettingq	db 'New settingq',0     ; DATA XREF: seg0fa9:0B40o
aOff		db 'Off',0              ; DATA XREF: seg0fa9:0B56o
aOn		db 'On',0               ; DATA XREF: seg0fa9:0B6Co
aGameControl	db 'Game Control',0     ; DATA XREF: seg0fa9:0C0Do
aGameControlIsC	db 'Game control is currently set to:',0 ; DATA XREF: seg0fa9:0C23o
aKeyboard	db 'KEYBOARD',0         ; DATA XREF: seg0fa9:0C4Ao
aJoystick	db 'JOYSTICK',0         ; DATA XREF: seg0fa9:0C5Eo
aJoy		db 'Joy',0              ; DATA XREF: seg0fa9:0C68o
aKey		db 'Key',0              ; DATA XREF: seg0fa9:0C7Eo
aCenterJoystick	db 'Center joystick and press',0Ah ; DATA XREF: seg0fa9:0CF5o
		db 'fire button...',0
aJoystickCalibr	db 'Joystick calibration aborted.',0 ; DATA XREF: seg0fa9:0D3Do
aGameSpeed_0	db 'Game Speed',0       ; DATA XREF: seg0fa9:0D7Fo
aGameSpeedIsCur	db 'Game speed is currently set to:',0 ; DATA XREF: seg0fa9:0D95o
aFast		db 'FAST',0             ; DATA XREF: seg0fa9:0DBDo
aSlow		db 'SLOW',0             ; DATA XREF: seg0fa9:0DD1o
aSlow_0		db 'Slow',0             ; DATA XREF: seg0fa9:0DDBo
aFast_0		db 'Fast',0             ; DATA XREF: seg0fa9:0DF1o
aT_help_txt	db 't_help.txt',0       ; DATA XREF: seg0fa9:0F1Eo
aBytesFree	db 'Bytes free  : ',0   ; DATA XREF: seg0fa9:0F67o
asc_2A262	db 0Ah,0		; DATA XREF: seg0fa9:0F9Ao
aMapWidth	db 0Ah			; DATA XREF: seg0fa9:0FAAo
		db 'Map width   : ',0
aMapHeight	db 0Ah			; DATA XREF: seg0fa9:0FDFo
		db 'Map height  : ',0
aCastSize	db 0Ah			; DATA XREF: seg0fa9:1014o
		db 'Cast size   : ',0
aSprtStorage	db 0Ah			; DATA XREF: seg0fa9:104Ao
		db 'Sprt storage: ',0
aEgoXY		db 0Ah			; DATA XREF: seg0fa9:1082o
		db 'Ego X,Y     : ',0
asc_2A2B4	db ' ',0                ; DATA XREF: seg0fa9:10B5o
aSystemBench	db 0Ah			; DATA XREF: seg0fa9:10E9o
		db 'System Bench: ',0
dbl_2A2C6	dq 18.2			; DATA XREF: seg0fa9:11AFr
flt_2A2CE	dd 600.0		; DATA XREF: seg0fa9:11B4r
aFramesPerSecon	db 'Frames per second: ',0 ; DATA XREF: seg0fa9:11CEo
aShotSize	db 'Shot size',0        ; DATA XREF: seg0fa9:1239o
aEnterNewShotSi	db '  Enter new shot size:  ',0 ; DATA XREF: seg0fa9:124Fo
aSmall		db 'Small',0            ; DATA XREF: seg0fa9:1265o
aMedium		db 'Medium',0           ; DATA XREF: seg0fa9:127Bo
aHuge		db 'Huge',0             ; DATA XREF: seg0fa9:1291o
aAdlibCardNotPr	db 'Adlib card not present.',0 ; DATA XREF: seg0fa9:1325o
a_cmf		db '*.cmf',0            ; DATA XREF: seg0fa9:1337o
aAdlibCardNot_0	db 'Adlib card not present.',0 ; DATA XREF: seg0fa9:137Ao
aGodModeNowOn	db 'God mode now on!',0 ; DATA XREF: seg0fa9:13A3o
aq		dw 3Fh			; DATA XREF: setup_options(void)+Eo
; char AboutRiptide[]
AboutRiptide	db 'About Riptide...',0 ; DATA XREF: setup_options(void)+2Ao
; char aCatalog___[]
aCatalog___	db 'Catalog...',0       ; DATA XREF: setup_options(void)+42o
; char aHelp[]
aHelp		db 'Help',0             ; DATA XREF: setup_options(void)+5Ao
aGame_1		db 'Game',0             ; DATA XREF: setup_options(void)+82o
; char aStart_0[]
aStart_0	db 'Start',0            ; DATA XREF: setup_options(void)+9Eo
; char aStartActIi[]
aStartActIi	db 'Start Act II',0     ; DATA XREF: setup_options(void)+B6o
; char aResume_1[]
aResume_1	db 'Resume',0           ; DATA XREF: setup_options(void)+CEo
; char aPassword[]
aPassword	db 'Password',0         ; DATA XREF: setup_options(void)+E6o
; char aStory___[]
aStory___	db 'Story...',0         ; DATA XREF: setup_options(void)+FEo
; char aInstructions__[]
aInstructions__	db 'Instructions...',0  ; DATA XREF: setup_options(void)+116o
; char aHighScores___[]
aHighScores___	db 'High scores...',0   ; DATA XREF: setup_options(void)+12Eo
; char aQuit[]
aQuit		db 'Quit',0             ; DATA XREF: setup_options(void)+146o
aSetup		db 'Setup',0            ; DATA XREF: setup_options(void)+16Eo
; char aSound[]
aSound		db 'Sound',0            ; DATA XREF: setup_options(void)+18Ao
; char aControl[]
aControl	db 'Control',0          ; DATA XREF: setup_options(void)+1A2o
; char aGameSpeed[]
aGameSpeed	db 'Game speed',0       ; DATA XREF: setup_options(void)+1BAo
aDebug_1	db 'Debug',0            ; DATA XREF: setup_options(void)+1ECo
; char aInfo[]
aInfo		db 'Info',0             ; DATA XREF: setup_options(void)+208o
; char aRunBenchmark_1[]
aRunBenchmark_1	db 'Run benchmark',0    ; DATA XREF: setup_options(void)+220o
; char aShotSize___[]
aShotSize___	db 'Shot size...',0     ; DATA XREF: setup_options(void)+238o
; char aPlaySong___[]
aPlaySong___	db 'Play song...',0     ; DATA XREF: setup_options(void)+250o
; char aStopSong[]
aStopSong	db 'Stop song',0        ; DATA XREF: setup_options(void)+268o
; char aGodMode[]
aGodMode	db 'God mode',0         ; DATA XREF: setup_options(void)+280o
		db 0
aRscFile_	db 'RSC file.',0        ; DATA XREF: game_manager::game_manager(uchar *)+67o
; char aSoundblasterDe[]
aSoundblasterDe	db 'SoundBlaster detected.',0Ah,0
					; DATA XREF: game_manager::game_manager(uchar *)+167o
aSoundStorageFu	db 'Sound storage full.',0
					; DATA XREF: game_manager::define_sound(uchar *,uchar)+13o
aSndNotInStorag	db 'Snd not in storage.',0 ; DATA XREF: game_manager::get_sound(uchar *)+63o
aCanTFindSong	db 'Can',27h,'t find song ',0
					; DATA XREF: game_manager::play_song(uchar *)+48o
; char a_voc[]
a_voc		db '.voc',0             ; DATA XREF: game_manager::play_voc_file(uchar *)+30o
; char a_voc_0[]
a_voc_0		db '.voc',0             ; DATA XREF: game_manager::load_voc(uchar *)+17o
aVocNotFound	db 'Voc not found: ',0  ; DATA XREF: game_manager::load_voc(uchar *)+52o
; char a_pcs[]
a_pcs		db '.pcs',0             ; DATA XREF: game_manager::load_pcs(uchar *)+17o
aErrorLoadingPc	db 'Error loading pcs:',0 ; DATA XREF: game_manager::load_pcs(uchar *)+F0o
aLoopStorageFul	db 'Loop storage full!',0 ; DATA XREF: game_manager::load_loop(uchar *)+14o
aAddingALoopToG	db 'Adding a loop to game_manager.',0
					; DATA XREF: game_manager::load_loop(uchar *)+35o
aLoadingLoop_	db 'Loading loop.',0    ; DATA XREF: game_manager::load_loop(uchar *)+219o
		db 0
aTooManyActorsI	db 'Too many actors in ed_list.',0 ; DATA XREF: m_actor::set_xy(int,int)+9Co
aErrorLookingFo	db 'Error looking for loop : ',0 ; DATA XREF: m_actor::new_loop(uchar *)+67o
aTooManyActorsT	db 'Too many actors to draw.',0 ; DATA XREF: m_actor::move(void)+15Bo
aAddingActorToC	db 'Adding actor to cast.',0
					; DATA XREF: game_cast::add(uchar *,void *,void	*)+63o
		db 0
_default_mouse	db  0Fh			; DATA XREF: ms_mouse::ms_mouse(void)+ABo
		db    1
		db    1
		db    1
		db    0
		db    1
		db  0Ah
		db  0Ah
		db  0Ah
		db    1
		db    1
		db  0Ah
		db  0Ah
		db    1
		db    0
		db    1
		db  0Ah
		db    1
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
aThisFeatureHas	db 'This feature has not',0Ah ; DATA XREF: seg137f:00DCo
		db 'been implemented yet.',0
aOpenFile	db 'Open File',0        ; DATA XREF: i_load_file(uchar *,uchar *)+5o
aCancel		db 'Cancel',0           ; DATA XREF: i_load_file(uchar *,uchar *)+33o
aOk_0		db 'Ok',0               ; DATA XREF: i_load_file(uchar *,uchar *)+49o
aCd		db 'Cd',0               ; DATA XREF: i_load_file(uchar *,uchar *)+5Fo
aChangeDirector	db 'Change Directory',0 ; DATA XREF: i_load_file(uchar *,uchar *)+AFo
aEnterNewPath	db 'Enter new path:',0  ; DATA XREF: i_load_file(uchar *,uchar *)+ABo
; char aNotAValidPath_[]
aNotAValidPath_	db 'Not a valid path.',0 ; DATA XREF: i_load_file(uchar *,uchar *)+E0o
aNo		db 'No',0               ; DATA XREF: i_yes_cancel(uchar *,uchar)+39o
aYes		db 'Yes',0              ; DATA XREF: i_yes_cancel(uchar *,uchar)+4Fo
aCancel_0	db 'Cancel',0           ; DATA XREF: i_yes_cancel(uchar *,uchar)+59o
aOk_1		db 'Ok',0               ; DATA XREF: i_yes_cancel(uchar *,uchar)+6Fo
aOk_2		db 'Ok',0               ; DATA XREF: i_inform(uchar *,uchar,uchar *)+35o
aTextBox	db 'Text Box',0         ; DATA XREF: seg137f:26D7o
; char a_[]
a_		db '_',0                ; DATA XREF: prompt_box::update_text(uchar *)+AAo
; char asc_2A621[2]
asc_2A621	db '\',0                ; DATA XREF: file_box::file_box(uchar *)+77o
; char asc_2A623[4]
asc_2A623	db 'X:\',0              ; DATA XREF: file_box::current_directory(uchar *)+4o
aMore		db 'More >>',0          ; DATA XREF: text_pager::text_pager(uchar *,uchar,void (*)(uchar))+176o
aExit		db 'Exit',0             ; DATA XREF: text_pager::text_pager(uchar *,uchar,void (*)(uchar))+191o
aDone		db 'Done',0             ; DATA XREF: text_pager::text_pager(uchar *,uchar,void (*)(uchar))+388o
; `__vtable__'[text_pager]
@text_pager@	dd @gui_item@draw$qv	; DATA XREF: text_pager::text_pager(uchar *,uchar,void (*)(uchar))+30o
					; text_pager::~text_pager(void)+Do
					; gui_item::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
		dd 6177334h
; `__vtable__'[file_box]
@file_box@	dd @file_box@draw$qv	; DATA XREF: file_box::file_box(uchar *)+32o
					; file_box::~file_box(void)+Eo
					; file_box::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
		dd @file_box@poll$qv	; file_box::poll(void)
; `__vtable__'[prompt_box]
@prompt_box@	dd @prompt_box@draw$qv	; DATA XREF: prompt_box::prompt_box(uchar *)+2Co
					; prompt_box::~prompt_box(void)+11o
					; prompt_box::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
off_2A659	dd @prompt_box@poll$qv	; prompt_box::poll(void)
; `__vtable__'[text_box]
@text_box@	dd @text_box@draw$qv	; DATA XREF: text_box::text_box(uchar *)+30o
					; text_box::~text_box(void)+11o
					; text_box::draw(void)
		dd @text_box@erase$qv	; text_box::erase(void)
		dd @text_box@poll$qv	; text_box::poll(void)
; `__vtable__'[menu_bar]
@menu_bar@	dd @menu_bar@draw$qv	; DATA XREF: menu_bar::menu_bar(void)+2Co
					; menu_bar::draw(void)
		dd @menu_bar@erase$qv	; menu_bar::erase(void)
		dd @menu_bar@poll$qv	; menu_bar::poll(void)
; `__vtable__'[pull_down]
@pull_down@	dd @pull_down@draw$qv	; DATA XREF: pull_down::pull_down(uchar	*)+2Co
					; pull_down::draw(void)
		dd @gui_item@erase$qv	; gui_item::erase(void)
		dd @pull_down@poll$qv	; pull_down::poll(void)
		db 0
aTiles_		db 'Tiles.',0           ; DATA XREF: tilemap::tilemap(uchar *,int,int)+43o
aViewportWidthT	db 'Viewport width too big.',0
					; DATA XREF: tilemap::set_viewport(int,int,int,int)+97o
aViewportHeight	db 'Viewport height too big.',0
					; DATA XREF: tilemap::set_viewport(int,int,int,int)+C5o
aInitMap_	db 'Init map.',0        ; DATA XREF: tilemap::reset_map(void)+72o
aSavingMap_	db 'Saving map.',0      ; DATA XREF: seg1783:0AC1o
aTiles__0	db 'Tiles.',0           ; DATA XREF: tilemap::load(uchar *,uchar)+13Bo
aLoadingMap_	db 'Loading map.',0     ; DATA XREF: tilemap::load(uchar *,uchar)+22Eo
aTileChangeOutO	db 'Tile change out of range.',0 ; DATA XREF: seg1783:0D25o
_page_offsets	dw 0			; DATA XREF: de_doit(void)+169r
					; de_doit(void)+1B5r ...
word_2A700	dw 3E80h		; DATA XREF: de_doit(void)+329r
					; post_message(uchar)+165r ...
		dw 7D00h
		dw 0BB80h
aPaletteCycleNo	db 'Palette cycle not a multiple of 4.',0
					; DATA XREF: vga_display::setup_cycle(uchar,uchar,uchar)+8Co
aNotInModeXAbor	db 'Not in Mode X - aborted.',0
					; DATA XREF: vga_display::show_offset(uint)+11o
aGettingScreenB	db 'Getting screen bits.',0
					; DATA XREF: vga_display::get_bits(int,int,int,int)+2Co
aLoadingPcxFile	db 'Loading pcx file.',0
					; DATA XREF: vga_display::show_pcx(uchar *,uchar,uint,int)+48o
aCreatingPcxHea	db 'Creating PCX header.',0
					; DATA XREF: vga_display::show_pcx(uchar *,uchar,uint,int)+8Do
aCouldnTOpen	db 'Couldn',27h,'t open',0
					; DATA XREF: vga_display::show_pcx(uchar *,uchar,uint,int)+1E6o
; char aRiptide_pcx[]
aRiptide_pcx	db 'riptide.pcx',0      ; DATA XREF: vga_display::dump_pcx(void)+Bo
aCreatingPcxH_0	db 'Creating PCX header.',0 ; DATA XREF: vga_display::dump_pcx(void)+38o
aRiptide_pcx_0	db 'riptide.pcx',0      ; DATA XREF: vga_display::dump_pcx(void)+26Bo
aCouldnTOpenRip	db 'Couldn',27h,'t open riptide.pcx',0
					; DATA XREF: vga_display::dump_pcx(void)+286o
a_pcx		db '*.pcx',0            ; DATA XREF: seg1891:125Co
aLoadingPcxFi_0	db 'Loading pcx file.',0 ; DATA XREF: seg1891:12C2o
		db 0
unk_2A7EC	db    0			; DATA XREF: return_element(uchar,uchar)+Ao
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; char aHigh_scr[]
aHigh_scr	db 'high.scr',0         ; DATA XREF: init_scores_array(void)+9o
					; save_all_scores(void)+Bo ...
; char arb[3]
arb		db 'rb',0               ; DATA XREF: init_scores_array(void)+5o
; char a________[]
a________	db '........',0         ; DATA XREF: init_scores_file(void)+Bo
; char aError_[]
aError_		db 'Error:',0           ; DATA XREF: save_all_scores(void)+1Fo
					; load_scores_in(void)+1Co
a1_0		db '1',0                ; DATA XREF: return_element(uchar,uchar):loc_1C24Eo
first_time	dw 1			; DATA XREF: _gr_start_kbd_grab+41r
					; _gr_start_kbd_grab+56w
_debug		dw 0			; DATA XREF: check_user(void)+3ECw
; int g_handle
_g_handle	dw 0FFFFh		; DATA XREF: g_open_element(uchar *):loc_1C500r
					; g_open_element(uchar *)+44w ...
_external_open	dd 0
					; DATA XREF: set_external_open(void *)+7w
					; g_open_element(uchar *)+4r ...
_external_read	dd 0
					; DATA XREF: set_external_read(void *)+7w
					; g_element_read(void *,uint)+4r ...
; char aSS[]
aSS		db '%s %s',0Ah,0        ; DATA XREF: terminate(uchar *,uchar *)+31o
; char aS[]
aS		db '%s',0Ah,0           ; DATA XREF: terminate(uchar *,uchar *)+45o
aOutOfHeap	db 'Out of heap : ',0   ; DATA XREF: no_heap(uchar *)+Ao
aReadError	db 'Read error : ',0    ; DATA XREF: read_error(uchar *)+Ao
aWriteError	db 'Write error : ',0   ; DATA XREF: write_error(uchar *)+Ao
aRequestToOpenM	db 'Request to open more than one element.',0
					; DATA XREF: g_open_element(uchar *)+29o
aElementNotOpen	db 'Element not open.',0 ; DATA XREF: g_element_read(void *,uint)+2Co
mouse_cursor_ds	dw 0
mouse_cursor_off db 0
		db    0
leftclipplanemask dd 80C0E0Fh		; DATA XREF: _x_draw_span+28r
					; _x_fill_rect+28r ...
rightclipplanemask dd 703010Fh		; DATA XREF: _x_draw_span+35r
					; _x_fill_rect+32r ...
charx		dw 0
chary		dw 0
charcolor	dw 0
doffset		dw 0
fade		dw 0
dotx		dw 0
doty		dw 0
dcolor		dw 0
_string		db    0
		db    0
		db    0
		db    0
tmp_rgb		db 0			; DATA XREF: _nullpalo	_nullpal+19o ...
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
target_rgb	db 0			; DATA XREF: _palup+10w _palup:incpalr
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; const	int _8087
__8087		dw 0FFFFh		; DATA XREF: sub_24D9+C8w sub_24D9+CEw ...
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
__protected	db 0			; DATA XREF: sub_24D9+18r
					; __fperror+6Br ...
__ldt		dw 0			; DATA XREF: sub_24D9+11r
		db 0
; unsigned int _default87
__default87	dw 1330h		; DATA XREF: sub_2624+4Ar
		db  81h	; 
		db    0
		dd aDomain		; "Domain"
		db  82h	; 
		db    0
		dd aDenormal		; "Denormal"
		db  83h	; 
		db    0
		dd aDivideBy0		; "Divide by 0"
		db  84h	; 
		db    0
		dd aOverflow		; "Overflow"
		db  85h	; 

		db    0
		dd aUnderflow		; "Underflow"
		db  86h	; 
		db    0
		dd aPartialLossOfP	; "Partial loss	of precision"
		db  87h	; 
		db    0
		dd aStackFault		; "Stack fault"
aDomain		db 'Domain',0           ; DATA XREF: seg2608:2C78o
aDenormal	db 'Denormal',0         ; DATA XREF: seg2608:2C7Eo
aDivideBy0	db 'Divide by 0',0      ; DATA XREF: seg2608:2C84o
aOverflow	db 'Overflow',0         ; DATA XREF: seg2608:2C8Ao
aUnderflow	db 'Underflow',0        ; DATA XREF: seg2608:2C90o
aPartialLossOfP	db 'Partial loss of precision',0 ; DATA XREF: seg2608:2C96o
aStackFault	db 'Stack fault',0      ; DATA XREF: seg2608:2C9Co
; char aFloatingPointE[]
aFloatingPointE	db 'Floating point error: %s.',0Ah,0 ; DATA XREF: __fperror+97o
flt_2AF70	dd 1.0			; DATA XREF: __pow10+38r __pow10+BFr
		db    0
		db    0
		db  20h
		db  41h	; A
		db    0
		db    0
		db 0C8h	; È
		db  42h	; B
		db    0
		db    0
		db  7Ah	; z
		db  44h	; D
		db    0
		db  40h	; @
		db  1Ch
		db  46h	; F
		db    0
		db  50h	; P
		db 0C3h	; Ã
		db  47h	; G
		db    0
		db  24h	; $
		db  74h	; t
		db  49h	; I
		db  80h	; 
		db  96h	; 
		db  18h
		db  4Bh	; K
flt_2AF90	dd 1.0e8		; DATA XREF: __pow10+47r
dbl_2AF94	dq 1.0e16		; DATA XREF: __pow10+54r
tbyte_2AF9C	dt 1.0e32		; DATA XREF: __pow10+5Dr
tbyte_2AFA6	dt 9.9999999999999999998e63 ; DATA XREF: __pow10+69r
tbyte_2AFB0	dt 1.0e128		; DATA XREF: __pow10+75r
tbyte_2AFBA	dt 1.0e256		; DATA XREF: __pow10+81r
tbyte_2AFC4	dt 1.0e512		; DATA XREF: __pow10+8Dr
tbyte_2AFCE	dt 9.9999999999999999997e1023 ;	DATA XREF: __pow10+99r
tbyte_2AFD8	dt 1.0e2048		; DATA XREF: __pow10+A5r
tbyte_2AFE2	dt 1.0e4096		; DATA XREF: __pow10+B1r
flt_2AFEC	dd 026DCFC0h			; DATA XREF: __pow10+17r
__atexitcnt	dw 0			; DATA XREF: _atexit+3r
					; _atexit:loc_2C57r ...
		public __ctype
; char _ctype[]
__ctype		db    0, 20h, 20h, 20h,	20h, 20h, 20h, 20h ; DATA XREF:	_atol+13o
		db  20h, 20h, 21h, 21h,	21h, 21h, 21h, 20h
		db  20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h
		db  20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h
		db  20h,   1, 40h, 40h,	40h, 40h, 40h, 40h
		db  40h, 40h, 40h, 40h,	40h, 40h, 40h, 40h
		db  40h,   2,	2,   2,	  2,   2,   2,	 2
		db    2,   2,	2, 40h,	40h, 40h, 40h, 40h
		db  40h, 40h, 14h, 14h,	14h, 14h, 14h, 14h
		db    4,   4,	4,   4,	  4,   4,   4,	 4
		db    4,   4,	4,   4,	  4,   4,   4,	 4
		db    4,   4,	4,   4,	40h, 40h, 40h, 40h
		db  40h, 40h, 18h, 18h,	18h, 18h, 18h, 18h
		db    8,   8,	8,   8,	  8,   8,   8,	 8
		db    8,   8,	8,   8,	  8,   8,   8,	 8
		db    8,   8,	8,   8,	40h, 40h, 40h, 40h
		db  20h,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0
		db    0
		db 0
__exitbuf	dd nullsub_1		; DATA XREF: sub_2D4E+29r _setvbuf+C1w ...
__exitfopen	dd nullsub_1		; DATA XREF: sub_2D4E+41r sub_4EDE+A2w
__exitopen	dd nullsub_1		; DATA XREF: sub_2D4E+45r
; FILE _streams[]
__streams	dw 0			; DATA XREF: __setupio+28o
					; __setupio+71o ...
word_2B102	dw 209h			; DATA XREF: __setupio+50w
					; __setupio+5Ar
byte_2B104	db 0			; DATA XREF: __setupio+1Cw
					; __setupio:loc_3263r
		db    0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		db    0
		db    0
off_2B112	dw offset __streams	; DATA XREF: __setupio+36w
; FILE stru_2B114
stru_2B114	FILE <0, 20Ah, 1, 0, 0,	0, 0, 0, 2EB4h>	; DATA XREF: __setupio+ADo
					; _printf+8o ...
; FILE stru_2B128
stru_2B128	FILE <0, 202h, 2, 0, 0,	0, 0, 0, 2EC8h>	; DATA XREF: __fperror+9Co
					; _perror+48o
unk_2B13C	db    0			; DATA XREF: seg2608:2EEEo
		db    0
		db  43h	; C
		db    2
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dw offset unk_2B13C
; FILE stream
_stream		FILE <0, 242h, 4, 0, 0,	0, 0, 0, 2EF0h>
					; DATA XREF: print_form(uchar *,uchar)+13Co
					; print_form(uchar *,uchar)+169o
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dd 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; void (__interrupt far	*isr)()
_isr		dw 0
		dw 0
		dd 0
		db 0
		db    0
		db 0
		db 0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db 0
		db    0
		db    0
		db 0
		db    0
		db    0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db 0
		db    0
		db 0
		db 0
		db 0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db 0
		db    0
		db 0
		db    0
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; unsigned int _nfile
__nfile		dw 14h			; DATA XREF: start+E1r	__setupio+3r ...
__openfd	dw 6001h		; DATA XREF: _lseek+8w	__read+8r ...
		dw 6002h
		dw 6002h
		dw 0A004h
		dw 0A002h
		dw 0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; int _fmode
__fmode		dw 4000h		; DATA XREF: sub_4EDE:loc_4F68r
					; _open+14r
__notumask	dw 0FFFFh		; DATA XREF: _open:loc_55EDr
; unsigned int _fpstklen
__fpstklen	dw 0CCh
; int _doserrno
__doserrno	dw 0			; DATA XREF: __ioerror:loc_2F2Ew
					; __ioerror+27w ...
__doserrortosv	db 0			; DATA XREF: __ioerror+17r
		db  13h
		db    2
		db    2
		db    4
		db    5
		db    6
		db    8
		db    8
		db    8
		db  14h
		db  15h
		db    5
		db  13h
		db  0Eh
		db  16h
		db    5
		db  11h
		db    2
		db  1Eh
		db  29h	; )
		db  2Ch	; ,
		db  28h	; (
		db  28h	; (
		db  28h	; (
		db  28h	; (
		db  28h	; (
		db  29h	; )
		db  2Ch	; ,
		db  28h	; (
		db  28h	; (
		db  28h	; (
		db    5
		db    5
		db  29h	; )
		db  17h
		db  17h
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Fh
		db  2Ch	; ,
		db  23h	; #
		db    2
		db  2Ch	; ,
		db  0Fh
		db  2Ah	; *
		db  28h	; (
		db  28h	; (
		db  28h	; (
		db  13h
		db  1Bh
		db  1Ch
		db    2
		db    2
		db    5
		db  0Fh
		db    2
		db  17h
		db  28h	; (
		db  2Ah	; *
		db  13h
		db  2Ah	; *
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  0Eh
		db  23h	; #
		db  0Eh
		db  1Ch
		db  28h	; (
		db  17h
		db  23h	; #
		db  25h	; %
		db 13h
		db  28h	; (
		db    0
; char aTmp[]
aTmp		db 'TMP',0              ; DATA XREF: __mkname+20o
; char a__0[]
a__0		db '.$$$',0             ; DATA XREF: __mkname+41o
		db    0
word_2B326	dw 1			; DATA XREF: _srand+Cw	_rand+4r ...
word_2B328	dw 0			; DATA XREF: _srand+6w	_randr	...
; unsigned int _stklen
__stklen	dw 1000h		; DATA XREF: start+62r	start+70w ...
aNull		db '(null)',0           ; DATA XREF: __vprinter+2CEo
byte_2B333	db 0			; DATA XREF: __vprinter+C3r
		db  14h
		db  14h
		db    1
		db  14h
		db  15h
		db  14h
		db  14h
		db  14h
		db  14h
		db    2
		db    0
		db  14h
		db    3
		db    4
		db  14h
		db    9
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  0Fh
		db  17h
		db  0Fh
		db    8
		db  14h
		db  14h
		db  14h
		db    7
		db  14h
		db  16h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  0Dh
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  10h
		db  0Ah
		db  0Fh
		db  0Fh
		db  0Fh
		db    8
		db  0Ah
		db  14h
		db  14h
		db    6
		db  14h
		db  12h
		db  0Bh
		db  0Eh
		db  14h
		db  14h
		db 11h
		db  14h
		db  0Ch
		db  14h
		db  14h
		db  0Dh
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db    0
; int _wscroll
__wscroll	dw 1			; DATA XREF: __cputn+D5r
__video		db 0			; DATA XREF: _clrscr+3r seg0000:16DBr	...
byte_2B397	db 0			; DATA XREF: _clrscr+7r seg0000:16DFr	...
byte_2B398	db 0			; DATA XREF: _clrscr+Br
					; __cputn:loc_39E0r ...
byte_2B399	db 0			; DATA XREF: _clrscr+Fr
					; __cputn:loc_39F8r ...
byte_2B39A	db 0			; DATA XREF: _textcolor+3r
					; _textcolor+10w ...
byte_2B39B	db 0			; DATA XREF: _normvideor
					; __c0crtinit+14w
byte_2B39C	db 0			; DATA XREF: __crtinit+6w
					; __crtinit+12r ...
byte_2B39D	db 0			; DATA XREF: __crtinit:loc_3BD1w
					; __crtinit+B8r ...
byte_2B39E	db 0			; DATA XREF: __vptr+3r	__crtinit+Ew ...
byte_2B39F	db 0			; DATA XREF: __cputn:loc_3988r
					; __crtinit:loc_3BB8w ...
byte_2B3A0	db 0			; DATA XREF: __vram+8r
					; __crtinit:loc_3BFDw
word_2B3A1	dw 0			; DATA XREF: __vptr+Fr	__crtinit+A2w
word_2B3A3	dw 0			; DATA XREF: __vptr+1Dr
					; __crtinit:loc_3C0Fw ...
; int directvideo
_directvideo	dw 1			; DATA XREF: __cputn+74r __screenio+Fr ...
aCompaq		db 'COMPAQ',0           ; DATA XREF: __crtinit+74o
aPrint		db 'print'              ; DATA XREF: sub_3C32o
aScan		db ' scan'              ; DATA XREF: sub_3C32:loc_3C37o
aFFloatingPoint	db 'f : floating point formats not linked',0Dh,0Ah,0
					; DATA XREF: sub_3C32+15o
word_2B3E0	dw 952h			; DATA XREF: seg0000:1A9Dw _delay+19r
word_2B3E2	dw 0			; DATA XREF: seg0000:1A97w _delay+15r
word_2B3E4	dw 0			; DATA XREF: sub_4120+13r
__cflag		db 0			; DATA XREF: _getchr _getch+7w ...
__cchar		db 0			; DATA XREF: _getch+Cr	_ungetch+17w
; int _argc
__argc		dw 0			; DATA XREF: unknown_libname_3+C8w
					; unknown_libname_3+113r
; char **_argv
__argv		dw 0			; DATA XREF: unknown_libname_3+DBw
					; unknown_libname_3+11Fr
word_2B3EC	dw 0			; DATA XREF: unknown_libname_3+DFw
					; unknown_libname_3+119r
off_2B3EE	dw offset start		; DATA XREF: unknown_libname_3w
					; unknown_libname_3+125r
word_2B3F0	dw 0			; DATA XREF: unknown_libname_3+4w
					; unknown_libname_3+10Fr
word_2B3F2	dw 0			; DATA XREF: unknown_libname_3+8w
					; unknown_libname_3+10Br
word_2B3F4	dw 0			; DATA XREF: unknown_libname_3+11w
					; unknown_libname_3+103r
word_2B3F6	dw 0			; DATA XREF: unknown_libname_3+15w
					; unknown_libname_3+107r
; char *sys_errlist[]
_sys_errlist	dd aError0		; DATA XREF: _perror+22r _perror+1Er
					; "Error 0"
		dd aInvalidFunctio	; "Invalid function number"
		dd aNoSuchFileOrDi	; "No such file	or directory"
		dd aPathNotFound	; "Path	not found"
		dd aTooManyOpenFil	; "Too many open files"
		dd aPermissionDeni	; "Permission denied"
		dd aBadFileNumber	; "Bad file number"
		dd aMemoryArenaTra	; "Memory arena	trashed"
		dd aNotEnoughMemor	; "Not enough memory"
		dd aInvalidMemoryB	; "Invalid memory block	address"
		dd aInvalidEnviron	; "Invalid environment"
		dd aInvalidFormat	; "Invalid format"
		dd aInvalidAccessC	; "Invalid access code"
		dd aInvalidData		; "Invalid data"
		dd unk_2B5C1
		dd aNoSuchDevice	; "No such device"
		dd aAttemptedToRem	; "Attempted to	remove current directory"
		dd aNotSameDevice	; "Not same device"
		dd aNoMoreFiles		; "No more files"
		dd aInvalidArgumen	; "Invalid argument"
		dd aArgListTooBig	; "Arg list too	big"
		dd aExecFormatErro	; "Exec	format error"
		dd aCrossDeviceLin	; "Cross-device	link"
		dd unk_2B65B
		dd unk_2B65C
		dd unk_2B65D
		dd unk_2B65E
		dd unk_2B65F
		dd unk_2B660
		dd unk_2B661
		dd unk_2B662
		dd unk_2B663
		dd unk_2B664
		dd aMathArgument	; "Math	argument"
		dd aResultTooLarge	; "Result too large"
		dd aFileAlreadyExi	; "File	already	exists"
		dd aPossibleDeadlo	; "Possible deadlock"
		dd unk_2B6AA
		dd unk_2B6AB
		dd unk_2B6AC
		dd unk_2B6AD
		dd unk_2B6AE
		dd unk_2B6AF
		dd unk_2B6B0
		dd unk_2B6B1
		dd unk_2B6B2
		dd unk_2B6B3
		dd unk_2B6B4
; int sys_nerr
_sys_nerr	dw 30h			; DATA XREF: _perror+9r
aError0		db 'Error 0',0          ; DATA XREF: seg2608:_sys_errlisto
aInvalidFunctio	db 'Invalid function number',0 ; DATA XREF: seg2608:319Co
aNoSuchFileOrDi	db 'No such file or directory',0 ; DATA XREF: seg2608:31A0o
aPathNotFound	db 'Path not found',0   ; DATA XREF: seg2608:31A4o
aTooManyOpenFil	db 'Too many open files',0 ; DATA XREF: seg2608:31A8o
aPermissionDeni	db 'Permission denied',0 ; DATA XREF: seg2608:31ACo
aBadFileNumber	db 'Bad file number',0  ; DATA XREF: seg2608:31B0o
aMemoryArenaTra	db 'Memory arena trashed',0 ; DATA XREF: seg2608:31B4o
aNotEnoughMemor	db 'Not enough memory',0 ; DATA XREF: seg2608:31B8o
aInvalidMemoryB	db 'Invalid memory block address',0 ; DATA XREF: seg2608:31BCo
aInvalidEnviron	db 'Invalid environment',0 ; DATA XREF: seg2608:31C0o
aInvalidFormat	db 'Invalid format',0   ; DATA XREF: seg2608:31C4o
aInvalidAccessC	db 'Invalid access code',0 ; DATA XREF: seg2608:31C8o
aInvalidData	db 'Invalid data',0     ; DATA XREF: seg2608:31CCo
unk_2B5C1	db    0			; DATA XREF: seg2608:31D0o
aNoSuchDevice	db 'No such device',0   ; DATA XREF: seg2608:31D4o
aAttemptedToRem	db 'Attempted to remove current directory',0 ; DATA XREF: seg2608:31D8o
aNotSameDevice	db 'Not same device',0  ; DATA XREF: seg2608:31DCo
aNoMoreFiles	db 'No more files',0    ; DATA XREF: seg2608:31E0o
aInvalidArgumen	db 'Invalid argument',0 ; DATA XREF: seg2608:31E4o
aArgListTooBig	db 'Arg list too big',0 ; DATA XREF: seg2608:31E8o
aExecFormatErro	db 'Exec format error',0 ; DATA XREF: seg2608:31ECo
aCrossDeviceLin	db 'Cross-device link',0 ; DATA XREF: seg2608:31F0o
unk_2B65B	db    0			; DATA XREF: seg2608:31F4o
unk_2B65C	db    0			; DATA XREF: seg2608:31F8o
unk_2B65D	db    0			; DATA XREF: seg2608:31FCo
unk_2B65E	db    0			; DATA XREF: seg2608:3200o
unk_2B65F	db    0			; DATA XREF: seg2608:3204o
unk_2B660	db    0			; DATA XREF: seg2608:3208o
unk_2B661	db    0			; DATA XREF: seg2608:320Co
unk_2B662	db    0			; DATA XREF: seg2608:3210o
unk_2B663	db    0			; DATA XREF: seg2608:3214o
unk_2B664	db    0			; DATA XREF: seg2608:3218o
aMathArgument	db 'Math argument',0    ; DATA XREF: seg2608:321Co
aResultTooLarge	db 'Result too large',0 ; DATA XREF: seg2608:3220o
aFileAlreadyExi	db 'File already exists',0 ; DATA XREF: seg2608:3224o
aPossibleDeadlo	db 'Possible deadlock',0 ; DATA XREF: seg2608:3228o
unk_2B6AA	db    0			; DATA XREF: seg2608:322Co
unk_2B6AB	db    0			; DATA XREF: seg2608:3230o
unk_2B6AC	db    0			; DATA XREF: seg2608:3234o
unk_2B6AD	db    0			; DATA XREF: seg2608:3238o
unk_2B6AE	db    0			; DATA XREF: seg2608:323Co
unk_2B6AF	db    0			; DATA XREF: seg2608:3240o
unk_2B6B0	db    0			; DATA XREF: seg2608:3244o
unk_2B6B1	db    0			; DATA XREF: seg2608:3248o
unk_2B6B2	db    0			; DATA XREF: seg2608:324Co
unk_2B6B3	db    0			; DATA XREF: seg2608:3250o
unk_2B6B4	db    0			; DATA XREF: seg2608:3254o
aUnknownError	db 'Unknown error',0    ; DATA XREF: _perror+31o
; char aSS_0[]
aSS_0		db '%s: %s',0Ah,0       ; DATA XREF: _perror+43o
		db    0
asc_2B6CC	db 0Dh,0		; DATA XREF: _fputc+149o
word_2B6CE	dw 0			; DATA XREF: _setvbuf:loc_5CBFr
					; _setvbuf+4Cw
word_2B6D0	dw 0			; DATA XREF: _setvbuf:loc_5CA9r
					; _setvbuf+36w
__realcvtvector	dw offset sub_26F1	; DATA XREF: __realcvtr
		dw offset sub_3C32
__scantodvector	dw offset loc_3C37
		dw offset loc_3C37
		dw offset loc_3C37
byte_2B6DC	db 0			; DATA XREF: start+12Fo
		db 10h
		dw offset sub_24D9
		db    0
		db    0
		db 0
		db    2
		dw offset __setupio
		db    0
		db    0
		db    0
		db  10h
		dw offset __c0crtinit
		db    0
		db    0
		db    1
		db  10h
		dd loc_3C6C
		db    0
		db  10h
		dw offset unknown_libname_3 ; TCC/TCC++/BCC++ 16 bit DOS
		db    0
		db    0
unk_2B6FA	db    0			; DATA XREF: start+132o start+15Eo
		db  10h
		db 0B3h	; ³
		db    4
		db    0
		db    0
; __int32 the_cast
_the_cast	dd 0			; DATA XREF: start+B3o	start+161o ...
_act		dd 0			; DATA XREF: de_doit(void)+2Cw
					; de_doit(void)+30r ...
; __int32 ego
_ego		dd 0			; DATA XREF: start_room(uchar *)+2EDw
					; start_room(uchar *)+2F0r ...
_end_door_ptr	dd 0			; DATA XREF: start_room(uchar *)+49w
					; de_doit(void)+291r ...
; __int32 jason
_jason		dd 0			; DATA XREF: add_jason(void)+27w
					; add_jason(void)+2Ar ...
; __int32 cur_sub
_cur_sub	dd 0			; DATA XREF: start_room(uchar *)+38Bw
					; de_doit(void):loc_73C4r ...
_boss		dd 0			; DATA XREF: start_room(uchar *)+10Dw
					; de_doit(void)+4EDr ...
_space_bar_been_up db 0			; DATA XREF: check_user(void):loc_9D6Fr
					; check_user(void):loc_9D7Aw ...
_ego_x_speed	db 0			; DATA XREF: start_room(uchar *)+52w
					; start_room(uchar *)+57r ...
_ego_y_speed	db 0			; DATA XREF: start_room(uchar *)+5Cw
					; check_user(void)+1A2r ...
_game_in_progress db 0			; DATA XREF: init_game(void)+20Ew
					; play_game(uchar):loc_659Cw ...
_got_key	db 0			; DATA XREF: start_room(uchar *)+6Ew
					; de_doit(void)+2BBr ...
		db 0
; void far *gun_underbits
_gun_underbits	dw 0			; DATA XREF: init_game(void):loc_63A2w
					; play_game(uchar)+4Ew	...
word_2B724	dw 0			; DATA XREF: play_game(uchar)+4Aw
					; start_room(uchar *)+4F8r ...
; void far *jguage_underbits
_jguage_underbits dw 0			; DATA XREF: init_game(void)+205w
					; play_game(uchar)+6Fw	...
word_2B728	dw 0			; DATA XREF: play_game(uchar)+6Bw
					; end_game(void)+16Br ...
_men		db 0			; DATA XREF: play_game(uchar)+A7w
					; kill_ego(int,int)+21Fr ...
_air_count	db 0			; DATA XREF: start_room(uchar *)+98w
					; check_guages(void)+4r ...
_air_speed	db 0			; DATA XREF: start_room(uchar *)+9Dw
					; check_guages(void)+Br
_system_bench	db 0			; DATA XREF: init_game(void)+2BDw
					; init_game(void):loc_6466r ...
_control	db 0			; DATA XREF: start_room(uchar *)+64w
					; start_room(uchar *)+4B6w ...
_shot_count	db 0			; DATA XREF: start_room(uchar *)+105w
					; ego_fire(void)+3r ...
_shot_size	db 0			; DATA XREF: play_game(uchar)+BCw
					; de_doit(void)+31Ew ...
_top_shot_count	db 0			; DATA XREF: start_room(uchar *)+102w
					; add_missile(m_actor *,uchar,int)+2D8w ...
_cur_map	db 0			; DATA XREF: play_game(uchar)+89w
					; play_game(uchar):loc_660Ar ...
_zoom_to_map	db 0			; DATA XREF: _main:loc_6198r
					; play_game(uchar):loc_6C2Er ...
_score_count	db 0			; DATA XREF: play_game(uchar)+97w
					; de_doit(void):loc_760Er ...
_top_fire	db 0			; DATA XREF: play_game(uchar)+B9w
					; kill_ego(int,int)+285w ...
_auto_fire	db 0			; DATA XREF: play_game(uchar)+B6w
					; kill_ego(int,int):loc_7E55w ...
_auto_fire_count db 0			; DATA XREF: play_game(uchar)+ACw
					; check_user(void)+43r	...
_gun_count	db 0			; DATA XREF: play_game(uchar)+A2w
					; de_doit(void)+319w ...
_jason_power	db 0			; DATA XREF: add_jason(void)+90w
					; update_jason_guage(void)+2Ar	...
_maximum_jason_power db	0		; DATA XREF: play_game(uchar)+CBw
					; check_guages(void)+1DFr
_jason_count	db 0			; DATA XREF: start_room(uchar *)+108w
					; check_guages(void):loc_AF4Br	...
_jason_fire	db 0			; DATA XREF: play_game(uchar)+B3w
					; kill_ego(int,int)+28Aw ...
_god_mode	db 0			; DATA XREF: init_game(void)+213w
					; kill_ego(int,int)+3r	...
_smart_missiles	db 0			; DATA XREF: start_room(uchar *)+73w
					; seg03f9:6BC3w ...
_jason_msg	db 0			; DATA XREF: de_doit(void):loc_7662r
					; de_doit(void)+3C7w
_cave_msg	db 0			; DATA XREF: de_doit(void):loc_76E9r
					; de_doit(void)+44Ew
_barrel_msg	db 0			; DATA XREF: de_doit(void):loc_768Fr
					; de_doit(void)+3F4w
_gun_msg	db 0			; DATA XREF: de_doit(void):loc_76BCr
					; de_doit(void)+421w
_cheat_mode	db 0			; DATA XREF: init_game(void)+218w
					; end_game(void)+F3r ...
_air_supply	dw 0			; DATA XREF: start_room(uchar *)+A2w
					; update_air_guage(int,int,int)+2Er ...
_shld_supply	dw 0			; DATA XREF: start_room(uchar *)+A8r
					; start_room(uchar *)+AFw ...
_start_x	dw 0			; DATA XREF: start_room(uchar *)+1A5w
					; start_room(uchar *)+1C6r ...
_start_y	dw 0			; DATA XREF: start_room(uchar *)+1BFw
					; start_room(uchar *)+1C2r ...
_finish_tile	dw 0			; DATA XREF: start_room(uchar *)+3ADw
					; de_doit(void):loc_74F3r
_end_door_tile	dw 0			; DATA XREF: start_room(uchar *)+3B8w
					; de_doit(void):loc_7534r
_secret_tile	dw 0			; DATA XREF: start_room(uchar *)+3D6w
					; de_doit(void):loc_7510r ...
_ego_map_w	dw 0			; DATA XREF: start_room(uchar *)+375w
					; seg0b2c:03EAr
_ego_map_h	dw 0			; DATA XREF: start_room(uchar *)+384w
					; seg0b2c:03E6r
_cur_message	dw 0			; DATA XREF: start_room(uchar *):loc_6E42w
					; post_message(uchar)+9r ...
_heavy_timer	dw 0			; DATA XREF: start_room(uchar *)+4E6r
					; start_room(uchar *)+4EDr ...
_map_messages	dw 0			; DATA XREF: start_room(uchar *)+479w
					; de_doit(void)+467r ...
word_2B75C	dw 0			; DATA XREF: start_room(uchar *)+497w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; __int32 score
_score		dd 0			; DATA XREF: play_game(uchar)+9Ew
					; end_game(void)+DDr ...
_debug_mode	db 0			; DATA XREF: _main:loc_618Cr
					; init_game(void)+1Er ...
_resume		db 0			; DATA XREF: activate_menu_bar(void)+106w
					; activate_menu_bar(void)+125r	...
_restart	db    0
_zapper_count	db 0			; DATA XREF: start_room(uchar *)+69w
					; add_map_item(uint,uint):loc_8376w ...
_new_map_name	dd 0			; DATA XREF: init_game(void)+1F3w
_stop_room	db 0			; DATA XREF: play_game(uchar):loc_68DBr
					; play_game(uchar)+65Br ...
_teleport_count	db 0			; DATA XREF: start_room(uchar *)+3D9w
					; start_room(uchar *)+3F7r ...
_barrier_count	db 0			; DATA XREF: de_doit(void)+Aw
					; de_doit(void)+3Br ...
_shootable_count db 0			; DATA XREF: de_doit(void)+7w
					; de_doit(void)+AEr ...
_enemy_count	db 0			; DATA XREF: start_room(uchar *)+95w
					; add_map_item(uint,uint)+19Bw	...
_goody_count	db 0			; DATA XREF: start_room(uchar *)+92w
					; add_map_item(uint,uint)+110w	...
_goodies_found	db 0			; DATA XREF: start_room(uchar *)+8Cw
					; show_stats(void):loc_C12Fr ...
_enemies_killed	db 0			; DATA XREF: start_room(uchar *)+8Fw
					; show_stats(void)+118r ...
_message_posted	db 0			; DATA XREF: start_room(uchar *)+BBw
					; de_doit(void)+4B5r ...
_message_count	db 0			; DATA XREF: start_room(uchar *)+441w
					; start_room(uchar *):loc_71EEr ...
_jason_on	db 0			; DATA XREF: play_game(uchar)+C1w
					; de_doit(void)+22Er ...
_jason_present	db 0			; DATA XREF: play_game(uchar)+C6w
					; play_game(uchar):loc_6645r ...
_displayed_page	db 0			; DATA XREF: play_game(uchar):loc_6B2Fr
					; start_room(uchar *)+32w ...
_non_displayed_page db 0		; DATA XREF: play_game(uchar)+623r
					; start_room(uchar *)+2Dw ...
_death_type	db 0			; DATA XREF: kill_ego(int,int)+39r
					; kill_ego(int,int):loc_7D35r ...
_saw_title_screen db 0			; DATA XREF: start_title_loop(void)+87r
					; start_title_loop(void):loc_BB84w
_barrier_list	dw 0			; DATA XREF: de_doit(void)+7Aw
					; check_new_pos(m_actor	*,int,int,int *,int *,int,int,int)+A7r	...
word_2B78C	dw 0			; DATA XREF: de_doit(void)+76w
					; check_new_pos(m_actor	*,int,int,int *,int *,int,int,int)+A3r	...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_shootable_list	dw 0			; DATA XREF: de_doit(void)+EDw
					; seg0b2c:3609r
word_2B818	dw 0			; DATA XREF: de_doit(void)+E9w
					; seg0b2c:3605r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_all_teleports	dw 0			; DATA XREF: start_room(uchar *)+410w
					; check_user(void)+9Br
word_2B890	dw 0			; DATA XREF: start_room(uchar *)+42Fw
					; check_user(void)+B9r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_diff_x		dw 0			; DATA XREF: seg0b2c:0AC5w
					; seg0b2c:loc_DFC2r ...
_diff_y		dw 0			; DATA XREF: seg0b2c:0ADEw
					; seg0b2c:0AE1r ...
; void far *the_game
_the_game	dw 0			; DATA XREF: init_game(void)+58w
					; init_game(void):loc_622Br ...
; int word_2B8BC
word_2B8BC	dw 0			; DATA XREF: init_game(void)+54w
					; init_game(void)+AEr ...
_cur_sound	dd 0			; DATA XREF: game_manager::game_manager(uchar *)+1DBw
					; game_manager::doit(void)+4r ...
_force_pc_sound	db 0			; DATA XREF: init_game(void):loc_61D7r
					; parse_options(int,uchar **)+9w ...
		db 0
; void (__interrupt far	*theirhandler)()
_theirhandler	dd 0			; DATA XREF: game_manager::game_manager(uchar *)+184w
					; game_manager::~game_manager(void)+31r ...
ticks18_2	db 0			; DATA XREF: @pc_sound_doit$qve+10r
					; @pc_sound_doit$qve+15w ...
		db    0
_ed_list	dw 0			; DATA XREF: m_actor::set_xy(int,int)+BBw
					; m_actor::move(void)+17Aw ...
word_2B8CC	dw 0			; DATA XREF: m_actor::set_xy(int,int)+B7w
					; m_actor::move(void)+176w ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_ed_list_size	db 0			; DATA XREF: m_actor::set_xy(int,int)+90r
					; m_actor::set_xy(int,int):loc_14752r ...
		db 0
_mouse		dd 0			; DATA XREF: init_game(void)+1BAr
					; activate_menu_bar(void)+F1r ...
; __int32 the_menu_bar
_the_menu_bar	dd 0			; DATA XREF: activate_menu_bar(void)+28r
					; activate_menu_bar(void)+42r ...
; void far *show_box
_show_box	dd 0			; DATA XREF: i_show_box(uchar *,int,int,uchar *,uchar *)+22w
					; i_show_box(uchar *,int,int,uchar *,uchar *)+2Fr ...
_show_box_on	db 0			; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+2Ew
					; i_show_box(uchar *,int,int,uchar *,uchar *)+3r ...
_menu_bar_height db 0			; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+33w
					; i_set_text(uchar,uchar,uchar,uchar)+3Ew ...
_m_dont_handle	db 0			; DATA XREF: ms_mouse::ms_mouse(void)+FDw
					; seg137f:0C27r ...
_maximum_text_length db	0		; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+38w
					; prompt_box::prompt_box(uchar *)+59r ...
_pd_redraws	db 0			; DATA XREF: init_game(void)+1C6w
					; i_init_interface(void	*,void *,void *,void *,void *)+29w ...
		db 0
_i_external_left dd 0
					; DATA XREF: show_high_scores(uchar):loc_BEE2r
					; show_high_scores(uchar):loc_BF28r ...
_i_external_right dd 0
					; DATA XREF: show_high_scores(uchar)+2CEr
					; show_high_scores(uchar)+314r	...
_i_external_up	dd 0
					; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+51w
					; seg137f:loc_170DEr
_i_external_down dd 0
					; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+59w
					; seg137f:loc_17107r
_i_external_button dd 0
					; DATA XREF: i_init_interface(void *,void *,void *,void	*,void *)+61w
					; seg137f:loc_1712Er ...
; __int32 the_map
_the_map	dd 0			; DATA XREF: init_game(void)+1EAw
					; start_room(uchar *)+116r ...
_tbl_mul_tw	dd 0			; DATA XREF: check_horizontal_ray(m_actor *,uint)+16r
					; check_new_pos(m_actor	*,int,int,int *,int *,int,int,int)+5Dr	...
		dw 0
		dw 0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_tbl_mul80	dw 0			; DATA XREF: tilemap::init_tables(void)+83w
					; tilemap::update(uint)+1Ar
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_tbl_tile_src	dw 0			; DATA XREF: tilemap::init_tables(void)+35w
					; tilemap::init_tables(void)+4Ew ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_2BFA0	db    0			; DATA XREF: show_prelude(void)+197o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_2C0E0	db    0			; DATA XREF: show_prelude(void)+109o
					; show_prelude(void)+1F3o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_tbl_tile_dst	dw 0			; DATA XREF: tilemap::set_viewport(int,int,int,int)+DCw
					; tilemap::set_viewport(int,int,int,int)+F4w ...
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_map_exploded	db 0			; DATA XREF: tilemap::init_work_vars(void)+3w
					; tilemap::explode(void)+37w ...
		db 0
; int display
_display	dd 0			; DATA XREF: init_game(void)+EFr
					; init_game(void)+109r	...
_scrn		dd 0
_system_font_ptr dd 0			; DATA XREF: vga_text(int,int,uchar *,uchar,uchar)+50r
					; vga_text(int,int,uchar *,uchar,uchar)+8Ar ...
_palette	db 0			; DATA XREF: de_doit(void)+1E0o
					; show_stats(void)+176o ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_2CA58	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_old_palette	db    0			; DATA XREF: vga_display::turn_cycling(uchar)+25o
					; vga_display::setup_cycle(uchar,uchar,uchar)+53o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_spare_palette	db    0			; DATA XREF: vga_display::save_palette(void)+Bo
					; vga_display::restore_palette(void)+7o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_2D2E6	db    0			; DATA XREF: save_new_score(ulong,uchar	*,uchar)+2Bo
					; save_new_score(ulong,uchar *,uchar)+54o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_2D2F0	dd 0			; DATA XREF: save_new_score(ulong,uchar	*,uchar)+6Fw
_download_pos	dw 0			; DATA XREF: init_display(uchar)+1Aw
					; save_new_score(ulong,uchar *,uchar)+81w
_game_highs	db    0			; DATA XREF: init_scores_file(void)+16o
					; save_all_scores(void)+35o ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
dword_2D300	dd 0			; DATA XREF: init_scores_array(void):loc_1C029r
					; init_scores_file(void)+2Dw ...
byte_2D304	db 0			; DATA XREF: init_scores_file(void)+40w
					; return_element(uchar,uchar):loc_1C245r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_high_score	dd 0			; DATA XREF: init_scores_array(void)+51w
fp_kbd_head	dd 0			; DATA XREF: _gr_int9+46w _gr_int9+4Fr
fp_kbd_tail	dd 0			; DATA XREF: _gr_int9:loc_1C373w
					; _gr_int9+56r
; void (__interrupt far	*gr_old_int9)()
_gr_old_int9	dd 0
					; DATA XREF: _gr_end_kbd_grab+7r
					; _gr_start_kbd_grab+1Dw ...
_exit_routine	dd 0			; DATA XREF: _set_exit_routine+7w
					; _gr_start_kbd_grab+8w ...
_disable_exit_routine db 0		; DATA XREF: seg137f:2F85w
					; seg137f:loc_18AA4w ...
_gr_keys	db 0			; DATA XREF: _gr_start_kbd_grab+26o
					; _gr_int9+2Aw	...
byte_2D3AC	db 0			; DATA XREF: check_user(void):loc_9D24r
					; activate_menu_bar(void):loc_ADB5r ...
byte_2D3AD	db 0			; DATA XREF: check_user(void):loc_A142r
byte_2D3AE	db 0			; DATA XREF: check_user(void):loc_A15Br
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D3BE	db 0			; DATA XREF: check_user(void):loc_A028r
		db    0
		db    0
byte_2D3C1	db 0			; DATA XREF: check_user(void):loc_A0A3r
		db 0
		db    0
byte_2D3C4	db 0			; DATA XREF: check_user(void):loc_A106r
		db    0
		db    0
byte_2D3C7	db 0			; DATA XREF: post_message(uchar):loc_7FF6r
					; post_message(uchar):loc_801Ar ...
byte_2D3C8	db 0			; DATA XREF: game_manager::doit(void)+8Ar
byte_2D3C9	db 0			; DATA XREF: check_user(void):loc_9FD5r
byte_2D3CA	db 0			; DATA XREF: check_user(void):loc_9FEBr
byte_2D3CB	db 0			; DATA XREF: check_user(void):loc_A0FBr
byte_2D3CC	db 0			; DATA XREF: check_user(void):loc_A001r
byte_2D3CD	db 0			; DATA XREF: check_user(void):loc_A0CAr
					; start_title_loop(void)+C4r
byte_2D3CE	db 0			; DATA XREF: check_user(void):loc_A075r
byte_2D3CF	db 0			; DATA XREF: check_user(void):loc_A04Fr
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D3D7	db 0			; DATA XREF: check_user(void):loc_A136r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D3E3	db 0			; DATA XREF: start_title_loop(void)+CBr
					; game_manager::doit(void):loc_135D5r
byte_2D3E4	db 0			; DATA XREF: de_button(void)+17r
					; wait_for_user(void)+2Ar ...
		db 0
byte_2D3E6	db 0			; DATA XREF: check_user(void)+15r
					; check_user(void):loc_A174r
byte_2D3E7	db 0			; DATA XREF: check_user(void):loc_A18Dr
byte_2D3E8	db 0			; DATA XREF: check_user(void):loc_A1A7r
byte_2D3E9	db 0			; DATA XREF: check_user(void):loc_A1C1r
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D3EF	db 0			; DATA XREF: seg0fa9:09E3r
		db    0
		db    0
		db    0
byte_2D3F3	db 0			; DATA XREF: seg03f9:6983r
					; game_manager::doit(void):loc_135B7r
		db    0
		db    0
byte_2D3F6	db 0			; DATA XREF: seg03f9:693Fr
					; game_manager::doit(void):loc_13599r
		db 0
byte_2D3F8	db 0			; DATA XREF: seg03f9:6961r
					; game_manager::doit(void)+38r
		db    0
		db    0
byte_2D3FB	db 0			; DATA XREF: seg03f9:69A5r
					; game_manager::doit(void):loc_135A8r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; char tmp[500]
_tmp		db 0			; DATA XREF: init_game(void)+249o
					; play_game(uchar)+6BEo ...
byte_2D42D	db 0			; DATA XREF: print_form(uchar *,uchar)+15Bw
		db    0
		db    0
		db    0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D47C	db 0			; DATA XREF: print_form(uchar *,uchar)+120w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; char tmp2[64]
_tmp2		dw 0			; DATA XREF: update_score(int,int)+34o
					; activate_menu_bar(void)+B2o ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_tmp3		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
_debug_ptr	db    0
		db    0
		db    0
		db    0
_worx_ax	dw 0			; DATA XREF: _worx_call+3Dw
					; _worx_call+52r ...
_worx_bx	dw 0			; DATA XREF: _worx_call+43w
_worx_dx	dw 0			; DATA XREF: _worx_call+49w
					; _openelement+19r
_worx_di	dw 0			; DATA XREF: _worx_call+4Fw
__atexittbl	dw 0			; DATA XREF: _atexit+21w sub_2D4E+19r
word_2D66A	dw 0			; DATA XREF: _atexit+1Dw
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2D6E8	db 0			; DATA XREF: _clock+Aw
					; _clock:loc_2CB4r
		db    0
unk_2D6EA	db    0			; DATA XREF: __mkname+Eo
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
__new_handler	dd 0			; DATA XREF: set_new_handler(void (*)(void))+9r
					; set_new_handler(void (*)(void))+1Cw ...
___signalptr	dd 0			; DATA XREF: __fperror+Cr
					; __fperror+1Fr ...
byte_2D700	db 0			; DATA XREF: _fgetc+80o
					; _fgetc:loc_5482r ...
		db 0
byte_2D702	db 0			; DATA XREF: _fputc+7w	_fputc+22r ...
		db    0
unk_2D704	db    0			; DATA XREF: start+B6o
					; seg2608:___brklvlo
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
seg2608		ends

		DGROUP	group	seg2608
_@button@		equ	@button@
_@file_box@		equ	@file_box@
_@gui_item@		equ	@gui_item@
_@menu_bar@		equ	@menu_bar@
_@prompt_box@		equ	@prompt_box@
_@pull_down@		equ	@pull_down@
_@text_box@		equ	@text_box@
_@text_pager@		equ	@text_pager@
_AboutRiptide		equ	AboutRiptide
___8087		equ	__8087
____brklvl		equ	___brklvl
____signalptr		equ	___signalptr
___argc		equ	__argc
___argv		equ	__argv
___atexitcnt		equ	__atexitcnt
___atexittbl		equ	__atexittbl
___c0argc		equ	__c0argc
___c0argv		equ	__c0argv
___c0environ		equ	__c0environ
___cchar		equ	__cchar
___cflag		equ	__cflag
___ctype		equ	__ctype
___default87		equ	__default87
___doserrno		equ	__doserrno
___doserrortosv		equ	__doserrortosv
___envlng		equ	__envlng
___envseg		equ	__envseg
___envsize		equ	__envsize
___exitbuf		equ	__exitbuf
___exitfopen		equ	__exitfopen
___exitopen		equ	__exitopen
___fmode		equ	__fmode
___fpstklen		equ	__fpstklen
___heapbase		equ	__heapbase
___heaptop		equ	__heaptop
___int0vector		equ	__int0vector
___int4vector		equ	__int4vector
___int5vector		equ	__int5vector
___int6vector		equ	__int6vector
___ldt		equ	__ldt
___new_handler		equ	__new_handler
___nfile		equ	__nfile
___notumask		equ	__notumask
___openfd		equ	__openfd
___osminor		equ	__osminor
___protected		equ	__protected
___psp		equ	__psp
___realcvtvector		equ	__realcvtvector
___scantodvector		equ	__scantodvector
___starttime		equ	__starttime
___stklen		equ	__stklen
___streams		equ	__streams
___version		equ	__version
___video		equ	__video
___wscroll		equ	__wscroll
__act		equ	_act
__air_count		equ	_air_count
__air_speed		equ	_air_speed
__air_supply		equ	_air_supply
__all_explosions		equ	_all_explosions
__all_maps		equ	_all_maps
__all_messages		equ	_all_messages
__all_projectiles		equ	_all_projectiles
__all_secrets		equ	_all_secrets
__all_teleports		equ	_all_teleports
__auto_fire		equ	_auto_fire
__auto_fire_count		equ	_auto_fire_count
__barrel_msg		equ	_barrel_msg
__barrier_count		equ	_barrier_count
__barrier_list		equ	_barrier_list
__boss		equ	_boss
__cave_msg		equ	_cave_msg
__cheat_mode		equ	_cheat_mode
__control		equ	_control
__cur_map		equ	_cur_map
__cur_message		equ	_cur_message
__cur_sound		equ	_cur_sound
__cur_sub		equ	_cur_sub
__death_type		equ	_death_type
__debug		equ	_debug
__debug_mode		equ	_debug_mode
__debug_ptr		equ	_debug_ptr
__default_mouse		equ	_default_mouse
__diff_x		equ	_diff_x
__diff_y		equ	_diff_y
__directvideo		equ	_directvideo
__disable_exit_routine		equ	_disable_exit_routine
__display		equ	_display
__displayed_page		equ	_displayed_page
__download_pos		equ	_download_pos
__ed_list		equ	_ed_list
__ed_list_size		equ	_ed_list_size
__ego		equ	_ego
__ego_map_h		equ	_ego_map_h
__ego_map_w		equ	_ego_map_w
__ego_x_speed		equ	_ego_x_speed
__ego_y_speed		equ	_ego_y_speed
__end_door_ptr		equ	_end_door_ptr
__end_door_tile		equ	_end_door_tile
__enemies_killed		equ	_enemies_killed
__enemy_count		equ	_enemy_count
__errno		equ	_errno
__exit_routine		equ	_exit_routine
__external_open		equ	_external_open
__external_read		equ	_external_read
__finish_tile		equ	_finish_tile
__force_pc_sound		equ	_force_pc_sound
__g_handle		equ	_g_handle
__game_highs		equ	_game_highs
__game_in_progress		equ	_game_in_progress
__god_mode		equ	_god_mode
__goodies_found		equ	_goodies_found
__goody_count		equ	_goody_count
__got_key		equ	_got_key
__gr_keys		equ	_gr_keys
__gr_old_int9		equ	_gr_old_int9
__gun_count		equ	_gun_count
__gun_msg		equ	_gun_msg
__gun_pieces_xy		equ	_gun_pieces_xy
__gun_underbits		equ	_gun_underbits
__heavy_timer		equ	_heavy_timer
__high_score		equ	_high_score
__i_external_button		equ	_i_external_button
__i_external_down		equ	_i_external_down
__i_external_left		equ	_i_external_left
__i_external_right		equ	_i_external_right
__i_external_up		equ	_i_external_up
__isr		equ	_isr
__jason		equ	_jason
__jason_count		equ	_jason_count
__jason_fire		equ	_jason_fire
__jason_msg		equ	_jason_msg
__jason_on		equ	_jason_on
__jason_power		equ	_jason_power
__jason_present		equ	_jason_present
__jguage_underbits		equ	_jguage_underbits
__m_dont_handle		equ	_m_dont_handle
__map_exploded		equ	_map_exploded
__map_messages		equ	_map_messages
__maximum_jason_power		equ	_maximum_jason_power
__maximum_text_length		equ	_maximum_text_length
__men		equ	_men
__menu_bar_height		equ	_menu_bar_height
__message_count		equ	_message_count
__message_posted		equ	_message_posted
__mode		equ	_mode
__mouse		equ	_mouse
__new_map_name		equ	_new_map_name
__non_displayed_page		equ	_non_displayed_page
__old_palette		equ	_old_palette
__page_offsets		equ	_page_offsets
__palette		equ	_palette
__pd_redraws		equ	_pd_redraws
__restart		equ	_restart
__resume		equ	_resume
__saw_title_screen		equ	_saw_title_screen
__score		equ	_score
__score_count		equ	_score_count
__scrn		equ	_scrn
__secret_tile		equ	_secret_tile
__shld_supply		equ	_shld_supply
__shootable_count		equ	_shootable_count
__shootable_list		equ	_shootable_list
__shot_count		equ	_shot_count
__shot_size		equ	_shot_size
__show_box		equ	_show_box
__show_box_on		equ	_show_box_on
__smart_missiles		equ	_smart_missiles
__space_bar_been_up		equ	_space_bar_been_up
__spare_palette		equ	_spare_palette
__src		equ	_src
__start_x		equ	_start_x
__start_y		equ	_start_y
__stop_room		equ	_stop_room
__stream		equ	_stream
__string		equ	_string
__sys_errlist		equ	_sys_errlist
__sys_nerr		equ	_sys_nerr
__system_bench		equ	_system_bench
__system_font_ptr		equ	_system_font_ptr
__tbl_mul80		equ	_tbl_mul80
__tbl_mul_tw		equ	_tbl_mul_tw
__tbl_tile_dst		equ	_tbl_tile_dst
__tbl_tile_src		equ	_tbl_tile_src
__teleport_count		equ	_teleport_count
__the_cast		equ	_the_cast
__the_game		equ	_the_game
__the_map		equ	_the_map
__the_menu_bar		equ	_the_menu_bar
__theirhandler		equ	_theirhandler
__tmp		equ	_tmp
__tmp2		equ	_tmp2
__tmp3		equ	_tmp3
__top_fire		equ	_top_fire
__top_shot_count		equ	_top_shot_count
__worx_ax		equ	_worx_ax
__worx_bx		equ	_worx_bx
__worx_di		equ	_worx_di
__worx_dx		equ	_worx_dx
__zapper_count		equ	_zapper_count
__zoom_to_map		equ	_zoom_to_map
_a1_0		equ	a1_0
_aAdd		equ	aAdd
_aAdd_0		equ	aAdd_0
_aAdd_1		equ	aAdd_1
_aAdd_2		equ	aAdd_2
_aAddingALoopToG		equ	aAddingALoopToG
_aAddingActorToC		equ	aAddingActorToC
_aAdlibCardNotPr		equ	aAdlibCardNotPr
_aAdlibCardNot_0		equ	aAdlibCardNot_0
_aAndPackMediaCo		equ	aAndPackMediaCo
_aAreYouSureYo_0		equ	aAreYouSureYo_0
_aAreYouSureYouW		equ	aAreYouSureYouW
_aArtwork		equ	aArtwork
_aAttemptToDivid		equ	aAttemptToDivid
_aAveryPack		equ	aAveryPack
_aBacksub_l		equ	aBacksub_l
_aBacksub_l_0		equ	aBacksub_l_0
_aBadgrunt		equ	aBadgrunt
_aBadgrunt_0		equ	aBadgrunt_0
_aBadgrunt_1		equ	aBadgrunt_1
_aBadgrunt_2		equ	aBadgrunt_2
_aBarrel1_l		equ	aBarrel1_l
_aBarrel1_l_0		equ	aBarrel1_l_0
_aBarrel2_l		equ	aBarrel2_l
_aBarrel2_l_0		equ	aBarrel2_l_0
_aBarrel3_l		equ	aBarrel3_l
_aBarrel3_l_0		equ	aBarrel3_l_0
_aBlock2_l		equ	aBlock2_l
_aBlock2_l_0		equ	aBlock2_l_0
_aBlock_l		equ	aBlock_l
_aBlock_l_0		equ	aBlock_l_0
_aBonus1_l		equ	aBonus1_l
_aBonus1_l_0		equ	aBonus1_l_0
_aBonus2_l		equ	aBonus2_l
_aBonus2_l_0		equ	aBonus2_l_0
_aBonusX100		equ	aBonusX100
_aBonusX50		equ	aBonusX50
_aBosshit_l		equ	aBosshit_l
_aBosshit_l_0		equ	aBosshit_l_0
_aBs1_bdl_l		equ	aBs1_bdl_l
_aBs1_bdl_l_0		equ	aBs1_bdl_l_0
_aBs1_bdl_l_1		equ	aBs1_bdl_l_1
_aBs1_bdl_l_2		equ	aBs1_bdl_l_2
_aBs1_bdl_l_3		equ	aBs1_bdl_l_3
_aBs1_bdr_l		equ	aBs1_bdr_l
_aBs1_bdr_l_0		equ	aBs1_bdr_l_0
_aBs1_bdr_l_1		equ	aBs1_bdr_l_1
_aBs1dr_l		equ	aBs1dr_l
_aBs1dr_l_0		equ	aBs1dr_l_0
_aBs1dr_l_1		equ	aBs1dr_l_1
_aBs2_bod_l		equ	aBs2_bod_l
_aBs2_bod_l_0		equ	aBs2_bod_l_0
_aBs2_bod_l_1		equ	aBs2_bod_l_1
_aBs2_tnl1_l		equ	aBs2_tnl1_l
_aBs2_tnl1_l_0		equ	aBs2_tnl1_l_0
_aBs2_tnl1_l_1		equ	aBs2_tnl1_l_1
_aBs2_tnl2_l		equ	aBs2_tnl2_l
_aBs2_tnl2_l_0		equ	aBs2_tnl2_l_0
_aBs2_tnl2_l_1		equ	aBs2_tnl2_l_1
_aBs2_tnr1_l		equ	aBs2_tnr1_l
_aBs2_tnr1_l_0		equ	aBs2_tnr1_l_0
_aBs2_tnr1_l_1		equ	aBs2_tnr1_l_1
_aBs2_tnr2_l		equ	aBs2_tnr2_l
_aBs2_tnr2_l_0		equ	aBs2_tnr2_l_0
_aBs2_tnr2_l_1		equ	aBs2_tnr2_l_1
_aBs3_arl_l		equ	aBs3_arl_l
_aBs3_arl_l_0		equ	aBs3_arl_l_0
_aBs3_arl_l_1		equ	aBs3_arl_l_1
_aBs3_arl_l_2		equ	aBs3_arl_l_2
_aBs3_arr_l		equ	aBs3_arr_l
_aBs3_arr_l_0		equ	aBs3_arr_l_0
_aBs3_arr_l_1		equ	aBs3_arr_l_1
_aBs3_arr_l_2		equ	aBs3_arr_l_2
_aBs3_bdl_l		equ	aBs3_bdl_l
_aBs3_bdl_l_0		equ	aBs3_bdl_l_0
_aBs3_bdl_l_1		equ	aBs3_bdl_l_1
_aBs3_bdl_l_2		equ	aBs3_bdl_l_2
_aBs3_bdr_l		equ	aBs3_bdr_l
_aBs3_bdr_l_0		equ	aBs3_bdr_l_0
_aBs3_bdr_l_1		equ	aBs3_bdr_l_1
_aBs3_dthr_l		equ	aBs3_dthr_l
_aBs3_dthr_l_0		equ	aBs3_dthr_l_0
_aBs3_dthr_l_1		equ	aBs3_dthr_l_1
_aBs3_facl_l		equ	aBs3_facl_l
_aBs3_facl_l_0		equ	aBs3_facl_l_0
_aBs3_facl_l_1		equ	aBs3_facl_l_1
_aBs3_facl_l_2		equ	aBs3_facl_l_2
_aBs3_facr_l		equ	aBs3_facr_l
_aBs3_facr_l_0		equ	aBs3_facr_l_0
_aBs3_facr_l_1		equ	aBs3_facr_l_1
_aBs3_facr_l_2		equ	aBs3_facr_l_2
_aBs3_prpl_l		equ	aBs3_prpl_l
_aBs3_prpl_l_0		equ	aBs3_prpl_l_0
_aBs3_prpl_l_1		equ	aBs3_prpl_l_1
_aBs3_prpl_l_2		equ	aBs3_prpl_l_2
_aBs3_prpr_l		equ	aBs3_prpr_l
_aBs3_prpr_l_0		equ	aBs3_prpr_l_0
_aBs3_prpr_l_1		equ	aBs3_prpr_l_1
_aBs3_prpr_l_2		equ	aBs3_prpr_l_2
_aBubbles2		equ	aBubbles2
_aBubbles2_0		equ	aBubbles2_0
_aBubbles2_1		equ	aBubbles2_1
_aBubmd_l		equ	aBubmd_l
_aBubmd_l_0		equ	aBubmd_l_0
_aBubsm_l		equ	aBubsm_l
_aBubsm_l_0		equ	aBubsm_l_0
_aBytesFree		equ	aBytesFree
_aBytesFreeLu		equ	aBytesFreeLu
_aCanTFindSong		equ	aCanTFindSong
_aCancel		equ	aCancel
_aCancel_0		equ	aCancel_0
_aCannonl_l		equ	aCannonl_l
_aCannonl_l_0		equ	aCannonl_l_0
_aCannonr_l		equ	aCannonr_l
_aCannonr_l_0		equ	aCannonr_l_0
_aCannonr_l_1		equ	aCannonr_l_1
_aCastSize		equ	aCastSize
_aCatalog___		equ	aCatalog___
_aCd		equ	aCd
_aCenterJoystick		equ	aCenterJoystick
_aChain_l		equ	aChain_l
_aChain_l_0		equ	aChain_l_0
_aChain_l_1		equ	aChain_l_1
_aChangeDirector		equ	aChangeDirector
_aCharge		equ	aCharge
_aCheatModeOnLet		equ	aCheatModeOnLet
_aChest_l		equ	aChest_l
_aChest_l_0		equ	aChest_l_0
_aClam_l		equ	aClam_l
_aClam_l_0		equ	aClam_l_0
_aCoin_l		equ	aCoin_l
_aCoin_l_0		equ	aCoin_l_0
_aCoin_l_1		equ	aCoin_l_1
_aCompaq		equ	aCompaq
_aComposerSoundE		equ	aComposerSoundE
_aConfig_rip		equ	aConfig_rip
_aConfigrip		equ	aConfigrip
_aControl		equ	aControl
_aCopyright1991B		equ	aCopyright1991B
_aCopyrightC1994		equ	aCopyrightC1994
_aCouldnTOpen		equ	aCouldnTOpen
_aCouldnTOpenRip		equ	aCouldnTOpenRip
_aCrab_l		equ	aCrab_l
_aCrab_l_0		equ	aCrab_l_0
_aCrabdie_l		equ	aCrabdie_l
_aCrabdie_l_0		equ	aCrabdie_l_0
_aCreatingPcxH_0		equ	aCreatingPcxH_0
_aCreatingPcxHea		equ	aCreatingPcxHea
_aCry		equ	aCry
_aDanFroelich		equ	aDanFroelich
_aDead		equ	aDead
_aDebugModeEnabl		equ	aDebugModeEnabl
_aDebug_		equ	aDebug_
_aDebug_1		equ	aDebug_1
_aDebug_2		equ	aDebug_2
_aDesignAndProgr		equ	aDesignAndProgr
_aDirhit		equ	aDirhit
_aDirhit_0		equ	aDirhit_0
_aDirhit_1		equ	aDirhit_1
_aDirhit_2		equ	aDirhit_2
_aDirhit_3		equ	aDirhit_3
_aDivideErrorAbn		equ	aDivideErrorAbn
_aDone		equ	aDone
_aDoor		equ	aDoor
_aDoor_0		equ	aDoor_0
_aDoor_ud_l		equ	aDoor_ud_l
_aDoor_ud_l_0		equ	aDoor_ud_l_0
_aDrillhi		equ	aDrillhi
_aDrillhi_0		equ	aDrillhi_0
_aDrillhi_1		equ	aDrillhi_1
_aDrillhi_2		equ	aDrillhi_2
_aDrillhi_3		equ	aDrillhi_3
_aDrillhi_4		equ	aDrillhi_4
_aDrillhi_5		equ	aDrillhi_5
_aDrillhi_6		equ	aDrillhi_6
_aDrillhi_7		equ	aDrillhi_7
_aDuct_d_l		equ	aDuct_d_l
_aDuct_d_l_0		equ	aDuct_d_l_0
_aDuct_l_l		equ	aDuct_l_l
_aDuct_l_l_0		equ	aDuct_l_l_0
_aDuct_r_l		equ	aDuct_r_l
_aDuct_r_l_0		equ	aDuct_r_l_0
_aDuct_u_l		equ	aDuct_u_l
_aDuct_u_l_0		equ	aDuct_u_l_0
_aEgoXY		equ	aEgoXY
_aEgodie2_l_0		equ	aEgodie2_l_0
_aEgodie2_l_0_		equ	aEgodie2_l_0_
_aEgodie2_l_1		equ	aEgodie2_l_1
_aElementNotOpen		equ	aElementNotOpen
_aEndCurrentGame		equ	aEndCurrentGame
_aEndDoorSwitchW		equ	aEndDoorSwitchW
_aEnd_dr_l		equ	aEnd_dr_l
_aEnd_dr_l_0		equ	aEnd_dr_l_0
_aEnd_l		equ	aEnd_l
_aEnemiesDestroy		equ	aEnemiesDestroy
_aEnterName		equ	aEnterName
_aEnterNewPath		equ	aEnterNewPath
_aEnterNewShotSi		equ	aEnterNewShotSi
_aEnterPasswordB		equ	aEnterPasswordB
_aErrorLoadingPc		equ	aErrorLoadingPc
_aErrorLookingFo		equ	aErrorLookingFo
_aErrorUpdatingG		equ	aErrorUpdatingG
_aError_		equ	aError_
_aExit		equ	aExit
_aExp1		equ	aExp1
_aExp2		equ	aExp2
_aExp2_0		equ	aExp2_0
_aExp2_1		equ	aExp2_1
_aExp3_l		equ	aExp3_l
_aExp3_l_0		equ	aExp3_l_0
_aExp3_l_1		equ	aExp3_l_1
_aExplg_l		equ	aExplg_l
_aExpmd_l		equ	aExpmd_l
_aExpsm_l		equ	aExpsm_l
_aFFloatingPoint		equ	aFFloatingPoint
_aFace_l_l		equ	aFace_l_l
_aFace_l_l_0		equ	aFace_l_l_0
_aFace_r_l		equ	aFace_r_l
_aFace_r_l_0		equ	aFace_r_l_0
_aFast		equ	aFast
_aFast_0		equ	aFast_0
_aFaze		equ	aFaze
_aFirbaldn_l		equ	aFirbaldn_l
_aFirbaldn_l_0		equ	aFirbaldn_l_0
_aFirbalup_l		equ	aFirbalup_l
_aFirbalup_l_0		equ	aFirbalup_l_0
_aFire1		equ	aFire1
_aFire1_0		equ	aFire1_0
_aFire2		equ	aFire2
_aFire2_0		equ	aFire2_0
_aFire2_1		equ	aFire2_1
_aFire_pit_l		equ	aFire_pit_l
_aFire_pit_l_0		equ	aFire_pit_l_0
_aFireball_l		equ	aFireball_l
_aFish1l_l		equ	aFish1l_l
_aFish1l_l_0		equ	aFish1l_l_0
_aFish1r_l		equ	aFish1r_l
_aFish1r_l_0		equ	aFish1r_l_0
_aFish1r_l_1		equ	aFish1r_l_1
_aFish1r_l_2		equ	aFish1r_l_2
_aFish2l_l		equ	aFish2l_l
_aFish2l_l_0		equ	aFish2l_l_0
_aFish2r_l		equ	aFish2r_l
_aFish2r_l_0		equ	aFish2r_l_0
_aFish2r_l_1		equ	aFish2r_l_1
_aFloatingPointE		equ	aFloatingPointE
_aForcingPcSound		equ	aForcingPcSound
_aFramesPerSecon		equ	aFramesPerSecon
_aFreemine_l		equ	aFreemine_l
_aFreemine_l_0		equ	aFreemine_l_0
_aGame		equ	aGame
_aGameControl		equ	aGameControl
_aGameControlIsC		equ	aGameControlIsC
_aGameSound		equ	aGameSound
_aGameSoundsAreC		equ	aGameSoundsAreC
_aGameSpeed		equ	aGameSpeed
_aGameSpeedIsCur		equ	aGameSpeedIsCur
_aGameSpeed_0		equ	aGameSpeed_0
_aGame_0		equ	aGame_0
_aGame_1		equ	aGame_1
_aGem_l		equ	aGem_l
_aGem_l_0		equ	aGem_l_0
_aGem_l_1		equ	aGem_l_1
_aGem_l_2		equ	aGem_l_2
_aGettingScreenB		equ	aGettingScreenB
_aGodMode		equ	aGodMode
_aGodModeNowOn		equ	aGodModeNowOn
_aGoodies		equ	aGoodies
_aGotcha_l		equ	aGotcha_l
_aGotcha_l_0		equ	aGotcha_l_0
_aGotcha_l_1		equ	aGotcha_l_1
_aGun_1_l		equ	aGun_1_l
_aGun_1_l_0		equ	aGun_1_l_0
_aGun_2_l		equ	aGun_2_l
_aGun_2_l_0		equ	aGun_2_l_0
_aGun_3_l		equ	aGun_3_l
_aGun_3_l_0		equ	aGun_3_l_0
_aGun_4_l		equ	aGun_4_l
_aGun_4_l_0		equ	aGun_4_l_0
_aHelp		equ	aHelp
_aHighScores___		equ	aHighScores___
_aHigh_scr		equ	aHigh_scr
_aHuge		equ	aHuge
_aInSearchOfDr_R		equ	aInSearchOfDr_R
_aInfo		equ	aInfo
_aInitMap_		equ	aInitMap_
_aInstructions__		equ	aInstructions__
_aInvalidSecre_0		equ	aInvalidSecre_0
_aInvalidSecretL		equ	aInvalidSecretL
_aJelly_l		equ	aJelly_l
_aJelly_l_0		equ	aJelly_l_0
_aJoy		equ	aJoy
_aJoystick		equ	aJoystick
_aJoystickCalibr		equ	aJoystickCalibr
_aKey		equ	aKey
_aKey_l		equ	aKey_l
_aKey_l_0		equ	aKey_l_0
_aKeyboard		equ	aKeyboard
_aLetsrip		equ	aLetsrip
_aLoadingLoop_		equ	aLoadingLoop_
_aLoadingMap_		equ	aLoadingMap_
_aLoadingPcxFi_0		equ	aLoadingPcxFi_0
_aLoadingPcxFile		equ	aLoadingPcxFile
_aLogos_pcx		equ	aLogos_pcx
_aLoopDoesNotExi		equ	aLoopDoesNotExi
_aLoopStorageFul		equ	aLoopStorageFul
_aMapHeight		equ	aMapHeight
_aMapWidth		equ	aMapWidth
_aMedium		equ	aMedium
_aMelGuymon		equ	aMelGuymon
_aMine_l		equ	aMine_l
_aMine_l_0		equ	aMine_l_0
_aMore		equ	aMore
_aMouse_l		equ	aMouse_l
_aMouse_l_0		equ	aMouse_l_0
_aMreal_l		equ	aMreal_l
_aMreal_l_0		equ	aMreal_l_0
_aMsg_bar_l		equ	aMsg_bar_l
_aMsg_cave_l		equ	aMsg_cave_l
_aMsg_gun_l		equ	aMsg_gun_l
_aMsg_jasn_l		equ	aMsg_jasn_l
_aMsl_arwl_l		equ	aMsl_arwl_l
_aMsl_arwr_l		equ	aMsl_arwr_l
_aMsl_bg2l_l		equ	aMsl_bg2l_l
_aMsl_bg2r_l		equ	aMsl_bg2r_l
_aMsl_bigl_l		equ	aMsl_bigl_l
_aMsl_bigr_l		equ	aMsl_bigr_l
_aMsl_hbl_l		equ	aMsl_hbl_l
_aMsl_hbr_l		equ	aMsl_hbr_l
_aMsl_inkl_l		equ	aMsl_inkl_l
_aMsl_inkl_l_0		equ	aMsl_inkl_l_0
_aMsl_inkr_l		equ	aMsl_inkr_l
_aMsl_inkr_l_0		equ	aMsl_inkr_l_0
_aMsl_pea_l		equ	aMsl_pea_l
_aMsl_red_l		equ	aMsl_red_l
_aMsl_rkl_l		equ	aMsl_rkl_l
_aMsl_rkr_l		equ	aMsl_rkr_l
_aMsl_sm_l		equ	aMsl_sm_l
_aMsl_spt_l		equ	aMsl_spt_l
_aMsl_str_l		equ	aMsl_str_l
_aMsl_top_l		equ	aMsl_top_l
_aMsl_top_l_0		equ	aMsl_top_l_0
_aMsl_tpl_l		equ	aMsl_tpl_l
_aMsl_tpr_l		equ	aMsl_tpr_l
_aNewPassword		equ	aNewPassword
_aNewSettingq		equ	aNewSettingq
_aNo		equ	aNo
_aNotAValidPath_		equ	aNotAValidPath_
_aNotInModeXAbor		equ	aNotInModeXAbor
_aNull		equ	aNull
_aOff		equ	aOff
_aOff_		equ	aOff_
_aOk		equ	aOk
_aOk_0		equ	aOk_0
_aOk_1		equ	aOk_1
_aOk_2		equ	aOk_2
_aOn		equ	aOn
_aOn_		equ	aOn_
_aOpenFile		equ	aOpenFile
_aOtis_l		equ	aOtis_l
_aOtiseyes_l		equ	aOtiseyes_l
_aOtiseyes_l_0		equ	aOtiseyes_l_0
_aOtiseyes_l_1		equ	aOtiseyes_l_1
_aOutOfHeap		equ	aOutOfHeap
_aP_death1_pcx		equ	aP_death1_pcx
_aP_death2_pcx		equ	aP_death2_pcx
_aP_frame_pcx		equ	aP_frame_pcx
_aP_highs_pcx		equ	aP_highs_pcx
_aP_stats_pcx		equ	aP_stats_pcx
_aP_title_pcx		equ	aP_title_pcx
_aPaletteCycleNo		equ	aPaletteCycleNo
_aPassword		equ	aPassword
_aPassword_0		equ	aPassword_0
_aPat1_l		equ	aPat1_l
_aPat1_l_0		equ	aPat1_l_0
_aPat1_l_1		equ	aPat1_l_1
_aPcsound		equ	aPcsound
_aPiece_1_l		equ	aPiece_1_l
_aPiece_1_l_0		equ	aPiece_1_l_0
_aPiece_2_l		equ	aPiece_2_l
_aPiece_2_l_0		equ	aPiece_2_l_0
_aPiece_3_l		equ	aPiece_3_l
_aPiece_3_l_0		equ	aPiece_3_l_0
_aPiece_4_l		equ	aPiece_4_l
_aPiece_4_l_0		equ	aPiece_4_l_0
_aPing		equ	aPing
_aPing_0		equ	aPing_0
_aPing_1		equ	aPing_1
_aPing_2		equ	aPing_2
_aPirana		equ	aPirana
_aPirana_0		equ	aPirana_0
_aPirana_1		equ	aPirana_1
_aPirana_2		equ	aPirana_2
_aPirana_3		equ	aPirana_3
_aPiranal_l		equ	aPiranal_l
_aPiranal_l_0		equ	aPiranal_l_0
_aPiranal_l_1		equ	aPiranal_l_1
_aPiranar_l		equ	aPiranar_l
_aPiranar_l_0		equ	aPiranar_l_0
_aPiranar_l_1		equ	aPiranar_l_1
_aPlaySong___		equ	aPlaySong___
_aPlunk2		equ	aPlunk2
_aPlunk2_0		equ	aPlunk2_0
_aPlunk2_1		equ	aPlunk2_1
_aPod1_l		equ	aPod1_l
_aPod1_l_0		equ	aPod1_l_0
_aPod2_l		equ	aPod2_l
_aPod2_l_0		equ	aPod2_l_0
_aPrelude_l		equ	aPrelude_l
_aPrint		equ	aPrint
_aPrinterError_C		equ	aPrinterError_C
_aProbel_l		equ	aProbel_l
_aProbel_l_0		equ	aProbel_l_0
_aProbel_l_1		equ	aProbel_l_1
_aProber_l		equ	aProber_l
_aProber_l_0		equ	aProber_l_0
_aProber_l_1		equ	aProber_l_1
_aProber_l_2		equ	aProber_l_2
_aProbspin_l		equ	aProbspin_l
_aProbspin_l_0		equ	aProbspin_l_0
_aProducer		equ	aProducer
_aPu_1up_l		equ	aPu_1up_l
_aPu_1up_l_0		equ	aPu_1up_l_0
_aPu_air_l		equ	aPu_air_l
_aPu_air_l_0		equ	aPu_air_l_0
_aPu_auto_l		equ	aPu_auto_l
_aPu_auto_l_0		equ	aPu_auto_l_0
_aPu_auto_l_1		equ	aPu_auto_l_1
_aPu_fire_l		equ	aPu_fire_l
_aPu_fire_l_0		equ	aPu_fire_l_0
_aPu_fire_l_1		equ	aPu_fire_l_1
_aPu_jason_l		equ	aPu_jason_l
_aPu_jason_l_0		equ	aPu_jason_l_0
_aPu_jason_l_1		equ	aPu_jason_l_1
_aPu_jf_l		equ	aPu_jf_l
_aPu_jf_l_0		equ	aPu_jf_l_0
_aPu_jwl1_l		equ	aPu_jwl1_l
_aPu_key_l		equ	aPu_key_l
_aPu_key_l_0		equ	aPu_key_l_0
_aPu_shld_l		equ	aPu_shld_l
_aPu_shld_l_0		equ	aPu_shld_l_0
_aPu_shld_l_1		equ	aPu_shld_l_1
_aPu_top_l		equ	aPu_top_l
_aPu_top_l_0		equ	aPu_top_l_0
_aPup		equ	aPup
_aPup2		equ	aPup2
_aPup2_0		equ	aPup2_0
_aPup2_1		equ	aPup2_1
_aPup2_2		equ	aPup2_2
_aPup2_3		equ	aPup2_3
_aPupNotDefined		equ	aPupNotDefined
_aPup_0		equ	aPup_0
_aPup_1		equ	aPup_1
_aQuit		equ	aQuit
_aREGISTERED		equ	aREGISTERED
_aRaoulSaid		equ	aRaoulSaid
_aReadError		equ	aReadError
_aRequestToOpenM		equ	aRequestToOpenM
_aReset		equ	aReset
_aResume		equ	aResume
_aResume_0		equ	aResume_0
_aResume_1		equ	aResume_1
_aRiptideRegiste		equ	aRiptideRegiste
_aRiptideRequi_0		equ	aRiptideRequi_0
_aRiptideRequire		equ	aRiptideRequire
_aRiptide_dat		equ	aRiptide_dat
_aRiptide_pcx		equ	aRiptide_pcx
_aRiptide_pcxHas		equ	aRiptide_pcxHas
_aRiptide_pcx_0		equ	aRiptide_pcx_0
_aRscFile_		equ	aRscFile_
_aRunBenchmark		equ	aRunBenchmark
_aRunBenchmark_0		equ	aRunBenchmark_0
_aRunBenchmark_1		equ	aRunBenchmark_1
_aS		equ	aS
_aSS		equ	aSS
_aSS_0		equ	aSS_0
_aSavingMap_		equ	aSavingMap_
_aScan		equ	aScan
_aScr_1000_l		equ	aScr_1000_l
_aScr_1000_l_0		equ	aScr_1000_l_0
_aScr_100_l		equ	aScr_100_l
_aScr_100_l_0		equ	aScr_100_l_0
_aScr_2000_l		equ	aScr_2000_l
_aScr_2000_l_0		equ	aScr_2000_l_0
_aScr_3000_l		equ	aScr_3000_l
_aScr_3000_l_0		equ	aScr_3000_l_0
_aScr_4000_l		equ	aScr_4000_l
_aScr_4000_l_0		equ	aScr_4000_l_0
_aScr_500_l		equ	aScr_500_l
_aScr_500_l_0		equ	aScr_500_l_0
_aScream		equ	aScream
_aSerp_l_l		equ	aSerp_l_l
_aSerp_l_l_0		equ	aSerp_l_l_0
_aSerp_l_l_1		equ	aSerp_l_l_1
_aSerp_r_l		equ	aSerp_r_l
_aSerp_r_l_0		equ	aSerp_r_l_0
_aSerp_r_l_1		equ	aSerp_r_l_1
_aSerpdie_l		equ	aSerpdie_l
_aSerpdie_l_0		equ	aSerpdie_l_0
_aSetup		equ	aSetup
_aSharkdie_l		equ	aSharkdie_l
_aSharkdie_l_0		equ	aSharkdie_l_0
_aSharkdie_l_1		equ	aSharkdie_l_1
_aSharkl_l		equ	aSharkl_l
_aSharkl_l_0		equ	aSharkl_l_0
_aSharkl_l_1		equ	aSharkl_l_1
_aSharkl_l_2		equ	aSharkl_l_2
_aSharkr_l		equ	aSharkr_l
_aSharkr_l_0		equ	aSharkr_l_0
_aSharkr_l_1		equ	aSharkr_l_1
_aSharkr_l_2		equ	aSharkr_l_2
_aShipl_l		equ	aShipl_l
_aShipl_l_0		equ	aShipl_l_0
_aShipl_l_1		equ	aShipl_l_1
_aShipr_l		equ	aShipr_l
_aShipr_l_0		equ	aShipr_l_0
_aShipr_l_1		equ	aShipr_l_1
_aShotSize		equ	aShotSize
_aShotSize___		equ	aShotSize___
_aShowStats		equ	aShowStats
_aShpbmb_l		equ	aShpbmb_l
_aShpbmb_l_0		equ	aShpbmb_l_0
_aShutl_l_l		equ	aShutl_l_l
_aShutl_l_l_0		equ	aShutl_l_l_0
_aShutl_l_l_1		equ	aShutl_l_l_1
_aShutl_r_l		equ	aShutl_r_l
_aShutl_r_l_0		equ	aShutl_r_l_0
_aSlow		equ	aSlow
_aSlow_0		equ	aSlow_0
_aSmall		equ	aSmall
_aSmash		equ	aSmash
_aSmash_0		equ	aSmash_0
_aSndNotInStorag		equ	aSndNotInStorag
_aSound		equ	aSound
_aSoundStorageFu		equ	aSoundStorageFu
_aSoundblasterDe		equ	aSoundblasterDe
_aSpikes_d_l		equ	aSpikes_d_l
_aSpikes_d_l_0		equ	aSpikes_d_l_0
_aSpikes_u_l		equ	aSpikes_u_l
_aSpikes_u_l_0		equ	aSpikes_u_l_0
_aSplat_l		equ	aSplat_l
_aSprtStorage		equ	aSprtStorage
_aSqueek		equ	aSqueek
_aStart		equ	aStart
_aStartActIi		equ	aStartActIi
_aStartGameFromB		equ	aStartGameFromB
_aStart_0		equ	aStart_0
_aStats_cmf		equ	aStats_cmf
_aStatue_l		equ	aStatue_l
_aStatue_l_0		equ	aStatue_l_0
_aStopSong		equ	aStopSong
_aStory___		equ	aStory___
_aSubl_l		equ	aSubl_l
_aSubl_l_0		equ	aSubl_l_0
_aSubl_l_1		equ	aSubl_l_1
_aSubl_l_2		equ	aSubl_l_2
_aSubr_l		equ	aSubr_l
_aSubr_l_0		equ	aSubr_l_0
_aSubr_l_1		equ	aSubr_l_1
_aSubr_l_2		equ	aSubr_l_2
_aSubr_l_3		equ	aSubr_l_3
_aSum		equ	aSum
_aSum_0		equ	aSum_0
_aSum_1		equ	aSum_1
_aSum_2		equ	aSum_2
_aSwish		equ	aSwish
_aSwish_0		equ	aSwish_0
_aSwish_1		equ	aSwish_1
_aSwitch_l		equ	aSwitch_l
_aSwitch_l_0		equ	aSwitch_l_0
_aSystemBench		equ	aSystemBench
_aT_cat_txt		equ	aT_cat_txt
_aT_exit_txt		equ	aT_exit_txt
_aT_help_txt		equ	aT_help_txt
_aT_inst_txt		equ	aT_inst_txt
_aT_story_txt		equ	aT_story_txt
_aTent_in_l		equ	aTent_in_l
_aTent_in_l_0		equ	aTent_in_l_0
_aTent_out_l		equ	aTent_out_l
_aTent_out_l_0		equ	aTent_out_l_0
_aTent_out_l_1		equ	aTent_out_l_1
_aTextBox		equ	aTextBox
_aThatIsNotAVali		equ	aThatIsNotAVali
_aThe_l		equ	aThe_l
_aThisFeatureHas		equ	aThisFeatureHas
_aTileChangeOutO		equ	aTileChangeOutO
_aTiles_		equ	aTiles_
_aTiles__0		equ	aTiles__0
_aTitle		equ	aTitle
_aTitle_cmf		equ	aTitle_cmf
_aTmp		equ	aTmp
_aTooManyActorsI		equ	aTooManyActorsI
_aTooManyActorsT		equ	aTooManyActorsT
_aTooManyBarrier		equ	aTooManyBarrier
_aTooManyShootab		equ	aTooManyShootab
_aTport		equ	aTport
_aTport_0		equ	aTport_0
_aTulip		equ	aTulip
_aTulip_l		equ	aTulip_l
_aTulip_l_0		equ	aTulip_l_0
_aTulip_l_1		equ	aTulip_l_1
_aTulipl_l		equ	aTulipl_l
_aTulipl_l_0		equ	aTulipl_l_0
_aTulipr_l		equ	aTulipr_l
_aTulipr_l_0		equ	aTulipr_l_0
_aTurn_l		equ	aTurn_l
_aTurn_l_0		equ	aTurn_l_0
_aTurn_l_1		equ	aTurn_l_1
_aTurn_l_2		equ	aTurn_l_2
_aUndefinedScore		equ	aUndefinedScore
_aUnknownError		equ	aUnknownError
_aViewportHeight		equ	aViewportHeight
_aViewportWidthT		equ	aViewportWidthT
_aVillans		equ	aVillans
_aVocNotFound		equ	aVocNotFound
_aWb		equ	aWb
_aWeed1_l		equ	aWeed1_l
_aWeed1_l_0		equ	aWeed1_l_0
_aWriteError		equ	aWriteError
_aYes		equ	aYes
_aYouMadeTheTop1		equ	aYouMadeTheTop1
_aYouReInTheTop1		equ	aYouReInTheTop1
_aYourScore		equ	aYourScore
_aZap		equ	aZap
_aZap_0		equ	aZap_0
_aZap_ud_l		equ	aZap_ud_l
_aZap_ud_l_0		equ	aZap_ud_l_0
_a_		equ	a_
_a__0		equ	a__0
_a________		equ	a________
_a_cmf		equ	a_cmf
_a_pcs		equ	a_pcs
_a_pcx		equ	a_pcx
_a_voc		equ	a_voc
_a_voc_0		equ	a_voc_0
_amandich		equ	amandich
_aq		equ	aq
_arb		equ	arb
_asc_29B47		equ	asc_29B47
_asc_29B5E		equ	asc_29B5E
_asc_29EFE		equ	asc_29EFE
_asc_2A262		equ	asc_2A262
_asc_2A2B4		equ	asc_2A2B4
_asc_2A621		equ	asc_2A621
_asc_2A623		equ	asc_2A623
_asc_2B6CC		equ	asc_2B6CC
_byte_2B104		equ	byte_2B104
_byte_2B333		equ	byte_2B333
_byte_2B397		equ	byte_2B397
_byte_2B398		equ	byte_2B398
_byte_2B399		equ	byte_2B399
_byte_2B39A		equ	byte_2B39A
_byte_2B39B		equ	byte_2B39B
_byte_2B39C		equ	byte_2B39C
_byte_2B39D		equ	byte_2B39D
_byte_2B39E		equ	byte_2B39E
_byte_2B39F		equ	byte_2B39F
_byte_2B3A0		equ	byte_2B3A0
_byte_2B6DC		equ	byte_2B6DC
_byte_2D304		equ	byte_2D304
_byte_2D3AC		equ	byte_2D3AC
_byte_2D3AD		equ	byte_2D3AD
_byte_2D3AE		equ	byte_2D3AE
_byte_2D3BE		equ	byte_2D3BE
_byte_2D3C1		equ	byte_2D3C1
_byte_2D3C4		equ	byte_2D3C4
_byte_2D3C7		equ	byte_2D3C7
_byte_2D3C8		equ	byte_2D3C8
_byte_2D3C9		equ	byte_2D3C9
_byte_2D3CA		equ	byte_2D3CA
_byte_2D3CB		equ	byte_2D3CB
_byte_2D3CC		equ	byte_2D3CC
_byte_2D3CD		equ	byte_2D3CD
_byte_2D3CE		equ	byte_2D3CE
_byte_2D3CF		equ	byte_2D3CF
_byte_2D3D7		equ	byte_2D3D7
_byte_2D3E3		equ	byte_2D3E3
_byte_2D3E4		equ	byte_2D3E4
_byte_2D3E6		equ	byte_2D3E6
_byte_2D3E7		equ	byte_2D3E7
_byte_2D3E8		equ	byte_2D3E8
_byte_2D3E9		equ	byte_2D3E9
_byte_2D3EF		equ	byte_2D3EF
_byte_2D3F3		equ	byte_2D3F3
_byte_2D3F6		equ	byte_2D3F6
_byte_2D3F8		equ	byte_2D3F8
_byte_2D3FB		equ	byte_2D3FB
_byte_2D42D		equ	byte_2D42D
_byte_2D47C		equ	byte_2D47C
_byte_2D6E8		equ	byte_2D6E8
_byte_2D700		equ	byte_2D700
_byte_2D702		equ	byte_2D702
_dataseg@		equ	dataseg@
_dbl_2A2C6		equ	dbl_2A2C6
_dbl_2AF94		equ	dbl_2AF94
_dword_2D2F0		equ	dword_2D2F0
_dword_2D300		equ	dword_2D300
_first_time		equ	first_time
_flt_29B10		equ	flt_29B10
_flt_2A2CE		equ	flt_2A2CE
_flt_2AF70		equ	flt_2AF70
_flt_2AF90		equ	flt_2AF90
_flt_2AFEC		equ	flt_2AFEC
_format		equ	format
_fp_kbd_head		equ	fp_kbd_head
_fp_kbd_tail		equ	fp_kbd_tail
_leftclipplanemask		equ	leftclipplanemask
_off_2826E		equ	off_2826E
_off_28270		equ	off_28270
_off_284E0		equ	off_284E0
_off_2B112		equ	off_2B112
_off_2B3EE		equ	off_2B3EE
_rightclipplanemask		equ	rightclipplanemask
_stru_2B114		equ	stru_2B114
_stru_2B128		equ	stru_2B128
_target_rgb		equ	target_rgb
_tbyte_2AF9C		equ	tbyte_2AF9C
_tbyte_2AFA6		equ	tbyte_2AFA6
_tbyte_2AFB0		equ	tbyte_2AFB0
_tbyte_2AFBA		equ	tbyte_2AFBA
_tbyte_2AFC4		equ	tbyte_2AFC4
_tbyte_2AFCE		equ	tbyte_2AFCE
_tbyte_2AFD8		equ	tbyte_2AFD8
_tbyte_2AFE2		equ	tbyte_2AFE2
_ticks18_2		equ	ticks18_2
_tmp_rgb		equ	tmp_rgb
_unk_2A7EC		equ	unk_2A7EC
_unk_2B6FA		equ	unk_2B6FA
_unk_2BFA0		equ	unk_2BFA0
_unk_2C0E0		equ	unk_2C0E0
_unk_2D2E6		equ	unk_2D2E6
_unk_2D6EA		equ	unk_2D6EA
_unk_2D704		equ	unk_2D704
_word_28262		equ	word_28262
_word_28264		equ	word_28264
_word_28266		equ	word_28266
_word_28268		equ	word_28268
_word_2826C		equ	word_2826C
_word_2A700		equ	word_2A700
_word_2B102		equ	word_2B102
_word_2B326		equ	word_2B326
_word_2B328		equ	word_2B328
_word_2B3A1		equ	word_2B3A1
_word_2B3A3		equ	word_2B3A3
_word_2B3E0		equ	word_2B3E0
_word_2B3E2		equ	word_2B3E2
_word_2B3E4		equ	word_2B3E4
_word_2B3EC		equ	word_2B3EC
_word_2B3F0		equ	word_2B3F0
_word_2B3F2		equ	word_2B3F2
_word_2B3F4		equ	word_2B3F4
_word_2B3F6		equ	word_2B3F6
_word_2B6CE		equ	word_2B6CE
_word_2B6D0		equ	word_2B6D0
_word_2B724		equ	word_2B724
_word_2B728		equ	word_2B728
_word_2B75C		equ	word_2B75C
_word_2B78C		equ	word_2B78C
_word_2B818		equ	word_2B818
_word_2B890		equ	word_2B890
_word_2B8BC		equ	word_2B8BC
_word_2B8CC		equ	word_2B8CC
_word_2D66A		equ	word_2D66A
		; ---- .lst <-> .asm name reconciliations (same bytes, renamed labels) ----
		public	s1
		public	_s1
		public	word_2BA84
		public	_word_2BA84
		public	word_2BA88
		public	_word_2BA88
s1		equ	aDebug_			; seg2608:1313 "Debug"
_s1		equ	aDebug_
word_2BA84	equ	word ptr _the_map+2	; seg2608:3824 row-offset tbl base
_word_2BA84	equ	word ptr _the_map+2
word_2BA88	equ	word ptr _tbl_mul_tw+2	; seg2608:3828 direction probe tbl
_word_2BA88	equ	word ptr _tbl_mul_tw+2
		end
