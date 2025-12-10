#!/bin/bash

# Путь к вашей папке с обоями
WALLPAPERS_DIR="/home/resets/mpp"

# Утилита для установки обоев теперь использует swww img
# Добавлены параметры для красивого перехода:
# -t "fade" (тип перехода: затухание)
# -d 300 (длительность: 300 миллисекунд)
SET_WALLPAPER_COMMAND="swww img --transition-type grow --transition-duration 2"

# Получаем список файлов обоев и форматируем для Rofi
WALLPAPERS=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \; | sort)

# Запускаем Rofi для выбора обоев
CHOICE=$(echo "$WALLPAPERS" | rofi -dmenu -i -p "Выберите обои: ")

# Если выбор сделан, устанавливаем новые обои
if [ -n "$CHOICE" ]; then
    # Полный путь к выбранному файлу
    SELECTED_WALLPAPER="$WALLPAPERS_DIR/$CHOICE"
    
    # Устанавливаем обои с помощью swww
    $SET_WALLPAPER_COMMAND "$SELECTED_WALLPAPER"
    
 
fi

