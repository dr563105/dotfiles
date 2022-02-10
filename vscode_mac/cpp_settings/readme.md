## VS Code settings for cpp projects

<!-- References: https://code.visualstudio.com/docs/cpp/config-clang-mac -->
### Files 
- `tasks.json`(compiler build settings)
- `launch.json`(debugger settings)
- `c_cpp_properties.json`(compiler path and intellisense settings)

### Modifying tasks.json
You can modify your tasks.son to build multiple C++ files by using an argument like
"${workspace Folder}/*.cap` instead of `${file}`. This will build all `.ccp` files in your
current folder. You can also modify the output filename by replacing
`${fileDirname}/${fileBasenameNoExtension}` with a hard-coded filename (for example
`${workspaceFolder}/myProgram.out`).


