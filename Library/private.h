/* private.h - private header for interface between guile and GNUstep
   Copyright (C) 1998 Free Software Foundation, Inc.

   Written by:  Richard Frith-Macdonald <richard@brainstorm.co.uk>
   Date: September 1998

   This file is part of the GNUstep-Guile Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */


#ifndef __private_h_INCLUDE
#define __private_h_INCLUDE 

#include <Foundation/NSLock.h>

/*
 *	NOTE - OBJC_VERSION needs to be defined to be the version of the
 *	Objective-C runtime you are using.  You can find this in the file
 *	'init.c' in the GNU objective-C runtime source.
 */
#define	OBJC_VERSION	8

#define ROUND(V, A) \
  ({ typeof(V) __v=(V); typeof(A) __a=(A); \
     __a*((__v+__a-1)/__a); })

/*
 *	Subsidiary initialisation functions.
 */
extern void gstep_init_id();
extern void gstep_init_class();
extern void gstep_init_protocol();
extern void gstep_init_voidp();

/*
 *	Utility functions.
 */
extern const char* gstep_guile_check_type(const char* type);
extern const char* gstep_guile_check_types(const char* type);
extern BOOL gstep_guile_decode_item(SCM list, void* datum, int *position, const char** typespec);
extern SCM gstep_guile_encode_item(void* datum, int *position, const char** typespec, BOOL isAlloc, BOOL isInit, id recv, SCM wrap);
extern int gstep_guile_list_length(SCM list);
extern BOOL gstep_guile_object_is_class(id obj);
extern void gstep_scm_error (char * message, SCM args);
extern void gstep_scm2str (char ** out, int * len_out, SCM * objp);

/*
 *	Internal layout of a voidp item.
 */
typedef	struct voidp_struct {
    void	*ptr;
    int		len;
    BOOL	lengthKnown;
    BOOL	isMallocMem;
} *voidp;

/*
 *	Stuff for testing type of scheme objects.
 */
extern int gstep_scm_tc16_id;
#define OBJC_ID_P(arg) ((SCM_TYP16(arg)) == gstep_scm_tc16_id) 
int gstep_scm_tc16_class;
#define OBJC_CLASS_P(arg) ((SCM_TYP16(arg)) == gstep_scm_tc16_class) 
extern int gstep_scm_tc16_voidp;
#define OBJC_VOIDP_P(arg) ((SCM_TYP16(arg)) == gstep_scm_tc16_voidp) 


/*
 *	Lock for thread-safe retain/release of Object
 */
extern	NSLock	*gstep_guile_object_lock;

#endif /* __private_h_INCLUDE */
