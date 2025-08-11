# Scripts to run to set up a machine



STARTUP/SHUTDOWN FILES
       Commands are first read from /etc/zshenv; this cannot be overridden.  Subsequent behaviour is modified by the RCS and GLOBAL_RCS options; the former affects all startup files, while the second
       only affects global startup files (those shown here with an path starting with a /).  If one of the options is unset at any point, any subsequent startup file(s) of the corresponding type will
       not be read.  It is also possible for a file in $ZDOTDIR to re-enable GLOBAL_RCS. Both RCS and GLOBAL_RCS are set by default.

       Commands are then read from $ZDOTDIR/.zshenv.  If the shell is a login shell, commands are read from /etc/zprofile and then $ZDOTDIR/.zprofile.  Then, if the shell is interactive, commands are
       read from /etc/zshrc and then $ZDOTDIR/.zshrc.  Finally, if the shell is a login shell, /etc/zlogin and $ZDOTDIR/.zlogin are read.

       When a login shell exits, the files $ZDOTDIR/.zlogout and then /etc/zlogout are read.  This happens with either an explicit exit via the exit or logout commands, or an implicit exit by reading
       end-of-file from the terminal.