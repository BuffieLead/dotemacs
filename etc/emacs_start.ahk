/*
------------------emacsclientw�N���p�X�N���v�g------------------
emacsclientw.exe���܂Ƃ��Ɏg����悤�ɂ���B
emacs���N�����ĂȂ��Ƃ��ɂ͋N���A�N�����Ă鎞�̓A�N�e�B�u���A�t�@�C���𑗂�Ɠǂݍ��ށB
gnupack��emacs�Ŏg���Ƃ���runemacs.exe�̑����INST_DIR��emacs.exe���w�肷��B
AutoHotKey_Lw / Ahk2Exe_L�œ���B
[1] �R���p�C�����ēK���ȏꏊ�ɒu��
�Ƃ肠����emacs.exe�Ɠ����ꏊ�������߁B
[2]  emacs�ŃT�[�o�[��L���ɂ���
�ȉ���Init.el�ɃR�s�[�B
;; Emacs Server Start
(require 'server)
(unless (eq t (server-running-p))
  (server-start))
[3] ini�t�@�C�����쐬����
���s�t�@�C���Ɠ����ꏊ��StartEmacs.ini���쐬�B���e�͈ȉ��B
[path]
emacs="C:\\usr\\share\\emacs\\bin\\runemacs.exe"
emacsclientw="C:\\usr\\share\\emacs\\bin\\emacsclientw.exe"
server="C:\\Users\\e09485\\Documents\\Program\\emacs\\.emacs.d\\server\\server"
[4] �N������
�t�@�C���𑗂�΂����ƊJ���Ă����B
�V���[�g�J�b�g�쐬��֘A�t���Ɏg���B
----------------------------------------------------------------
*/


;; =============================================================
;; �����ݒ�

;; �N�����[�h���w��
#SingleInstance ignore

;; ���ϐ��𖳎�����
#NoEnv

;; �^�X�N�g���C�A�C�R����\�����Ȃ�
#NoTrayIcon

;; SendMode��Input�Ɏw��
SendMode Input

;; ��ƃf�B���N�g���w��
SetWorkingDir %A_ScriptDir%

;; �t�@�C���G���R�[�h��UTF-8�Ɏw��
FileEncoding, CP65001

;; ini�t�@�C�������w��
ini_file = StartEmacs.ini


;; =============================================================
;; ���C�����s��

;; �������擾����
arg_string := get_read_argument_string()

;; ini�t�@�C������e�t�@�C���̃p�X���擾����
read_ini_file_paths()

;; emacs�̋N����Ԃ��`�F�b�N���ċN������
start_emacs()


;; =============================================================
;; �֐�

;; �������擾���A������ɐ��`���ďo�͂���
;; ���������݂��Ȃ��Ȃ�NULL��Ԃ�
get_read_argument_string()
{
	local arg_string
	;; �����̌��܂Ń��[�v
	Loop, %0%
	{
		;; �擾����������������d���p���ň͂�ŘA������
		arg_string .= " """ . %A_Index% . """"
	}
	return arg_string
}

;; ini�t�@�C���̓��e��ǂݍ���
read_ini_file_paths()
{
	;; �O���[�o���ϐ����g��
	global
	IniRead, path_emacs, %ini_file%, path, emacs
	IniRead, path_emacsclientw, %ini_file%, path, emacsclientw
	IniRead, path_server, %ini_file%, path, server
}

;; emacs���N�������ǂ������ׂċN��������s��
start_emacs()
{
	;; emacs��PID���擾
	emacs_pid := get_emacs_pid()
	if (emacs_pid)
	{
		;; ���łɋN�����Ȃ̂ŃN���C�A���g���g���A�܂��̓A�N�e�B�u������
		activate_emacs(emacs_pid)
	}
	else
	{
		;; �N�����Ă��Ȃ��̂ŋN������
		run_emacs()
	}
}

;; ����������ꍇ�̓N���C�A���g���N������
;; �������Ȃ��ꍇ��emacs���A�N�e�B�u�ɂ���
activate_emacs(emacs_pid)
{
	;; �N���C�A���g�̃p�X�ƃT�[�o�[�t�@�C���̃p�X�A�������g�p
	global path_emacsclientw, path_server, arg_string
	if(arg_string)
	{
		;; ���������݂���Ȃ�N���C�A���g�Ƀt�@�C���𑗂�
		Run, "%path_emacsclientw%" -n "%arg_string%"
	}
	else
	{
		;; ���������݂��Ȃ��Ȃ�v���Z�X�̃E�B���h�E���A�N�e�B�u������
		WinActivate, ahk_pid %emacs_pid%
	}
}

;; emacs���N������
run_emacs()
{
	;; emacs�{�̂̃p�X�ƈ������g�p
	global path_emacs, arg_string
	;; emacs���N������
	Run, "%path_emacs%" "%arg_string%"
}

;; emacs��PID���擾����
get_emacs_pid()
{
	;; emacs.exe�v���Z�X�̑��݂��m�F
	Process, Exist, emacs.exe
	;; �v���Z�X�����݂��Ă���Ȃ�v���Z�XID,���݂��Ȃ��Ȃ�0��Ԃ�
	return ErrorLevel
}


;; =============================================================
;; End
