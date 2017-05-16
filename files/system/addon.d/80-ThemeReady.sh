#!/sbin/sh
#
# Script: /system/addon.d/80-hangouts_exposed.sh
# This addon.d script will make the exposed Google apps survive a dirty flash :

. /tmp/backuptool.functions

list_files() {
cat << EOF
app/Hangouts/Hangouts.apk
app/PlusOne/PlusOne.apk
app/Gmail/Gmail.apk
app/Photos/Photos.apk
app/YouTube/YouTube.apk
app/GBoard/GBoard.apk
priv-app/Phonesky/Phonesky.apk
priv-app/Velvet/Velvet.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
