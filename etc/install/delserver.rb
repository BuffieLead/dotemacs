# -*- coding: utf-8 -*-
# ocra --chdir-first --windows delserver.rb
# $Id: delserver.rbw 107 2014-07-03 04:39:44Z e09485 $
require 'rubygems'

Prog =  $0

ScriptDir = File.dirname(File.expand_path(Prog))
RootDir = File.expand_path("#{ScriptDir}/../..")
ServerPath = "#{RootDir}/.emacs.d/server/server"
File.delete(ServerPath) if File.exists? ServerPath


