apN=$1

set -e
[ ! -z "$apN" ] || ( >&2 echo "Expected parameter in configure_apache.sh"; exit 1 )

echo "LoadModule mirrorbrain_module __srcdir/build/mod_mirrorbrain/mod_mirrorbrain.so" > $(ls -d $apN*/)/extra-mirrorbrain.conf

echo "
MirrorBrainEngine On
MirrorBrainDebug On
FormGET On
MirrorBrainHandleHEADRequestLocally Off
MirrorBrainMinSize 0
MirrorBrainExcludeUserAgent rpm\/4.4.2*
MirrorBrainExcludeUserAgent *APT-HTTP*
MirrorBrainExcludeMimeType application\/pgp-keys" > $(ls -d $apN*/)/directory-mirrorbrain.conf
