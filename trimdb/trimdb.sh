python trimdb.py "sqlite:///$APPDATA/quassel-irc.org/quassel-storage.sqlite" -is
sqlite3 "$APPDATA/quassel-irc.org/quassel-storage.sqlite" "VACUUM;"
