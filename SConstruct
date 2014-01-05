# vim: set ft=python

prefix = ARGUMENTS.get('PREFIX','/usr')

env = Environment(LIBS=['libtermbox'],
                  CCFLAGS=['-g','-Wall','-Werror'])

termbox = env.SharedLibrary(target='termbox', 
                            source=['lua-termbox.c'],
                            SHLIBPREFIX='')

env.Alias('install', env.Install(prefix+'/lib/lua/5.2', termbox))

