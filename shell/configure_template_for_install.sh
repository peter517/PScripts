
ac_default_prefix=/usr/local

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

Installation directories:
  --prefix=PREFIX         install architecture-independent files in PREFIX
			  [$ac_default_prefix]
  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
			  [PREFIX]

By default, \`make install' will install all the files in
\`$ac_default_prefix/bin', \`$ac_default_prefix/lib' etc.  You can specify
an installation prefix other than \`$ac_default_prefix' using \`--prefix',
for instance \`--prefix=\$HOME'.

For better control, use the options below.

Fine tuning of the installation directories:
  --bindir=DIR           user executables [EPREFIX/bin]
_ACEOF

  cat <<\_ACEOF
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
    expr "x$ac_feature" : ".*[^-._$as_cr_alnum]" >/dev/null &&
      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
   { (exit 1); exit 1; }; }
    ac_feature=`echo $ac_feature | sed 's/[-.]/_/g'`
    eval enable_$ac_feature=no ;;

  -enable-* | --enable-*)
    ac_feature=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
    echo "ac_feature1"=$ac_feature
    # Reject names that are not valid shell variable names.
    expr "x$ac_feature" : ".*[^-._$as_cr_alnum]" >/dev/null &&
      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
   { (exit 1); exit 1; }; }
    ac_feature=`echo $ac_feature | sed 's/[-.]/_/g'`
    echo "ac_feature2"=$ac_feature
    eval enable_$ac_feature=\$ac_optarg ;;

  -help | --help | --hel | --he | -h)
    print_help
    ac_init_help=long ;;

  -with-* | --with-*)
    ac_package=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_package" : ".*[^-._$as_cr_alnum]" >/dev/null &&
      { echo "$as_me: error: invalid package name: $ac_package" >&2
   { (exit 1); exit 1; }; }
    ac_package=`echo $ac_package | sed 's/[-.]/_/g'`
    eval with_$ac_package=\$ac_optarg ;;

  -without-* | --without-*)
    ac_package=`expr "x$ac_option" : 'x-*without-\(.*\)'`
    # Reject names that are not valid shell variable names.
    expr "x$ac_package" : ".*[^-._$as_cr_alnum]" >/dev/null &&
      { echo "$as_me: error: invalid package name: $ac_package" >&2
   { (exit 1); exit 1; }; }
    ac_package=`echo $ac_package | sed 's/[-.]/_/g'`
    eval with_$ac_package=no ;;

  -prefix | --prefix | --prefi | --pref | --pre | --pr | --p)
    ac_prev=prefix ;;
  -prefix=* | --prefix=* | --prefi=* | --pref=* | --pre=* | --pr=* | --p=*)
    prefix=$ac_optarg ;;

  -exec-prefix | --exec_prefix | --exec-prefix | --exec-prefi \
  | --exec-pref | --exec-pre | --exec-pr | --exec-p | --exec- \
  | --exec | --exe | --ex)
    ac_prev=exec_prefix ;;
  -exec-prefix=* | --exec_prefix=* | --exec-prefix=* | --exec-prefi=* \
  | --exec-pref=* | --exec-pre=* | --exec-pr=* | --exec-p=* | --exec-=* \
  | --exec=* | --exe=* | --ex=*)
    exec_prefix=$ac_optarg ;;

  --x)
    # Obsolete; use --with-x.
    with_x=yes ;;

  -*) { echo -e "error: unrecognized option: $ac_option\nTry \`$0 --help' for more information." >&2
      { (exit 1); exit 1; }; }
    ;;

  *=*)
    ac_envvar=`expr "x$ac_option" : 'x\([^=]*\)='`
    # Reject names that are not valid shell variable names.
    expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null &&
      { echo "error: invalid variable name: $ac_envvar" >&2
   { (exit 1); exit 1; }; }
    eval $ac_envvar=\$ac_optarg
    export $ac_envvar ;;

  *)
    echo "error: invalid param input: $ac_option" >&2
    { (exit 1); exit 1; }; 
    ;;

  esac
done

