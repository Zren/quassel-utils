# QuasselUtils: TrimDB

This script is used to trim Quassel's database of unimportant stuff like:

## Install

Requires:

* Python
    * `pip`
    * SQLAlchemy

```
pip install sqlalchemy
```

## Usage

### Deleting Messages

`python trimdb.py [uri] -i`

* Joins/Parts/Quits
* Mode/Nick Changes
* Status Buffer

Leaving behind:

* Messages/Actions (Eg: /me)
* DayChange
* Topic
* Kick/Kill

> TODO: Only prune messages `x` days old.

### Delete Orphaned Senders

`python trimdb.py [uri] -s`

This will delete any sender that isn't attached to a message. This command runs after the `-i` command.

### Resize the SQLite DB

`sqlite3 [uri] "VACUUM;"`

The other commands won't actually free up any space if you're using an SQLite db. Instead it'll just leave empty spaces in the database file. To force it to resize, run the above command after using `trimdb.py`.

## Notes

* Tested on SQLite / Windows only.
* Uses SQLAlchemy so it should work with Postgres in theory. The orphan senders uses a raw SQL query however.
* Make sure to shut down the core beforehand, especially in the case of SQLite as it doesn't handle multithreading. In the case of Postgres, it's more so the case that the core might glitch/break.
