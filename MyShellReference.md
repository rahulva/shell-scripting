# Shell reference

`sudo apt update`
 --update your system's package list by entering the following command:

`sudo apt full-upgrade` 
 --upgrade all your installed packages to their latest versions

downloaded package files (.deb files) are kept in `/var/cache/apt/archives`.
And can remove these in order to free up space with sudo apt clean

Disk, Space
------------
- `df -h`
- Check disk space
- https://linuxize.com/post/how-get-size-of-file-directory-linux/

Check OS version
-----------------
`vcgencmd measure_volts`

- https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/


http://192.168.50.10/admin/

ipv4 add : 192.168.50.10/24 </br>
Router 192.168.50.1 </br>
DNS Server : 8.8.8.8

Find the files having given pattern
----------------------------------
- `grep -Eil "PatternOrText" .`

Creating & Deleting Symbolic Link
----------------------------------
- https:/linuxize.com/post/how-to-remove-symbolic-links-in-linux
- https:/linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command

- `ln -s [dir or file to link] [path of the new link]`

- `ls -lrt | grep 9003`

Exclude output of grep
--------------------------
`ps -ef | grep java | grep -v grep`

Grep and print before and after few lines
-----------------------------------------
- `grep -i error * -A 1 -B 1`
- https://stackoverflow.com/questions/12444808/how-do-i-fetch-lines-before-after-the-grep-result-in-bash/12444813

Grep all sub dirs
-----------------
- `grep -r -i error * -A 1 -B 1`
- `grep -ri error */STP.LOG -A 1 -B 1`
- `grep -ri error */STP* -A 1 -B 1`

Disk Space Analysis
--------------------
- `df -h .`
- `du -sh *`  "du --summarize --human-readable *"
- `du -sk * | sort -n`

Remove lines matching lines
---------------------------------
`awk '!/pattern/' file > temp.txt`

Checksum/md5sum/csum

What is my current shell?
----------------------------
```
echo $0
```
https://askubuntu.com/questions/590899/how-do-i-check-which-shell-i-am-using