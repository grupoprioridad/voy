#!/bin/bash
# Instala voy en ~/.local/bin (o en $PREFIX/bin si se define PREFIX).
set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/voy"
cd "$(dirname "$0")"

for dep in ssh fzf column awk; do
  command -v "$dep" >/dev/null || echo "aviso: falta '$dep' (necesario para voy)" >&2
done

install -Dm755 voy "$PREFIX/bin/voy"
echo "✓ instalado en $PREFIX/bin/voy"

if [[ ! -f $CONFIG/servers ]]; then
  install -Dm644 servers.example "$CONFIG/servers"
  echo "✓ lista de servidores creada en $CONFIG/servers"
fi

case ":$PATH:" in
  *":$PREFIX/bin:"*) ;;
  *) echo "aviso: agrega $PREFIX/bin a tu PATH" >&2 ;;
esac
