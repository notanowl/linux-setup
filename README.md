# Linux Environment Preparation

This repo contains scripts for setting up my linux working environment, mainly by
installing two vital applications: TMUX and VIM and setting up their behaviour.

**BEWARE**, running this will **DELETE** your previous tmux and vim setup (.vim, .tmux.conf, .vimrc)!!

To clone and install everything run following code:

```bash
mkdir -p ~/git
cd ~/git
sudo apt-get install git
git clone --recursive https://github.com/klaxalk/linux-setup.git
cd linux-setup
./install.sh
```

**Calling install.sh repeatedly** will not cause acumulation of gibrish in your .bashrc, so feel free to update your configuration by rerunning it.

# How to work with my setup?

Here I describe the most important keybindings and shortcuts..

## TMUX shortcuts

- **ctrl+a** tmux **__PREFIX__**
- **__PREFIX__ w** list windows
- **ctrl t** create new window
- **shift left** switch to previous windows
- **shift right** switch to next windows
- **ctrl s** horizontal split
- **ctrl d** vertical split
- **alt left** switch to left split pane
- **alt right** switch to right split pane
- **__PREFIX__ k** kill current tmux session with all its processes
- **__PREFIX__ space** switch panel configuration
- **F2** go to vim edit mode
- **__PREFIX__ p** paste yanked text (from vim edit mode) 
- **__PREFIX__ z** enlarge focused pane to the whole screen (or back)

TMUX-RESURRECT can be used to save a state of a single session. Use following keys to control it.

- **__PREFIX__ ctrl+s** save current session using tmux-resurrect
- **__PREFIX__ ctrl+r** resurrect previously saved session

My tmux setup allows to nest tmux sessions. Key shortcuts are prepared to switch focus between nested and mother sessions.

- **shift down** gain control of nested tmux
- **shift up** regain control of thr mother tmux

### Custom TMUX config

If you wish to use your own tmux config besides mine, create a file **~/.my.tmux.conf**, it will be sourced automatically if it exists.

## TMUXINATOR

I forked TMUXINATOR (https://github.com/tmuxinator/tmuxinator) and made no changes to it. I suggest to read its tutorials.

## VIM

Vim has been heavily pluginized in this setup, which makes it more like IDE then a simple terminal editor. Plugins are maintained by a plugin manager called **Vundle**, which should download them from their repositories automatically.
To update them manually, call **:PluginUpdate**, to install them **:PluginInstall** in Vim. However, they will be installed automatically by **install.sh**.

Here is a short description of the most important plugins together with example of thier usage:

### Startify

Run vim without parameters! Really, try that. Startify shows a useful list of recently openned files when running vim without parameters. It also allows to **save** and **load** sessions. Save the current session by calling
```bash
:SSave
```
you will be prompted to enter the name of the session. You can later see the session on the main Startify screen. Startify also displays random vim tips in a form of a 'barking dog'. Feel free to update those and submit them by means of a **pull request** on a file appconfig/vim/startify_quotes.txt.

### NERDTree

NERDTree provides a simple file browser within a split. Toggle it by **^N**. The current setup shows NERDTree also when you open vim with a folder in the argument. Read its documentation for further information.

### Vimmux

Vimmux allows to open TMUX splits and run commands in them. I use them mainly for compiling
my workspace. Commands can be configured in **~/.my.vimrc** file which will stay unchanged
by git. My current setup is following:

- **\<leader\>m** - compile whole workspace
- **\<leader\>j** - compile just some app
- **\<leader\>l** - close the vimmux window

### United-front

This pluggin allows to share registers between different instances of vim. Thus allows to copy and paste regardles of splitting in vim od TMUX.

## Other vim stuff ...

### The leader key

I have remapped the leader to a comma ",".

### Using CTAGS

Ctags is a useful way to maintain "hyperlinks" in your code. It later allows you to jump through "tags" (names in the code), e.g. function names. Variable **CTAGS_SOURCES_DIR** in your **.bashrc** specifies where should ctags look for your code. The database is built automatically when running vim, or manually by calling **:MakeTags** in vim. Further shortcuts can be used to navigate through your code:

- **\<leader\>.** - dive into the tag
- **\<leader\>/** - go back one tag
- **\<leader\>;** - show list of files in which the tag is defined

### Macros

Working macros might be tedious. If you, just like me, tend to record everything to @a, following feature might be useful. When in **visual mode**, the **dot** operator applies macro **@a** over all selected lines.

### Other key bindings

- **\<leader\>n** - toggles relative/absolute line numbering
- **\<leader\>a** - toggles highlighting of words under the cursor
- **\<leader\>p** - toggles :paste mode
- **\<leader\>g** - automatically indents the whole document while staying on the current line

Since **\<ctrl\>a** is occupied by TMUX, number manipulations has been remapped to followig:
- **\<ctrl\>\<alt\>a** - increment under the cursor
- **\<ctrl\>\<alt\>x** - decrement under the cursor
