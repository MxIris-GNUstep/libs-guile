dnl aclocal.m4 generated automatically by aclocal 1.2


# serial 24 AM_PROG_LIBTOOL
AC_DEFUN(AM_PROG_LIBTOOL,
[AC_REQUIRE([AM_ENABLE_SHARED])dnl
AC_REQUIRE([AM_ENABLE_STATIC])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_PROG_RANLIB])dnl
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AM_PROG_LD])dnl
AC_REQUIRE([AM_PROG_NM])dnl
AC_REQUIRE([AC_PROG_LN_S])dnl
dnl
# Always use our own libtool.
LIBTOOL='$(SHELL) $(top_builddir)/libtool'
AC_SUBST(LIBTOOL)dnl

# Check for any special flags to pass to ltconfig.
libtool_flags=
test "$enable_shared" = no && libtool_flags="$libtool_flags --disable-shared"
test "$enable_static" = no && libtool_flags="$libtool_flags --disable-static"
test "$silent" = yes && libtool_flags="$libtool_flags --silent"
test "$ac_cv_prog_gcc" = yes && libtool_flags="$libtool_flags --with-gcc"
test "$ac_cv_prog_gnu_ld" = yes && libtool_flags="$libtool_flags --with-gnu-ld"

# Some flags need to be propagated to the compiler or linker for good
# libtool support.
case "$host" in
*-*-irix6*)
  # Find out which ABI we are using.
  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case "`/usr/bin/file conftest.o`" in
    *32-bit*)
      LD="${LD-ld} -32"
      ;;
    *N32*)
      LD="${LD-ld} -n32"
      ;;
    *64-bit*)
      LD="${LD-ld} -64"
      ;;
    esac
  fi
  rm -rf conftest*
  ;;

*-*-sco3.2v5*)
  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
  CFLAGS="$CFLAGS -belf"
  ;;
esac

# Actually configure libtool.  ac_aux_dir is where install-sh is found.
CC="$CC" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" \
LD="$LD" NM="$NM" RANLIB="$RANLIB" LN_S="$LN_S" \
${CONFIG_SHELL-/bin/sh} $ac_aux_dir/ltconfig \
$libtool_flags --no-verify $ac_aux_dir/ltmain.sh $host \
|| AC_MSG_ERROR([libtool configure failed])
])

# AM_ENABLE_SHARED - implement the --enable-shared flag
# Usage: AM_ENABLE_SHARED[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AM_ENABLE_SHARED,
[define([AM_ENABLE_SHARED_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(shared,
changequote(<<, >>)dnl
<<  --enable-shared         build shared libraries [default=>>AM_ENABLE_SHARED_DEFAULT]
changequote([, ])dnl
[  --enable-shared=PKGS    only build shared libraries if the current package
                          appears as an element in the PKGS list],
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_shared=yes ;;
no) enable_shared=no ;;
*)
  enable_shared=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_shared=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_shared=AM_ENABLE_SHARED_DEFAULT)dnl
])

# AM_DISABLE_SHARED - set the default shared flag to --disable-shared
AC_DEFUN(AM_DISABLE_SHARED,
[AM_ENABLE_SHARED(no)])

# AM_DISABLE_STATIC - set the default static flag to --disable-static
AC_DEFUN(AM_DISABLE_STATIC,
[AM_ENABLE_STATIC(no)])

# AM_ENABLE_STATIC - implement the --enable-static flag
# Usage: AM_ENABLE_STATIC[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AM_ENABLE_STATIC,
[define([AM_ENABLE_STATIC_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(static,
changequote(<<, >>)dnl
<<  --enable-static         build static libraries [default=>>AM_ENABLE_STATIC_DEFAULT]
changequote([, ])dnl
[  --enable-static=PKGS    only build shared libraries if the current package
                          appears as an element in the PKGS list],
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_static=yes ;;
no) enable_static=no ;;
*)
  enable_static=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_static=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_static=AM_ENABLE_STATIC_DEFAULT)dnl
])


# AM_PROG_LD - find the path to the GNU or non-GNU linker
AC_DEFUN(AM_PROG_LD,
[AC_ARG_WITH(gnu-ld,
[  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]],
test "$withval" = no || with_gnu_ld=yes, with_gnu_ld=no)
AC_REQUIRE([AC_PROG_CC])
ac_prog=ld
if test "$ac_cv_prog_gcc" = yes; then
  # Check if gcc -print-prog-name=ld gives a path.
  AC_MSG_CHECKING([for ld used by GCC])
  ac_prog=`($CC -print-prog-name=ld) 2>&5`
  case "$ac_prog" in
  # Accept absolute paths.
  /* | [A-Za-z]:\\*)
    test -z "$LD" && LD="$ac_prog"
    ;;
  "")
    # If it fails, then pretend we aren't using GCC.
    ac_prog=ld
    ;;
  *)
    # If it is relative, then search for the first ld in PATH.
    with_gnu_ld=unknown
    ;;
  esac
elif test "$with_gnu_ld" = yes; then
  AC_MSG_CHECKING([for GNU ld])
else
  AC_MSG_CHECKING([for non-GNU ld])
fi
AC_CACHE_VAL(ac_cv_path_LD,
[if test -z "$LD"; then
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:"
  for ac_dir in $PATH; do
    test -z "$ac_dir" && ac_dir=.
    if test -f "$ac_dir/$ac_prog"; then
      ac_cv_path_LD="$ac_dir/$ac_prog"
      # Check to see if the program is GNU ld.  I'd rather use --version,
      # but apparently some GNU ld's only accept -v.
      # Break only if it was the GNU/non-GNU ld that we prefer.
      if "$ac_cv_path_LD" -v 2>&1 < /dev/null | egrep '(GNU|with BFD)' > /dev/null; then
	test "$with_gnu_ld" != no && break
      else
        test "$with_gnu_ld" != yes && break
      fi
    fi
  done
  IFS="$ac_save_ifs"
else
  ac_cv_path_LD="$LD" # Let the user override the test with a path.
fi])
LD="$ac_cv_path_LD"
if test -n "$LD"; then
  AC_MSG_RESULT($LD)
else
  AC_MSG_RESULT(no)
fi
test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
AC_SUBST(LD)
AM_PROG_LD_GNU
])

AC_DEFUN(AM_PROG_LD_GNU,
[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], ac_cv_prog_gnu_ld,
[# I'd rather use --version here, but apparently some GNU ld's only accept -v.
if $LD -v 2>&1 </dev/null | egrep '(GNU|with BFD)' 1>&5; then
  ac_cv_prog_gnu_ld=yes
else
  ac_cv_prog_gnu_ld=no
fi])
])

# AM_PROG_NM - find the path to a BSD-compatible name lister
AC_DEFUN(AM_PROG_NM,
[AC_MSG_CHECKING([for BSD-compatible nm])
AC_CACHE_VAL(ac_cv_path_NM,
[case "$NM" in
/* | [A-Za-z]:\\*)
  ac_cv_path_NM="$NM" # Let the user override the test with a path.
  ;;
*)
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:"
  for ac_dir in /usr/ucb /usr/ccs/bin $PATH /bin; do
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/nm; then
      # Check to see if the nm accepts a BSD-compat flag.
      # Adding the `sed 1q' prevents false positives on HP-UX, which says:
      #   nm: unknown option "B" ignored
      if ($ac_dir/nm -B /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
        ac_cv_path_NM="$ac_dir/nm -B"
      elif ($ac_dir/nm -p /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
        ac_cv_path_NM="$ac_dir/nm -p"
      else
        ac_cv_path_NM="$ac_dir/nm"
      fi
      break
    fi
  done
  IFS="$ac_save_ifs"
  test -z "$ac_cv_path_NM" && ac_cv_path_NM=nm
  ;;
esac])
NM="$ac_cv_path_NM"
AC_MSG_RESULT([$NM])
AC_SUBST(NM)
])

dnl   Automake macros for working with Guile.
dnl   
dnl   	Copyright (C) 1998 Free Software Foundation, Inc.
dnl   
dnl   This program is free software; you can redistribute it and/or modify
dnl   it under the terms of the GNU General Public License as published by
dnl   the Free Software Foundation; either version 2, or (at your option)
dnl   any later version.
dnl   
dnl   This program is distributed in the hope that it will be useful,
dnl   but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl   GNU General Public License for more details.
dnl   
dnl   You should have received a copy of the GNU General Public License
dnl   along with this software; see the file COPYING.  If not, write to
dnl   the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
dnl   Boston, MA 02111-1307 USA
dnl   
dnl   As a special exception, the Free Software Foundation gives permission
dnl   for additional uses of the text contained in its release of GUILE.
dnl   
dnl   The exception is that, if you link the GUILE library with other files
dnl   to produce an executable, this does not by itself cause the
dnl   resulting executable to be covered by the GNU General Public License.
dnl   Your use of that executable is in no way restricted on account of
dnl   linking the GUILE library code into it.
dnl   
dnl   This exception does not however invalidate any other reasons why
dnl   the executable file might be covered by the GNU General Public License.
dnl   
dnl   This exception applies only to the code released by the
dnl   Free Software Foundation under the name GUILE.  If you copy
dnl   code from other Free Software Foundation releases into a copy of
dnl   GUILE, as the General Public License permits, the exception does
dnl   not apply to the code that you add in this way.  To avoid misleading
dnl   anyone as to the status of such modified files, you must delete
dnl   this exception notice from them.
dnl   
dnl   If you write modifications of your own for GUILE, it is your choice
dnl   whether to permit this exception to apply to your modifications.
dnl   If you do not wish that, delete this exception notice.


dnl   GUILE_FLAGS --- set flags for compiling and linking with Guile
dnl 
dnl   This macro runs the `guile-config' script, installed with Guile,
dnl   to find out where Guile's header files and libraries are
dnl   installed.  It sets two variables, marked for substitution, as
dnl   by AC_SUBST.
dnl
dnl	GUILE_CFLAGS --- flags to pass to a C or C++ compiler to build
dnl		code that uses Guile header files.  This is almost
dnl		always just a -I flag.
dnl
dnl     GUILE_LDFLAGS --- flags to pass to the linker to link a
dnl		program against Guile.  This includes `-lguile' for
dnl		the Guile library itself, any libraries that Guile
dnl		itself requires (like -lqthreads), and so on.  It may
dnl		also include a -L flag to tell the compiler where to
dnl		find the libraries.

AC_DEFUN([GUILE_FLAGS],[
  ## First, let's just see if we can find Guile at all.
  AC_MSG_CHECKING(for Guile)
  guile-config link > /dev/null || {
    echo "configure: cannot find guile-config; is Guile installed?" 1>&2
    exit 1
  }
  GUILE_CFLAGS="`guile-config compile`"
  GUILE_LDFLAGS="`guile-config link`"
  AC_SUBST(GUILE_CFLAGS)
  AC_SUBST(GUILE_LDFLAGS)
  AC_MSG_RESULT(yes)
])

