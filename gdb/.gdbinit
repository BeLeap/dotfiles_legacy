source /home/beleap/.dotfiles/gdb/pwndbg/gdbinit.py
set disassembly-flavor intel

define clear
    shell clear
end

alias disas='disassemble'
alias exit='q'
