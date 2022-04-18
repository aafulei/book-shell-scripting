# Shell Scripting Solutions

My solutions to exercises in **Shell Scripting** by *Jason Cannon* (2015).

- [Chapter 1. Shell Scripting, Succinctly](#chapter-1-shell-scripting-succinctly)
- [Chapter 2. Exit Statuses and Return Codes](#chapter-2-exit-statuses-and-return-codes)
- [Chapter 3. Functions](#chapter-3-functions)
## Chapter 1. Shell Scripting, Succinctly

- Shebang - `#!`
- Variables
    - Assign a value to a variable - `VAR=value`
    - Assign command output to a variable - `VAR=$(command)`
    - Use a variable with `${VARIABLE}`
- Tests - `[ ]`
- The `if` statement - `if` `then` `fi`
- The `for` loop - `for` `in` `do` `done`
- Positional parameters - `$1` `$2` and `$@`
- Comments - `#`
- Getting user input - `read -p`

| Test Syntax         | Description                                      |
| ------------------- | ------------------------------------------------ |
| `[ -e FILE ]`       | check if `FILE` exists                           |
| `[ -s FILE ]`       | check if `FILE` exists and is not empty          |
| `[ -f FILE ]`       | check if `FILE` exists and is a regular file     |
| `[ -d FILE ]`       | check if `FILE` exists and is a directory        |
| `[ -r FILE ]`       | check if `FILE` exists and is readable by user   |
| `[ -w FILE ]`       | check if `FILE` exists and is writable by user   |
| `[ -x FILE ]`       | check if `FILE` exists and is executable by user |
| `[ STR1 = STR2 ]`   | check if strings `STR1` and `STR2` are equal     |
| `[ STR1 != STR2 ]`  | check if strings `STR1` and `STR2` are not equal |
| `[ -z STR ]`        | check if string `STR` is empty                   |
| `[ -n STR ]`        | check if string `STR` is nonempty                |
| `[ STR ]`           | check if string `STR` is nonempty                |
| `[ NUM1 -eq NUM2 ]` | check if numbers `NUM1` and `NUM2` are equal     |
| `[ NUM1 -ne NUM2 ]` | check if numbers `NUM1` and `NUM2` are not equal |
| `[ NUM1 -lt NUM2 ]` | check if numbers `NUM1` < `NUM2`                 |
| `[ NUM1 -le NUM2 ]` | check if numbers `NUM1` <= `NUM2`                |
| `[ NUM1 -gt NUM2 ]` | check if numbers `NUM1` > `NUM2`                 |
| `[ NUM1 -ge NUM2 ]` | check if numbers `NUM1` >= `NUM2`                |

### Exercise 1

Write a shell script that prints "Shell Scripting is Fun!" on the screen.

*Hint 1: Remember to make the shell script executable with the chmod command.*

*Hint 2: Remember to start your script with a shebang `!`*

**Solution:**

```sh
#!/bin/sh

echo "Shell Scripting is Fun!"
```

- [`11.sh`](./11.sh)

### Exercise 2

Modify the shell script from exercise 1 to include a variable. The variable will hold the contents of the message "Shell Scripting is Fun!".

**Solution:**

```sh
#!/bin/bash

MESSAGE="Shell Scripting is Fun!"
echo "$MESSAGE"
```

- [`12.sh`](./12.sh)

### Exercise 3

Store the output of the command "hostname" in a variable. Display "This script is running on \_\_\_\_." where "\_\_\_\_" is the output of the "hostname" command.

*Hint: It's a best practice to use the `${VARIABLE}` syntax if there is text or characters that directly precede or follow the variable.*

**Solution:**

```sh
#!/bin/bash

HOSTNAME=$(hostname)
echo "This script is running on ${HOSTNAME}."
```

- [`13.sh`](./13.sh)

### Exercise 4

Write a shell script to check to see if the file `/etc/shadow` exists. If it does exist, display "Shadow passwords are enabled." Next, check to see if you can write to the file. If you can, display "You have permissions to edit /etc/shadow." If you cannot, display "You do NOT have permissions to edit /etc/shadow."

**Solution:**

```sh
#!/bin/bash

FILE="/etc/shadow"

if [ -e $FILE ]
then
    echo "Shadow passwords are enabled."
    if [ -w $FILE ]
    then
        echo "You have permissions to edit ${FILE}."
    else
        echo "You do NOT have permissions to edit ${FILE}."
    fi
fi
```

- [`14.sh`](./14.sh)

### Exercise 5

Write a shell script that displays "man", "bear", "pig", "dog", "cat", and "sheep" on the screen with each appearing on a separate line. Try to do this in as few lines as possible.

*Hint: Loops can be used to perform repetitive tasks.*

**Solution:**

```sh
#!/bin/bash

for ANIMAL in man bear pig dog cat sheep
do
    echo $ANIMAL
done
```

- [`15.sh`](./15.sh)

### Exercise 6

Write a shell script that prompts the user for a name of a file or directory and reports if it is a regular file, a directory, or another type of file. Also perform an `ls` command against the file or directory with the long listing option.

**Solution:**

```sh
#!/bin/bash

read -p "Please enter a name of a file or directory: " FILE

if [ -f $FILE ]
then
    echo "${FILE} is a regular file."
elif [ -d $FILE ]
then
    echo "${FILE} is a directory."
else
    echo "${FILE} is neither a regular file nor a directory."
fi

ls -l $FILE
```

- [`16.sh`](./16.sh)

### Exercise 7

Modify the previous script so that it accepts the file or directory name as an argument instead of prompting the user to enter it.

**Solution:**

```sh
#!/bin/bash

$FILE=$1

if [ -f $FILE ]
then
    echo "${FILE} is a regular file."
elif [ -d $FILE ]
then
    echo "${FILE} is a directory."
else
    echo "${FILE} is neither a regular file nor a directory."
fi

ls -l $FILE
```

- [`17.sh`](./17.sh)

### Exercise 8

Modify the previous script to accept an unlimited number of files and directories as arguments.

*Hint: You'll want to use a special variable.*

**Solution:**

```sh
#!/bin/bash

for FILE in $@
do
    if [ -f $FILE ]
    then
        echo "${FILE} is a regular file."
    elif [ -d $FILE ]
    then
        echo "${FILE} is a directory."
    else
        echo "${FILE} is neither a regular file nor a directory."
    fi
    ls -l $FILE
done
```

- [`18.sh`](./18.sh)

## Chapter 2. Exit Statuses And Return Codes

- Exit status / return code / exit code - an integer in `[0, 255]`
- Check exit status with `$?`
- Join two commands with `&&` and `||`
- Exit shell scripts with and without `exit`

### Exercise 1

Write a shell script that displays, "This script will exit with a 0 exit status." Be sure that the script does indeed exit with a `0` exit status.

**Solution:**

```sh
#!/bin/bash

echo "This script will exit with a 0 exit status."
exit 0
```

- [`21.sh`](./21.sh)

    - Check with `echo $?`

### Exercise 2

Write a shell script that accepts a file or directory name as an argument. Have the script report if it is a regular file, a directory, or another type of file. If it is a regular file, exit with a `0` exit status.  If it is a directory, exit with a `1` exit status.  If it is some other type of file, exit with a `2` exit status.

**Solution:**

```sh
#!/bin/bash

FILE=$1

if [ -f $FILE ]
then
    echo "${FILE} is a regular file."
    exit 0
elif [ -d $FILE ]
then
    echo "${FILE} is a directory."
    exit 1
else
    echo "${FILE} is neither a regular file nor a directory."
    exit 2
fi
```

- [`22.sh`](./22.sh)

    - Run with `./22.sh [FILENAME]` and check with `echo $?`

### Exercise 3

Write a script that executes the command `cat /etc/shadow`. If the command returns a `0` exit status, report "Command succeeded" and exit with a `0` exit status. If the command returns a non-zero exit status, report "Command failed" and exit with a `1` exit status.

**Solution:**

```sh
#!/bin/bash

cat /etc/shadow
if [ "$?" -eq "0" ]
then
    echo "Command succeeded"
    exit 0
else
    echo "Command failed"
    exit 1
fi
```

- [`23.sh`](./23.sh)

    - Run with `./23.sh` and `sudo ./23.sh`, respectively, and check with `echo $?`

## Chapter 3. Functions

- Define a function with `function func() {}`
- Call a function - no `()` needed
    - Define before use
- Positional parameters - `$1` `$2` and `$@` but no `$0`
- Variable scope
    - Global by default - blank if undefined
    - Local with `local`
- Exit statuses and return codes
    - Explicit - return from `0` to `255`
    - Implicit - exit status of last command in the function

### Exercise 1

Write a shell script that consists of a function that displays the number of files in the present working directory. Name this function `file_count` and call it in your script. If you use a variable in your function, remember to make it a local variable.

*Hint: The `wc` utility is used to count the number of lines, words, and bytes.*

**Solution:**

```sh
#!/bin/bash

function file_count() {
    local FILE_NUM=$(ls | wc -l)
    echo "$FILE_NUM"
}

file_count
```

- [`31.sh`](./31.sh)

### Exercise 2

Modify the script from the previous exercise. Make the `file_count` function accept a directory as an argument. Next, have the function display the name of the directory followed by a colon. Finally, display the number of files to the screen on the next line. Call the function three times. First on the "/etc" directory, next on the "/var" directory and finally on the "/usr/bin" directory.

Example output:

```
/etc:
    85
```

**Solution:**

```sh
#!/bin/bash

function file_count() {
    local DIR=$1
    local FILE_NUM=$(ls $1 | wc -l)
    echo "${DIR}:"
    echo "    $FILE_NUM"
}

file_count /etc
file_count /var
file_count /usr/bin
```

- [`32.sh`](./32.sh)

    - Sample Output

        ```
        /etc:
            185
        /var:
            13
        /usr/bin:
            1419
        ```
