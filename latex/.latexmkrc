$clean_ext = "paux lox pdfsync out nav snm auxlock dpth log md5 dep";
$out_dir = 'build';
$pdf_previewer = "start evince";
$pdf_update_method = 0;
$pdflatex = "pdflatex --shell-escape";


# Custom dependency and function for nomencl package 
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}
