#!/usr/bin/env python

###  Function.py

#---------------------   start class definition   ----------------------
class Function:                                                      #(A)

    # class variable:
    funcs_scanned = []                                               #(B)

    # instance method for initialization:
    def __init__( self, **args ):                                    #(C)
        Function.funcs_scanned.append(args['name'])                  #(D)
        self._name = args['name']                                    #(E)
        self._ret_type  =  args['ret_type'] or '?????'               #(F)
        self._file      =  args['file']     or '?????'               #(G)
        self._line_num  =  args['line_num'] or '?????'               #(H)

    # instance get methods:
    def get_name( self ): return self._name                          #(I)
    def get_file( self ): return self._file                          #(J)
    def get_ret_type( self ): return self._ret_type                  #(K)
    def get_line_num( self ): return self._line_num                  #(L)

    # class method:
    def get_total_func_count():                                      #(M)
        return len( Function.funcs_scanned )                         #(N)
    get_total_func_count = staticmethod( get_total_func_count )      #(O)

    # instance method for garbage collection:
    def __del__(self):                                               #(P)
        import os                                                    #(Q)
        FILE = os.open( "function_archive.txt", \
                       os.O_RDWR | os.O_CREAT | os.O_APPEND ) #(R)
        record = ' '.join([self._name, self._file, \
                           self._ret_type, str(self._line_num)])     #(R)
        os.write( FILE, record + "\n" )                              #(S)
        os.close(FILE)                                               #(T)
#-----------------------  end of class definition  ---------------------

if __name__ == "__main__":                                           #(U)

    import re                                                        #(V)

    # utility subroutine:
    def _extract_functions( filename ):                              #(W)
        FILE = open( filename )                                      #(X)
        all_lines = FILE.readlines()                                 #(Y)
        regex = re.compile(  \
           r'^((?:struct\s+)?\w+\s+\*?\s*\w+)\s*\(.*\).*\{\s*(\d*)') #(Z)
        all_lines = map( None, all_lines, range( len(all_lines) ) )  #(a)
        all_lines = [ item[0] + str(item[1]) for item in all_lines]  #(b)
        functions = map( regex.findall, all_lines )                  #(c)
        functions = filter( None, functions )                        #(d)
        functions = [ list(item[0]) + [filename] \
                      for item in functions]                         #(e)
        functions = [ " ".join( item ) for item in functions ]       #(f)
        return functions                                             #(g)

    func_list = _extract_functions( "func.c" )                       #(h)

    func_instances = []                                              #(i)
    regex2 = re.compile( r'^(.*\s+\*?)(\w+)\s(\d+)\s(\w+\.\w+)$' )   #(j)
    for header in func_list:                                         #(k)
        m = regex2.search( header )                                  #(l)
        func_instances.append( Function(                             #(m)
                    ret_type   = m.group(1),                         #(n)
                    name       = m.group(2),                         #(o)
                    line_num   = m.group(3),                         #(p)
                    file       = m.group(4) ) )                      #(q)

    for func in func_instances:                                      #(r)
        print func.get_name(), func.get_ret_type(), \
              func.get_line_num(), func.get_file()                   #(s)


    # call the class method
    print "\n\nTotal number of functions scanned: %d\n\n" % \
                          Function.get_total_func_count()            #(t)
