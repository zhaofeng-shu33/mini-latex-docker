#!/bin/sh
if [[ ! -z "$ALPINE_MIRROR" ]]; then
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
fi
apk add curl perl fontconfig make ghostscript
if [[ -z "$CTAN_MIRROR" ]]; then
    REMOTE="http://mirror.ctan.org/systems/texlive/tlnet";
else
    REMOTE="$CTAN_MIRROR/systems/texlive/tlnet"
fi
INSTALL="/tmp/install-texlive";
mkdir -p $INSTALL;
echo $REMOTE
curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C $INSTALL \
     --strip-components=1;
echo "selected_scheme scheme-basic" >> $INSTALL/tl.profile;
echo "collection-fontsrecommended 1" >> $INSTALL/tl.profile;
echo "collection-latex 1" >> $INSTALL/tl.profile;
echo "collection-xetex 1" >> $INSTALL/tl.profile;
echo "TEXDIR /usr/local/texlive" >> $INSTALL/tl.profile;
echo "TEXMFLOCAL /usr/local/texlive/texmf-local" >> $INSTALL/tl.profile;
echo "TEXMFSYSCONFIG /usr/local/texlive/texmf-config" >> $INSTALL/tl.profile;
echo "TEXMFSYSVAR /usr/local/texlive/texmf-var" >> $INSTALL/tl.profile;
echo "tlpdbopt_autobackup 0" >> $INSTALL/tl.profile;
echo "tlpdbopt_install_docfiles 0" >> $INSTALL/tl.profile;
echo "tlpdbopt_install_srcfiles 0" >> $INSTALL/tl.profile;
$INSTALL/install-tl -repository $REMOTE -profile $INSTALL/tl.profile;
tlmgr install listings IEEEtran wrapfig etoolbox translator caption mathtools algorithms float footmisc cite pdfescape elsarticle;

