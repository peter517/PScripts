
function print_help()
{
cat <<_ACEOF
\`configure' configures this package to adapt to many kinds of systems.

Usage: $0 [OPTION]... [VAR=VALUE]...

To assign environment variables (e.g., CC, CFLAGS...), specify them as
VAR=VALUE.  See below for descriptions of some of the useful variables.

Defaults for the options are specified in brackets.

Configuration:
  -h, --help              display this help and exit
  -V, --version           display version information and exit

By default, \`make' will build all the modules...

For better control, use the options below.

Fine tuning of the installation directories:
  --bindir=DIR           user executables [EPREFIX/bin]
_ACEOF
}

as_cr_letters='abcdefghijklmnopqrstuvwxyz'
as_cr_LETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
as_cr_Letters=$as_cr_letters$as_cr_LETTERS
as_cr_digits='0123456789'
as_cr_alnum=$as_cr_Letters$as_cr_digits

for ac_option
do
  #Parase the option value
  case $ac_option in
  *=*)	ac_optarg=`expr "X$ac_option" : '[^=]*=\(.*\)'` ;;
  *)	ac_optarg=yes ;;
  esac

  # Accept the important Cygnus configure options, so we can diagnose typos.
  case $ac_option in
  --)
   ;;
  -bindir | --bindir | --bindi | --bind | --bin | --bi)
    ac_prev=bindir ;;
  -bindir=* | --bindir=* | --bindi=* | --bind=* | --bin=* | --bi=*)
    echo "bindir"=$ac_optarg
    bindir=$ac_optarg ;;

  -disable-* | --disable-*)
    ac_feature=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_feature" : ".*[^-._$as_cr_alnum]" >/dev/null && echo "$as_me: error: invalid feature name: $ac_feature" >&2 && return
    ac_feature=`echo $ac_feature | sed 's/[-.]/_/g'`
    eval enable_$ac_feature=no ;;

  -enable-* | --enable-*)
    ac_feature=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_feature" : ".*[^-._$as_cr_alnum]" >/dev/null && echo "$as_me: error: invalid feature name: $ac_feature" >&2a && return
    ac_feature=`echo $ac_feature | sed 's/[-.]/_/g'`
    eval enable_$ac_feature=\$ac_optarg ;;

  -help | --help | --hel | --he | -h)
    print_help;;

  -with-* | --with-*)
    ac_package=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_package" : ".*[^-._$as_cr_alnum]" >/dev/null && echo "$as_me: error: invalid package name: $ac_package" >&2 && return
    ac_package=`echo $ac_package | sed 's/[-.]/_/g'`
    eval with_$ac_package=\$ac_optarg ;;

  -without-* | --without-*)
    ac_package=`expr "x$ac_option" : 'x-*without-\(.*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_package" : ".*[^-._$as_cr_alnum]" >/dev/null && echo "$as_me: error: invalid package name: $ac_package" >&2 && return
    ac_package=`echo $ac_package | sed 's/[-.]/_/g'`
    eval with_$ac_package=no ;;

  -*) echo -e "error: unrecognized option: $ac_option\nTry \`$0 --help' for more information." >&2 && return
    ;;

  *=*)
    ac_envvar=`expr "x$ac_option" : 'x\([^=]*\)='`
    # Reject names that are not valid shell variable names.
    expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null && echo "error: invalid variable name: $ac_envvar" >&2 && return 
    eval $ac_envvar=\$ac_optarg
    export $ac_envvar ;;

  *)
    echo "error: invalid param input: $ac_option" >&2 &&  return  
    ;;

  esac
done

