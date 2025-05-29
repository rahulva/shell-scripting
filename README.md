# Shell Bash Terminal

## Commands
### which - Find currently active shell
```
which $SHELL
```

```
which bash
whchh zsh
bash --version
zsh --version
```
### echo
```
echo "Hi Mom"
echo 'dsfsf';
```

### chmod - Add eXecutable access to ...
```
chmod +x himom.sh 
```

### ls - List directory
```
ls -latrh
```

### See usage
```
ls --help
man ls
```

### Create new file/dir
```
touch new-file.txt
mkdir new-folder
```
### Copy move file/dir
```
cp
mv 
rm 
rm -r
rm -rf
```

### pwd - Find the current path
```
pwd
```

### ln - create a symbolic link
```
nl -s big-file-name.txt short-simlink.txt 
```

### File view
```
more
less
head              -- to seee first feq line
tail              -- last few lines
tail -f test.log  -- to follow
cat
```

## Search
### grep
```
grep '$inbad' <file>
```

### rg
```
rg 'Sinbad'  // Like grep but faster
```

### find
```
find -name 'node_modules' -type d
```

## fd
```
fd 'node_modules'
```

### sed
```
sed - Stream editing tool
sed 's/REPLACE_EMAIL/sindbad@sailor.org' template.yaml
```

### awk
```
 text processing
 Extract text out of specifica position
```

### sort
```
sort data.txt (default alphabatic)
sort -k2 -n data.txt (numaric)
sort -R data.txt (random)
```

### uniq
```
ls -lrt | uniq
```

### Piping (|) - Use output of one command as input to input to another
```
% echo 'Hello, World!' | sed 's/World/UNIVERSE/'
Hello, UNIVERSE!
```

### seq - Sequence
`seq 1 9`\
Generates sequence 1 to 9\
     1 2 3 4 5 6 7 8 9

### xargs
```
ls | xargs figlet -f digital
ls | xargs -n 1
ls | xargs -n 3

seq 1 9 | xargs -L3 echo

echo -e "one\ntwo\nthree" | xargs -I % echo % %

ls -d /usr/local /opt | xargs -J % -P2 -n1 find % -name file
```
 - Takes the contenent what ever pipe into it and split into diffrent chunks
 - Extracts argument from output of previous command and pass it to given comman as argument
 
 **TODO** read, practice more


### File/Directory size
`du -sh` 
- Size of current directory

`du -sh <file-path>` 
- Size of given file/directory

`ls | xargs du -sh` 
- Size of each file/directory returned by `ls` command

`ls | grep 'l' | xargs du -sh`

### subshell
`echo "My current directory is: $(pwd)"`
- Out put of the commed is injected into main command

### redirection
`ls --help > ls-help.txt` 
- Output of the `ls --help` will be redirected as content of a (new) file *ls-help.txt. 
- This will overwrite if the file already exists.

`ls --help >> ls-help.txt` 
- `>>` either create a new or will append to the file instead of overwriting


### tr
```
tr "[:lower:]" "[:upper:]" < file1 (1)
tr -cd "[:print:]" < file1
tr "[=e=]" "e"
```
- (1) 
- Translate the contents of file1 to upper-case. (Otherway around also posible) (This should be preferred over the traditional UNIX idiom of “tr a-z A-Z”, since it works correctly in all locales.)

### fzf - Fuzzy Finder
```
fzf
```
- Loands the current file tree into the fuzzy finder.
- you can also pass in a text stream using a pipe and chain together

### Generate possible completion matches for word according to the options - compgen / complete
```
compgen -c | less
```
- Lists all the available commans
- Available in bash but not in zsh `help compgen`

> https://unix.stackexchange.com/questions/151118/understand-compgen-builtin-command

### wc - Word Count??
**TODO**

## Combining commands
### Find any command in your system and see its manual
```
compgen -c | fzf | xargs man
```
- combind compgen, fuzzy find and man
- take compgen passed into the fussy finder, then we pipe that into man using xargs

### Creating alias
```
alias fman="compgen -c | fzf | xargs man"
fman
```
- This can be added to config file - eg: .bashrc or .zhrc so it will be available to all the session

### 
```
kubectl get pods -A --no-headers | fzf | awk '{print $2, $1}' | xargs -n 2 sh -c 'kubectl describe pod $0 -n $1'
```
- This will list all of the available pods, allows to select a pod, and then run kube controle to describe the pod
- kubectl get pods --> fzf --> awk --> kubectl describe pod
- awk '{print $2, $1}' - to grab the both the pod name and the namespace
> ref: https://www.youtube.com/watch?v=IYZDIhfAUM0


### Find the bigest file in the given path
```
du -ah . | sort -hr | head -n 10
```
- List the files with its human readable form
- Sort it by desending/reverse order
- Show/get the top 10 lines

### Choose the file to delete
```
find . -name 'node_modules' -type d | xargs du -sh | sort -hr | fzf -m  --header "Select which ones to delete" --preview 'cat $(dirname {})/package.json' | awk '{pring $2} | xargs -r rm -rf
```

```
find . -name 'node_modules' -type d |
    xargs du -sh |
    sort -hr |
    fzf -m  --header "Select which ones to delete" --preview 'cat $(dirname {})/package.json' |
    awk '{pring $2} |
    xargs -r rm -rf
```

### See running process
`top` Mac
`htop` Linux??

## References
- https://adamtheautomator.com/linux-shell-scripting-tutorial/
- https://www.shellscript.sh/
- https://www.youtube.com/watch?v=IYZDIhfAUM0

-------------------------
# Hotkeys
Ctrl/^ + C  Kill active process
Ctrl/^ + K  Delete everything after your cursor
Ctrl/^ + U  Bash - Delete everything before your cursor **
Ctrl/^ + U  Zsh - Delete whole line

Ctrl/^ + L  Clear the screen
Ctrl/^ + Z  Put process in bg
can use fg to branch back to the foreground

Ctrl/^ + A  Goto *front* of the line   
Ctrl/^ + E  Goto *end* of the line

Ctrl/^ + F  Go *forward* 1 characeter  
Ctrl/^ + B  Go *backward* 1 character

Alt + F     Go forward one word           
Alt + B     Go back one word

!!          Run previous comman (!-bang)
!<cmd>      Run previous matching cmd

Ctrl+x Ctrl+e Open line in $EDITOR (works in bash not in zsh)

^ + D   Split Pane (Mac)

> Ref: https://www.youtube.com/watch?v=IYZDIhfAUM0


### Setup default terminal editor
https://stackoverflow.com/questions/3539594/change-the-default-editor-for-files-opened-in-the-terminal-e-g-set-it-to-text


Summary
> Ref: https://www.youtube.com/watch?v=IYZDIhfAUM0
- Use the man pages (or tldr)
- Use pipelines and subshells for a good time
- Use aliases and scripts to save your work
- Use fzf

# Terminal multiplexer (tmux)
- Program runs inside terminal and allows other programs to run inside it

```
brew install tmux
apt install tmux

tmux

^ + B, d    Detach from session
tmux

```

Reference:
https://www.youtube.com/watch?v=DzNmUNvnB04
https://www.youtube.com/watch?v=nTqu6w2wc68


# Usecases
### Disk, Space
`df -h -- Check disk space`
- https://linuxize.com/post/how-get-size-of-file-directory-linux/

### Find the files having given pattern
`grep -Eil "PatternOrText" .`

### Creating & Deleting Symbolic Link
`ln -s [dir or file to link] [path of the new link]`
- https:/linuxize.com/post/how-to-remove-symbolic-links-in-linux
- https:/linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command

### list files with a pattern
`ls -lrt | grep 2024`

### Exclude output of grep
`ps -ef | grep java | grep -v grep`
- Find runnding process java exclude process of grep

### Grep and print before and after few lines
`grep -i error * -A 1 -B 1`
- https://stackoverflow.com/questions/12444808/how-do-i-fetch-lines-before-after-the-grep-result-in-bash/12444813

### Grep all sub dirs
`grep -r -i error * -A 1 -B 1`

`grep -ri error */STP.LOG -A 1 -B 1`

`grep -ri error */STP* -A 1 -B 1`

### Display free (df) disk space
`df -h .`

### Disk Usage (du) Analysis
`du -sh *`
- Summarize disk usage in the (s)-specific directory, (h)human readable form.
`du -sk * | sort -n`
> refer `man du` for more details

### Remove lines matching pattern
`awk '!/pattern/' file > temp.txt`

### Checksum
Checksum/md5sum/csum


### Find process that uses specific port and kill
**TODO**

### Setup default cli editor
```
echo "export EDITOR=\"/Applications/TextEdit.app/Contents/MacOS/TextEdit\"" >> ~/.bashrc
```
```
echo $EDITOR
```
```
echo "export NANO_PATH=/usr/bin/nano" >> ~/.bashrc
echo "export EDITOR=$NANO_PATH" >> ~/.bashrc
echo $EDITOR
```

### Chaning default shell on
```
chsh -s $(which zsh)
```
Ref: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

# Personalizing, Customising Terminal
### How to make the Terminal colourful
##### Install Zsh - Prerequesit for Oh My zsh
- https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
```
zsh --version
```
```
echo $SHELL
```
#### Install Oh My zsh!
https://github.com/ohmyzsh/ohmyzsh

**TODO**



# Shell Scripting/Programming Tutorial
## Types of shell
Bash Shell, C Shell, Korn Shell, Z Shell, Fish Shell
Z Shell - Zsh  - Has many improments compared to bash. Default in MacOS

##
```
#!/bin/bash
echo "Hello World"
```

## Input/Output

## Control Statements

## Shell Regex
- The three main wildcards are *, ?, and [].

### Comment
- '#' is treated as a comment in scripting


# Raspberry Pi OS
### Check OS version
https://www.raspberrypi.com/documentation/computers/os.html
`vcgencmd measure_volts`

- https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
- http://192.168.50.10/admin/

ipv4 add : 192.168.50.10/24 \
Router 192.168.50.1 \
DNS Server : 8.8.8.8

###
`sudo apt update`
- update your system's package list by entering the following command:

`sudo apt full-upgrade`
- upgrade all your installed packages to their latest versions

- downloaded package files (.deb files) are kept in /var/cache/apt/archives
can remove these in order to free up space with sudo apt clean


https://www.youtube.com/watch?v=dnzaIeUgH_4
- These tolls are interactive usage and not for script usage
Task                  Traditional     Modern
Listing files         ls/tree         exa
Finding files         find            fd
Searching in fles     grep            ripgrep
Counting Loc          cloc            tokei
Making HTTP reqs      curl            httpie
Show file contents    cat/less        bat
Replace text          sed             sd
Benchmarking/timing   time            hyperfine
Presenting/slides     PowerPoint      mdp
Pretending to do work compiling Linux genact


# Types of shells
Reference : https://www.freecodecamp.org/news/linux-shells-explained/


-------------------------------------------------------------------------------
```
which bash
> /bin/bash
```

#### Variable
```
nano bash.sh
#!/bin/bash
STRING="Null Byte"
echo "Hackers love to learn on $STRING"
```

#### Argument input
```
#!/bin/bash
echo "I firmly believe that $1, $2, $3 are best friends"

% bash bash.sh "Tomm" "Harry" "Hammayni"
```

#### Execute something to and print the result of it
```
#!/bin/bash
echo "$(whoami)"
```

#### Interactive Input
```
#!/bin/bash
echo "What is your name?"
read name
echo "Wow, $name sounds like a genius!"
```

#### Conditional checks
```
#!/bin/bash
echo "What is your name?"
read name
if [ $name ]; then
  echo "$name sounds like genious"
else
  echo "Something not right!"
fi
```

### Using multiple tools together - What is my ip address?
```
ifconfig | grep broadcast | awk '{print $2}'
```

### makeing aliases
```
alias whatismyipaddress="echo $(ifconfig | grep broadcast | awk '{print $2}')"

whatismyipaddress
```
> Ref : [Write Your Own Bash Scripts for Automation [Tutorial]](https://www.youtube.com/watch?v=PPQ8m8xQAs8)

-------------------------------------------------------------------------------

TODO
> Ref: [Never say "If" writing a Bash script! (Exit codes & logical operators)](https://www.youtube.com/watch?v=p0KKBmfiVl0)



-------------------------------------------------------------------------------
### Real world programming bash / Bash projects
[Real World Programming with BASH Shell Scripts](https://www.youtube.com/watch?v=Z5oyKonnAV4)

###  What is ?
 - bash - `.bash_profile` and `.bashrc`
 - zsh  - `.zsh_profile` and `.zshrc` `.zprofile` `.zsh_session`
 
---------------- BASH Pager -----------------------
# What is "$PAGER"
## How It Works
If the output of a command exceeds one screen, the program specified in the $PAGER variable is invoked to handle the output.
* Common values for $PAGER are:
  * less: A commonly used pager that allows scrolling backward and forward through the output.
  * more: A simpler pager that only supports forward scrolling.
  * cat: Displays all the output at once without any pagination.
## Default Behavior
If $PAGER is not set, most tools fall back to their own default. For example:
  git uses less by default.
  man also uses less.
## How to Check $PAGER
You can check its current value by running: \
`echo $PAGER`

- use 'cat' o print it directly on shell
`export PAGER=cat` \
`export GIT_PAGER=cat`
- use 'less' (fefault) if you want a schrollable/naviagle view
- 


## Port to process/app finding 
How to check whcih application uses the port?

`lsof -i tcp:80`
`sudo netstat -nlp`

Ref 
- https://stackoverflow.com/questions/4421633/who-is-listening-on-a-given-tcp-port-on-mac-os-x
- https://superuser.com/questions/42843/finding-the-process-that-is-using-a-certain-port-in-linux


TODO 
Write Your Own Bash Scripts for Automation [Tutorial]
https://www.youtube.com/watch?v=PPQ8m8xQAs8

Real World Programming with BASH Shell Scripts
https://www.youtube.com/watch?v=Z5oyKonnAV4
Using Shell Scripting How To Create a Password | project 1 using shell script
https://www.youtube.com/watch?v=hEFJbL_Fbh8&list=PLIIXhQukapwf5g4XENuRzyTDJPhkGG-na
https://www.youtube.com/watch?v=xqjXBbOP7o0&list=PLIIXhQukapwf5g4XENuRzyTDJPhkGG-na&index=11

https://www.youtube.com/watch?v=q1GDSHhaH0E

https://github.com/kodekloudhub/shell-scripting-for-beginners-course

1. Master the Basics of Terminal
Open Terminal: Applications > Utilities > Terminal.
Learn basic Unix commands:
Navigation: cd, ls, pwd
File management: cp, mv, rm, touch, mkdir
Viewing: cat, less, head, tail


2. Learn and Use zsh Efficiently
macOS uses Z shell (zsh) by default.
Customize it with Oh My Zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
Explore plugins like git, z, autojump, alias-finder.

3. Customize Your Shell
Edit ~/.zshrc to:
Add aliases: alias gs='git status'
Set environment variables
Customize prompt with POWERLEVEL10K

4. Learn Key Tools
brew (Homebrew): The package manager for macOS.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fzf: Fuzzy finder for searching files and history.
htop, bat, ripgrep, exa (enhanced ls), fd (modern find).

5. Practice Shell Scripting
Write shell scripts to automate repetitive tasks:
#!/bin/zsh
for file in *.txt; do
  echo "Processing $file"
  mv "$file" "${file%.txt}.bak"
done
Learn variables, loops, conditions, and functions.

6. Use tmux or screen for Terminal Multiplexing
Allows split panes, persistent sessions.
Learn tmux basics: Ctrl-b + % (split), d (detach), s (switch sessions).

7. Git and GitHub from the Shell
Master git CLI commands.
Use SSH keys with GitHub.
Use CLI tools like gh (GitHub CLI).

8. Explore macOS-Specific CLI Tools
defaults for system settings
osascript for AppleScript automation
pbcopy, pbpaste for clipboard interaction

9. Learn man and tldr
man ls for detailed info.
Install tldr for simpler explanations: brew install tldr

10. Stay Consistent and Practice
Use the terminal for daily tasks.
Solve real problems: backups, batch renaming, downloading, etc.
Try commandlinefu.com for inspiration.


# Tool List by purpose

## Alternative to `cd`
- z, autojump, and zoxide
- brew install zoxide
- Instead of `cd ~/projects/web/react-app` --> `z reack`


https://github.com/romkatv/powerlevel10k