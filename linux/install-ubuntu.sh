#!/bin/bash

USAGE="Usage: ./install-ubuntu.sh add|remove|readd" 
US_LAYOUT_FILE=/usr/share/X11/xkb/symbols/us
RULES_XML_FILE=/usr/share/X11/xkb/rules/evdev.xml
LAYOUT_NAME=US-Int-Swiss-Lat-v1
BACKUP_US_LAYOUT_FILE="$US_LAYOUT_FILE.backup.$LAYOUT_NAME"

if [ -z "$1" ]; then
    echo "$USAGE"
    exit 1
fi

if [ ! -e "$US_LAYOUT_FILE" ]; then
    echo "This script is designed to modify the base US layout file that should be stored as: $US_LAYOUT_FILE. This file does not exist."
    exit 1
fi

add () {
    echo "Installing keyboard layout definition..."

    if grep -q "$LAYOUT_NAME" "$US_LAYOUT_FILE"; then
        echo "It seems like the US layout definition file $US_LAYOUT_FILE already contains a definition for $LAYOUT_NAME"
        exit 1
    fi
    
    echo "Creating backup copy of US layout definition $US_LAYOUT_FILE"
    if [ -e $BACKUP_US_LAYOUT_FILE ]; then
        echo "Warning: the backup file $BACKUP_US_LAYOUT_FILE already exists, it will be overwritten."
        rm $BACKUP_US_LAYOUT_FILE
        # TODO : ask user confirmation
    fi
    cp $US_LAYOUT_FILE $BACKUP_US_LAYOUT_FILE

    echo "Apending layout definition to $US_LAYOUT_FILE ..."
    cat ./layout-definition >> "$US_LAYOUT_FILE"

    echo "Now paste the following XML into the XKB rules file $RULES_XML_FILE under the <variantList> tag of the <layout> tag with name=us :"
    cat rule.xml
    echo
    echo "After that run the following command: "
    echo "    sudo dpkg-reconfigure xkb-data"
    echo "And maybe reboot..."
}

remove () {
    echo "Uninstalling keyboard layout definition..."

    if [ ! -e $BACKUP_US_LAYOUT_FILE ]; then
        echo "Backup file $BACKUP_US_LAYOUT_FILE does not exist and thus cannot be restored."
        exit 1
    fi

    TMP_FILE="$US_LAYOUT_FILE.tmp"
    mv $US_LAYOUT_FILE $TMP_FILE
    mv $BACKUP_US_LAYOUT_FILE $US_LAYOUT_FILE
    rm $TMP_FILE

    echo "You must manually remove the variant XML node from the <variantList> tag of the <layout> tag with name=us in the XKB rules file $RULES_XML_FILE."
}

case "$1" in
    "add")
        add
        exit 0
        ;;
    "remove")
        remove
        exit 0
        ;;
    "re-add")
        remove
        add
        exit 0
        ;;
    *)
        echo "$USAGE"
        exit 1 
        ;;
esac
