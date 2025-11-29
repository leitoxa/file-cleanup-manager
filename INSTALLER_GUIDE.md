# Создание Installer для File Cleanup Manager

## Инструкции по сборке

### Требуется:
1. **Inno Setup** - бесплатный установщик для Windows
   - Скачать: https://jrsoftware.org/isdl.php
   - Установить стандартную версию (около 2 МБ)

### Шаги:

#### 1. Установка Inno Setup
```
1. Скачайте Inno Setup с официального сайта
2. Установите программу (Next -> Next -> Install)
3. Запустите Inno Setup Compiler
```

#### 2. Компиляция Installer
```
1. Откройте Inno Setup Compiler
2. File -> Open -> выберите installer.iss
3. Build -> Compile (или нажмите F9)
4. Готовый installer будет в папке Output\
```

#### 3. Результат
- **Файл**: `FileCleanupManagerSetup.exe`
- **Размер**: ~1-2 МБ
- **Установка**: Двойной клик и следуйте инструкциям

---

## Альтернативный вариант (без Inno Setup)

Если не хотите устанавливать Inno Setup, можно использовать простые скрипты:

### Простой ZIP-архив (уже готово)
Просто используйте C# версию как portable:
```
1. Скопируйте CleanupManager.exe куда угодно
2. Запустите двойным кликом
3. Готово!
```

### Опция: Batch установщик
Создайте `install.bat`:

```batch
@echo off
echo Installing File Cleanup Manager...

REM Создать папку в Program Files
mkdir "%ProgramFiles%\FileCleanupManager"

REM Скопировать файлы
copy CleanupManager.exe "%ProgramFiles%\FileCleanupManager\"
copy README.md "%ProgramFiles%\FileCleanupManager\"

REM Создать ярлык на рабочем столе
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\File Cleanup Manager.lnk');$s.TargetPath='%ProgramFiles%\FileCleanupManager\CleanupManager.exe';$s.Save()"

echo Installation complete!
echo Run from Desktop or Start Menu
pause
```

Запустите от имени администратора!

---

## Что делает Installer

1. ✅ Проверяет наличие .NET Framework 4.5+
2. ✅ Копирует файлы в Program Files
3. ✅ Создает ярлыки (Start Menu + Desktop)
4. ✅ Добавляет в "Установка и удаление программ"
5. ✅ Создает деинсталлятор

---

## Размеры файлов

| Версия | Размер Exe | Размер Installer |
|--------|------------|------------------|
| C# Native | 19.5 КБ | ~1-2 МБ |
| Python | 22 МБ | ~20-25 МБ |

**Рекомендация**: Используйте C# версию для минимального размераи распространения!

---

**Created with Antigravity by Serik Muftakhidinov © 2025**
