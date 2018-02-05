python
import sys
sys.path.insert(0, '/home/connor/.gdb/')
from printers import register_eigen_printers
register_eigen_printers (None)
end

set history save on
set history remove-duplicates unlimited
