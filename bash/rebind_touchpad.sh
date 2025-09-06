for drv in /sys/bus/i2c/drivers/i2c*hid*; do
    for dev in "$drv"/i2c-*; do
        [ -e "$dev" ] || continue
        d="${dev##*/}"
        echo "$d" | sudo tee "$drv"/unbind
        sleep 1
        echo "$d" | sudo tee "$drv"/bind
    done
done
