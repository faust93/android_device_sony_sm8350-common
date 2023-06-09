#!/vendor/bin/sh

model=$(sed -e '/[Mm][Oo][Dd][Ee][Ll]: /!d' -e 's/^.*[Mm][Oo][Dd][Ee][Ll]: \([A-Za-z0-9-]*\).*$/\1/' -e '/^$/d' /dev/block/bootdevice/by-name/LTALabel) 2> /dev/null
case "$model" in
    "XQ-BC42" | "XQ-BC52" | "XQ-BC72" | "XQ-BC72" | "XQ-BQ42" | "XQ-BQ52" | "XQ-BQ62" | "XQ-BQ72")
        setprop vendor.radio.multisim.config dsds;;
    * )
        setprop vendor.radio.multisim.config ss;;
esac

if [ "$model" = "" ]; then
    setprop vendor.radio.ltalabel.model "unknown"
else
    setprop vendor.radio.ltalabel.model "$model"
fi
