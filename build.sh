#!/bin/sh
export PATH="/usr/local/bin/x86_64-linux:$PATH";
if ! command -v tlmgr > /dev/null; then
    REMOTE="http://mirror.ctan.org/systems/texlive/tlnet";
    INSTALL="/usr/local/bin/install-texlive";
    mkdir -p $INSTALL;
    curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C $INSTALL \
        --strip-components=1;
    echo "selected_scheme scheme-basic" >> $INSTALL/tl.profile;
    echo "collection-fontsrecommended 1" >> $INSTALL/tl.profile;
    echo "collection-latex 1" >> $INSTALL/tl.profile;
    echo "collection-xetex 1" >> $INSTALL/tl.profile;
    echo "TEXDIR /tmp/texlive" >> $INSTALL/tl.profile;
    echo "TEXMFLOCAL /tmp/texlive/texmf-local" >> $INSTALL/tl.profile;
    echo "TEXMFSYSCONFIG /tmp/texlive/texmf-config" >> $INSTALL/tl.profile;
    echo "TEXMFSYSVAR /tmp/texlive/texmf-var" >> $INSTALL/tl.profile;
    echo "tlpdbopt_autobackup 0" >> $INSTALL/tl.profile;
    echo "tlpdbopt_install_docfiles 0" >> $INSTALL/tl.profile;
    echo "tlpdbopt_install_srcfiles 0" >> $INSTALL/tl.profile;
    $INSTALL/install-tl -profile $INSTALL/tl.profile;        
    tlmgr install wrapfig etoolbox translator caption mathtools algorithms float footmisc;          
fi

