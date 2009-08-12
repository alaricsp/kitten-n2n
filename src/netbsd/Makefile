# $NetBSD$
#

DISTNAME=	kitten-n2n-1.4
CATEGORIES=	net
MASTER_SITES=	http://www.kitten-technologies.co.uk/projects/tarballs/

MAINTAINER=	Alaric Snell-Pym <alaric@kitten-technologies.co.uk>
HOMEPAGE=       http://www.ntop.org/n2n/
COMMENT=	Fork of n2n, the peer-to-peer VPN, with NetBSD support
LICENSE=	gnu-gpl-v3

PKG_DESTDIR_SUPPORT=    user-destdir
RCD_SCRIPTS=   n2n_supernode n2n_edge

INSTALLATION_DIRS=      ${PKGMANDIR}/man1 ${PKGMANDIR}/man8
MAKE_ENV+=	PREFIX=${DESTDIR}${PREFIX} MANDIR=${DESTDIR}${PREFIX}/${PKGMANDIR}
.include "../../mk/bsd.pkg.mk"
