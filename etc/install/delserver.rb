# -*- coding: utf-8 -*-
# ocra --chdir-first --windows delserver.rb
# $Id: delserver.rbw 107 2014-07-03 04:39:44Z e09485 $
require 'rubygems'
require 'win32/registry'

def regkey(path, key)
    Win32::Registry::HKEY_CURRENT_USER.open(path) do |reg|
        yield reg['HOME'].gsub( '\\', '/' )
    end
end

HOME = 'HOME'
Path = 'Software\GNU\emacs'

emacsdir = ENV[HOME]
regkey(Path, HOME) {
    |val| emacsdir = val unless val.nil?
}

puts emacsdir

ServerPath = "#{emacsdir}/.emacs.d/server/server"
File.delete(ServerPath) if File.exists? ServerPath


