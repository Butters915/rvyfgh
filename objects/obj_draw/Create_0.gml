globalvar build;
globalvar bugfix;
globalvar release;
release = "0";
bugfix = "0";
build = "21";
globalvar version;
version = string(global.release) + "." + string(global.bugfix) + "." + string(global.build);