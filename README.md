# InfernoData Builder

Автоматическая сборка `InfernoData.zip` для эмулятора Inferno.

## Запуск

1. Actions → Build InfernoData → Run workflow
2. Дождаться завершения (~30-40 мин)
3. Скачать `InfernoData.zip` из Artifacts

## Скрипты

- `scripts/create-disks.sh` — создание образов дисков
- `scripts/fetch-ipsw.sh` — загрузка и распаковка IPSW
- `scripts/make-apticket.sh` — создание AP Ticket
- `scripts/fs-patch.sh` — патч файловой системы
- `scripts/build-emulator.sh` — сборка эмулятора
