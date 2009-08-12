#!/bin/sh
#
# $NetBSD$
#

# PROVIDE: n2n_edge
# REQUIRE: NETWORKING n2n_supernode

$_rc_subr_loaded . /etc/rc.subr

name="n2n_edge"
rcvar=$name
command="@PREFIX@/sbin/edge"
pidfile="@VARBASE@/run/${name}.pid"

start_precmd="n2n_edge_precmd"

n2n_edge_precmd()
{
      ifconfig tap0 create
}

stop_postcmd="n2n_edge_postcmd"

n2n_edge_postcmd()
{
      ifconfig tap0 destroy
}

command_args="-f -P $pidfile"
load_rc_config $name
run_rc_command "$1"



