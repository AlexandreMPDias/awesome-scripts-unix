# awesome-scripts-unix

# Installation



append the following code to the end of **~/bashrc**, replace the path with the proper path

```sh
if [ -d "$HOME/Dev/awesome/bin" ] ; then
    export AWESOME="$HOME/Dev/awesome/bin"
    PATH="$HOME/Dev/awesome/bin:$PATH"
fi
```