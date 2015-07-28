# -*- coding: utf-8 -*-
# $Id: delserver.rbw 107 2014-07-03 04:39:44Z e09485 $

ScriptDir = File.dirname(File.expand_path($0))
RootDir = File.expand_path("#{ScriptDir}/../..")
File.delete("#{RootDir}/.emacs.d/server/server")


