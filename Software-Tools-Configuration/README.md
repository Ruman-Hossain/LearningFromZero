# Table Of Index
1. Git Bash
2. Visual Studio Code (VS Code)
3. Sublime Text

# 1. GIT BASH

## GIT Bash | Terminal Configuration
### Open Any File or Folder in Sublime Text Using CMD or Git Bash Terminal

1. Assuming your Sublime Text 3 was located in the ```C:\Program Files\Sublime Text``` directory

2. In ```Git Bash``` copy paste and run: ```echo 'alias subl="/C/Program\ Files/Sublime\ Text/sublime_text.exe"' >> ~/.bashrc```

3. Close ```Git Bash``` and Open it again.

4. Now you can open any folder or file in ```Sublime Text``` using ```Git Bash``` Terminal
   ```shell
    # To Open a Folder in Sublime Text 
    subl folderName

    # OR from inside of that folder Type
    subl .

    # To Open a File in Sublime Text
    subl fileName
   ```

