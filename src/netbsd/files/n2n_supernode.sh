#!/bin/sh
#
# $NetBSD$
#

# PROVIDE: n2n_supernode
# REQUIRE: NETWORKING

$_rc_subr_loaded . /etc/rc.subr

name="n2n_supernode"
rcvar=$name
command="@PREFIX@/bin/supernode"
pidfile="@VARBASE@/run/${name}.pid"

n2n_supernode_flags=${n2n_supernode_flags-"-l 9898 -u nobody -g nobody"}

command_args="-f -P $pidfile"
load_rc_config $name
run_rc_command "$1"



