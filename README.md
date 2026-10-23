# voy

Conexiones SSH rápidas con sesión **tmux persistente**. Elige un servidor con `fzf`, conéctate y, si se corta la conexión, al volver a entrar retomas exactamente donde estabas.

## Uso

```
voy               elegir servidor con fzf y conectarse
voy <nombre>      conectarse directo (acepta coincidencia parcial)
voy <nombre> -n   abrir una sesión tmux nueva en vez de la compartida
voy add           agregar un servidor (y copiar tu llave SSH)
voy rm [nombre]   eliminar un servidor
voy edit          abrir la lista en el editor
voy ls            listar servidores
```

Al conectar, `voy` entra a la sesión tmux `voy` del servidor (la crea si no existe). Si el servidor no tiene tmux, abre un shell normal.

Con `-n` (o `--new`) abre una sesión aparte, llamada `voy-HHMMSS`, para trabajar en paralelo sin mezclarse con la sesión `voy`. Para retomarla después, entra al servidor y usa `tmux attach -t voy-HHMMSS` (`tmux ls` las lista).

## Instalación

```bash
git clone https://github.com/grupoprioridad/voy.git
cd voy
./install.sh
```

Requisitos: `bash`, `ssh`, `fzf`, `column` (util-linux), `awk`. En el servidor, `tmux` es opcional pero recomendado.

## Lista de servidores

Se guarda en `~/.config/voy/servers`, una línea por servidor:

```
# nombre  usuario@host[:puerto]  descripción opcional
casa      usuario@192.168.1.10:22   PC de la casa
vps       deploy@ejemplo.com:2222   Servidor web
```

Este archivo es local y **no** forma parte del repositorio.

## Licencia

MIT
