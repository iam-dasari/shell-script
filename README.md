# Shell Scripts

1. install-packages.sh
How to Run
```
sudo sh install-packages.sh
```

Output
```
nginx is not installed.  Installing...
Installing nginx... ...  SUCCESS
nginx is not running... Starting...
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
Starting nginx... ...  SUCCESS
```

2. dir-file-exist.sh
How to Run
```
sh dir-file-exist.sh
```

Output
```
Directory does not exist: EXAMPLE
Directory created: EXAMPLE
File does not exist: EXAMPLE/example.txt
File created: EXAMPLE/example.txt

Directory and file check completed.
```