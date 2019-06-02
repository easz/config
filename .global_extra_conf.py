def FlagsForFile( filename ):
  return { 'flags': [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-std=c++1z',
    '-x', 'c++',
    '-isystem', '/Library/Developer/CommandLineTools/usr/include/c++/v1',
    '-isystem', '/usr/local/include',
    '-isystem', '/Library/Developer/CommandLineTools/usr/lib/clang/10.0.0/include',
    '-isystem', '/Library/Developer/CommandLineTools/usr/include',
    '-isystem', '/usr/include',
    '-isystem', '/System/Library/Frameworks',
    '-isystem', '/Library/Frameworks',
  ] }


