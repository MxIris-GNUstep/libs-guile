
;   Copyright (C) 1998 Free Software Foundation, Inc.
;
;   Written by:  Richard Frith-Macdonald <richard@brainstorm.co.uk>
;   Date: April 1998
;
;   This file is part of the Greg package - part of the GNUstep project.
;
;   This library is free software; you can redistribute it and/or
;   modify it under the terms of the GNU Library General Public
;   License as published by the Free Software Foundation; either
;   version 2 of the License, or (at your option) any later version.
;
;   This library is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;   Library General Public License for more details.
;
;   You should have received a copy of the GNU Library General Public
;   License along with this library; if not, write to the Free
;   Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;
;	Start up a shell to talk to.
;
(greg-child "/bin/sh" "-i")

(greg-testcase "A shell will echo hello" #t
(lambda ()
  (greg-send "echo hello\n")
  (greg-recv ("^hello" #t))
))

